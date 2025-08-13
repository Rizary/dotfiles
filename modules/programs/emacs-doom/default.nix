{ config, lib, pkgs, ... }:
let
  sources = import ../../../niv/sources.nix;
  doom-emacs = import (builtins.fetchTarball { inherit (sources.nix-doom-emacs) url sha256; });

  font = config.primary-user.home-manager.font;
  myEmacs = (
    pkgs.emacsWithPackagesFromUsePackage {
      config = builtins.readFile ./modules/init.el;
      package = pkgs.emacsGit;
    }
  );
  myDoomEmacs = pkgs.callPackage doom-emacs {
    bundledPackages = false;
    emacsPackages = pkgs.emacsPackagesFor pkgs.emacsGit;
    doomPrivateDir = ./doom.d;
    extraPackages = epkgs: pkgs.callPackage ./packages.nix { mu = pkgs.mu; inherit epkgs; };
  };
in
{
  primary-user.home-manager.programs.emacs.enable = true;
  primary-user.home-manager.programs.emacs.package = myDoomEmacs;
  primary-user.home-manager.home.packages = lib.mkForce [ myDoomEmacs ];

  # put everything in modules folder into doom.d's modules
  #primary-user.home-manager.home.file.".doom.d".source = ./doom.d;
  #primary-user.home-manager.home.file.".doom.d".recursive = true;

  primary-user.home-manager.home.file.".emacs.d/init.el".text = ''  
    (load "default.el")
  '';

  # Systemd configuration to run emacs within daemon. I use --fg-daemon to force the daemon to run in the foreground

  primary-user.home-manager.systemd.user.services.emacs = {
    Unit = {
      Description = "Emacs: the extensible, self-documenting text editor";
      Documentation = "info:emacs man:emacs(1) https://gnu.org/software/emacs/";

      # Avoid killing the Emacs session, which may be full of
      # unsaved buffers.
      X-RestartIfChanged = false;
    };

    Service = {
      ExecStart = "${pkgs.runtimeShell} -l -c 'exec ${myDoomEmacs}/bin/emacs --fg-daemon'";
      ExecStop = "${myDoomEmacs}/bin/emacsclient --eval '(kill-emacs)'";
      Type = "forking";
      SyslogIdentifier = "emacs";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

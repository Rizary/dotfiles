{ config, lib, pkgs, ... }:

let
  font = config.primary-user.home-manager.font;
  myEmacs = (
    pkgs.emacsWithPackagesFromUsePackage {
      config = builtins.readFile ./modules/init.el;
      package = pkgs.emacsGit;
      extraEmacsPackages = epkgs: pkgs.callPackage ./packages.nix { mu = pkgs.mu; inherit epkgs; };
    }
  );
in

{
  primary-user.home-manager.programs.emacs.enable = true;
  primary-user.home-manager.programs.emacs.package = myEmacs;
  primary-user.home-manager.home.packages = lib.mkForce [ myEmacs ];

  # put everything in modules folder into emacs.d's modules
  primary-user.home-manager.home.file.".emacs.d/modules".source = ./modules;
  primary-user.home-manager.home.file.".emacs.d/modules".recursive = true;
  primary-user.home-manager.home.file.".emacs.d/modules/modes/ra-emacs-lsp.el".source = pkgs.raEmacsLsp;

  primary-user.home-manager.home.file.".emacs.d/init.el".text = ''
    (setq nix-config #s(hash-table
                        test equal
                        data (
                              "paths" #s(hash-table
                                         test equal
                                         data (
                                                "ag" "${pkgs.silver-searcher}/bin/ag"
                                                "git" "${pkgs.git}/bin/git"
                                                "shell" "${pkgs.stdenv.shell}"
                                         ))
                              "font" #s(hash-table
                                        test equal
                                        data (
                                              "face" "${font.face}"
                                              "size" "${toString font.size}"
                                       ))
    )))

    (load (concat user-emacs-directory (convert-standard-filename "modules/init")))
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
      ExecStart = "${pkgs.runtimeShell} -l -c 'exec ${myEmacs}/bin/emacs --fg-daemon'";
      ExecStop = "${myEmacs}/bin/emacsclient --eval '(kill-emacs)'";
      Type = "forking";
      SyslogIdentifier = "emacs";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

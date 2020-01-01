{ config, lib, pkgs, ... }:

let
  font = config.primary-user.home-manager.font;
  emacsGit = (pkgs.emacsPackagesGen pkgs.emacsGit).emacsWithPackages (
    epkgs: pkgs.callPackage ./packages.nix { inherit epkgs; }
  );
in

{
  primary-user.home-manager.programs.emacs.enable = true;
  primary-user.home-manager.services.emacs.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ emacsGit ];

  # put everything in modules folder into emacs.d's modules
  primary-user.home-manager.home.file.".emacs.d/modules".source = ./modules;
  primary-user.home-manager.home.file.".emacs.d/modules".recursive = true;


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

  #primary-user.home-manager.systemd.user.services.emacs-daemon.Service.Type = "forking";
  primary-user.home-manager.systemd.user.services.emacs.Service.SyslogIdentifier = "emacs";
}

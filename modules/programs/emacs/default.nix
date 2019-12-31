{ config, pkgs, ... }:

let
  font = config.primary-user.home-manager.font;
in

{
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

    (load (concat user-emacs-directory "modules/init"))
  '';

  # Systemd configuration to run emacs within daemon. I use --fg-daemon to force the daemon to run in the foreground

  primary-user.home-manager.systemd.user.services.emacs-daemon.Unit.Description = "Emacs text editor";
  primary-user.home-manager.Unit.Documentation = "info:emacs man:emacs(1) https://gnu.org/software/emacs/";

  primary-user.home-manager.Install.WantedBy = [ "default.target" ];

  primary-user.home-manager.Service.Type = "forking";
  primary-user.home-manager.Service.ExecStart = "${pkgs.stdenv.shell} -l -c 'exec ${pkgs.emacs}/bin/emacs --fg-daemon'";
  primary-user.home-manager.Service.ExecStop = "${pkgs.emacs}/bin/emacsclient --eval '(kill-emacs)'";
  primary-user.home-manager.Service.Restart = "on-failure";
  primary-user.home-manager.Service.SyslogIdentifier = "emacs-daemon";
}

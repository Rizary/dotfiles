{ pkgs, config, ... }:
let
  sessionScript = pkgs.writeScriptBin "lll" ''
    #!${pkgs.stdenv.shell}
    sudo -u ${config.primary-user.name} \
      mount ${config.primary-user.secure.mountPoint}

    ${pkgs.runtimeShell} feh --bg-fill ${wallpaper}
    ${pkgs.xorg.setxkbmap}/bin/setxkbmap \
      -layout dvorak,ara \
      -variant dvorak \
      -option grp:alt_space_toggle,grp_led:scroll
  '';
  wallpaper = ../../../wallpaper/Rizilab/rizilab-nordic.png;
in
{
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xfce.noDesktop = true;

  primary-user.home-manager.xsession.enable = true;
  # primary-user.home-manager.xsession.windowManager.command = "";
  primary-user.home-manager.xsession.scriptPath = ".hm-xsession";

  services.xserver.desktopManager.session = [
    {
      name = "home-manager";
      bgSupport = true;
      start = ''
        ${pkgs.stdenv.shell} $HOME/.hm-xsession &
        waitPID=$!
      '';
    }

    # {
    #   name = "setup-desktop";
    #   bgSupport = true;
    #   start = ''
    #     ${pkgs.runtimeShell} setxkbmap -layout us -variant dvorak
    #     ${pkgs.runtimeShell} feh --bg-fill ${wallpaper}
    #   '';
    # }
    # xloadimage -onroot -fullscreen -background black -center (for background)
  ];

  #services.xserver.desktopManager.sessionCommands = "${sessionScript}/bin/lll";
}

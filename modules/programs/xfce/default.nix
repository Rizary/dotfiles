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
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;

  primary-user.home-manager.xsession.scriptPath = ".hm-xsession";

  services.xserver.desktopManager.session = [
    {
      manage = "window";
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$! 
      '';
    }

    {
      manage = "window";
      name = "setup-desktop";
      start = ''
        ${pkgs.runtimeShell} setxkbmap -layout us -variant dvorak
        ${pkgs.runtimeShell} feh --bg-fill ${wallpaper}
      '';
    }
    # xloadimage -onroot -fullscreen -background black -center (for background)
  ];

  services.xserver.desktopManager.sessionCommands = "${sessionScript}/bin/lll";
}

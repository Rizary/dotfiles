{ pkgs, config, ... }:
let
  sessionScript = pkgs.writeScriptBin "lll" ''
      #!${pkgs.stdenv.shell}
    export SHELL=/run/current-system/sw/bin/bash
      xrandr --output Virtual-1 --mode "1920x1080"
      ${pkgs.runtimeShell} feh --bg-fill ${wallpaper}
      ${pkgs.xorg.setxkbmap}/bin/setxkbmap \
        -layout dvorak,ara \
        -variant dvorak \
        -option grp:alt_space_toggle,grp_led:scroll
  '';
  wallpaper = ./../../../wallpaper/Rizilab/rizilab-nordic.png;
in
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.displayManager.autoLogin.user = "rizary";

  services.xserver.displayManager.lightdm.background = "${wallpaper}";

  primary-user.home-manager.xsession.scriptPath = ".xsession";

  services.xserver.displayManager.session = [
    {
      manage = "window";
      name = "home-manager";
      start = ''
        xrandr --output Virtual-1 --mode "1920x1080"
        ${pkgs.runtimeShell} $HOME/.xsession &
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

  services.xserver.displayManager.sessionCommands = "${sessionScript}/bin/lll";
}

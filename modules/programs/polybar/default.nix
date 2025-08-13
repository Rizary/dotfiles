{ config, pkgs, ... }:
let
  fonts = import ./fonts;
  cfg = config.colorTheme;
  caffein = pkgs.callPackage ./caffein.nix { };
  switch = pkgs.callPackage ./switch.nix { };
in
{
  primary-user.home-manager.services.polybar.enable = true;
  primary-user.home-manager.services.polybar.package = pkgs.polybar.override {
    githubSupport = true;
    pulseSupport = true;
  };
  primary-user.home-manager.services.polybar.config = {
    # Global config
    "global/wm" = {
      margin-top = 0;
      margin-bottom = 0;
    };

    # Main bars

    "bar/xmonad" = fonts // {
      #monitor = "\''${env:MONITOR:HDMI-1}";
      override-redirect = false;

      enable-ipc = true;

      width = "100%";
      height = 52;
      offset-x = 0;
      offset-y = 0;

      background = cfg.background;
      foreground = cfg.foreground;

      overline-size = 2;
      underline-size = 2;

      border-bottom = "0";
      border-bottom-color = cfg.cyan;

      cursor-click = "pointer";
      cursor-scroll = "ns-resize";
      spacing = 1;
      padding-left = 0;
      padding-right = 2;
      module-margin-left = 1;
      module-margin-right = 2;

      modules-left = "workspaces layout";
      modules-center = "music";
      modules-right = "date volume caffeine lock userswitch powermenu";

      tray-position = "right";
      tray-padding = 2;

    };

    # Modules

    "module/workspaces" = {
      type = "custom/script";
      exec = "tail -F /tmp/xmonad-ws";
      exec-if = "[ -p /tmp/xmonad-ws ]";
      tail = true;

      click-left = "sleep 0.1; ${pkgs.xdotool}/bin/xdotool key Super w g";

      format = "<label>";
      format-background = colours.basebg-alt;
      format-foreground = colours.base02;
      format-padding = 2;
    };

    "module/layout" = {
      type = "custom/script";
      exec = "tail -f /tmp/xmonad-layout";
      exec-if = "[ -p /tmp/xmonad-layout ]";
      tail = true;

      format = "<label>";
      format-background = colours.basebg-alt;
      format-foreground = colours.basefg-alt;
      format-padding = 1;

      label = "%output%  ";
    };

    "module/music" = {
      type = "custom/script";
      exec = "${pkgs.playerctl}/bin/playerctl --follow metadata --format '{{artist}}  |  {{title}}'";
      tail = true;
      format = "<label>";
      format-background = colours.base14; # closest to spotify green
      format-foreground = colours.basebg;
      format-padding = 3;

      click-left = "wmctrl -x -a spotify";

      label = "  %output%";
    };

    "module/date" = {
      type = "internal/date";
      interval = 30;
      label = "%time%";
      label-padding = 2;
      label-background = colours.basebg;
      label-foreground = colours.basefg-alt;
      time = " %H:%M";
      time-alt = " %Y-%m-%d";
    };

    "module/volume" = {
      type = "internal/pulseaudio";
      format-volume = "<ramp-volume> <label-volume>  ";
      format-volume-padding = 2;
      format-volume-background = cfg.background;
      format-volume-foreground = cfg.foreground;
      label-volume = "%percentage:3%%";
      label-muted = " mute  ";
      label-muted-foreground = cfg.grey;
      label-muted-background = cfg.lightGrey;
      label-muted-padding = 2;

      ramp-volume-0 = "";
    };

    "module/caffeine" = {
      type = "custom/script";
      exec = "tail -F /tmp/caffeine";
      exec-if = "[ -p /tmp/caffeine ]";
      tail = true;

      click-left = toString caffein;

      format = "<label>";
      format-background = cfg.yellow;
      format-foreground = cfg.lightYellow;
      label = "   %output% ";
      content-padding = 3;
    };

    "module/cpu" = {
      type = "internal/cpu";
      interval = 2;
      format-prefix = " ";
      format-prefix-foreground = cfg.foreground;
      format-underline = cfg.red;
      label = "%percentage%%";
    };

    "module/lock" = {
      type = "custom/text";
      content = " ";
      content-padding = 2;
      content-background = cfg.cyan;
      content-foreground = cfg.foreground;
      click-left = "sleep 0.1; ${pkgs.xdotool}/bin/xdotool key Super q l";
    };

    "module/userswitch" = {
      type = "custom/text";
      content = "";
      content-padding = 2;
      content-background = cfg.lightBlue;
      content-foreground = cfg.foreground;
      click-left = toString switch;
    };

    "module/powermenu" = {
      type = "custom/text";
      content = "襤 ";
      content-padding = 2;
      content-background = cfg.green;
      content-foreground = cfg.foreground;
      click-left = "sleep 0.1; ${pkgs.xdotool}/bin/xdotool key Super q m";
    };
  };

  primary-user.home-manager.services.polybar.extraConfig = "";
  primary-user.home-manager.services.polybar.script = '' 
    pkill polybar
    desktop=$(echo $DESKTOP_SESSION)

    case $desktop in
      none+xmonad)
        if ! pgrep -x polybar; then
          if type "xrandr">/dev/null; then
            echo "Launching polybar for each screen"
            polybar -q -r xmonad &
            ln -s /tmp/polybar_mqueue.$! /tmp/xmonad-mode
          fi
        else
          pkill -USR1 polybar
        fi
        ;;
    esac 
  '';

  # use the following to activate polybar in multiple screen
  #xrandr --listactivemonitors | grep -oP '(HDMI\-\d+$|eDP\-\d+$)' | xargs -P1 -I{} fish -c "MONITOR={}
}

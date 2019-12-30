{ config, lib, pkgs, ... }:

let
  cfg = config.colorTheme;
  colorThemeType = pkgs.callPackage ../../../../lib/type/color-theme {};

  removeOctothorpe = builtins.replaceStrings [ "#" ] [ "" ];
in
{
  options.colorTheme = lib.mkOption {
    type = lib.types.nullOr colorThemeType;
    default = null;
  };

  config = lib.mkIf (cfg != null) {
    home.sessionVariables.LS_COLORS = "$(dircolors ${cfg.dircolors} | head -n 1 | sed \"s/LS_COLORS='\\(.*\\)';/\\1/\")";

    programs.urxvt.extraConfig = {
      # Color Scheme

      "background" = cfg.background;
      "foreground" = cfg.foreground;

      # terminal cursor

      "cursorColor" = cfg.blue;

      "color0" = cfg.black;
      "color8" = cfg.highlightBackground;

      # warning or error color after terminal command
      "color1" = cfg.urgent;
      "color9" = cfg.urgent;

      "color2" = cfg.green;
      "color10" = cfg.green;

      "color3" = cfg.lightYellow;
      "color11" = cfg.lightYellow;


      "color4" = cfg.lightBlue;
      "color12" = cfg.lightBlue;

      # Application warning

      "color5" = cfg.purple;
      "color13" = cfg.purple;

      "color6" = cfg.lightCyan;
      "color14" = cfg.cyan;

      "color7" = cfg.lightGrey;
      "color15" = cfg.highlightForeground;
    };

    programs.fish.shellInit = ''
      set fish_color_normal ${removeOctothorpe cfg.grey}
      set fish_color_command ${removeOctothorpe cfg.lightBlue}
      set fish_color_quote ${removeOctothorpe cfg.green}
      set fish_color_redirection ${removeOctothorpe cfg.lightBlue}
      set fish_color_end ${removeOctothorpe cfg.white}
      set fish_color_error ${removeOctothorpe cfg.red}
      set fish_color_param ${removeOctothorpe cfg.grey}
      set fish_color_comment ${removeOctothorpe cfg.highlightBackground}
      set fish_color_match ${removeOctothorpe cfg.lightCyan}
      set fish_color_search_match ${removeOctothorpe cfg.lightCyan}
      set fish_color_operator ${removeOctothorpe cfg.lightBlue}
      set fish_color_escape ${removeOctothorpe cfg.lightYellow}
      set fish_color_autosuggestion ${removeOctothorpe cfg.white}
      set fish_color_user ${removeOctothorpe cfg.grey}
      set fish_color_host ${removeOctothorpe cfg.lightBlue}
      set fish_color_cancel ${removeOctothorpe cfg.purple}
      set fish_pager_color_prefix ${removeOctothorpe cfg.lightYellow}
      set fish_pager_color_completion ${removeOctothorpe cfg.white}
      set fish_pager_color_description ${removeOctothorpe cfg.blue}
      set fish_pager_color_progress ${removeOctothorpe cfg.lightRed}
      set fish_pager_color_secondary ${removeOctothorpe cfg.foreground}
    '';
  };
}

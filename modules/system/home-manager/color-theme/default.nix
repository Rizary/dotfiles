{ config, lib, pkgs, ... }:

let
  cfg = config.colorTheme;
  colorThemeType = pkgs.callPackage ../../../../lib/type/color-theme {};

  #removeOctothorpe = builtins.replaceStrings [ "#" ] [ "" ];
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
      set fish_color_normal ${cfg.grey}
      set fish_color_command ${cfg.lightBlue}
      set fish_color_quote ${cfg.green}
      set fish_color_redirection ${cfg.lightBlue}
      set fish_color_end ${cfg.white}
      set fish_color_error ${cfg.red}
      set fish_color_param ${cfg.grey}
      set fish_color_comment ${cfg.highlightBackground}
      set fish_color_match ${cfg.lightCyan}
      set fish_color_search_match ${cfg.lightCyan}
      set fish_color_operator ${cfg.lightBlue}
      set fish_color_escape ${cfg.lightYellow}
      set fish_color_cwd ${cfg.lightCyan}
      set fish_color_autosuggestion ${cfg.white}
      set fish_color_user ${cfg.grey}
      set fish_color_host ${cfg.lightBlue}
      set fish_color_cancel ${cfg.purple}
      set fish_pager_color_prefix ${cfg.lightYellow}
      set fish_pager_color_completion ${cfg.white}
      set fish_pager_color_description ${cfg.blue}
      set fish_pager_color_progress ${cfg.lightRed}
      set fish_pager_color_secondary ${cfg.foreground}
    '';
  };
}

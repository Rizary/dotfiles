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
      "foreground" = "${cfg.foreground}";
      "cursorColor" = "${cfg.secondaryContent}";
      "color0" = "${cfg.background}";
      "color1" = "${cfg.secondaryContent}";
      "color2" = "${cfg.selection}";
      "color3" = "${cfg.highlightBackground}";
      "color4" = "${cfg.grey}";
      "color5" = "${cfg.lightGrey}";
      "color6" = "${cfg.white}";
      "color7" = "${cfg.cyan}";
      "color8" = "${cfg.lightCyan}";
      "color9" = "${cfg.lightBlue}";
      "color10" = "${cfg.blue}";
      "color11" = "${cfg.red}";
      "color12" = "${cfg.lightRed}";
      "color13" = "${cfg.lightYellow}";
      "color14" = "${cfg.green}";
      "color15" = "${cfg.purple}";
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
      set fish_pager_color_secondary ${cfg.secondaryContent}
    '';
  };
}

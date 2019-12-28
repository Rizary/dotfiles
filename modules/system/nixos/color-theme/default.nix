{ config, lib, pkgs, ... }:

let
  cfg = config.colorTheme;
  colorThemeType = pkgs.callPackage ../../../../lib/type/color-theme {};
in
{
  options.colorTheme = lib.mkOption {
    type = lib.types.nullOr colorThemeType;
    default = null;
  };

  config = lib.mkIf (cfg != null) {
    i18n.consoleColors = map (builtins.replaceStrings [ "#" ] [ "" ]) [
      cfg.background
      cfg.foreground
      cfg.red
      cfg.green
      cfg.yellow
      cfg.blue
      cfg.purple
      cfg.cyan
      cfg.grey
      cfg.lightRed
      cfg.lightGreen
      cfg.lightYellow
      cfg.lightBlue
      cfg.lightPurple
      cfg.lightCyan
      cfg.white
    ];
  };
}

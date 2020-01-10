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
    console.colors = map (builtins.replaceStrings [ "#" ] [ "" ]) [
      cfg.black
      cfg.urgent
      cfg.green
      cfg.lightYellow
      cfg.lightBlue
      cfg.purple
      cfg.lightCyan
      cfg.lightGrey
      cfg.highlightBackground
      cfg.urgent
      cfg.green
      cfg.lightYellow
      cfg.lightBlue
      cfg.purple
      cfg.cyan
      cfg.highlightForeground
    ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.colorTheme;
  configFile = let
    fonts = lib.concatStringsSep "," [
      "Iosevka:size=12"
      "Iosevka:style=bold:size=10"
    ];
  in
    pkgs.writeText "xmobar-config" ''
      Config
        { font = "xft:${fonts}"
        , bgColor = "${cfg.background}"
        , fgColor = "${cfg.foreground}"
        , position = Top
        , border = Top
        , alpha = 210
        , commands =
            [ Run Cpu
              [ "-t", "<total>%"
              , "-L", "10"
              , "-H", "50"
              , "-l", "${cfg.green}"
              , "-h", "${cfg.red}" ] 10
            , Run Date "%a %d.%m %T" "date" 10
            , Run XMonadLog
            , Run Memory [] 10
            , Run DynNetwork 
                [ "-t", "<tx>,<rx> KB/s | "
                , "-L", "10000"
                , "-H", "500000"
                , "-l", "${cfg.green}"
                , "-n", "${cfg.lightRed}"
                , "-h", "${cfg.red}" ] 10
          ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%XMonadLog% } "}%memory% | %dynnetwork%%cpu% "}<fc=${cfg.red}>%date%</fc>"
        }
    '';

in
{
  primary-user.home-manager.services.xmobar.enable = true;
  primary-user.home-manager.services.xmobar.config = configFile;
}

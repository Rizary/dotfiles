{ config, lib, pkgs, ... }:
let
  cfg = config.colorTheme;
  configFile =
    let
      fonts = lib.concatStringsSep "," [
        "PragmataPro Mono:style=Regular:size=14"
        "PragmataPro Mono:style=Bold:size=13"
        "FontAwesome:style=solid:size=14"
      ];
    in
    pkgs.writeText "xmobar-config" ''
      Config
        { font = "xft:${fonts}"
        , bgColor = "${cfg.background}"
        , fgColor = "${cfg.foreground}"
        , position = Top
        , border = TopB
        , alpha = 210
        , commands =
            [ Run StdinReader
            , Run Cpu
              [ "-t", "<total>%"
              , "-L", "10"
              , "-H", "50"
              , "-l", "${cfg.green}"
              , "-h", "${cfg.red}" ] 10
            , Run Date "%a %d.%m %T" "date" 10
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

        -- layout
        , template = "%StdinReader% }{ %memory% | %dynnetwork%%cpu% <fc=${cfg.lightBlue}>%date%</fc> "
        }
    '';
in
{
  primary-user.home-manager.programs.xmobar.enable = true;
  primary-user.home-manager.programs.xmobar.config = configFile;
}

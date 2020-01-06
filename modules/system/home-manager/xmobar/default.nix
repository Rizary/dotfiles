{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.services.xmobar;
in
{
  options.services.xmobar = {
    enable = mkEnableOption "xmobar status bar";
    config = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = literalExample ''
        pkgs.writeText "xmobar-config" '''
          Config 
            {
              font = "xft:Iosevka"
            , position = Top
            }
        '''
      '';
      description = ''
        The configuration file to be used for xmobar. 
      '';
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.xmobar = {
      Unit = {
        Description = "Xmobar";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.haskellPackages.xmobar}/bin/xmobar ${cfg.config}";
        Restart = "on-failure";
      };
    };
  };
}

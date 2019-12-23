{ lib, config, ... }:

let
  cfg = config.font;
in

{
  options.font = {
    package = lib.mkOption {
      description = "The package that provides the font";
      default = null;
      type = lib.types.nullOr lib.types.package;
    };

    face = lib.mkOption {
      type = lib.types.str;
      description = "The font face name.";
    };

    size = lib.mkOption {
      type = lib.types.int;
      description = "The font size.";
    };
  };

  config = lib.mkIf (cfg.package != null) {
    home.packages = [ cfg.package ];

    programs = {};
  };
}

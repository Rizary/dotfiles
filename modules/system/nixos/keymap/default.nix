{ pkgs, config, lib, ... }:
let
  cfg = config.keymap;
  keymapType = pkgs.callPackage ../../../../lib/type/keymap { };
in
{
  options.keymap = lib.mkOption {
    type = lib.types.nullOr keymapType;
    default = null;
  };

  config = lib.mkIf (cfg != null) {
    console.keyMap = pkgs.runCommand "console-keymap"
      { } ''
      '${pkgs.ckbcomp}/bin/ckbcomp' \
        -layout '${cfg.layout}' \
        -variant '${cfg.variant}' \
        -option '${cfg.options}' > "$out"
    '';
  };
}

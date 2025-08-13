{ pkgs, config, lib, ... }:
let
  cfg = config.keymap;
<<<<<<< HEAD
  keymapType = pkgs.callPackage ../../../../lib/type/keymap {};
=======
  keymapType = pkgs.callPackage ../../../../lib/type/keymap { };
>>>>>>> flakes
in
{
  options.keymap = lib.mkOption {
    type = lib.types.nullOr keymapType;
    default = null;
  };

  config = lib.mkIf (cfg != null) {
<<<<<<< HEAD
    i18n.consoleKeyMap = pkgs.runCommand "console-keymap" {} ''
      '${pkgs.ckbcomp}/bin/ckbcomp' \
        -layout '${cfg.layout}' \
        -option '${cfg.options}' \
        -variant '${cfg.variant}' > "$out"
=======
    console.keyMap = pkgs.runCommand "console-keymap"
      { } ''
      '${pkgs.ckbcomp}/bin/ckbcomp' \
        -layout '${cfg.layout}' \
        -variant '${cfg.variant}' \
        -option '${cfg.options}' > "$out"
>>>>>>> flakes
    '';
  };
}

{ lib }:

lib.types.submodule {
  options.layout = lib.mkOption {
    description = "keymap";
    type = lib.types.str;
  };
  options.variant = lib.mkOption {
    description = "keymap";
    type = lib.types.str;
  };
  options.options = lib.mkOption {
    description = "keymap";
    type = lib.types.str;
  };
}

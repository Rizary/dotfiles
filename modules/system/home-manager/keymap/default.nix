{ pkgs, lib, ... }:
let
  keymapType = pkgs.callPackage ../../../../lib/type/keymap {};
in
{
  options.keymap = lib.mkOption {
    type = lib.types.nullOr keymapType;
    default = null;
  };
}

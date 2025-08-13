{ pkgs, lib, ... }:
<<<<<<< HEAD
let keymapType = pkgs.callPackage ../../../../lib/type/keymap {};
=======
let
  keymapType = pkgs.callPackage ../../../../lib/type/keymap { };
>>>>>>> flakes
in
{
  options.keymap = lib.mkOption {
    type = lib.types.nullOr keymapType;
    default = null;
  };
}
<<<<<<< HEAD

=======
>>>>>>> flakes

{ pkgs }:
let
  sources = import ../../niv/sources.nix;
  inherit (pkgs.tmuxPlugins) mkDerivation;
in
mkDerivation {
  pluginName = "nord";
  src = sources.nord-tmux;
}

let
  sources = import ../../niv/sources.nix;
  emacs-overlays = import (builtins.fetchTarball { inherit (sources.emacs-overlay) url sha256; });
in

emacs-overlays

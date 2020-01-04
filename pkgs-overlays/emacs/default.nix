let
  sources = import ../../niv/sources.nix;
  emacs-overlays = import (builtins.fetchTarball { inherit (sources.emacs-overlay) url sha256; });

in
self: super: rec {
  mu = super.mu.override { emacs = self.emacsGit; };
  inherit (emacs-overlays self super) emacsGit emacsGit-nox;
}

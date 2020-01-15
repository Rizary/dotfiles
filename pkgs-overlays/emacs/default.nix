let
  sources = import ../../niv/sources.nix;
  emacs-overlays = import (builtins.fetchTarball { inherit (sources.emacs-overlay) url sha256; });

in
self: super: rec {
  mu = super.mu.override { emacs = self.emacs; };
  inherit (emacs-overlays self super) emacsGit emacsGit-nox emacsWithPackagesFromUsePackage emacsPackagesFor;
  #emacsPackagesFor = emacs: (
  #(super.emacsPackagesFor emacs).overrideScope' (
  #epkgs: _: {
  #ra-emacs-lsp = epkgs.callPackage ./ra-emacs-lsp.nix { inherit epkgs sources; };
  #}
  #)
  #);
  raEmacsLsp = self.callPackage ./ra-emacs-lsp.nix { inherit sources; };
}

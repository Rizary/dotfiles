{ sources }:
let
  raEmacsLsp = sources.rust-analyzer + "/editors/emacs/ra-emacs-lsp.el";
in
raEmacsLsp

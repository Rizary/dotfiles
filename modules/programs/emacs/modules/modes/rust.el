;;; modes/rust.el --- Configuration for rust language
;;;
;;; Commentary:
;;;
;;; This file 
;;;
;;; Code:

;; Rust

(use-package rust-mode
	    :defer t
	    :commands (rust-mode)
	    :config
	    (setq rust-indent-offset 2))

(require 'lsp)
(require 'ra-emacs-lsp)
(setq lsp-rust-server 'rust-analyzer)
(setq lsp-log-io 't)

(provide 'rust)
;;; rust.el ends here

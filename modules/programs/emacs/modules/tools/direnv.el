;;; tools/direnv.el --- Configuration for direnv
;;;
;;; Commentary:
;;;
;;; This file enables direnv integration and running direnv-allow within emacs.
;;;
;;; Code:

;; Enable direnv
(use-package direnv
  :config
  (direnv-mode))

(provide 'direnv)
;;; direnv.el ends here

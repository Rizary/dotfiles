;;; keybindings/evil.el --- Configuration for evil mode
;;;
;;; Commentary:
;;;
;;; This file is to enable evil mode
;;;
;;; Code:

;; Evil

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(provide 'evil)
;;; evil.el ends here

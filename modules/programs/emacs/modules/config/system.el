;;; config/system.el --- Set system config values
;;;
;;; Commentary:
;;;
;;; This file defines system settings that make things work better in Emacs.
;;;
;;; Code:

;; calling shell from nix-config global variable
(setq shell-file-name (gethash "shell" (gethash "paths" nix-config)))

;; enabe y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; make it hard to kill emacs
(setq confirm-kill-emacs #'y-or-n-p)

(provide 'system) ;; to be available to another file
;;; system.el ends here

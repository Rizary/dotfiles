;;; config/system.el --- Set system config values
;;;
;;; Commentary:
;;;
;;; This file defines system settings that make things work better in Emacs.
;;;
;;; Code:

;; calling shell from nix-config global variable
(setq shell-file-name (gethash "shell" (gethash "paths" nix-config)))

(provide 'system) ;; to be available to another file
;;; system.el ends here

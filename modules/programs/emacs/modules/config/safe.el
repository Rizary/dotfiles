;;; config/safe.el --- Set safety values
;;;
;;; Commentary:
;;;
;;; This file modify how Emacs starts up
;;;
;;; Code:

;; Hide startup screen and messages
(setq inhibit-startup-screen t
      inhibit-startup-message t)

(provide 'safe) ;; to be available to another file
;;; safe.el ends here

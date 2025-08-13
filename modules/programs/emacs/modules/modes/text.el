;;; modes/text.el --- Configuration for text-based file
;;;
;;; Commentary:
;;;
;;; This file modify how Emacs behaves on text-based file
;;;
;;; Code:

(setq-default
 ;; completely disable tabs mode
 indent-tabs-mode nil
 ;; set tab-width to 4 spaces
 tab-width 4
 ;; fill to 80 characters instead of default 70
 fill-column 80)

;; smart tab behavior - indent or complete
(setq tab-always-inent 'complete)

(provide 'text) ;; to be available to another file
;;; text.el ends here

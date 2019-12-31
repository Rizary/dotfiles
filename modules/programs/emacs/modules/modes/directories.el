;;; modes/directories.el --- Configuration for directories
;;;
;;; Commentary:
;;;
;;; This file change the way of directory listed.
;;;
;;; Code:

;; Use ranger instead of dired
(use-package ranger
	     :demand
	     :init (setq ranger-cleanup-on-disable nil
			 ranger-cleanup-eagerly nil)
	     :config (ranger-override-dired-mode)
	     :general
	     ('(normal-motion emacs)
	      "SPC ar" '(ranger :which-key "ranger"))
	     (ranger-mode-map
	      "C-W" nil
	      "?" nil
	      "M" #'dired-do-chmod
	      "C" #'dired-do-copy
	      "R" #'dired-do-rename))

(provide 'directories) ;; to be available to another file
;;; directories.el ends here

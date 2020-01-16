;;; config/files.el --- Configuration for file handling
;;;
;;; Commentary:
;;;
;;; This file configure how Emacs deals with temporary files, autosave file, etc.
;;;
;;; Code:

;; Stop making lockfiles
(setq create-lockfiles nil)

;; Disable backup and autosave files
;;(use-package files
;;	     :config (setq make-backup-files nil
;;			   auto-save-default nil))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq create-lockfiles nil)

(provide 'files) ;; to be available to another file
;;; files.el ends here

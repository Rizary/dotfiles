;;; tools/orgjournal.el --- Configuration for org-journal
;;;
;;; Commentary:
;;;
;;; This file enables org-journal integration  within emacs.
;;;
;;; Code:

;; Enable org-journal
(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  ("C-c n t" . org-journal-today)
  :config
  (setq org-journal-date-prefix "#+TITLE: "
        org-journal-file-format "private-%Y-%m-%d.org"
        org-journal-dir "/home/rizary/Projects/rizilab-braindump"
        org-journal-carryover-items nil
        org-journal-date-format "%Y-%m-%d")
  (defun org-journal-today ()
    (interactive)
    (org-journal-new-entry t)))

(provide 'orgjournal)
;;; orgjournal.el ends here

;;; tools/orgroam.el --- Configuration for org-roam
;;;
;;; Commentary:
;;;
;;; This file enables org-roam integration  within emacs.
;;;
;;; Code:

;; Enable orgroam
(use-package org-roam
  :commands (org-roam-insert org-roam-find-file org-roam-switch-to-buffer org-roam)
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "/home/rizary/Projects/rizilab-braindump")
  ;;(org-roam-db-location "/home/rizary/Projects/rizilab-braindump/org-roam.db")
  :bind (:map org-roam-mode-map
          (("C-c n l" . org-roam)
           ("C-c n f" . org-roam-find-file)
           ("C-c n g" . org-roam-show-graph)
           :map org-mode-map
           (("C-c n i" . org-roam-insert)))))

(provide 'orgroam)
;;; orgroam.el ends here

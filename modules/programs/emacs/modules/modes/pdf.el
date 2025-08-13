;;; modes/text.el --- Configuration for pdf-based file
;;;
;;; Commentary:
;;;
;;; This file modify how Emacs behaves on pdf-based file
;;;
;;; Code:
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  )

(use-package org-pdfview)

(provide 'pdf) ;; to be available to another file
;;; pdf.el ends here

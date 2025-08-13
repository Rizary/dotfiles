;;; keybindings/evilcollection.el --- Configuration for evil-collection mode
;;;
;;; Commentary:
;;;
;;; This file is to enable evil-collection mode
;;;
;;; Code:

;; Evil-collection

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))



(provide 'evilcollection)
;;; evilcollection.el ends here

;;; ui/gui.el --- Configuration for Emacs GUI
;;;
;;; Commentary:
;;;
;;; This file disables pretty much all GUI elements.
;;;
;;; Code:

;; Turn off GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-flame-alist '(vertical-scroll-bars . nil))
(setq x-gtk-use-system-tooltips nil)

(provide 'gui) ;; to be available to another file
;;; startup.el ends here

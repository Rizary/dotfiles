;;; init.el --- Emacs configuration
;;;
;;; Commentary:
;;;
;;; This is the entrypoint of my Emacs configuration for day-to-day software development
;;; I choose to stay on plain Emacs so I can learn Emacs Lisp one at a time
;;; The following code and setup are based on my preference from other Emacs user (please refer to my dotfiles' README.md credit section).
;;; Feel free to use this as your Emacs reference
;;;
;;; Code:

(require 'package)
(setq package-archives nil
      package-enable-at-startup nil)
(package-initialize)

(eval-when-compile (require 'use-package))

(defun load-module (module)
  "Load all files in Module from the `user-emacs-directory`."
  (load (concat user-emacs-directory module)))

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)

;; Keybinding should be loaded first here

;; Specific filetype or app configuration
(load-module "modules/modes/text")

;; UI configuration
(load-module "modules/ui/buffers")
(load-module "modules/ui/gui")

;; General configuration
(load-module "modules/config/files")
;; NOT READY: (load-module "modules/config/safe")
(load-module "modules/config/startup")
(load-module "modules/config/system")

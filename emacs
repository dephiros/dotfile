(load-theme 'adwaita)
(require 'tramp)
(setq tramp-default-method "ssh")
;;; add package repo
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; turn off startup message
(setq inhibit-startup-message t)

;; not use tab in code
(setq-default indent-tabs-mode nil)


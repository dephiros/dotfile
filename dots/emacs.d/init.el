;; simplify things by removing some bars
(menu-bar-mode -1)
(tool-bar-mode -1)
;; set display of tab to 2 col
(setq tab-width nil)
(setq lisp-indent-offset 2)
;; default theme
(load-theme 'adwaita t)
(set-frame-font "FiraCode Nerd Font Mono-13" nil t)

; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
	(expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
       (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
	"https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
;; use-package setup
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

;; extra theme
(use-package zenburn-theme)
(use-package gruvbox-theme
  :config (load-theme 'gruvbox-dark-medium t))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package magit)
(use-package company-mode
  :hook (after-init . global-company-mode))
(use-package selectrum
  :config
  (selectrum-mode +1))
(use-package selectrum-prescient
  :hook (selectrum-mode . selectrum-prescient-mode))
(use-package which-key
  :config
  (which-key-mode 1))
;; Start emacs server in the background
(server-start)

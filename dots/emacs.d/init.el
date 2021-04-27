;; simplify things by removing some bars
(menu-bar-mode -1)
(tool-bar-mode -1)
;; set display of tab to 2 col
(setq tab-width nil)
(setq lisp-indent-offset 2)
;; default theme
(load-theme 'adwaita t)
(set-frame-font "FiraCode Nerd Font Mono-13" nil t)
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta))

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
;; package to manage git
(use-package magit)
;; autocomplete engine
(use-package company-mode
  :hook (after-init . global-company-mode))
(use-package company-prescient
  :hook (company-mode . company-prescient-mode))
;; interactive selection of time
(use-package selectrum
  :config
  (selectrum-mode +1))
;; sort and filter selection of items based on last used
(use-package selectrum-prescient
  :init
  (setq prescient-filter-method '(literal regexp initialism fuzzy))
  :hook (selectrum-mode . selectrum-prescient-mode))
;; handy command based on emacs completion function, yank, buffer, gotolink, mark, search...
(use-package consult)
;; Emacs Mini-Buffer Actions Rooted in Keymaps
;; This package provides a sort of right-click contextual menu for Emacs, accessed through the embark-act command
(use-package embark)
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :bind (("C-," . 'embark-act)
         ("C-." . 'embark-become))
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))
;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode)

  ;; Prefer richer, more heavy, annotations over the lighter default variant.
  ;; E.g. M-x will show the documentation string additional to the keybinding.
  ;; By default only the keybinding is shown as annotation.
  ;; Note that there is the command `marginalia-cycle' to
  ;; switch between the annotators.
  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
)
;; display popup for keyboard shortcuts for emacs
(use-package which-key
  :config
  (which-key-mode 1))
;; Start emacs server in the background
(server-start)

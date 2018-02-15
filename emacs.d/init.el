;; -*- lexical-binding: t -*-


;;----------------------------------------------------------------------------
;; some init systems setting
;;----------------------------------------------------------------------------

(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;;----------------------------------------------------------------------------
;; visual settings
;;----------------------------------------------------------------------------

(global-visual-line-mode 1)
(line-number-mode 1)                    ; have line numbers and
(column-number-mode 1)                  ; column numbers in the mode line

(tool-bar-mode -1)                      ; no tool bar with icons
(scroll-bar-mode -1)                    ; no scroll bars
(unless (string-match "apple-darwin" system-configuration)
  ;; on mac, there's always a menu bar drown, don't have it empty
  (menu-bar-mode -1))

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
    (set-face-font 'default "Monaco-14")
  (set-face-font 'default "Monospace-14"))

(global-linum-mode 1)                   ; add line numbers on the left


;;----------------------------------------------------------------------------
;; init package management straight.el and use-package
;;----------------------------------------------------------------------------

;;; install straight.el
(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; use-package
(straight-use-package 'use-package)
(setq use-package-verbose t)
(setq straight-use-package-by-default t)


;;----------------------------------------------------------------------------
;; Install packages
;;----------------------------------------------------------------------------
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package evil
  :init
  :config
  (require 'evil)
  (evil-mode t))

(use-package evil-leader
  :init
  :config
  (require 'evil-leader)
  (global-evil-leader-mode))

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package projectile
  :init
  (projectile-global-mode))

;; this package help fuzzy matching
(use-package flx)

;; ivy replaces ido and configure fuzzy matching that rely on flx for sorting
;; https://oremacs.com/2016/01/06/ivy-flx/
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist
    '((swiper . ivy--regex-plus)
      (t . ivy--regex-fuzzy))))

;; this package use ivy as a backend for text search in file
(use-package swiper
  :config
  (global-set-key "\C-s" 'swiper))

;; integration between ivy and projectile
(use-package counsel-projectile
  :config
  (counsel-projectile-mode 1))

(use-package ag)
(use-package rg)

(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

;; org brain for wiki. See https://github.com/Kungsgeten/org-brain
(use-package org-brain
  :init
  (setq org-brain-path "~/org/brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  ; You might want to add information at the end of an entry, without visiting the file. A way to do this is to use a capture template, such as the one presented above.
  ; (push '("b" "Brain" plain (function org-brain-goto-end)
  ;         "* %i%?" :empty-lines 1)
  ;       org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  ;; For Evil users
  (setq org-brain-title-max-length 12)
  (global-set-key "\C-cb" 'org-brain-visualize)
  (evil-set-initial-state 'org-brain-visualize-mode 'emacs))

;;----------------------------------------------------------------------------
;; Org settings
;;----------------------------------------------------------------------------
(setq org-src-fontify-natively t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-directory "~/org")

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------

(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; custom
;;----------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/note.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)

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

;; Key bindings

(when *is-a-mac* ;; mac specific settings
  (setq mac-option-key-is-meta t)
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier nil)
  (setq  mac-option-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
)
;;; C-x r j e
(set-register ?i (cons 'file "~/dotfiles/emacs.d/init.el"))
(set-register ?w (cons 'file "~/org/wiki/index.org"))


;;----------------------------------------------------------------------------
;; visual settings
;;----------------------------------------------------------------------------

(global-visual-line-mode 1)
(line-number-mode 1)                    ; have line numbers and
(column-number-mode 1)                  ; column numbers in the mode line

(tool-bar-mode -1)                      ; no tool bar with icons
(scroll-bar-mode -1)                    ; no scroll bars
(if (not *is-a-mac*)
  ;; on mac, there's always a menu bar drown, don't have it empty
  (menu-bar-mode -1))

;; choose your own fonts, in a system dependant way
(if *is-a-mac*
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
(use-package ag)
(use-package rg)

;; helm
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally
(straight-use-package
 '(helm-rg :type git :host github :repo "microamp/helm-rg"))
(use-package helm-projectile
  :bind(("C-c p p" . helm-projectile-switch-project)))

(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

;; org-wiki: example to isntall from github
;; (use-package let-alist)
;; (use-package org-wiki
;;   :straight (org-wiki :type git :host github :repo "caiorss/org-wiki")
;;   :config
;;   (require 'org-wiki)
;;   (setq org-wiki-location-list
;;     '(
;;       "~/org/wiki"
;;     ))
;; 
;;   ;; Initialize first org-wiki-directory or default org-wiki 
;;   (setq org-wiki-location (car org-wiki-location-list))
;;   (setq org-wiki-server-port "8123") ;; 8000 - default value 
;; 
;;   )

;; this helps with code highlight
(use-package htmlize)

;; org rifle for searching through org file
(use-package dash)
(use-package f)
(use-package s)
(use-package helm-org-rifle
  :bind (("C-c r" . helm-org-rifle-org-directory)))

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
 '(org-agenda-files (quote ("~/org/note.org")))
 '(org-export-with-sub-superscripts (quote {}))
 '(org-use-sub-superscripts (quote {})))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)

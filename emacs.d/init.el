; emacs basic miscellaneous stuffs
;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; add line number by default
(global-linum-mode t)
;; turn on visual line mode by default
(global-visual-line-mode t)
;; save session
(desktop-save-mode 1)
;; enable whitespace mode to highlight tab and trailing space
(require 'whitespace)
(setq whitespace-style
      '(face empty lines-tail tabs tab-mark trailing))
(global-whitespace-mode t)
;; set these font if exist in systems
(cond ((member "Source Code Pro" (font-family-list))
       (set-face-attribute 'default nil :font "Source Code Pro-13"))
      ((member "Inconsolata" (font-family-list))
       (set-face-attribute 'default nil :font "Inconsolata-14")))

;; list of prerequisite packages like use-package
(defvar my-packages '(use-package))
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(package-initialize)
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages from above list
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;;; make sure package always ensured to be installed from package.el
(setq use-package-always-ensure t)
(defvar defer-sec-1 1 "Defer time in sec for level 1.")
(defvar defer-sec-2 5 "Defer time in sec for level 2.")

;; set up auto-update-package
(use-package auto-package-update
  ;; delay 5 seconds before loading this package
  :defer defer-sec-1
  :config
  (auto-package-update-maybe))

;; set up exec path from shell; make sure path is synced in emacs GUI
(use-package exec-path-from-shell
  :config
  ; sync emacs path
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;; set up better default
(use-package better-defaults)

;; set up solarized-theme
(use-package solarized-theme
  :config
  ;;; load theme
  (load-theme 'solarized-dark t))

;; set up company mode
(use-package company
  :defer 5
  :config (global-company-mode))

;; set up org mode
(use-package org
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  :defer t)

;; set up auctex
(use-package auctex
  :defer t
  :config
  (setq TeX-auto-save t))


;; set up flycheck
(use-package flycheck
  :config
  (setq flycheck-global-modes '(not LaTeX-mode latex-mode org-mode)))

;; set up ido
(use-package ido
  :ensure ido-ubiquitous
  :ensure smex
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;;;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  )

;; magit
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

;; emmet html expansion
(use-package emmet-mode
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  )

;; js2 mode
(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
  (setq js2-basic-offset 2))

; finally start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (smex magit ido-ubiquitous better-defaults)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

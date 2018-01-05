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

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------

(require 'server)
(unless (server-running-p)
  (server-start))

; emacs basic miscellaneous stuffs
;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; add line number by default
(global-linum-mode t)
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
; set up packages
(require 'package)
;; list of packages
(defvar my-packages '(better-defaults ido-ubiquitous magit smex solarized-theme auctex))

(add-to-list 'package-archives
     '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; set up ido-ubiquitous
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smex ido in M-x
(require 'smex) ; Not needed if you use package.el
;;; bind M-x to use smex instead of default emacs
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

; load theme
(load-theme 'solarized-light t)

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

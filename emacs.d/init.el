;;; init.el --- Where all the magic begins
;;
;;
;; This is the first thing to get loaded.
;;

;; load Org-mode from source when the ORG_HOME environment variable is set
(when (getenv "ORG_HOME")
  (let ((org-lisp-dir (expand-file-name "lisp" (getenv "ORG_HOME"))))
    (when (file-directory-p org-lisp-dir)
      (add-to-list 'load-path org-lisp-dir)
      (require 'org))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(require 'diminish)
(require 'bind-key)

(use-package evil
  :init
  :config
  (require 'evil)
  (evil-mode t))

(use-package markdown-mode)

(use-package flycheck)

(use-package ivy
  :diminish ivy-mode
  :init (setq projectile-completion-system 'ivy)
  :bind
  (:map ivy-mode-map ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 13)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-virtual-abbreviate 'full) ; Show the full virtual file paths
  (setq ivy-extra-directories '("./")) ; default value: ("../" "./")
  (setq ivy-wrap t)
  (setq ivy-re-builders-alist '((swiper . ivy--regex-plus)
                (counsel-ag . ivy--regex-plus)
                (counsel-grep-or-swiper . ivy--regex-plus)
                (t . ivy--regex-fuzzy))))
(use-package magit)

;; javascript and stuff
(use-package web-mode)
(use-package vue-mode)

;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vue-mode web-mode flycheck markdown-mode evil use-package auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

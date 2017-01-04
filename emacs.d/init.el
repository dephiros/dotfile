; emacs basic miscellaneous stuffs
;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; highlight tab and spaces
(highlight-tabs)
(highlight-trailing-whitespace)
;; add line number by default
(global-linum-mode t)
;; set these font if exist in systems
(cond ((member "Source Code Pro" (font-family-list))
       (set-face-attribute 'default nil :font "Source Code Pro-13"))
      ((member "Inconsolata" (font-family-list))
       (set-face-attribute 'default nil :font "Inconsolata-14")))

; finally start emacs server
(require 'server)
(unless (server-running-p)
    (server-start))

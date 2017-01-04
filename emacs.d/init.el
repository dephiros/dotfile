; emacs basic miscellaneous stuffs
;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; add line number by default
(global-linum-mode t)
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

; finally start emacs server
(require 'server)
(unless (server-running-p)
    (server-start))

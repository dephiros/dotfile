; Install packages
(setq package-list '(evil ))

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; load theme
(load-theme 'misterioso t)

; Use evil mode
(require 'evil)
(evil-mode t)

; turn on linum
(global-linum-mode t)
; turn off tab
(setq-default indent-tabs-mode nil)

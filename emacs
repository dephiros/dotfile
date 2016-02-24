; Install packages
(setq package-list '(evil nginx-mode))

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
(require 'linum)
(line-number-mode 1)
(column-number-mode 1)  ;; Line numbers on left most column
(global-linum-mode 1)
; turn off tab
(setq-default indent-tabs-mode nil)
; turn on visual line mode by default
(global-visual-line-mode 1)

; replace yes no with just y, n
(fset 'yes-or-no-p 'y-or-n-p)

; set up tramp
(setq tramp-default-method "sshx")

(server-start)

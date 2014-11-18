;; Add emacs to emacs-lisp-mode
(add-to-list 'auto-mode-alist '("\\.?emacs\\'" . emacs-lisp-mode))

;; tramp setup
(require 'tramp)
(setq tramp-default-method "ssh")

;; add package repo
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; turn off startup message
(setq inhibit-startup-message t)
;; disable menu bar
;; (tool-bar-mode -1)
;; load theme
(load-theme 'adwaita)

;; define offset
(setq c-basic-offset 2)
;; tab width
;; (setq-default tab-width 4)
;; treat tab as space from now on
(setq indent-tabs-mode nil)

;; not use tab in code
(setq-default indent-tabs-mode nil)

;; turn on syntax highlighting
(global-font-lock-mode 1)


;;; insert time and date
;; ====================
;; insert date and time

(defvar current-date-time-format "%Y%m%d%H%M"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%H%M%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert ": ")
       )

(global-set-key "\C-c\C-d" 'insert-current-time)

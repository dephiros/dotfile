;;; packages.el --- simplenote layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: An Nguyen <an.nguyen@anZonarMac>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `simplenote-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `simplenote/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `simplenote/pre-init-PACKAGE' and/or
;;   `simplenote/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq simplenote-packages
  '(
    simplenote2
   ))


;;; packages.el ends here
(defun simplenote/init-simplenote2()
  (use-package simplenote2
    :defer t
    :commands (simplenote2-browse
               simplenote2-sync-notes
               simplenote2-create-note-from-buffer
               simplenote2-push-buffer
               simplenote2-pull-buffer
               simplenote2-filter-note-by-tag
               simplenote2-add-tag
               simplenote2-delete-tag
               simplenote2-set-pinned
               simplenote2-set-markdown
               )
    :config
             (setq simplenote2-email "dephiros@gmail.com")
             (setq simplenote2-password nil)
             (simplenote2-setup)
    )
)

;;; init-ivy.el
;;; Commentary:
;;; Code:

(require-package 'diminish)

;; ivy
(require-package 'ivy)
(add-hook 'after-init-hook 'ivy-mode)
(with-eval-after-load 'ivy
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-magic-title nil
		ivy-use-selectable-prompt t
		Emable-recursive-minibuffers t)
  (diminish 'ivy-mode))

;; counsel
(require-package 'counsel)
(setq-default counsel-mode-override-describe-bindings t)
(with-eval-after-load 'counsel
  (diminish 'counsel-mode))
(add-hook 'after-init-hook 'counsel-mode)

(require-package 'ivy-xref)
(setq xref-show-xrefs-function 'ivy-xref-show-xrefs)

(require-package 'ivy-purpose)
(ivy-purpose-setup)

(provide 'init-ivy)
;; init-ivy.el ends here

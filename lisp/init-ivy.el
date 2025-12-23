;;; init-ivy.el
;;; Commentary:
;;; Code:

;; ivy
(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :config
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-magic-title nil
		ivy-use-selectable-prompt t
		Emable-recursive-minibuffers t)
  (diminish 'ivy-mode)
  (use-package ivy-xref
    :ensure t
    :config
    (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))
  (use-package ivy-purpose
    :ensure t
    :config
    (ivy-purpose-setup)))

;; counsel
(use-package counsel
  :ensure t
  :hook (after-init . counsel-mode)
  :config
  (setq-default counsel-mode-override-describe-bindings t)
  (diminish 'counsel-mode))

(provide 'init-ivy)
;; init-ivy.el ends here

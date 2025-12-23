;;; init-yasnippet.el --- Initialize yasnippet

;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :custom
  (yas-snippet-dirs (list (expand-file-name "snippets/" user-emacs-directory)))
  :config
  (let ((local-snippets (expand-file-name ".snippets/" "~/")))
    (if (file-directory-p local-snippets)
        (add-to-list 'yas-snippet-dirs local-snippets)))
  (diminish 'yas-minor-mode)
  (yas-reload-all))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

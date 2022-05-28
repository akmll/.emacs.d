;;; init-yasnippet.el --- Initialize yasnippet

;;; Commentary:
;;; Code:

(require-package 'yasnippet)
(with-eval-after-load 'yasnippet
  (diminish 'yas-minor-mode))

(setq yas-snippet-dirs (list
			(expand-file-name "snippets/" user-emacs-directory)
			(expand-file-name "local-snippets/" user-emacs-directory)))

(yas-reload-all)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

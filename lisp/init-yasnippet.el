;;; init-yasnippet.el --- Initialize yasnippet

;;; Commentary:
;;; Code:

(require-package 'yasnippet)
(with-eval-after-load 'yasnippet
  (diminish 'yas-minor-mode)
  (yas-reload-all))

(setq yas-snippet-dirs (list
			(expand-file-name "snippets/" user-emacs-directory)
			(expand-file-name "local-snippets/" user-emacs-directory)))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

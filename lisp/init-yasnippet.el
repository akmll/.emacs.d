;;; init-yasnippet.el --- Initialize yasnippet

;;; Commentary:
;;; Code:

(require-package 'yasnippet)
(with-eval-after-load 'yasnippet
  (setq yas-snippet-dirs (list (expand-file-name "snippets/" user-emacs-directory)))
  (let ((local-snippets (expand-file-name ".snippets/" "~/")))
    (if (file-directory-p local-snippets)
        (add-to-list 'yas-snippet-dirs local-snippets)))
  
  (diminish 'yas-minor-mode)
  (yas-reload-all))


(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

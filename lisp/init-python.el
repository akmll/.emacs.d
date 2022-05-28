;;; init-python.el --- Phthon editing
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(require-package 'anaconda-mode)
(with-eval-after-load 'python
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
(with-eval-after-load 'anaconda-mode
  (define-key anaconda-mode-map (kbd "M-?") nil))

(require-package 'company-anaconda)
(with-eval-after-load 'company
  (with-eval-after-load 'python
    (push 'company-anaconda company-backends)))

(require-package 'lsp-pyright)
(add-hook 'python-mode-hook 'lsp-defferred)

(provide 'init-python)
;; init-python.el ends here

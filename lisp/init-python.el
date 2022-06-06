;;; init-python.el --- Phthon editing
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(require-package 'lsp-mode)
(require-package 'lsp-pyright)
(add-hook 'python-mode-hook 'lsp-deferred)

(require 'dap-python)

(provide 'init-python)
;; init-python.el ends here

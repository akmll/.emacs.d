;;; init-python.el --- Phthon editing  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(use-package pip-requirements
  :ensure t)

(require 'eglot)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'python-ts-mode-hook 'eglot-ensure)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-ts-mode . ("pylsp"))))

(provide 'init-python)
;; init-python.el ends here

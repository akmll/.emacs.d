;;; init-python.el --- Phthon editing
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(require 'eglot)
(add-hook 'python-mode-hook 'eglot-ensure)

(provide 'init-python)
;; init-python.el ends here

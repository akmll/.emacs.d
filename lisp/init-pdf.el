;;; init-pdf.el --- Provide configuration for pdf related functions

;;; Commentary:
;;; Code:

(require-package 'pdf-tools)

(pdf-loader-install)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (pdf-view-themed-minor-mode)
            (pdf-outline-minor-mode)))

(provide 'init-pdf)

;;; init-pdf.el ends here

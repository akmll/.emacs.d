;;; init-cc-mode.el --- Initialize C/C++ mode

;;; Commentary:
;;

;;; Code:

(require 'compile)
;; Add compilation error regex for IAR Embedded Workbench
(with-eval-after-load 'compile
  (let ((defn '(iarbuild
                "\\(^.+\\.\\(?:cpp\\|c\\|hpp\\|h\\)\\)(\\([0-9]+\\))\\s-+:\\s-+\\(?:\\(Error\\)\\|\\(Warning\\)\\|\\(Info\\)\\).*"
                1 2 (3 . 4))))
    (add-to-list 'compilation-error-regexp-alist-alist defn)
    (add-to-list 'compilation-error-regexp-alist (car defn))))

;; Initialize CC-mode style
(c-add-style "zap"
             '("bsd"
               (c-offsets-alist
                (inextern-lang . 0)
                (inline-open . 0)
                (innamespace . 0)
                )
               (c-basic-offset . 4)
               (c-tab-always-indent . nil)
               (c-doc-comment-style . doxygen)
               (c-indent-comment-alist
                (empty-line align comment)
                )
               ))

(require-package 'lsp-mode)
(require-package 'dap-mode)

(require 'lsp-clangd)
(setq lsp-clients-clangd-args
      '("--header-insertion=never"
        "--header-insertion-decorators=0"
        ))

(require 'dap-cpptools)

(setq-default c-mark-wrong-style-of-comment t)
(setq-default c-default-style "zap")

(defun zap/c-mode-hook ()
  (setq tab-width 4)
  (setq comment-column 40)

  (yas-minor-mode)
  (lsp-deferred)
  )

(add-hook 'c-mode-common-hook 'zap/c-mode-hook)

(global-set-key (kbd "C-c l g o") 'lsp-clangd-find-other-file)
(global-set-key (kbd "<mouse-4>") 'xref-pop-marker-stack)

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here

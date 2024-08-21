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

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((c-mode c++-mode) . ("clangd"
                                      "--header-insertion=never"
                                      "--header-insertion-decorators=0"
                                      "--rename-file-limit=0"
                                      "--query-driver=**/arm-none-eabi-*"))))

(setq-default c-mark-wrong-style-of-comment t)
(setq-default c-default-style "zap")

(defun zap/c-mode-hook ()
  (setq tab-width 4)
  (setq comment-column 40)
  (setq flymake-diagnostic-functions nil)

  (yas-minor-mode)
  (eglot-ensure)
  )

(add-hook 'c-mode-common-hook 'zap/c-mode-hook)

(require 'c-ts-mode)
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-or-c++-mode . c-or-c++-ts-mode))

(defun zap/c-ts-indent-style ()
  `(
    ,@(alist-get 'bsd (c-ts-mode--indent-styles 'cpp))))

(defun zap/c-ts-mode-hook ()
  (setq tab-width 4)
  (setq comment-column 40)
  (setq flymake-diagnostic-functions nill)
  (setq c-doc-comment-style 'doxygen)
  (setq c-ts-mode-indent-offset 4)
  (setq c-ts-mode-toggle-comment-style 1)
  (setq c-ts-mode-indent-style #'zap/c-ts-indent-style)

  (yas-minor-mode)
  (eglot-ensure)
  )
(add-hook 'c-ts-base-mode-hook 'zap/c-ts-mode-hook)

(defun eglot-clangd-find-other-file (&optional new-window)
  (interactive "P")
  (let
      ((other-file (jsonrpc-request
                    (eglot--current-server-or-lose)
                    :textDocument/switchSourceHeader
                    (eglot--TextDocumentIdentifier))))
    (unless (not (or (null other-file) (string= "" other-file)))
      (user-error "Could not find other file"))
    (funcall (if new-window #'find-file-other-window #'find-file)
             (eglot--uri-to-path other-file))))

(global-set-key (kbd "C-c o") 'eglot-clangd-find-other-file)
(global-set-key (kbd "<mouse-4>") 'xref-pop-marker-stack)

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here

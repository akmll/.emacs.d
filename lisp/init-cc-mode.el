;;; init-cc-mode.el --- Initialize C/C++ mode  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:

(require 'compile)

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

(with-eval-after-load 'compile
  (add-to-list 'compilation-error-regexp-alist-alist
               '(zap/iar
                 "^\"\\(.*\\)\",\\([0-9]+\\)\\s-+\\(?:\\(Error\\)\\|\\(Warning\\)\\|\\(Info\\)\\)\\[\\([a-zA-Z0-9].*?\\)\\]:"
                 1 2 nil (4 . 5)))
  (add-to-list 'compilation-error-regexp-alist-alist
               '(zap/iarbuild
                 "^\\(.*?\\)\(\\([0-9]+\\)\)\\s-+:\\s-+\\(?:\\(Error\\)\\|\\(Warning\\)\\|\\(Info\\)\\)\\[\\([a-zA-Z0-9]+\\)\\]:"
                 1 2 nil (4 . 5)))
  (add-to-list 'compilation-error-regexp-alist 'zap/iar)
  (add-to-list 'compilation-error-regexp-alist 'zap/iarbuild))

(setq-default c-mark-wrong-style-of-comment t)
(setq-default c-default-style "zap")

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

(defun eglot-clangd-find-other-file-other-window ()
  (interactive)
  (eglot-clangd-find-other-file t))

(defun zap/c-mode-hook ()
  (setq tab-width 4)
  (setq comment-column 40)
  (setq flymake-diagnostic-functions nil)

  (yas-minor-mode)
  (eglot-ensure)
  (define-key c-mode-map (kbd "C-c o") 'eglot-clangd-find-other-file))

(add-hook 'c-mode-common-hook 'zap/c-mode-hook)

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here

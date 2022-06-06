;;; eglot-clangd.el --- Provide clangd LSP server specific functions with eglot

;;; Commentary:
;;

(require 'eglot)
(require 's)

(defun eglot-clangd-find-other-file (&optional new-window)
  (interactive "P")
  (let
      ((other-file (jsonrpc-request
                    (eglot--current-server-or-lose)
                    :textDocument/switchSourceHeader
                    (eglot--TextDocumentIdentifier))))
    (unless (s-present? other-file)
      (user-error "Could not find other file"))
    (funcall (if new-window #'find-file-other-window #'find-file)
             (eglot--uri-to-path other-file))))

(provide 'eglot-clangd)

;;; eglot-clangd.el ends here

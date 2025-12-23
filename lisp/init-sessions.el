;;; init-sessions.el --- Save and restore sessions
;;; Commentary:
;;; Code:

(setq desktop-path (list user-emacs-directory))
(setq desktop-auto-save-timeout 1000)
(setq desktop-restore-eager 5)
(desktop-save-mode 1)

(setq-default history-length 1000)
(add-hook 'after-init-hook 'savehist-mode)

(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
(add-to-list 'desktop-modes-not-to-save 'lsp-mode)
(add-to-list 'desktop-modes-not-to-save 'eglot-mode)

(provide 'init-sessions)
;; init-sessions.el ends here

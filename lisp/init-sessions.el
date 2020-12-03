;;; init-sessions.el --- Save and restore sessions
;;; Commentary:
;;; Code:

(setq desktop-path (list user-emacs-directory))
(setq desktop-auto-save-timeout 1000)
(desktop-save-mode 1)

(setq-default history-length 1000)
(add-hook 'after-init-hook 'savehist-mode)

(require-package 'session)
(setq session-save-file (expand-file-name ".session" user-emacs-directory))
(setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
(setq session-save-file-coding-system 'utf-8)
(add-hook 'after-init-hook 'session-initialize)

(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(provide 'init-sessions)
;; init-sessions.el ends here

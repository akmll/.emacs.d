;;; init-misc.el

;;; Commentary:
;;; Code:

;; Initialize for ibuffer
(use-package fullframe
  :ensure t
  :config
  (fullframe list-packages
	     quit-window))

(use-package diff-hl
  :ensure t
  :hook
  (after-init . global-diff-hl-mode)
  (after-init . diff-hl-margin-mode)
  :config
  :custom
  (diff-hl-margin-mode t))

(use-package ibuffer
  :ensure nil
  :config
  (use-package ibuffer-vc
    :ensure t)
  (fullframe ibuffer
	     ibuffer-quit)
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size)))
  (global-set-key (kbd "C-x C-b") 'ibuffer))

;; Iniitialize for dired
(use-package dired
  :ensure nil
  :hook
  (dired-mode . diff-hl-dired-mode)
  :config
  (use-package diredfl
    :ensure t
    :config
    (diredfl-global-mode)
    (require 'dired-x))
  (setq-default dired-dwim-target t)
  (setq-default dired-recursive-deletes 'top)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode t)
  (setq-default hl-todo-wrap-movement t))

;; Initialize isearch
(use-package anzu
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-anzu-mode)
  (setq anzu-mode-lighter "")
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

(defun isearch-yank-regexp (regexp)
  "Pull REGEXP into search regexp."
  (let ((isearch-regexp nil)) ;; Dynamic binding of global.
    (isearch-yank-string regexp))
  (if (not isearch-regexp)
      (isearch-toggle-regexp))
  (isearch-search-and-update))

(defun isearch-yank-symbol ()
  "Put symbol at current point into search string."
  (interactive)
  (let ((sym (find-tag-default)))
    (if (null sym)
        (message "No symbol at point")
      (isearch-yank-regexp
       (concat "\\_<" (regexp-quote sym) "\\_>")))))

(define-key isearch-mode-map "\C-\M-w" 'isearch-yank-symbol)

;; Initialize grep
(setq-default grep-highlight-matches t)
(setq-default grep-scroll-output t)

(use-package wgrep
  :ensure t)

;; uniquify
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-seperator " | ")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*"))

;; recentf
(use-package recentf-mode
  :ensure nil
  :hook (after-init . recentf-mode)
  :config
  (setq-default recentf-max-saved-items 500))

;; smex
(use-package smex
  :ensure t
  :config
  (setq-default smex-save-file (expand-file-name ".smex" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

;; hippie expand
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;; company
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (dolist (backend '(company-eclim company-semantic))
    (delq backend company-backends))
  (diminish 'company-mode)
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all)
  (setq-default company-tooltip-align-annotations t)
  (global-set-key (kbd "C-M-/") 'company-complete)
  (use-package company-quickhelp
    :ensure t
    :hook (after-init . company-quickhelp-mode)))

(use-package abbrev
  :ensure nil
  :config
  (diminish 'abbrev-mode))

(use-package eldoc
  :ensure nil
  :config
  (diminish 'eldoc-mode))

(global-set-key (kbd "C-.") 'set-mark-command)

(global-set-key (kbd "C-o") (lambda ()
                              (interactive)
                              (end-of-line)
                              (newline-and-indent)))

(global-set-key (kbd "M-o") (lambda ()
                              (interactive)
                              (beginning-of-line)
                              (newline-and-indent)
                              (previous-line)
                              (if (> (point) (point-min))
                                  (indent-according-to-mode))))

;; Toggle comment in current line
(global-set-key (kbd "C-M-;") (lambda ()
                                (interactive)
                                (comment-or-uncomment-region
                                 (line-beginning-position) (line-end-position))))

(setq confirm-kill-emacs 'yes-or-no-p)

;; Replace yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-misc)
;;; init-misc.el ends here

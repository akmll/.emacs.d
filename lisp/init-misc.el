;;; init-misc.el

;;; Commentary:
;;; Code:


;; Initialize for ibuffer
(require-package 'fullframe)
(with-eval-after-load 'ibuffer
  (fullframe ibuffer ibuffer-quit))

(require-package 'ibuffer-vc)
(with-eval-after-load 'ibuffer
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Iniitialize for dired
(require-package 'diredfl)
(with-eval-after-load 'dired
  (diredfl-global-mode)
  (require 'dired-x))

(require-package 'diff-hl)
(with-eval-after-load 'dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(require-package 'hl-todo)
(global-hl-todo-mode t)
(setq-default hl-todo-wrap-movement t)

(setq-default dired-dwim-target t)

(with-eval-after-load 'dired
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

;; Initialize isearch
(require-package 'anzu)
(add-hook 'after-init-hook 'global-anzu-mode)
(setq anzu-mode-lighter "")
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
(global-set-key [remap query-replace] 'anzu-query-replace)

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

(require-package 'wgrep)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-seperator " | ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; recentf
(add-hook 'after-init-hook 'recentf-mode)
(setq-default recentf-max-saved-items 500)

;; smex
(require-package 'smex)
(setq-default smex-save-file (expand-file-name ".smex" user-emacs-directory))
(global-set-key [remap execute-extended-command] 'smex)

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

(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (dolist (backend '(company-eclim company-semantic))
    (delq backend company-backends))
  (diminish 'company-mode)
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all)
  (setq-default company-tooltip-align-annotations t))
(global-set-key (kbd "C-M-/") 'company-complete)

(require-package 'company-quickhelp)
(add-hook 'after-init-hook 'company-quickhelp-mode)

(with-eval-after-load 'abbrev
  (diminish 'abbrev-mode))

(with-eval-after-load 'eldoc
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

(setq confirm-kill-emacs 'yes-or-no-p)

;; Replace yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-misc)
;;; init-misc.el ends here

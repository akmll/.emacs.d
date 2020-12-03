;;; init-editting.el
;;; Commentary:
;;; Code:

(require-package 'unfill)

(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'electric-indent-mode)

(setq-default blink-cursor-interval 0.5)
(setq-default case-fold-search t)
(setq-default column-number-mode t)
(setq-default delete-selection-mode t)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)
(setq-default mouse-yank-at-point t)
(setq-default comment-fill-column 120)
(setq-default save-interprogram-paste-before-kill t)
(setq-default scroll-preserve-screen-position 'always)
(setq-default set-mark-command-repeat-pop t)
(setq-default tooltip-delay 1.5)
(setq-default truncate-lines t)
(setq-default kill-whole-line t)
(setq-default truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(after-load 'autorevert
  (diminish 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)

(after-load 'subword
  (diminish 'subword-mode))

(setq-default display-line-numbers-width 3)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(require-package 'goto-line-preview)
(global-set-key [remap goto-line] 'goto-line-preview)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook 'symbol-overlay-mode)
(after-load 'symbol-overlay
  (diminish 'symbol-overlay-mode)
  (define-key symbol-overlay-mode-map (kbd "M-i") 'symbol-overlay-put)
  (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-next)
  (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-prev))

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require-package 'avy)
(global-set-key (kbd "C-;") 'avy-goto-char-timer)

(require-package 'whole-line-or-region)
(add-hook 'after-init-hook 'whole-line-or-region-global-mode)
(after-load 'whole-line-or-region
  (diminish 'whole-line-or-region-local-mode))

(require-package 'highlight-escape-sequences)
(add-hook 'after-init-hook 'hes-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(after-load 'which-key
  (diminish 'which-key-mode))

(add-hook 'after-init-hook 'show-paren-mode)

(setq-default show-trailing-whitespace nil)
(defun enable-show-trailing-whitespace ()
  (setq show-trailing-whitespace t))

(add-hook 'prog-mode-hook 'enable-show-trailing-whitespace)

(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)
(after-load 'whitespace-cleanup-mode
  (diminish 'whitespace-cleanup-mode))

;; textile mode
(require-package 'textile-mode)

;; markdown mode
(require-package 'markdown-mode)

;; csv file mode
(require-package 'csv-mode)
(setq csv-seperators '("," ";" "|" " "))

(global-set-key [remap just-one-space] 'cycle-spacing)


(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(require-package 'multiple-cursors)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-line-this)
(global-set-key (kbd "C-c m r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m a") 'mc/edit-beginning-of-lines)

(provide 'init-editting)
;; init-editting.el ends here

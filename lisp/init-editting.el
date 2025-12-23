;;; init-editting.el
;;; Commentary:
;;; Code:

(use-package unfill
  :ensure t)

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
(setq-default help-window-select t)
(setq-default split-height-threshold 120)

(require 'hl-line)
(global-hl-line-mode 1)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(with-eval-after-load 'autorevert
  (diminish 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)

(with-eval-after-load 'subword
  (diminish 'subword-mode))

(setq-default display-line-numbers-width 3)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package goto-line-preview
  :ensure t
  :config
  (global-set-key [remap goto-line] 'goto-line-preview))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package symbol-overlay
  :ensure t
  :hook (prog-mode . symbol-overlay-mode)
  :config
  (diminish 'symbol-overlay-mode)
  (define-key symbol-overlay-mode-map (kbd "M-i") 'symbol-overlay-put)
  (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-jump-next)
  (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-jump-prev))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

(use-package avy
  :ensure t
  :bind
  ("C-;" . avy-goto-char-timer))

(use-package highlight-escape-sequences
  :ensure t
  :hook (after-init . hes-mode))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :config
  (diminish 'which-key-mode))

(use-package paren
  :hook (after-init . show-paren-mode))

(setq-default show-trailing-whitespace nil)
(defun enable-show-trailing-whitespace ()
  (setq show-trailing-whitespace t))

(add-hook 'prog-mode-hook 'enable-show-trailing-whitespace)

(use-package whitespace-cleanup-mode
  :ensure t
  :hook (after-init . global-whitespace-cleanup-mode)
  :config
  (diminish 'whitespace-cleanup-mode))

;; textile mode
(use-package textile-mode
  :ensure t)

;; markdown mode
(use-package markdown-mode
  :ensure t)

;; csv file mode
(use-package csv-mode
  :ensure t
  :custom
  (setq csv-seperators '("," ";" "|" " ")))

(global-set-key [remap just-one-space] 'cycle-spacing)


(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-<" . mc/mark-previous-like-this)
  ("C->" . mc/mark-next-like-this)
  ("C-c C-<" . mc/mark-all-line-this)
  ("C-c m r" . 'set-rectangular-region-anchor)
  ("C-c m c" . mc/edit-lines)
  ("C-c m e" . mc/edit-ends-of-lines)
  ("C-c m a" . mc/edit-beginning-of-lines))

(provide 'init-editting)
;; init-editting.el ends here

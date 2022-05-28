;;; init-vc.el --- Initialize version control related
;;; Comentary:
;;; Code:

;; git
(require-package 'git-blamed)
(require-package 'git-modes)
(require-package 'git-timemachine)
(global-set-key (kbd "C-x v t") 'git-timemachine-toggle)

(require-package 'magit)
(setq-default magit-diff-refine-hunk t)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

(require-package 'magit-todos)
(require-package 'fullframe)
(with-eval-after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

(autoload 'vc-git-root "vc-git")

;; git-svn support, copied from Purcell's configuration
(with-eval-after-load 'compile
  (dolist (defn (list '(git-svn-updated "^\t[A-Z]\t\\(.*\\)$" 1 nil nil 0 1)
                      '(git-svn-needs-update "^\\(.*\\): needs update$" 1 nil nil 2 1)))
    (add-to-list 'compilation-error-regexp-alist-alist defn)
    (add-to-list 'compilation-error-regexp-alist (car defn))))

;; (defvar git-svn--available-commands nil "Cached list of git svn subcommands")
(defvar git-svn--available-commands
  (list
   "blame" "branch" "clone" "commit-diff" "dcommit" "fetch" "gc" "info" "init" "log" "rebase" "reset" "tag"
   ))

(defun git-svn (dir command)
  "Run a git svn subcommand in DIR."
  (interactive (list (read-directory-name "Directory: ")
                     (completing-read "git-svn command: " git-svn--available-commands nil t nil nil git-svn--available-commands)))
  (let* ((default-directory (vc-git-root dir))
         (compilation-buffer-name-function (lambda (major-mode-name) "*git-svn*")))
    (compile (concat "git svn " command))))

(require-package 'diff-hl)
(setq-default diff-hl-margin-mode t)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'after-init-hook (lambda ()
                             (global-diff-hl-mode)
                             (diff-hl-margin-mode)))

(require 'vc-svn)

(provide 'init-vc)
;; init-vc.el ends here

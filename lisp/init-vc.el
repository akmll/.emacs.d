;;; init-vc.el --- Initialize version control related
;;; Comentary:
;;; Code:

;; git
(use-package git-modes
  :ensure t)

(use-package git-timemachine
  :ensure t
  :bind
  ("C-x v t" . git-timemachine-toggle))

(use-package magit
  :ensure t
  :hook (magit-post-refresh . diff-hl-magit-post-refresh)
  :custom
  (magit-diff-refine-hunk t)
  (magit-refresh-status-buffer nil)
  :config
  (use-package magit-todos
    :ensure t)
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

(require 'vc-svn)

(provide 'init-vc)
;; init-vc.el ends here

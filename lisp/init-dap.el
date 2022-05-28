;;; init-dap.el --- Provide configuration for dap-mode

;;; Commentary:
;;
(require-package 'bui)
(require-package 'dap-mode)
(require 'dap-ui)
(require 'dap-mouse)

(setq dap-auto-configure-mode t)
(dap-mode 1)
(dap-ui-mode 1)
(dap-tooltip-mode 1)
(dap-ui-controls-mode 1)


(provide 'init-dap)

;;; init-dap.el ends here

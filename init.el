;; 引导emacs找到配置工程路径
(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

;; 收纳系统杂项配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; 启动系统杂项配置
(when (file-exists-p custom-file)
  (load-file custom-file))



(require 'init-const)
(require 'init-startup)
(require 'init-ui)
(require 'init-packages)

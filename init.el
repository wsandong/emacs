;; 引导emacs找到配置工程路径
(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))


;; 收纳系统杂项配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; 启动系统杂项配置
(when (file-exists-p custom-file)
  (load-file custom-file))


;; 备份、自动保存到单独文件夹
;; 定义备份目录路径
(setq backup-dir "~/.Emacs_backups/")
(setq auto-save-dir "~/.Emacs_autosaves/")
;; 确保目录存在
(make-directory backup-dir t)
(make-directory auto-save-dir t)
;; 设置备份目录
(setq backup-directory-alist `(("." . ,backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,auto-save-dir t)))



(require 'init-const)
(require 'init-startup)
(require 'init-ui)
(require 'init-packages)

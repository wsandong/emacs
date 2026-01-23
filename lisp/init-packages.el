(require 'package)

;; 设置包管理源，使用清华镜像
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; 禁用签名检查
(setq package-check-signatrue nil)

;; 初始化包管理系统
(package-initialize)

;; 如果包列表为空，则刷新包列表
(unless package-archive-contents
  (package-refresh-contents))

;; 安装 use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; 使用 use-package
(eval-when-compile
  (require 'use-package))

;; 建议添加的配置
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-always-demand nil)
(setq use-package-expand-minimally t)
(setq use-package-verbose t)

;; 添加需要的拓展包
(use-package restart-emacs)


(use-package emacs
  :config
  (setq-default display-line-numbers 'relative
	global-display-line-numbers-mode t))


(use-package flycheck
  :init
  (global-flycheck-mode)
  (setq-default flycheck-indication-mode nil)
  (custom-set-faces
   '(flycheck-error ((t (:underline (:style line)))))
   '(flycheck-warning ((t (:underline (:style line)))))
   '(flycheck-info ((t (:underline (:style line)))))))


(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))


(use-package which-key
    :config
    (which-key-mode))


;;(use-package corfu
;;  :init
;;  (global-corfu-mode 1)
;;  (corfu-history-mode +1)
;;  (setq corfu-history-max 50)
;;  :config
;;  (setq corfu-auto t                ; 自动补全
;;        corfu-auto-delay 0.05       ; 延迟时间
;;        corfu-auto-prefix 2         ; 最少字符数
;;        corfu-cycle t               ; 循环选择
;;	corfu-preselect 'first      ; 自动预选第一个候选项
;;        corfu-preview-current nil   ; 不预览当前项
;;        corfu-quit-at-boundary t    ; 到边界时退出
;;        corfu-quit-no-match t       ; 无匹配时退出
;;        corfu-count 10              ; 显示数量
;;        corfu-max-width 80          ; 最大宽度
;;        corfu-min-width 30)         ; 最小宽度
;;  (define-key corfu-map (kbd "RET") nil)
;;  (define-key corfu-map (kbd "<return>") nil)
;;  :bind
;;  (:map corfu-map
;;        ("C-n" . corfu-next)
;;        ("C-p" . corfu-previous)
;;        ("<escape>" . corfu-quit)))


(if (display-graphic-p)
    (use-package corfu
      :ensure t
      :init
      (global-corfu-mode 1)
      (corfu-history-mode +1)
      (setq corfu-history-max 50)
      :config
      (setq corfu-auto t                ; 自动补全
            corfu-auto-delay 0.05       ; 延迟时间
            corfu-auto-prefix 2         ; 最少字符数
            corfu-cycle t               ; 循环选择
            corfu-preselect 'first      ; 自动预选第一个候选项
            corfu-preview-current nil   ; 不预览当前项
            corfu-quit-at-boundary t    ; 到边界时退出
            corfu-quit-no-match t       ; 无匹配时退出
            corfu-count 10              ; 显示数量
            corfu-max-width 80          ; 最大宽度
            corfu-min-width 30)         ; 最小宽度
      ;; 禁用回车键默认选择
      (define-key corfu-map (kbd "RET") nil)
      (define-key corfu-map (kbd "<return>") nil)
      ;; 按键绑定
      (define-key corfu-map (kbd "C-n") #'corfu-next)
      (define-key corfu-map (kbd "C-p") #'corfu-previous)
      (define-key corfu-map (kbd "<escape>") #'corfu-quit))
  (use-package company
    :ensure t
    :init
    (global-company-mode 1)
    (setq company-idle-delay 0.05           ; 自动补全延迟
          company-minimum-prefix-length 2   ; 最少字符数
          company-tooltip-limit 10          ; 显示数量
          company-selection-wrap-around t   ; 循环选择
          company-require-match nil         ; 不强制匹配
          company-frontends '(company-pseudo-tooltip-frontend
                              company-echo-metadata-frontend)) ; 类似 Corfu 行为
    :config
    ;; 按键绑定与 Corfu 保持一致
    (define-key company-active-map (kbd "TAB") #'company-complete-selection)
    (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    (define-key company-active-map (kbd "<escape>") #'company-abort)
    ;; 可选：禁用 RET 自动选择
    (define-key company-active-map (kbd "RET") nil)
    (define-key company-active-map (kbd "<return>") nil)))


(use-package lsp-mode
  :init
  (setq lsp-completion-provider :capf
        lsp-enable-snippet nil      ; 如果你不需要代码片段
        lsp-enable-indentation nil  ; 让 major-mode 处理缩进
        lsp-enable-on-type-formatting nil
	lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp-deferred))
  :config
  (setq lsp-pylsp-server-command '("pylsp"))
  :commands (lsp lsp-deferred))


(use-package lsp-ui
  :after (lsp-mode)
  :commands lsp-ui-mode)




(provide 'init-packages)

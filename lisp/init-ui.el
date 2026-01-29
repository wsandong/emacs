(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))


;; 关闭启动画面
(setq inhibit-startup-screen t)


;; 关闭工具栏、菜单栏、滚动条
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


;; 加大窗口
(setq initial-frame-alist '((width . 95)
 			    (height . 30)
 			    (left . 50)
 			    (top . 50)))


;; 加载主题
;; (load-theme 'timu-caribbean t)
;; (unless (display-graphic-p)
;;  (face-spec-reset-face 'default)
;;  (set-face-background 'default "unspecified-bg" (selected-frame)))
;; (set-face-attribute 'region nil :foreground 'unspecified :background 'unspecified)


;; 高亮当前行
(global-hl-line-mode t)

;;更改字体字号
(set-face-attribute 'default nil
                    ;;:family "0xProtoNerdFontMono-Italic"
                    :height '220)



(provide 'init-ui)

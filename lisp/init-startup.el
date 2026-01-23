;; 优化启动速度								 
(setq gc-cons-threshold most-positive-fixnum)				 
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

;; 设置系统编码，防止各处乱码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(provide 'init-startup)

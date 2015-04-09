(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

;; Always use spaces instead of tabs.
(setq-default indent-tabs-mode nil)
;; Use 2 spaces per tab in JavaScript.
(setq js-indent-level 2)
;; Turn column number mode on.
(setq column-number-mode t)

;; use packages

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq package-list '(clojure-mode cider web-mode go-mode))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Always use spaces instead of tabs.
(setq-default indent-tabs-mode nil)
;; Use 2 spaces per tab in JavaScript.
(setq js-indent-level 2)
;; Turn column number mode on.
(setq column-number-mode t)
;; Make selection visible
(transient-mark-mode)
;; Better selection color
(set-face-attribute 'region nil :background "#CCC")
;; Use clojure-mode with .cljs files
;(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
;; Don't add newlines to the end of files
(setq require-final-newline nil)
;; paren mode
(show-paren-mode 1)
;; Set HTML default indentation
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation to 1, but let SGML mode guess, too.
            (set (make-local-variable 'sgml-basic-offset) 1)
            (sgml-guess-indent)))
;; Show trailing whitespace
(setq-default show-trailing-whitespace t)
;; Allow downcase-region
(put 'downcase-region 'disabled nil)
;; Activate recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; get correct go-mode indents
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

;; Better HTML handling
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.wml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.wmi\\'" . web-mode))

;; Handle Mozilla .jsm files as js
(add-to-list 'auto-mode-alist '("\\.jsm\\'" . js-mode))

;; use 2 spaces per tab in web-mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(go-mode web-mode cider clojure-mode))
 '(safe-local-variable-values '((js-indent-level . 2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

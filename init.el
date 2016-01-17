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


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Better HTML handling
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
      '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
        (js-mode  "<script[^>]*>" "</script>")
        (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

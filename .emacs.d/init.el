(let ((emacsd-dir (file-name-directory load-file-name)))
  (add-to-list 'load-path (concat emacsd-dir "/vendor/use-package"))
  (add-to-list 'load-path (concat emacsd-dir "/vendor"))
  (require 'use-package)

  (require 'package)

  ;; add melpa
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  
  (package-initialize)
  
  (when (memq window-system '(mac os x))
    (exec-path-from-shell-initialize))
  
  (require 'use-package-ensure)
  (setq use-package-always-ensure t)

  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq create-lockfiles nil)

  (let* ((stuff-dir (concat emacsd-dir "/stuff"))
         (load-it (lambda (f) (load-file (concat (file-name-as-directory stuff-dir) f)))))
    (mapc load-it (directory-files stuff-dir nil "\\.el$")))

  (message "Hello Master!"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(package-selected-packages
   '(aggressive-indent tide csv-mode exec-path-from-shell ag restclient go-eldoc company-go go-mode yaml-mode browse-kill-ring rainbow-delimiters dired-single flx counsel ivy magit popwin ibuffer-vc company cider smartparens window-numbering moe-theme powerline))
 '(safe-local-variable-values '((cider-shadow-cljs-default-options . "app")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

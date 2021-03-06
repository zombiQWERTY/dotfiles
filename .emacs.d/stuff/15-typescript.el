;(use-package rjsx-mode
;  :ensure t
;  :mode "\\.js\\'")

;(use-package flycheck
;  :ensure t
;  :init (global-flycheck-mode))

;(defun setup-tide-mode ()
;  "Setup Tide"
;  (interactive)
;  (tide-setup)
;  (flycheck-mode +1)
;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
;  (eldoc-mode +1)
;  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
;  (company-mode +1))

;(use-package tide
;  :ensure t
;  :after (typescript-mode company flycheck)
;  :hook (rjsx-mode . setup-tide-mode))

;(use-package prettier-js
;  :ensure t
;  :after (rjsx-mode)
;  :hook (rjsx-mode . prettier-js-mode))

;; aligns annotation to the right hand side
;(setq company-tooltip-align-annotations t)

;(add-hook 'typescript-mode-hook #'setup-tide-mode)

;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;(add-hook 'web-mode-hook
;          (lambda ()
;            (when (string-equal "tsx" (file-name-extension buffer-file-name))
;              (setup-tide-mode))))

;(add-hook 'web-mode-hook
;          (lambda ()
;            (when (string-equal "jsx" (file-name-extension buffer-file-name))
;              (setup-tide-mode))))

;; enable typescript-tslint checker
;(flycheck-add-mode 'typescript-tslint 'web-mode)

;(add-hook 'js2-mode-hook #'setup-tide-mode)

;; configure javascript-tide checker to run after your default javascript checker
;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

;; configure jsx-tide checker to run after your default jsx checker
;(flycheck-add-mode 'javascript-eslint 'web-mode)
;(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)


(use-package flycheck
  :ensure t
  :config
  (add-hook 'typescript-mode-hook 'flycheck-mode))
 
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
 
(use-package company
  :ensure t
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))
 
(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1)
  (use-package pos-tip
    :ensure t))
 
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2
 
        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t
	web-mode-enable-auto-indentation nil
        )
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))
  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode))
 
(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2)
  (add-hook 'typescript-mode #'subword-mode))
 
(use-package tide
  :init
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)))
 
(use-package css-mode
  :config
(setq css-indent-offset 2))

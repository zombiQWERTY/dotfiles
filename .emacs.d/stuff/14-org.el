(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (progn
    (setq zombiqwerty/notebook-path "~/Documents/Notebook/")
    (defun zombiqwerty/notebook-file (name) (concat zombiqwerty/notebook-path name))
    ;; Org capture templates and settings
    (setq org-capture-templates
          `((
             "n"
             "Quick Note"
             entry
             (file+olp+datetree ,(zombiqwerty/notebook-file "notes.org") "Заметки")
             (file ,(zombiqwerty/notebook-file "captureTemplates/note_tmpl.org")))
            ;; (
            ;;  "t"
            ;;  "Task"
            ;;  entry
            ;;  (file+headline ,(vbifonix/notebook-file "tasks.org") "Инбокс")
            ;;  (file ,(zombiqwerty/notebook-file "captureTemplates/task_tmpl.org")))
            ;; (
            ;;  "g"
            ;;  "Groceries"
            ;;  entry
            ;;  (file+headline ,(vbifonix/notebook-file "tasks.org") "Список покупок")
            ;;  (file ,(zombiqwerty/notebook-file "captureTemplates/grocery_tmpl.org")))
            ;; (
            ;;  "b"
            ;;  "Bookmark"
            ;;  entry
            ;;  (file+headline ,(vbifonix/notebook-file "tasks.org") "Закладки")
            ;;  (file ,(zombiqwerty/notebook-file "captureTemplates/grocery_tmpl.org")))

            ))
    ;; config stuff
    ))

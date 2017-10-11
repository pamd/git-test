;; Disable start-up message
(setq inhibit-startup-message t)

;; Redefine some keys.
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

;; Font color
(global-font-lock-mode t)

;; Frame and icon titles
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))

;; Replace highlighted text (FAQ)
(delete-selection-mode t)

;; Scroll only one line (FAQ)
(setq scroll-step 1)

;; Enable parentheses matching mode
(show-paren-mode 1)

;; Define key combinations (C-x g) to go to a certain line (FAQ)
(global-set-key "\C-xg" 'goto-line)

;; Show column number on mode line
(setq column-number-mode t)

;; Disable tab character in indentation
(setq-default indent-tabs-mode nil)

;; Always show line numbers in mode line.
;; See Emacs manual 14.18: "Optional Mode Line Features"
(setq-default line-number-display-limit nil)
(setq-default line-number-display-limit-width 20000)

;; Set a larger size limit when visiting a file.
;; Default is 10000000 (~10MB), set to ~50MB now.
;; Ref: http://www.gnu.org/software/emacs/manual/html_mono/emacs.html#Visiting
(setq-default large-file-warning-threshold 50000000)

;; ELPA (default) and MELPA package (only for emacs 24 or later)
;; http://stackoverflow.com/questions/29085937/package-refresh-contents-hangs-at-contacting-host-elpa-gnu-org80
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                     ("marmalade" . "http://marmalade-repo.org/packages/")
;                     ("melpa" . "http://melpa.org/packages/")))
;; This command sometimes hang up emacs.
;; Instead of running it here, run it manually by "M-x pacakge-refresh-contents" .
;;(package-refresh-contents)

;; flycheck
;;(require 'flycheck)
;;(global-flycheck-mode)
;; Enable flycheck only
(defun add-flycheck-in-py()
  (cond ((string-match "^.*" buffer-file-name)
         (flycheck-mode t)
         )))
;; Add the hook to python code
(add-hook 'python-mode-hook #'add-flycheck-in-py)

;; Set tab-with in python mode to 4 explicitly.
;; (Optional, because tab-width defaults to 4 in python.)
;(add-hook 'python-mode-hook
;          (function (lambda () (setq tab-width 4))))

;; Add personal load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; https://www.cs.princeton.edu/courses/archive/spring12/cos461/assignments/.emacs
;; Display characters in columns 80 using unusual background colors, thus making it
;; easy to spot lines that are longer than 80 characters.
;; Activate it only in python-mode.
;; "column-marker.el" is downloaded from:
;; http://www.emacswiki.org/emacs/ColumnMarker
;; and put in: ~/emacs.d/lisp
;(require 'column-marker)
;(defun myMarkCol ()
;   (interactive)
;   (column-marker-1 79)
;   (column-marker-2 80))
;;(add-hook 'font-lock-mode-hook 'myMarkCol)
;(add-hook 'python-mode-hook 'myMarkCol)

;; Only show trailing white space characters in prog mode.
;; If trailing spaces will be removed before saving, this line won't be necessary.
;(add-hook 'prog-mode-hook '(lambda() (setq show-trailing-whitespace t)))

;; Always remove trailing whitespace(s) before saving:
;; https://www.emacswiki.org/emacs-test/DeletingWhitespace#toc3
;; (Type "M-x delete-trailing-whitespace" to launch it manually.)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Indicate empty lines at the end, and disable toobar mode
;; Added by "Options" on menu bar.
(custom-set-variables
 '(column-number-mode t)
 ;;------------------------------------------------------------------------
 ;; In csv-mode, only use comma as csv-separator (default is comma and tab)
 '(csv-separators (quote (",")))
 ;;------------------------------------------------------------------------
 '(indicate-empty-lines t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;; Differentiate buffer name, default is "post-forward-angle-brackets"
;; http://www.gnu.org/software/emacs/manual/html_mono/emacs.html#Uniquify
(require 'uniquify)
;(setq-default uniquify-buffer-name-style 'forward)

;; auto-fill-mode is annoying sometimes. Do not turn it on.
;; https://www.emacswiki.org/emacs/AutoFillMode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Set column fill width
;; https://www.emacswiki.org/emacs/FillParagraph
(setq-default fill-column 80)

;; Show line number. To disable it, type "M-x linum-mode".
;; https://www.emacswiki.org/emacs/LineNumbers
(global-linum-mode t)
;;(setq linum-format "%d ")
;;
;; "nlinum" (installed from elpa) is supposed to be better than linum.
;;(global-nlinum-mode t)
;;(setq nlinum-format "%d ")
;; But this mode contradicts with 'c-x 5 2'(which creates new frames).
;; DON'T USE IT.

;; Comment/uncomment a certain area:
;; M-x comment-dwim   ;; "dwim": Do What I Mean.

;; Comment line in lisp that starts with only one ";" has unusual indentation rules.
;; http://stackoverflow.com/questions/26312317/wrong-indentation-of-comments-in-emacs
;; But the following solution does NOT work on Emacs 24:
;; (setq ess-fancy-comments nil)

;; Set javascript indent to 2 (default is 4)
;; http://stackoverflow.com/questions/4177929/how-to-change-the-indentation-width-in-emacs-javascript-mode
(setq-default js-indent-level 2)

;; Markdown mode, refer to:
;; http://jblevins.org/projects/markdown-mode/
;; The following lines have been added earlier.
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;(package-initialize)

;; less-css mode, refer to:
;; https://www.emacswiki.org/emacs/LessCssMode
;; Installed by:
;;     M-x package-install RET less-css-mode RET
;; Indentation in this mode is controlled by "css-mode" indentation rule,
;; whose default indentation is 4.
(setq-default css-indent-offset 2)

;; agular-mode
(require 'angular-mode)

;; yasnippet and angular-snippets
;(add-to-list 'load-path
;             "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)
;(require 'angular-snippets)
;(add-to-list 'yas-snippet-dirs "~/.emacs.d/angularjs-mode-1.0/snippets")

;; Use angular-mode (instead of the default js-mode) when opening a *.js file.
;; https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist '("\\.js\\'" . angular-mode))

;; eslint config:
;; https://afsmnghr.github.io/emacs/angular/
;; (This variable has been disabled since flycheck version 30.)
;;(setq-default flycheck-eslintrc "~/adage-server/interface/eslint.conf.js")
;; Instead, create two soft links (~/.eslintrc.js and ~/eslint.google.js)
;; that point to the actual config file.
;;
;; Check the exact eslint command used in emacs: "C-c ! C-c"

;; Enable flycheck in angular-mode
(defun add-flycheck-in-ng()
  ;; Only for files in a certain directory:
  ;; http://superuser.com/questions/522763/how-do-i-enable-a-minor-mode-for-all-files-under-a-directory
  (cond ((string-match "^.*" buffer-file-name)
         (flycheck-mode t)
         (flycheck-add-mode 'javascript-eslint 'angular-mode)
         )))
(add-hook 'angular-mode-hook #'add-flycheck-in-ng)

;; Enable flycheck in js-mode
(defun add-flycheck-in-js()
  ;; Only for files in a certain directory:
  ;; http://superuser.com/questions/522763/how-do-i-enable-a-minor-mode-for-all-files-under-a-directory
  (cond ((string-match "^.*" buffer-file-name)
         (flycheck-mode t)
         ;; "(flycheck-add-mode ...)" is not necessary, because flycheck-mode
         ;; will be activated in js mode by default.
         ))
)
;; Enable flycheck in JavaScript mode
(add-hook 'js-mode-hook #'add-flycheck-in-js)

;; javascript: newline-and-indent
;(add-hook 'js-mode-hook '(lambda ()
;  (local-set-key (kbd "RET") 'newline-and-indent)))

;; Ignore electric-indent-mode in javascript
;; https://www.emacswiki.org/emacs/AutoIndentation
;;
;; Ignoring electric indentation in angular-mode and rst-mode
(defun electric-indent-ignore-ng (char)
  "Ignore electric indentation for js-mode"
  (if (or (equal major-mode 'angular-mode) (equal major-mode 'rst-mode))
      'no-indent nil))
;; Add function to the hook
(add-hook 'electric-indent-functions 'electric-indent-ignore-ng)

;; Enter key executes newline-and-indent
;(defun set-newline-and-indent ()
;  "Map the return key with `newline-and-indent'"
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'python-mode-hook 'set-newline-and-indent)

;; html-mode:
;; http://stackoverflow.com/questions/7022556/emacs-nxhtml-how-to-highlight-or-jump-to-the-closing-html-tag
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/HTML-Mode.html
;; "c-x c-f": move forward to the matching tag
;; "c-x c-b": move backward to the matching tag

;; web-mode: http://web-mode.org/
;; Not default for html file, can be launched by "M-x web-mode".
;; Set indentation to 2 (default is 4)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; Enable current element highlight
(setq web-mode-enable-current-element-highlight t)
;; Enable current column highlight (VERY HELPFUL)
(setq web-mode-enable-current-column-highlight t)

;; Difference between "require", "load", "load-file" etc
;; http://ergoemacs.org/emacs/elisp_library_system.html

;; Preview of markdown file:
;; "M-x package-install RET markdown-preview-mode"
;; shell$ apt-get install markdown
;; "C-c C-c p"

;; yaml-mode for *.yml file
;; "M-x package-install RET yaml-mode"

;; Relace a comma with new line:
;; http://stackoverflow.com/questions/613022/how-to-replace-a-character-with-a-newline-in-emacs
;; http://stackoverflow.com/questions/935723/find-tab-characters-in-emacs
;; "M-% , C-q C-j RET"

;; csv-mode: align fields
;; https://elpa.gnu.org/packages/csv-mode.html
;; "M-x csv-align-fields"

;; tsv-mode:
;; https://www.emacswiki.org/emacs/TsvMode
;; Doesn't work very well, deleted.
;; Instead, customized my own tsv-mode (based on csv-mode).
(autoload 'tsv-mode "tsv-mode" "A mode to edit table like file" t)
(autoload 'tsv-normal-mode "tsv-mode" "A minor mode to edit table like file" t)

;;
;; Insert a tab character at current position:
;; "C-q", then press "tab" key
;;
;; Convert spaces to tab in selected text:
;; "M-x tabify"
;; Convert tab to spaces in selected text:
;; "M-x untabify"
;; The number of spaces that will be converted from or to tab depends on
;; the original text at the moment when "tab" key was originally pressed.
;; If we never pressed "tab" key at all when originally creating the text,
;; then "M-x tabify" will never convert any space characters into tab at all.

;; Check a variable's current value:
;; "C-h v foobar"

;; Remove a package in emacs
;; Option 1): Remove the package sub-directory in ~/.emacs.d/elpa/
;; Option 2): "M-x list-packages", find package,
;;            press "d" (delete), then type "x" (execute)

;; Go to the next or previous balanced expressions:
;; https://www.emacswiki.org/emacs/NavigatingParentheses
;; (1) Navigate to next group: ctrl-meta-n  (put cursor on the char)
;; (2) Navigate to prev group: ctrl-meta-p  (put cursor behind the char)

;;================================== ediff configuration: ===========================================
;;
;; Command that asks user to interactively select two files for ediff comparison:
;;    "M-x ediff-revision"
;; DO NOT use this command to compare the current file with a file in version control system.
;; Use "M-x vc-ediff" command that is listed below..

;; Commands to compare current file with a file on remote version control system:
;; (1) "C-x v ="       # use "diff"  for comparison;
;; (2) "M-x vc-ediff"  # use "ediff" for comparison;

;; Customize "c-x v =" command into "M-x ediff-revision".
;; http://stackoverflow.com/questions/3712834/getting-vc-diff-to-use-ediff-in-emacs-23-2
;; (eval-after-load "vc-hooks"
;;  '(define-key vc-prefix-map "=" 'ediff-revision))

;; Split the frame horizontally for comparison.
;; http://www.emacswiki.org/emacs/EdiffMode
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; http://cinsk.github.io/2012/04/26/smart-ediff.html
;; In ediff mode:
;;   * Type "m" to make a wider display;
;;   * Type "?" to toggle the help screen;

;; Use ediff with "git mergetool" command, see this article in Chinese:
;; http://jixiuf.github.io/blog/%E4%BD%BF%E7%94%A8emacs%E4%B8%AD%E7%9A%84ediff-%E4%BD%9C%E4%B8%BAgit-mergetool%E4%BD%BF%E7%94%A8%E7%9A%84%E5%B7%A5%E5%85%B7%E8%BF%9B%E8%A1%8C%E6%96%87%E4%BB%B6%E5%90%88%E5%B9%B6/
(defvar ediff-after-quit-hooks nil
  "* Hooks to run after ediff or emerge is quit.")

(defadvice ediff-quit (after edit-after-quit-hooks activate)
  (run-hooks 'ediff-after-quit-hooks))

;; Always maximize the frame before ediff is launched:
(defun local-ediff-frame-maximize ()
  (interactive)
  (toggle-frame-maximized))

(defun local-ediff-before-setup-hook ()
  (setq local-ediff-saved-frame-configuration (current-frame-configuration))
  (setq local-ediff-saved-window-configuration (current-window-configuration))
  (local-ediff-frame-maximize))

(defun local-ediff-quit-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(defun local-ediff-suspend-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(add-hook 'ediff-before-setup-hook 'local-ediff-before-setup-hook)
(add-hook 'ediff-quit-hook 'local-ediff-quit-hook 'append)
(add-hook 'ediff-suspend-hook 'local-ediff-suspend-hook 'append)

;;================================== End of ediff configuration =====================================

;; http://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
;; Toggle full screen: "M-x toggle-frame-maximized"

;; vimrc-mode.
;; Download "vimrc-mode.el" from: https://github.com/mcandre/vimrc-mode
;; and save in: ~/.emacs.d/lisp/
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))

;; How to load a large fil ein emacs faster?
;; https://stackoverflow.com/questions/18316665/how-to-improve-emacs-performance-when-view-large-file
;; Solution #1: Type "M-x find-file-literally" to open the file, or:
;; Solution #2:   (setq jit-lock-defer-time 0.05)
;; Note: #2 is much slower than #1.

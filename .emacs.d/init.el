;;x11とクリップボードを共有
(setq x-select-enable-clipboard t)

;;関数名をモードラインに表示
(which-function-mode 1)

;;C-h でバックスペース
(define-key global-map (kbd "C-h") 'delete-backward-char)

;;C-m/C-jでにゅーらいんいんでんと
;;(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; ;;C-\でprevious line
;; (define-key global-map (kbd "C-\\") 'previous-line)
(define-key global-map (kbd "C-:") 'previous-line)

;; windwmove
(windmove-default-keybindings)
(global-set-key (quote [kp-8]) (quote windmove-up))
(global-set-key (quote [kp-2]) (quote windmove-down))
(global-set-key (quote [kp-6]) (quote windmove-right))
(global-set-key (quote [kp-4]) (quote windmove-left))

;;行番号を表示
(global-linum-mode t)

;;;;;;;;;;;;;;;;;;;;;;;load-path;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/elisp/multiple-cursors.el/")
(add-to-list 'load-path "~/.emacs.d/elisp/emacs-anzu/")
(add-to-list 'load-path "~/.emacs.d/elisp/haskell-mode-2.8.0/")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-20140328.905/")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-ag-20140328.557/")
(add-to-list 'load-path "~/.emacs.d/elpa/point-undo-20100504.829/")
(add-to-list 'load-path "~/.emacs.d/elpa/undohist-20140321.758/")
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet")
(add-to-list 'load-path "~/.emacs.d/elpa/ac-math-20131003.1604")
;;(add-to-list 'load-path "~/.emacs.d/elpa/tabbar-20140316.600l")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;YaTe settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist (append
  '(("\\.tex$" . yatex-mode)
    ("\\.ltx$" . yatex-mode)
    ("\\.cls$" . yatex-mode)
    ("\\.oty$" . yatex-mode)
    ("\\.clo$" . yatex-mode)
    ("\\.bbl$" . yatex-mode)) auto-mode-alist))

 ;;; begin型「C-c C-b 1文字」補完のカスタマイズ
(setq yatex-mode-load-hook
      '(lambda()
;;         (YaTeX-define-begend-key "be" "equation") ; デフォルトは enumerate

;;         (YaTeX-define-begend-key "bE" "enumerate") ; デフォルトは equation

         (YaTeX-define-begend-key "ba" "align")

         (YaTeX-define-begend-key "bA" "align*")
         (YaTeX-define-begend-key "bg" "aligned")

         (YaTeX-define-begend-key "bf" "figure")
         (YaTeX-define-begend-key "bp" "proof")
         (YaTeX-define-begend-key "bP" "prop")
         (YaTeX-define-begend-key "bd" "dfn")
         (YaTeX-define-begend-key "bl" "lem")
         (YaTeX-define-begend-key "br" "thm")
         (YaTeX-define-begend-key "bc" "cor")
         ))


;; _{} を挿入して括弧の中にカーソルを移動する関数
(defun MyTeX-insert-subscript_rm ()
  (interactive)
  (insert "_{}")
  (backward-char 1))
;; YaTeX モードで「Command＋"_" 」のショートカットに割当
(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "_") 'MyTeX-insert-subscript_rm)))

;; ^{} を挿入して括弧の中にカーソルを移動する関数上の設定を真似してみた
(defun MyTeX-insert-subscript_ue ()
  (interactive)
  (insert "^{}")
  (backward-char 1))
;; YaTeX モードで「Command＋"^" 」のショートカットに割当
(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "^") 'MyTeX-insert-subscript_ue)))
;(lambda () (local-set-key [^] 'MyTeX-insert-subscript_ue)))
;;ここでやろうと思った事は^を押したら^{}と挿入されて,カーソルが{}の真ん中にくるようにしたかったのだ.
;;しかし「command+^」のショートカットに割り当てをするところまではよかったが,そのあとがだめになった.
;; ^{} を挿入して括弧の中にカーソルを移動する関数上の設定を真似してみた
(defun MyTeX-insert-subscript_par ()
  (interactive)
  (newline-and-indent)
  (insert "\\par\  ")
  )
;; YaTeX モードで「Command＋"C-ret" 」のショートカットに割当
(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "<C-return>") 'MyTeX-insert-subscript_par)))


;; YaTeXでalign環境でも補完できるようにする
(setq YaTeX-use-AMS-LaTeX t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;undo-tree;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;C-x u undo-tree
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;undohist;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'undohist nil t)
  (undohist-initialize))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;point-undo;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'point-undo nil t)
  (global-set-key (kbd "M-[") 'point-undo)
  (global-set-key (kbd "M-]") 'point-redo))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;emacs settings;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 領域の色付け
(setq transient-mark-mode t)

;;文字の色つけ
(global-font-lock-mode t)

;;カーソルのある行番号を表示
(setq line-number-mode t)

;;日本語infoの文字化け防止
;(auto-compression-mode t)

;;スクロールバーを右に表示
(set-scroll-bar-mode 'right)

;;フレームのタイトル指定
(setq frame-title-format
    (concat "%b - emacs@" system-name))

;;時計を表示
(display-time)

;;警告音を消す
(setq visible-bell t)

;;; リージョンに色を付ける
(setq transient-mark-mode t)
(set-face-background 'region "darkgreen")
;;

;;; 対応する括弧を光らせる
(show-paren-mode)
;;

;;括弧を補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;;改行,Tabなどを色付ける.
;;参考サイトhttp://masutaka.net/chalow/2011-10-12-1.html
(global-whitespace-mode 1)

;;補完可能なものを随時表示
(icomplete-mode 1) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;auto-install;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path "~/.emacs.d/elisp/")
;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el)
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;;;;;;;;;;;;;;;;;;;;;;;;anything;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'anything-startup)
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;;ショートカットの設定

(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;SKKの設定;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;句読点のタイプを設定
(setq-default skk-kutouten-type 'en)
;;http://d.hatena.ne.jp/Rion778/20090617/1245212154参考サイト
;;参考サイトhttp://mugijiru.seesaa.net/article/275755984.html
(add-hook 'skk-load-hook
          (lambda ()
            ;; コード中では自動的に英字にする。
            (require 'context-skk)

            ;; 半角で入力したい文字
            (setq skk-rom-kana-rule-list
                  (nconc skk-rom-kana-rule-list
                         '((";" nil nil)
                           (":" nil nil)
                           ("?" nil nil)
                           ("," nil nil)
                           ("." nil nil)
;;                           ("-" nil nil)
                           ("$" nil nil)
                           ("\\" nil nil)
                           ("\ " nil nil)
                           ("!" nil nil))))))
;;skkを起動時に自動的に起動する
(require 'skk-autoloads)
(when (require 'skk nil t)
  (global-set-key "\C-\\" 'skk-mode))
;;自動で補完すると思っただろ?

;; SKK自動起動の設定

;; lisp-interaction-mode
(add-hook 'lisp-interaction-mode-hook
          '(lambda()
             (progn
               (eval-expression (skk-mode) nil)
               )))

;; find-fileで skk-mode になる
(add-hook 'find-file-hooks
          '(lambda()
             (progn
               (eval-expression (skk-mode) nil)
               )))



; 動的自動補完機能
(setq skk-dcomp-activate t)

; 見出し語と送り仮名がマッチした候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)


; 閉じ括弧の自動入力
(setq skk-auto-insert-paren t)

;; インライン候補縦表示
(setq skk-show-inline 'vertical)

(setq skk-show-tooltip nil)

;;;;;;;;;;;;;;;;;;;latexmk
(setq tex-command "latexmk -pvc -src-specials -file-line-error"
;(setq tex-command "latexmk -src-specials -dvi"
   ;; dvi2-command "evince")
    dvi2-command "xdvi")

;;参考サイトはこちらhttp://lay-sakura.blogspot.jp/2010/10/latexmkpdf.html

;; latexmk -c を実行（TeX の不用なファイルを削除）
(defun MyTeX-latexmk-cleanup ()
  (interactive)
  (let* ((yn))
    (if (y-or-n-p "cleaning up all nonessential files?")
(progn
(message nil)
(process-query-on-exit-flag
(start-process-shell-command "latexmk clean-up" nil "latexmk -c"))
(message "latexmk clean-up done"))
      )))

;;; YaTeX用キーバインドの設定
(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c d") 'MyTeX-latexmk-cleanup)
             ))

;;参考サイトはこちらhttps://github.com/ryseto/emacs_and_tex/blob/master/my_yatex.el

;;src-specialの設定です.
;;; TeX src-special のための設定
(server-start) ; 必須
(require 'xdvi-search) ; 必須
 ; 窓を上に
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'yatex-mode-hook
           '(lambda ()
              (define-key YaTeX-mode-map "\C-c\C-j" 'xdvi-jump-to-line)))
;;参考サイトはこちらhttp://www.nn.iij4u.or.jp/~tutimura/tex/src-special.html

;;;;;;;;;;;;;;;;C-c C-jの設定でふ.;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(foreign-regexp/regexp-type (quote perl))
 '(reb-re-syntax (quote foreign-regexp))
 '(safe-local-variable-values (quote ((TeX-master . "/home/el/math/2014zemi/ishidakan8/2-8_hmorphism.tex") (TeX-master . "2-3_integral.tex") (TeX-master . "$3.tex") (TeX-master . "2-2_idandf.tex") (TeX-master . "~/Desktop/zemi/2-3_integral.tex") (TeX-master . "langalg") (TeX-master . "~/math/2014zemi/2-3_integral.tex") (TeX-master . "~/math/2014zemi/ishidakan8/langalg.tex") (TeX-master . t))))
 '(yas-trigger-key "<C-tab>"))


;;latex-indent
;;(require 'latex-indent)
;;だめですた

(autoload 'latex-indent-command "~/.emacs.d/"
  "Indent current line accroding to LaTeX block structure.")
(autoload 'latex-indent-region-command "~/.emacs.d/"
  "Indent each line in the region according to LaTeX block structure.")
(add-hook
 'latex-mode-hook
 '(lambda ()
    (define-key tex-mode-map "\t"       'latex-indent-command)
    (define-key tex-mode-map "\M-\C-\\" 'latex-indent-region-command)))

;; indent and newline
(define-key global-map (kbd "RET") 'newline-and-indent)
;;http://www.emacswiki.org/emacs/AutoIndentation

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

(global-set-key "\C-y" 'yank-and-indent)

;;参考http://www.emacswiki.org/emacs/AutoIndentation


;;;;;;;;;;;;;;yatex skk;;;;;;;;
;; skk 対策
(add-hook 'skk-mode-hook
          (lambda ()
            (if (eq major-mode 'yatex-mode)
                (progn
                  (define-key skk-j-mode-map "\\" 'self-insert-command)
                  (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar)
                  ))
            ))

;; math-sign の追加
(setq
 YaTeX-math-sign-alist-private
 '(
   ("q"         "Q"                  "(Q)")
   ("z"         "Z"                  "ZZ")
   ("t"                "text"                "text{}")
   ("qu"        "quad"                 "__")
   ("qq"        "qquad"         "____")
;;   ("ls"        "varlimsup"     "___\nlim")
;;   ("li"        "varliminf"     "lim\n---")
;;   ("il"        "varinjlim"     "lim\n-->")
;;   ("pl"        "varprojlim"    "lim\n<--")
;;   ("st"        "text{ s.t. }" "s.t.")
   ("bigop"     "bigoplus"      "_\n(+)~")
   ("bigot"     "bigotimes"     "_\n(x)\n ~")
   ))


;;; package.el
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeを追加
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; インストールしたパッケージにロードパスを通してロードする
  (package-initialize))

;;(package-install 'helm)
;;(add-to-list 'load-path “/path/to/helm/directory”)

(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
;;  (define-key global-map (kbd "C-x b")   'helm-buffers-list)
  (define-key global-map (kbd "M-s")   'helm-occur)
  (define-key global-map (kbd "C-;")   'helm-resume)
  (define-key helm-command-map (kbd "C-s") 'helm-occur-from-isearch)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;;   (helm :sources '(helm-source-findutils
;; ;;                   helm-source-ls-git
;;                    helm-source-recentf
;;                    helm-source-buffers-list
;;                    helm-source-locate)
;;         :buffer "*helm-find-files*")
  ;;http://blog.jenkster.com/2013/10/finding-files-in-emacs-helm.html

;;   (defun my-helm ()
;;     (interactive)
;;     (helm :sources '(
;;                      helm-c-source-buffers-list
;;                      helm-c-source-recentf
;;                      helm-c-source-files-in-current-dir
;;                      helm-c-source-mac-spotlight
;;                      helm-c-source-buffer-not-found)
;;           :buffer "*my helm*"))

;;   (global-set-key (kbd "C-x b") 'my-helm)
  ;;http://yoshiori.github.io/blog/2013/01/30/dot-emacs-renewal/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2014/03/30 22:38:59

  
;;  (defun my-helm ()
;;    (interactive)
;; ;;   (helm :sources '(
;;   (helm :sources '(helm-source-findutils
;; ;;                   helm-source-ls-git
;; ;;                   helm-source-file-cache
;;                    helm-source-buffers-list
;;                    helm-source-recentf
;;                    helm-source-files-in-current-dir
;;                    helm-source-locate
;;                    helm-source-find-files)
;; ;;        :buffer "*helm-find-files*")
;;                     ;; helm-c-source-buffers-list
;;                     ;; helm-c-source-recentf
;;                     ;; helm-c-source-files-in-current-dir
;;                     ;; helm-c-source-mac-spotlight
;;                     ;; helm-c-source-buffer-not-found)
;; ;        (helm-ff-transformer-show-only-basename nil)
;;          :buffer "*my helm*"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;|;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;\|/
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (defun my-helm ()
   (interactive)
   (helm :sources '(
                    helm-c-source-buffers-list
                    helm-c-source-recentf
                    helm-c-source-files-in-current-dir
                    helm-c-source-mac-spotlight
                    helm-c-source-locate
                    helm-c-source-file-name-history
                    helm-c-source-find-files
                    helm-c-source-buffer-not-found)
         :buffer "*my helm*"))

 ;; emacsの終了時に、履歴を保存する
 (remove-hook 'kill-emacs-hook 'helm-c-adaptive-save-history)


 
 
 ;; (defun my-helm (buffers sources)
 ;;   "helm-highlight-buffersのファイルサイズとか消してフルパス表示する版"
 ;;   (loop for i in buffers
 ;;         for buf = (get-buffer i)
 ;;         for proc = (get-buffer-process buf)
 ;;         for bufname = (or (buffer-file-name buf) (format "%s" buf))
 ;;         for directory = (rassoc buf dired-buffers)
 ;;         collect
 ;;         (cond (directory
 ;;                (cons (propertize (car directory) 'face 'helm-ff-directory) i))
 ;;               ((file-exists-p bufname)
 ;;                (cons (propertize bufname 'face 'helm-ff-file) i))
 ;;               (t
 ;;                (cons (propertize bufname 'face 'italic) i))
 ;;               )))
 ;; ;;http://hitode909.hatenablog.com/entry/2013/08/04/114845 

 (setq helm-ff-transformer-show-only-basename nil)
 ;;http://mikio.github.io/article/2013/06/14_helm.html
 (global-set-key (kbd "C-x b") 'my-helm)


  ;; (helm :sources '(helm-source-findutils
  ;;                  helm-source-recentf
  ;;                  helm-source-bookmarks
  ;;                  helm-source-buffers-list
  ;;                  helm-source-google-suggest
  ;;                  helm-source-locate
  ;;                  helm-source-ls-git)
  ;;       :buffer "*helm all the things*")

  ;;http://blog.jenkster.com/2013/10/finding-files-in-emacs-helm.html

  ;;;;;;;;&&&&&&&&&&&&&&&&&&&
  (require 'helm-files)
  (require 'helm-ag)

  (global-set-key (kbd "M-g .") 'helm-ag)
  (global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
  (global-set-key (kbd "C-M-s") 'helm-ag-this-file)
  ;;;;;;;;&&&&&&&&&&&&&&&&&&&
  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
           (input-pattern (file-name-nondirectory pattern))
           (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
            (concat dirname
                    (if (string-match "^\\^" input-pattern)
                        ;; '^' is a pattern for basename
                        ;; and not required because the directory name is prepended
                        (substring input-pattern 1)
                      (concat ".*" input-pattern)))))))

;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
;; ;;helmのfind file は通常のものを使う.

;; all-ext.el を使う. M-x allで起動 helm occer のあと, C-c C-a で起動することも可能です.
(require 'all-ext)

;; C-c C-q でall-editから脱出
(defun all-mode-quit ()
  (interactive)
  (view-mode 1) (View-quit))

(define-key all-mode-map (kbd "C-c C-q") 'all-mode-quit)

(cd "/home/arch")

(add-to-list 'default-frame-alist '(alpha . 95))


;; indent and newline
(define-key global-map (kbd "RET") 'newline-and-indent)
;;http://www.emacswiki.org/emacs/AutoIndentation

;;indentにTabを使いたくない
(setq-default indent-tabs-mode nil)


;;もうしょうがないのでつくった. しょうがないのだ
(defun MyTeX-insert-subscript_bf ()
  (interactive)
  (insert "\\textbf{}")
  (backward-char 1))

(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "C-S-b") 'MyTeX-insert-subscript_bf)))

;; ;;tex blank after $$
;; (defun MyTeX-insert-subscript_dollar ()
;;   (interactive)
;;   (insert "$$\s")
;;   (backward-char 2))

;; (add-hook
;;  'yatex-mode-hook
;;  (lambda () (local-set-key (kbd "$") 'MyTeX-insert-subscript_bf)))


;;TeX label
(require 'texlabel nil t)
(add-hook 'YaTeX-mode-load-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c C-l" 'texlabel-auto-labeling-default)))
)

;; flyspell mode
;; ispellをaspellに置き換える.
(setq-default ispell-program-name "aspell")
;;日本語の混じった環境でも使えるようにする
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(mapc                                   ;; 以下flyspell-modeの設定
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(
   c-mode-common-hook                 ;; ここに書いたモードではコメント領域のところだけ
   emacs-lisp-mode-hook                 ;; flyspell-mode が有効になる
   ))
(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(
   yatex-mode-hook     ;; ここに書いたモードでは
   ;; flyspell-mode が有効になる
   ))

;; yspelmode
;;(add-to-list 'load-path "~/.emacs.d/yaspel")

;;(require 'yspel)

;;move-end-of-line

;;Setting for RefTeX
(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))

;; (setq reftex-label-alist
;;       '(AMSTeX
;;         ("thm" ?h "thm:" "\\ref{%s}" t ("Theorem" "th." -2))
;;         ("defi" ?h "defi:" "\\ref{%s}" t ("Definition" "def." -3))))


;;参考url`http://www.math.s.chiba-u.ac.jp/~matsu/emacs/emacs21/reftex.html'
;;本来は`定理\ref{thmhoge}' とするのが面倒だったので, prettyref.styを導入
;;しようと思ったのだけれど, YaTeX との連携ができないと面倒そうだったので, 導入した error 吐くかも
;;ちなみに, prettyref は https://sites.google.com/site/6eskymemo/note/tex-lyx/prettyrefを参照すればいいと思う.

;;こんまのあとにくうはく
(defun MyTeX-insert-blank-after-comma ()
  (interactive)
  (insert ",\s")
  (backward-char 0))

(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "\,") 'MyTeX-insert-blank-after-comma)))
;;ぴりおどのあとにくうはく
(defun MyTeX-insert-blank-after-period ()
  (interactive)
  (insert ".\s")
  (backward-char 0))

(add-hook
 'yatex-mode-hook
 (lambda () (local-set-key (kbd "\.") 'MyTeX-insert-blank-after-period)))

;; If you push F5 key, then inserted today's template
(define-key global-map [f5]
  '(lambda ()
     (interactive)
     (insert (format-time-string "%Y/%m/%d %H:%M:%S"))))

;; Anything-for-files with locate
(setq anything-c-locate-command
      (case system-type
        ('gnu/linux "locate -i -r %s")
        ('berkeley-unix "locate -i %s")
        ('windows-nt "es -i -r %s")
        (t "locate %s")))

;;reload
(global-set-key
 [f12] 'eval-buffer)

;;smartrep & multiple-cursors
(require 'multiple-cursors)
(require 'smartrep)

(declare-function smartrep-define-key "smartrep")

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key "\C-t")

(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("g"        . 'mc/mark-sgml-tag-pair)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

;;all-mode の編集の際にsmartrep
(eval-after-load "smartrep"
  '(progn
     (smartrep-define-key global-map "M-g"
       '(("n"   . 'next-error)
         ("p"   . 'previous-error)
         ("C-n" . 'next-error)
         ("C-p" . 'previous-error)))))

(global-unset-key "\C-z")

;; ;;popwin.el
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)

;; (setq popwin:popup-window-position 'bottom)

;; ;; anything
;; (push '("*anything*") popwin:special-display-config)

;; ;; *Completions*
;; (push '("*Completions*") popwin:special-display-config)

;; ;; *anything auto install*
;; (push '("*anything auto install*") popwin:special-display-config)

;; ;; *anything for files*
;; (push '("*anything for files*") popwin:special-display-config)

;; ;; *YaTeX-typesetting*
;; (push '("*YaTeX-typesetting*") popwin:special-display-config)

;;emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
;; (keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
;; (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開


;;(define-key emmet-mode-keymap (kbd "TAB") 'emmet-expand-line) ;; C-i で展開
;;(define-key emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas) ;; C-i で展開

;;anzu
(require 'anzu)
(global-anzu-mode +1)


(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c R") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c c") 'anzu-query-replace-at-cursor-thing)



;;find file で文字の大小を区別しない
(setq completion-ignore-case t)

;; ace jump mode
(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


(deftheme default-black
  "Automatically created 2013-05-20.")
;; emacs rocks theme
(custom-theme-set-faces
 'default-black
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-t*hrough nil :overline nil :underline nil :slant normal :weight normal :width normal :height 130))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#111111"))))
 '(region ((nil (:background "#464740"))))
 '(hl-line ((nil (:background "#222222"))))
 '(yas-field-highlight-face ((nil (:background "#333399"))))
 '(js2-function-param-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((nil (:foreground "#ff6666"))))
 '(show-paren-match ((nil (:background "#333399"))))
 '(show-paren-mismatch ((((class color)) (:background "red")))))

(provide-theme 'default-black)


(when skk-show-inline
  ;; 変換候補の装飾に変数 `skk-treat-candidate-appearance-function' を利用
  ;; するならば、skk-inline-show-face を nil に設定すること
  (setq skk-inline-show-face nil
        skk-inline-show-background-color     "gray15"        ;偶数ラインの背景色
        skk-inline-show-background-color-odd "gray20")) ;奇数ラインの背景色
;;*候補*バッファ の背景色
(setq skk-candidate-buffer-background-color     "grey90"
      skk-candidate-buffer-background-color-odd "grey80")

;; ;;hi-light-regrep C-c w rで解除
;; (global-set-key (kbd"C-h i") 'highlight-regexp)


;;http://note.golden-lucky.net/2010/06/emacs-emacs-22.html
(defun keep-highlight-regexp (re)
  (interactive "sRegexp: \n")
  (make-face 'my-highlight-face)
  (set-face-foreground 'my-highlight-face "black")
  (set-face-background 'my-highlight-face "yellow")
  (defvar my-highlight-face 'my-highlight-face)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-add-keywords 'nil (list (list re 0 my-highlight-face t)))
  (font-lock-fontify-buffer))

(defun cancel-highlight-regexp ()
  (interactive)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-fontify-buffer))

(global-set-key (kbd "M-S-f") 'keep-highlight-regexp)
(global-set-key (kbd "C-S-d") 'cancel-highlight-regexp)

(require 'cl)
;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)


;;;; yasnippetを置いているフォルダにパスを通す
;; (add-to-list 'load-path
;;              (expand-file-name "~/.emacs.d/elpa/yasnippet"))

(require 'yasnippet)
;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
        "~/.emacs.d/elpa/yasnippet/snippets" ;; 最初から入っていたスニペット(省略可能)
        ))
(yas-global-mode 1)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか

;;(custom-set-variables '(yas-trigger-key ""))
;;(custom-set-variables '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;;;;;;;;;;;;;;;;;;;;;;;auto-complete-mode;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path "~/.emacs.d/");;上のload-pathに加えたたので消した
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)

;;http://gihyo.jp/admin/serial/01/ubuntu-recipe/0118の設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))
(global-auto-complete-mode t)
(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ひらがなとカタカナのトグル
(defun skk-j-mode-and-toggle-kana ()
  (interactive)
  (cond (skk-j-mode
         (skk-toggle-kana nil))
        (t
         (skk-j-mode-on))))


;;; 変換/無変換キーで対応したキー設定削除
(defun skk-load-hooks ()
  ;; キーでモードを変更しない
  (defvar skk-my-unnecessary-base-rule-list
    '("l" "q" "L"))
  (dolist (str skk-my-unnecessary-base-rule-list)
    (setq skk-rom-kana-base-rule-list
          (skk-del-alist str skk-rom-kana-base-rule-list))))

(add-hook 'skk-load-hook 'skk-load-hooks)


;;; 変換/無変換キーで対応したazik専用キー設定削除
(defun skk-azik-load-hooks ()
  ;; 1. l, q が使えないことによる変更を戻す
  ;; 2. tU で「っ」になるのを防ぐ
  (defvar skk-my-azik-unnecessary-rule-list
    '("xxa" "xxe" "xxi" "xxo" "xxu" "@" "tU"))
  (dolist (str skk-my-azik-unnecessary-rule-list)
    (setq skk-rom-kana-rule-list
          (skk-del-alist str skk-rom-kana-rule-list)))
  ;; l を使った小文字入力など
  (defvar skk-my-azik-additional-rom-kana-rule-list
    '(("la" nil ("ァ" . "ぁ"))
      ("le" nil ("ェ" . "ぇ"))
      ("li" nil ("ィ" . "ぃ"))
      ("lo" nil ("ォ" . "ぉ"))
      ("lu" nil ("ゥ" . "ぅ"))
      ("lya" nil ("ャ" . "ゃ"))
      ("lyu" nil ("ュ" . "ゅ"))
      ("lyo" nil ("ョ" . "ょ"))
      ("@" nil skk-today)))
  (dolist (rule skk-my-azik-additional-rom-kana-rule-list)
    (add-to-list 'skk-rom-kana-rule-list rule)))

(add-hook 'skk-azik-load-hook 'skk-azik-load-hooks)


;;; キー割り当て
;;(global-set-key (kbd "<zenkaku-hankaku>") 'skk-mode)
(global-set-key (kbd "<muhenkan>") 'skk-latin-mode)
(global-set-key (kbd "<henkan>") 'skk-j-mode-and-toggle-kana)
(global-set-key (kbd "S-<muhenkan>") 'skk-jisx0208-latin-mode)
(global-set-key (kbd "S-<henkan>") 'skk-toggle-katakana)



(ac-flyspell-workaround)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;ac-math;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'LaTex-mode)
(add-to-list 'ac-modes 'org-mode)

(defun ac-latex-mode-setup ()
  (set ac-sources
       (append '(ac-source-math-unicode ac-source-math-latex -ac-source-latex-commands)
               ac-sources)))

(add-to-list 'latex-mode-hook 'ac-latex-mode-setup)
;(add-to-list 'LaTex-mode-hook 'ac-latex-mode-setup)
;(add-to-list 'org-mode-hook 'ac-latex-mode-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;;darkroom-mode with C-c d
(require 'darkroom-mode)
(global-set-key "\C-cd" 'darkroom-mode)


;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;keyfreq settings
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;jaunte
(require 'jaunte)
(global-set-key (kbd "<zenkaku-hankaku>") 'jaunte)
(global-set-key (kbd "C-t j") 'jaunte)
(setq jaunte-hint-unit)

(defun newline-at-middle-line ()
  (move-end-of-line)
  (newline-and-indent))

(global-set-key (kbd "M-RET") 'newline-at-middle-line)

;;ediff の設定
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;;(install-elisp https://raw.github.com/k-talo/foreign-regexp.el/master/foreign-regexp.el)
;; (require 'foreign-regexp)

;; (custom-set-variables
;;  ;; 正規表現、perlかrubyを選択
;;  '(foreign-regexp/regexp-type 'perl) ;; Choose by your preference.
;;  '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/elisp/foreign-regexp.el"))

(require 'foreign-regexp)

 ;; Tell re-builder to use foreign regexp.

;;haskell-mode
(autoload 'haskell-mode "haskell-mode")
(autoload 'haskell-cabal "haskell-cabal")
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal" . haskell-cabal-mode))

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
(setq haskell-program-name "/usr/bin/ghci")

;; ghc-mod
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.cabal/share/ghc-mod-3.1.3")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
          (lambda () (ghc-init)))
(add-to-list 'ac-sources 'ac-source-ghc-mod)


;;font settings at English

(set-face-attribute 'default nil
                    :family "monaco" ;; font
;;                    :family "Comic Sans MS" ;; font
                    :height 150)    ;; font size

;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  (font-spec :family "Ricty")) ;; font

;; (set-background-color "#98bc98") ;; background color
;; ;; (set-foreground-color "black")   ;; font color

(setq inhibit-startup-message t)

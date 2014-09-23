;;
;; auto-save-buffers.el
;;
;; ���������  �������� �  ���������� (ELF:01128)
;;
;; � ���:
;;
;;   (require 'auto-save-buffers)
;;   (run-with-idle-timer 0.5 t 'auto-save-buffers) ; ����� �0.5ɏ����ݏ��
;;
;; auto-save-buffers �� on/off ��� �� �� �ᤦ������� (C-x a s)
;;
;;   (define-key ctl-x-map "as" 'auto-save-buffers-toggle)
;;

;; auto-save-buffers ��§�  ��� ����� ������ ��
(defvar auto-save-buffers-regexp ""
  "*Regexp that matches `buffer-file-name' to be auto-saved.")

;; auto-save-buffers � ������� ����� ������ ��
(defvar auto-save-buffers-exclude-regexp "^$"
  "*Regexp that matches `buffer-file-name' not to be auto-saved.")

;;
;; ��� �� auto-save-buffers ������������� ������ � � � ���
;;
;; (require 'auto-save-buffers)
;; (run-with-idle-timer 0.5 t 'auto-save-buffers "\\.c$" "^$") ; .c ����§��
;; (run-with-idle-timer 0.5 t 'auto-save-buffers ""   "\\.h$") ; .h ��������
;;

;; nil �  ��� �� � (����� �� 󤏫��� �)
(defvar auto-save-buffers-active-p t
  "If non-nil, `auto-save-buffers' saves buffers.")

;; �ʏ��� �������� �include/exclude � ����� ������� ���
(defun auto-save-buffers (&rest regexps)
  "Save buffers if `buffer-file-name' matches `auto-save-buffers-regexp'."
  (let ((include-regexp (or (car  regexps) auto-save-buffers-regexp))
        (exclude-regexp (or (cadr regexps) auto-save-buffers-exclude-regexp))
        (buffers (buffer-list)))
    (save-excursion
      (while buffers
	(set-buffer (car buffers))
	(if (and buffer-file-name
                 auto-save-buffers-active-p 
		 (buffer-modified-p)
		 (not buffer-read-only)
		 (string-match include-regexp buffer-file-name)
                 (not (string-match exclude-regexp buffer-file-name))
		 (file-writable-p buffer-file-name))
	    (save-buffer))
	(setq buffers (cdr buffers))))))

;; auto-save-buffers �� on/off �� ����� �� ���
;; Based on the code by Yoshihiro (��������� 2004-03-23)
(defun auto-save-buffers-toggle ()
  "Toggle `auto-save-buffers'"
  (interactive)
  (if auto-save-buffers-active-p
      (setq auto-save-buffers-active-p nil)
    (setq auto-save-buffers-active-p t))
  (if auto-save-buffers-active-p
      (message "auto-save-buffers on")
    (message "auto-save-buffers off")))

;;
;; Emacs 21 �  � Makefile ��� ����� "Suspicious line XXX. Save anyway"
;; � ���� ��  򽧶�� ����� �� �ᤦ��� �� �
;;
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (fset 'makefile-warn-suspicious-lines 'ignore))))

(provide 'auto-save-buffers)


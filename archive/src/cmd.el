(setq auto-save-default nil)

(defun my-tags-query-replace (a b c)
  (interactive)
  (cond ((equal c "yes") (tags-query-replace (concat "\\b" a "\\b") b ))
	(t (tags-query-replace a b))))
(setq tag-table-files nil) ;;reset
(my-tags-query-replace "fsymeval" "symbol-function" "yes")
(my-tags-query-replace "prinlevel" "*print-level*" "yes")
(my-tags-query-replace "prinlevel" "*print-level*" "yes")


(my-tags-query-replace "symeval" "symbol-value" "yes")
(my-tags-query-replace "show" "ishow" "yes")
(my-tags-query-replace "delete" "zl-delete" "yes")
(my-tags-query-replace "(\\+ " "(f+ " "no")
(my-tags-query-replace "(\\* " "(f* " "no" )
(my-tags-query-replace "(\\- " "(f- " "no" )
(my-tags-query-replace "(\\^ " "(expt  " "no" )
(big-query-replace "\\([( +---]\\)lispm" "\\1cl" "yes" nil)
(my-tags-query-replace "probef" "probe-file" "yes" )
(my-tags-query-replace "fs:*parse-pathname" "pathname" "yes" )
(my-tags-query-replace "\*catch" "catch" "yes")
(my-tags-query-replace "\*throw" "throw" "yes")
(my-tags-query-replace "defconst" "defparameter" "yes")
(my-tags-query-replace "standard-output" "*standard-output*" "yes")
(my-tags-query-replace "multiple-value" "multiple-value-setq" "yes")
(my-tags-query-replace "function-cell-location" "symbol-function" "yes")
(my-tags-query-replace "get-pname" "symbol-name" "yes")
(my-tags-query-replace "substitute" "maxima-substitute" "yes")
(my-tags-query-replace "integerp" "maxima-integerp" "yes")
(my-tags-query-replace "rationalize" "maxima-rationalize" "yes")
(my-tags-query-replace "rationalp" "maxima-rationalp" "yes")
(my-tags-query-replace "constantp" "maxima-constantp" "yes")
(my-tags-query-replace "(string" "(maxima-string" "yes")
(my-tags-query-replace "union" "maxima-union" "yes")
(my-tags-query-replace "remf" "maxima-remf" "yes")
(my-tags-query-replace "float-precision" "MAXIMA-float-precision" "yes")
(my-tags-query-replace "intersection" "maxima-intersection" "yes")

(my-tags-query-replace "remprop" "zl-remprop" "yes")
(my-tags-query-replace "assoc" "zl-assoc" "yes")
(my-tags-query-replace "delete" "zl-delete" "yes")
(my-tags-query-replace "member" "zl-member" "yes")
(my-tags-query-replace "remove" "zl-remove" "yes")
(my-tags-query-replace "get" "zl-get" "yes")


(my-tags-query-replace "lexpr-funcall" "apply" "yes")
(my-tags-query-replace "copytree" "copy-tree" "yes")
(my-tags-query-replace "copylist" "copy-list" "yes") 

(my-tags-query-replace "length (the array" "length (the lisp::array" "no")
(my-tags-query-replace ":fill-pointer 0" ":fill-pointer 0 :adjustable t" "no")

(my-tags-query-replace "flonump" "floatp" "yes")
(tags-kbd-macro "(array-active-length"  "q length (the array)")
(tags-kbd-macro "(neq"   "ot (eql)")
(my-tags-query-replace "array-length" "array-total-size" "yes")
   
(tags-kbd-macro "array-push-extend"  "q vector-push-extend  ")

(tags-kbd-macro "array-push"  "q vector-push  ")
(tags-query-replace "\\`[ 10;a-zA-Z---\\*:]*" ";;; -*-  Mode: Lisp; Package: Maxima; Syntax: Common-Lisp; Base: 10 -*- ;;;;" "no")

(my-tags-query-replace "(plist" "(symbol-plist" "no" )
(my-tags-query-replace "adjust-array-size" "adjust-array" "yes")
(my-tags-query-replace "copysymbol" "copy-symbol" "yes")
(my-tags-query-replace "\n(declare " "\n(declare-top " "no")
(tags-query-replace "maxima-typecase"
   "maxima-typecase" "yes") ;;replaced with (or (assoc ..) ..)
(my-tags-query-replace "typep" "ml-typep" "yes")

(my-tags-query-replace "boole[ ]+1"  "boole  boole-and" "yes")
(my-tags-query-replace "boole[ ]+2" "boole boole-andc1" "yes")
(my-tags-query-replace "boole 4" "boole  boole-andc2" "yes")
(my-tags-query-replace "boole 6" "boole boole-xor" "yes")
(my-tags-query-replace "boole 7" "boole  boole-ior" "yes")
(se "\\bboole[ \\t]+[0-9]")
;(se "(defun[ ]+[ $a-zA-Z0-9]*[ ]*\\bn\\b")

(defun se (str)
  (tags-query-replace str str "yes"))

(defun se (str &optional delim)
  (cond (delim (setq str (concat "\\b" str "\\b"))))
  (tags-search str))


(defun call-kbd1 (string macro)
  (interactive)
  (let ((last-kbd-macro macro))
    (while (re-search-forward string nil t)
	   (save-excursion (call-last-kbd-macro) ))))


(defun tags-kbd-macro (string macro)
  (interactive "sTags search (regexp): ")
  
    (setq tags-loop-form
     (list 'call-kbd1 string macro))
    (tags-loop-continue t))

(defun se (str &optional delim)
  (cond (delim (setq str (concat "\\b" str "\\b"))))
  (tags-search str))

(defun try (str)
  (setq tags-loop-form
	(list 'and (list 're-search-forward str nil t)
	       (looking-at "("))



   


;;number operations:
fixnum: f+,f*,^,f-
float:  +$,*$,^$,-$
general or funcalled: plus times expt difference

(tags-query-replace "sub1" "1-" "yes")
(tags-query-replace "add1" "1+" "yes")
(tags-query-replace "standard-input" "*standard-input*" "yes")
(tags-query-replace "(minus" "(-" "yes")
;(tags-query-replace "greaterp" ">" "yes") ;are these for fixnum only?
;(tags-query-replace "lessp" "<" "yes")  


(tags-kbd-macro "\\bfset\\b"  "q setf (symbol-function ) ")

(tags-query-replace "\\b\\(1[+---]\\)\\b" "f\\1" "no")
(tags-query-replace "'[ ]*f1\\([+---]\\)\\b" "'1\\1" "no")
(se "lispm[ 
]*x")

("SYS:DEFUN-COMPATIBILITY :OBSOLETE NIL "Obsolete DEFUN
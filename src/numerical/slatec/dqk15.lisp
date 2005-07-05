;;; Compiled by f2cl version 2.0 beta Date: 2005/06/20 01:53:39 
;;; Using Lisp CMU Common Lisp Snapshot 2005-06 (19B)
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':array)
;;;           (:array-slicing t) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "SLATEC")


(let ((wg
       (make-array 4
                   :element-type 'double-float
                   :initial-contents '(0.1294849661688697 0.27970539148927664
                                       0.3818300505051189 0.4179591836734694)))
      (xgk
       (make-array 8
                   :element-type 'double-float
                   :initial-contents '(0.9914553711208126 0.9491079123427585
                                       0.8648644233597691 0.7415311855993945
                                       0.5860872354676911 0.4058451513773972
                                       0.20778495500789848 0.0)))
      (wgk
       (make-array 8
                   :element-type 'double-float
                   :initial-contents '(0.022935322010529224 0.06309209262997856
                                       0.10479001032225019 0.14065325971552592
                                       0.1690047266392679 0.19035057806478542
                                       0.20443294007529889
                                       0.20948214108472782))))
  (declare (type (array double-float (8)) wgk xgk)
           (type (array double-float (4)) wg))
  (defun dqk15 (f a b result abserr resabs resasc)
    (declare (type double-float resasc resabs abserr result b a)
             (type (function (double-float) (values double-float &rest t)) f))
    (f2cl-lib:with-multi-array-data
        nil
      (prog ((fv1 (make-array 7 :element-type 'double-float))
             (fv2 (make-array 7 :element-type 'double-float)) (j 0) (jtw 0)
             (jtwm1 0) (absc 0.0) (centr 0.0) (dhlgth 0.0) (epmach 0.0)
             (fc 0.0) (fsum 0.0) (fval1 0.0) (fval2 0.0) (hlgth 0.0) (resg 0.0)
             (resk 0.0) (reskh 0.0) (uflow 0.0) (abs$ 0.0f0))
        (declare (type single-float abs$)
                 (type (array double-float (7)) fv2 fv1)
                 (type double-float uflow reskh resk resg hlgth fval2 fval1
                                    fsum fc epmach dhlgth centr absc)
                 (type f2cl-lib:integer4 jtwm1 jtw j))
        (setf epmach (f2cl-lib:d1mach 4))
        (setf uflow (f2cl-lib:d1mach 1))
        (setf centr (* 0.5 (+ a b)))
        (setf hlgth (* 0.5 (- b a)))
        (setf dhlgth (coerce (abs hlgth) 'double-float))
        (setf fc
                (multiple-value-bind (ret-val var-0)
                    (funcall f centr)
                  (declare (ignore))
                  (when var-0
                    (setf centr var-0))
                  ret-val))
        (setf resg (* fc (f2cl-lib:fref wg (4) ((1 4)))))
        (setf resk (* fc (f2cl-lib:fref wgk (8) ((1 8)))))
        (setf resabs (coerce (abs resk) 'double-float))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j 3) nil)
          (tagbody
            (setf jtw (f2cl-lib:int-mul j 2))
            (setf absc (* hlgth (f2cl-lib:fref xgk (jtw) ((1 8)))))
            (setf fval1 (funcall f (- centr absc)))
            (setf fval2 (funcall f (+ centr absc)))
            (f2cl-lib:fset (f2cl-lib:fref fv1 (jtw) ((1 7))) fval1)
            (f2cl-lib:fset (f2cl-lib:fref fv2 (jtw) ((1 7))) fval2)
            (setf fsum (+ fval1 fval2))
            (setf resg (+ resg (* (f2cl-lib:fref wg (j) ((1 4))) fsum)))
            (setf resk (+ resk (* (f2cl-lib:fref wgk (jtw) ((1 8))) fsum)))
            (setf resabs
                    (+ resabs
                       (* (f2cl-lib:fref wgk (jtw) ((1 8)))
                          (+ (abs fval1) (abs fval2)))))
           label10))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j 4) nil)
          (tagbody
            (setf jtwm1 (f2cl-lib:int-sub (f2cl-lib:int-mul j 2) 1))
            (setf absc (* hlgth (f2cl-lib:fref xgk (jtwm1) ((1 8)))))
            (setf fval1 (funcall f (- centr absc)))
            (setf fval2 (funcall f (+ centr absc)))
            (f2cl-lib:fset (f2cl-lib:fref fv1 (jtwm1) ((1 7))) fval1)
            (f2cl-lib:fset (f2cl-lib:fref fv2 (jtwm1) ((1 7))) fval2)
            (setf fsum (+ fval1 fval2))
            (setf resk (+ resk (* (f2cl-lib:fref wgk (jtwm1) ((1 8))) fsum)))
            (setf resabs
                    (+ resabs
                       (* (f2cl-lib:fref wgk (jtwm1) ((1 8)))
                          (+ (abs fval1) (abs fval2)))))
           label15))
        (setf reskh (* resk 0.5))
        (setf resasc (* (f2cl-lib:fref wgk (8) ((1 8))) (abs (- fc reskh))))
        (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                      ((> j 7) nil)
          (tagbody
            (setf resasc
                    (+ resasc
                       (* (f2cl-lib:fref wgk (j) ((1 8)))
                          (+ (abs (- (f2cl-lib:fref fv1 (j) ((1 7))) reskh))
                             (abs
                              (- (f2cl-lib:fref fv2 (j) ((1 7))) reskh))))))
           label20))
        (setf result (* resk hlgth))
        (setf resabs (* resabs dhlgth))
        (setf resasc (* resasc dhlgth))
        (setf abserr (coerce (abs (* (- resk resg) hlgth)) 'double-float))
        (if (and (/= resasc 0.0) (/= abserr 0.0))
            (setf abserr
                    (* resasc
                       (min 1.0 (expt (/ (* 200.0 abserr) resasc) 1.5)))))
        (if (> resabs (/ uflow (* 50.0 epmach)))
            (setf abserr (max (* epmach 50.0 resabs) abserr)))
        (go end_label)
       end_label
        (return (values nil nil nil result abserr resabs resasc))))))


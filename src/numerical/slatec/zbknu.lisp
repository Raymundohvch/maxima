;;; Compiled by f2cl version 2.0 beta Date: 2005/06/20 01:53:39 
;;; Using Lisp CMU Common Lisp Snapshot 2005-06 (19B)
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':simple-array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "SLATEC")


(let ((kmax 30)
      (czeror 0.0)
      (czeroi 0.0)
      (coner 1.0)
      (conei 0.0)
      (ctwor 2.0)
      (r1 2.0)
      (dpi 3.141592653589793)
      (rthpi 1.2533141373155003)
      (spi 1.909859317102744)
      (hpi 1.5707963267948966)
      (fpi 1.8976999933151775)
      (tth 0.6666666666666666)
      (cc
       (make-array 8
                   :element-type 'double-float
                   :initial-contents '(0.5772156649015329 -0.04200263503409524
                                       -0.04219773455554433 0.0072189432466631
                                       -2.1524167411495098e-4
                                       -2.013485478078824e-5
                                       1.133027231981696e-6
                                       6.116095104481416e-9))))
  (declare (type (simple-array double-float (8)) cc)
           (type double-float tth fpi hpi spi rthpi dpi r1 ctwor conei coner
                              czeroi czeror)
           (type f2cl-lib:integer4 kmax))
  (defun zbknu (zr zi fnu kode n yr yi nz tol elim alim)
    (declare (type (simple-array double-float (*)) yi yr)
             (type f2cl-lib:integer4 nz n kode)
             (type double-float alim elim tol fnu zi zr))
    (prog ((cssr (make-array 3 :element-type 'double-float))
           (csrr (make-array 3 :element-type 'double-float))
           (bry (make-array 3 :element-type 'double-float))
           (cyr (make-array 2 :element-type 'double-float))
           (cyi (make-array 2 :element-type 'double-float)) (i 0) (iflag 0)
           (inu 0) (k 0) (kflag 0) (kk 0) (koded 0) (idum 0) (j 0) (ic 0)
           (inub 0) (nw 0) (aa 0.0) (ak 0.0) (ascle 0.0) (a1 0.0) (a2 0.0)
           (bb 0.0) (bk 0.0) (caz 0.0) (cbi 0.0) (cbr 0.0) (cchi 0.0)
           (cchr 0.0) (cki 0.0) (ckr 0.0) (coefi 0.0) (coefr 0.0) (crscr 0.0)
           (csclr 0.0) (cshi 0.0) (cshr 0.0) (csi 0.0) (csr 0.0) (czi 0.0)
           (czr 0.0) (dnu 0.0) (dnu2 0.0) (etest 0.0) (fc 0.0) (fhs 0.0)
           (fi 0.0) (fk 0.0) (fks 0.0) (fmui 0.0) (fmur 0.0) (fr 0.0) (g1 0.0)
           (g2 0.0) (pi$ 0.0) (pr 0.0) (pti 0.0) (ptr 0.0) (p1i 0.0) (p1r 0.0)
           (p2i 0.0) (p2m 0.0) (p2r 0.0) (qi 0.0) (qr 0.0) (rak 0.0) (rcaz 0.0)
           (rzi 0.0) (rzr 0.0) (s 0.0) (smui 0.0) (smur 0.0) (sti 0.0)
           (str 0.0) (s1i 0.0) (s1r 0.0) (s2i 0.0) (s2r 0.0) (tm 0.0) (t1 0.0)
           (t2 0.0) (elm 0.0) (celmr 0.0) (zdr 0.0) (zdi 0.0) (as 0.0)
           (alas 0.0) (helim 0.0) (abs$ 0.0f0))
      (declare (type single-float abs$)
               (type (simple-array double-float (2)) cyi cyr)
               (type (simple-array double-float (3)) cssr csrr bry)
               (type double-float helim alas as zdi zdr celmr elm t2 t1 tm s2r
                                  s2i s1r s1i str sti smur smui s rzr rzi rcaz
                                  rak qr qi p2r p2m p2i p1r p1i ptr pti pr pi$
                                  g2 g1 fr fmur fmui fks fk fi fhs fc etest
                                  dnu2 dnu czr czi csr csi cshr cshi csclr
                                  crscr coefr coefi ckr cki cchr cchi cbr cbi
                                  caz bk bb a2 a1 ascle ak aa)
               (type f2cl-lib:integer4 nw inub ic j idum koded kk kflag k inu
                                       iflag i))
      (setf caz (zabs zr zi))
      (setf csclr (/ 1.0 tol))
      (setf crscr tol)
      (f2cl-lib:fset (f2cl-lib:fref cssr (1) ((1 3))) csclr)
      (f2cl-lib:fset (f2cl-lib:fref cssr (2) ((1 3))) 1.0)
      (f2cl-lib:fset (f2cl-lib:fref cssr (3) ((1 3))) crscr)
      (f2cl-lib:fset (f2cl-lib:fref csrr (1) ((1 3))) crscr)
      (f2cl-lib:fset (f2cl-lib:fref csrr (2) ((1 3))) 1.0)
      (f2cl-lib:fset (f2cl-lib:fref csrr (3) ((1 3))) csclr)
      (f2cl-lib:fset (f2cl-lib:fref bry (1) ((1 3)))
                     (/ (* 1000.0 (f2cl-lib:d1mach 1)) tol))
      (f2cl-lib:fset (f2cl-lib:fref bry (2) ((1 3)))
                     (/ 1.0 (f2cl-lib:fref bry (1) ((1 3)))))
      (f2cl-lib:fset (f2cl-lib:fref bry (3) ((1 3))) (f2cl-lib:d1mach 2))
      (setf nz 0)
      (setf iflag 0)
      (setf koded kode)
      (setf rcaz (/ 1.0 caz))
      (setf str (* zr rcaz))
      (setf sti (* (- zi) rcaz))
      (setf rzr (* (+ str str) rcaz))
      (setf rzi (* (+ sti sti) rcaz))
      (setf inu (f2cl-lib:int (+ fnu 0.5)))
      (setf dnu (- fnu inu))
      (if (= (abs dnu) 0.5) (go label110))
      (setf dnu2 0.0)
      (if (> (abs dnu) tol) (setf dnu2 (* dnu dnu)))
      (if (> caz r1) (go label110))
      (setf fc 1.0)
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
          (zlog rzr rzi smur smui idum)
        (declare (ignore var-0 var-1))
        (setf smur var-2)
        (setf smui var-3)
        (setf idum var-4))
      (setf fmur (* smur dnu))
      (setf fmui (* smui dnu))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zshch fmur fmui cshr cshi cchr cchi)
        (declare (ignore var-0 var-1))
        (setf cshr var-2)
        (setf cshi var-3)
        (setf cchr var-4)
        (setf cchi var-5))
      (if (= dnu 0.0) (go label10))
      (setf fc (* dnu dpi))
      (setf fc (/ fc (sin fc)))
      (setf smur (/ cshr dnu))
      (setf smui (/ cshi dnu))
     label10
      (setf a2 (+ 1.0 dnu))
      (setf t2
              (exp
               (-
                (multiple-value-bind (ret-val var-0 var-1)
                    (dgamln a2 idum)
                  (declare (ignore var-0))
                  (setf idum var-1)
                  ret-val))))
      (setf t1 (/ 1.0 (* t2 fc)))
      (if (> (abs dnu) 0.1) (go label40))
      (setf ak 1.0)
      (setf s (f2cl-lib:fref cc (1) ((1 8))))
      (f2cl-lib:fdo (k 2 (f2cl-lib:int-add k 1))
                    ((> k 8) nil)
        (tagbody
          (setf ak (* ak dnu2))
          (setf tm (* (f2cl-lib:fref cc (k) ((1 8))) ak))
          (setf s (+ s tm))
          (if (< (abs tm) tol) (go label30))
         label20))
     label30
      (setf g1 (- s))
      (go label50)
     label40
      (setf g1 (/ (- t1 t2) (+ dnu dnu)))
     label50
      (setf g2 (* (+ t1 t2) 0.5))
      (setf fr (* fc (+ (* cchr g1) (* smur g2))))
      (setf fi (* fc (+ (* cchi g1) (* smui g2))))
      (multiple-value-bind (var-0 var-1 var-2 var-3)
          (zexp fmur fmui str sti)
        (declare (ignore var-0 var-1))
        (setf str var-2)
        (setf sti var-3))
      (setf pr (/ (* 0.5 str) t2))
      (setf pi$ (/ (* 0.5 sti) t2))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zdiv 0.5 0.0 str sti ptr pti)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf ptr var-4)
        (setf pti var-5))
      (setf qr (/ ptr t1))
      (setf qi (/ pti t1))
      (setf s1r fr)
      (setf s1i fi)
      (setf s2r pr)
      (setf s2i pi$)
      (setf ak 1.0)
      (setf a1 1.0)
      (setf ckr coner)
      (setf cki conei)
      (setf bk (- 1.0 dnu2))
      (if (or (> inu 0) (> n 1)) (go label80))
      (if (< caz tol) (go label70))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt zr zi zr zi czr czi)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf czr var-4)
        (setf czi var-5))
      (setf czr (* 0.25 czr))
      (setf czi (* 0.25 czi))
      (setf t1 (* 0.25 caz caz))
     label60
      (setf fr (/ (+ (* fr ak) pr qr) bk))
      (setf fi (/ (+ (* fi ak) pi$ qi) bk))
      (setf str (/ 1.0 (- ak dnu)))
      (setf pr (* pr str))
      (setf pi$ (* pi$ str))
      (setf str (/ 1.0 (+ ak dnu)))
      (setf qr (* qr str))
      (setf qi (* qi str))
      (setf str (- (* ckr czr) (* cki czi)))
      (setf rak (/ 1.0 ak))
      (setf cki (* (+ (* ckr czi) (* cki czr)) rak))
      (setf ckr (* str rak))
      (setf s1r (+ (- (* ckr fr) (* cki fi)) s1r))
      (setf s1i (+ (* ckr fi) (* cki fr) s1i))
      (setf a1 (* a1 t1 rak))
      (setf bk (+ bk ak ak 1.0))
      (setf ak (+ ak 1.0))
      (if (> a1 tol) (go label60))
     label70
      (f2cl-lib:fset (f2cl-lib:fref yr (1) ((1 n))) s1r)
      (f2cl-lib:fset (f2cl-lib:fref yi (1) ((1 n))) s1i)
      (if (= koded 1) (go end_label))
      (multiple-value-bind (var-0 var-1 var-2 var-3)
          (zexp zr zi str sti)
        (declare (ignore var-0 var-1))
        (setf str var-2)
        (setf sti var-3))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt s1r s1i str sti (f2cl-lib:fref yr (1) ((1 n)))
           (f2cl-lib:fref yi (1) ((1 n))))
        (declare (ignore var-0 var-1 var-2 var-3))
        (f2cl-lib:fset (f2cl-lib:fref yr (1) ((1 n))) var-4)
        (f2cl-lib:fset (f2cl-lib:fref yi (1) ((1 n))) var-5))
      (go end_label)
     label80
      (if (< caz tol) (go label100))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt zr zi zr zi czr czi)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf czr var-4)
        (setf czi var-5))
      (setf czr (* 0.25 czr))
      (setf czi (* 0.25 czi))
      (setf t1 (* 0.25 caz caz))
     label90
      (setf fr (/ (+ (* fr ak) pr qr) bk))
      (setf fi (/ (+ (* fi ak) pi$ qi) bk))
      (setf str (/ 1.0 (- ak dnu)))
      (setf pr (* pr str))
      (setf pi$ (* pi$ str))
      (setf str (/ 1.0 (+ ak dnu)))
      (setf qr (* qr str))
      (setf qi (* qi str))
      (setf str (- (* ckr czr) (* cki czi)))
      (setf rak (/ 1.0 ak))
      (setf cki (* (+ (* ckr czi) (* cki czr)) rak))
      (setf ckr (* str rak))
      (setf s1r (+ (- (* ckr fr) (* cki fi)) s1r))
      (setf s1i (+ (* ckr fi) (* cki fr) s1i))
      (setf str (- pr (* fr ak)))
      (setf sti (- pi$ (* fi ak)))
      (setf s2r (+ (- (* ckr str) (* cki sti)) s2r))
      (setf s2i (+ (* ckr sti) (* cki str) s2i))
      (setf a1 (* a1 t1 rak))
      (setf bk (+ bk ak ak 1.0))
      (setf ak (+ ak 1.0))
      (if (> a1 tol) (go label90))
     label100
      (setf kflag 2)
      (setf a1 (+ fnu 1.0))
      (setf ak (* a1 (abs smur)))
      (if (> ak alim) (setf kflag 3))
      (setf str (f2cl-lib:fref cssr (kflag) ((1 3))))
      (setf p2r (* s2r str))
      (setf p2i (* s2i str))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt p2r p2i rzr rzi s2r s2i)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf s2r var-4)
        (setf s2i var-5))
      (setf s1r (* s1r str))
      (setf s1i (* s1i str))
      (if (= koded 1) (go label210))
      (multiple-value-bind (var-0 var-1 var-2 var-3)
          (zexp zr zi fr fi)
        (declare (ignore var-0 var-1))
        (setf fr var-2)
        (setf fi var-3))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt s1r s1i fr fi s1r s1i)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf s1r var-4)
        (setf s1i var-5))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt s2r s2i fr fi s2r s2i)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf s2r var-4)
        (setf s2i var-5))
      (go label210)
     label110
      (multiple-value-bind (var-0 var-1 var-2 var-3)
          (zsqrt zr zi str sti)
        (declare (ignore var-0 var-1))
        (setf str var-2)
        (setf sti var-3))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zdiv rthpi czeroi str sti coefr coefi)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf coefr var-4)
        (setf coefi var-5))
      (setf kflag 2)
      (if (= koded 2) (go label120))
      (if (> zr alim) (go label290))
      (setf str (* (exp (- zr)) (f2cl-lib:fref cssr (kflag) ((1 3)))))
      (setf sti (* (- str) (sin zi)))
      (setf str (* str (cos zi)))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt coefr coefi str sti coefr coefi)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf coefr var-4)
        (setf coefi var-5))
     label120
      (if (= (abs dnu) 0.5) (go label300))
      (setf ak (cos (* dpi dnu)))
      (setf ak (coerce (abs ak) 'double-float))
      (if (= ak czeror) (go label300))
      (setf fhs (coerce (abs (- 0.25 dnu2)) 'double-float))
      (if (= fhs czeror) (go label300))
      (setf t1
              (coerce
               (the f2cl-lib:integer4
                    (f2cl-lib:int-sub (f2cl-lib:i1mach 14) 1))
               'double-float))
      (setf t1 (* t1 (f2cl-lib:d1mach 5) 3.321928094))
      (setf t1 (max t1 12.0))
      (setf t1 (min t1 60.0))
      (setf t2 (- (* tth t1) 6.0))
      (if (/= zr 0.0) (go label130))
      (setf t1 hpi)
      (go label140)
     label130
      (setf t1 (f2cl-lib:datan (/ zi zr)))
      (setf t1 (coerce (abs t1) 'double-float))
     label140
      (if (> t2 caz) (go label170))
      (setf etest (/ ak (* dpi caz tol)))
      (setf fk coner)
      (if (< etest coner) (go label180))
      (setf fks ctwor)
      (setf ckr (+ caz caz ctwor))
      (setf p1r czeror)
      (setf p2r coner)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i kmax) nil)
        (tagbody
          (setf ak (/ fhs fks))
          (setf cbr (/ ckr (+ fk coner)))
          (setf ptr p2r)
          (setf p2r (- (* cbr p2r) (* p1r ak)))
          (setf p1r ptr)
          (setf ckr (+ ckr ctwor))
          (setf fks (+ fks fk fk ctwor))
          (setf fhs (+ fhs fk fk))
          (setf fk (+ fk coner))
          (setf str (* (abs p2r) fk))
          (if (< etest str) (go label160))
         label150))
      (go label310)
     label160
      (setf fk (+ fk (* spi t1 (f2cl-lib:fsqrt (/ t2 caz)))))
      (setf fhs (coerce (abs (- 0.25 dnu2)) 'double-float))
      (go label180)
     label170
      (setf a2 (f2cl-lib:fsqrt caz))
      (setf ak (/ (* fpi ak) (* tol (f2cl-lib:fsqrt a2))))
      (setf aa (/ (* 3.0 t1) (+ 1.0 caz)))
      (setf bb (/ (* 14.7 t1) (+ 28.0 caz)))
      (setf ak
              (/
               (+ (f2cl-lib:flog ak)
                  (/ (* caz (cos aa)) (+ 1.0 (* 0.008 caz))))
               (cos bb)))
      (setf fk (+ (/ (* 0.12125 ak ak) caz) 1.5))
     label180
      (setf k (f2cl-lib:int fk))
      (setf fk (coerce (the f2cl-lib:integer4 k) 'double-float))
      (setf fks (* fk fk))
      (setf p1r czeror)
      (setf p1i czeroi)
      (setf p2r tol)
      (setf p2i czeroi)
      (setf csr p2r)
      (setf csi p2i)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i k) nil)
        (tagbody
          (setf a1 (- fks fk))
          (setf ak (/ (+ fks fk) (+ a1 fhs)))
          (setf rak (/ 2.0 (+ fk coner)))
          (setf cbr (* (+ fk zr) rak))
          (setf cbi (* zi rak))
          (setf ptr p2r)
          (setf pti p2i)
          (setf p2r (* (- (* ptr cbr) (* pti cbi) p1r) ak))
          (setf p2i (* (- (+ (* pti cbr) (* ptr cbi)) p1i) ak))
          (setf p1r ptr)
          (setf p1i pti)
          (setf csr (+ csr p2r))
          (setf csi (+ csi p2i))
          (setf fks (+ (- a1 fk) coner))
          (setf fk (- fk coner))
         label190))
      (setf tm (zabs csr csi))
      (setf ptr (/ 1.0 tm))
      (setf s1r (* p2r ptr))
      (setf s1i (* p2i ptr))
      (setf csr (* csr ptr))
      (setf csi (* (- csi) ptr))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt coefr coefi s1r s1i str sti)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf str var-4)
        (setf sti var-5))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt str sti csr csi s1r s1i)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf s1r var-4)
        (setf s1i var-5))
      (if (or (> inu 0) (> n 1)) (go label200))
      (setf zdr zr)
      (setf zdi zi)
      (if (= iflag 1) (go label270))
      (go label240)
     label200
      (setf tm (zabs p2r p2i))
      (setf ptr (/ 1.0 tm))
      (setf p1r (* p1r ptr))
      (setf p1i (* p1i ptr))
      (setf p2r (* p2r ptr))
      (setf p2i (* (- p2i) ptr))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt p1r p1i p2r p2i ptr pti)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf ptr var-4)
        (setf pti var-5))
      (setf str (- (+ dnu 0.5) ptr))
      (setf sti (- pti))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zdiv str sti zr zi str sti)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf str var-4)
        (setf sti var-5))
      (setf str (+ str 1.0))
      (multiple-value-bind (var-0 var-1 var-2 var-3 var-4 var-5)
          (zmlt str sti s1r s1i s2r s2i)
        (declare (ignore var-0 var-1 var-2 var-3))
        (setf s2r var-4)
        (setf s2i var-5))
     label210
      (setf str (+ dnu 1.0))
      (setf ckr (* str rzr))
      (setf cki (* str rzi))
      (if (= n 1) (setf inu (f2cl-lib:int-sub inu 1)))
      (if (> inu 0) (go label220))
      (if (> n 1) (go label215))
      (setf s1r s2r)
      (setf s1i s2i)
     label215
      (setf zdr zr)
      (setf zdi zi)
      (if (= iflag 1) (go label270))
      (go label240)
     label220
      (setf inub 1)
      (if (= iflag 1) (go label261))
     label225
      (setf p1r (f2cl-lib:fref csrr (kflag) ((1 3))))
      (setf ascle (f2cl-lib:fref bry (kflag) ((1 3))))
      (f2cl-lib:fdo (i inub (f2cl-lib:int-add i 1))
                    ((> i inu) nil)
        (tagbody
          (setf str s2r)
          (setf sti s2i)
          (setf s2r (+ (- (* ckr str) (* cki sti)) s1r))
          (setf s2i (+ (* ckr sti) (* cki str) s1i))
          (setf s1r str)
          (setf s1i sti)
          (setf ckr (+ ckr rzr))
          (setf cki (+ cki rzi))
          (if (>= kflag 3) (go label230))
          (setf p2r (* s2r p1r))
          (setf p2i (* s2i p1r))
          (setf str (coerce (abs p2r) 'double-float))
          (setf sti (coerce (abs p2i) 'double-float))
          (setf p2m (max str sti))
          (if (<= p2m ascle) (go label230))
          (setf kflag (f2cl-lib:int-add kflag 1))
          (setf ascle (f2cl-lib:fref bry (kflag) ((1 3))))
          (setf s1r (* s1r p1r))
          (setf s1i (* s1i p1r))
          (setf s2r p2r)
          (setf s2i p2i)
          (setf str (f2cl-lib:fref cssr (kflag) ((1 3))))
          (setf s1r (* s1r str))
          (setf s1i (* s1i str))
          (setf s2r (* s2r str))
          (setf s2i (* s2i str))
          (setf p1r (f2cl-lib:fref csrr (kflag) ((1 3))))
         label230))
      (if (/= n 1) (go label240))
      (setf s1r s2r)
      (setf s1i s2i)
     label240
      (setf str (f2cl-lib:fref csrr (kflag) ((1 3))))
      (f2cl-lib:fset (f2cl-lib:fref yr (1) ((1 n))) (* s1r str))
      (f2cl-lib:fset (f2cl-lib:fref yi (1) ((1 n))) (* s1i str))
      (if (= n 1) (go end_label))
      (f2cl-lib:fset (f2cl-lib:fref yr (2) ((1 n))) (* s2r str))
      (f2cl-lib:fset (f2cl-lib:fref yi (2) ((1 n))) (* s2i str))
      (if (= n 2) (go end_label))
      (setf kk 2)
     label250
      (setf kk (f2cl-lib:int-add kk 1))
      (if (> kk n) (go end_label))
      (setf p1r (f2cl-lib:fref csrr (kflag) ((1 3))))
      (setf ascle (f2cl-lib:fref bry (kflag) ((1 3))))
      (f2cl-lib:fdo (i kk (f2cl-lib:int-add i 1))
                    ((> i n) nil)
        (tagbody
          (setf p2r s2r)
          (setf p2i s2i)
          (setf s2r (+ (- (* ckr p2r) (* cki p2i)) s1r))
          (setf s2i (+ (* cki p2r) (* ckr p2i) s1i))
          (setf s1r p2r)
          (setf s1i p2i)
          (setf ckr (+ ckr rzr))
          (setf cki (+ cki rzi))
          (setf p2r (* s2r p1r))
          (setf p2i (* s2i p1r))
          (f2cl-lib:fset (f2cl-lib:fref yr (i) ((1 n))) p2r)
          (f2cl-lib:fset (f2cl-lib:fref yi (i) ((1 n))) p2i)
          (if (>= kflag 3) (go label260))
          (setf str (coerce (abs p2r) 'double-float))
          (setf sti (coerce (abs p2i) 'double-float))
          (setf p2m (max str sti))
          (if (<= p2m ascle) (go label260))
          (setf kflag (f2cl-lib:int-add kflag 1))
          (setf ascle (f2cl-lib:fref bry (kflag) ((1 3))))
          (setf s1r (* s1r p1r))
          (setf s1i (* s1i p1r))
          (setf s2r p2r)
          (setf s2i p2i)
          (setf str (f2cl-lib:fref cssr (kflag) ((1 3))))
          (setf s1r (* s1r str))
          (setf s1i (* s1i str))
          (setf s2r (* s2r str))
          (setf s2i (* s2i str))
          (setf p1r (f2cl-lib:fref csrr (kflag) ((1 3))))
         label260))
      (go end_label)
     label261
      (setf helim (* 0.5 elim))
      (setf elm (exp (- elim)))
      (setf celmr elm)
      (setf ascle (f2cl-lib:fref bry (1) ((1 3))))
      (setf zdr zr)
      (setf zdi zi)
      (setf ic -1)
      (setf j 2)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i inu) nil)
        (tagbody
          (setf str s2r)
          (setf sti s2i)
          (setf s2r (+ (- (* str ckr) (* sti cki)) s1r))
          (setf s2i (+ (* sti ckr) (* str cki) s1i))
          (setf s1r str)
          (setf s1i sti)
          (setf ckr (+ ckr rzr))
          (setf cki (+ cki rzi))
          (setf as (zabs s2r s2i))
          (setf alas (f2cl-lib:flog as))
          (setf p2r (- alas zdr))
          (if (< p2r (- elim)) (go label263))
          (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
              (zlog s2r s2i str sti idum)
            (declare (ignore var-0 var-1))
            (setf str var-2)
            (setf sti var-3)
            (setf idum var-4))
          (setf p2r (- str zdr))
          (setf p2i (- sti zdi))
          (setf p2m (/ (exp p2r) tol))
          (setf p1r (* p2m (cos p2i)))
          (setf p1i (* p2m (sin p2i)))
          (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
              (zuchk p1r p1i nw ascle tol)
            (declare (ignore var-0 var-1 var-3 var-4))
            (setf nw var-2))
          (if (/= nw 0) (go label263))
          (setf j (f2cl-lib:int-sub 3 j))
          (f2cl-lib:fset (f2cl-lib:fref cyr (j) ((1 2))) p1r)
          (f2cl-lib:fset (f2cl-lib:fref cyi (j) ((1 2))) p1i)
          (if (= ic (f2cl-lib:int-sub i 1)) (go label264))
          (setf ic i)
          (go label262)
         label263
          (if (< alas helim) (go label262))
          (setf zdr (- zdr elim))
          (setf s1r (* s1r celmr))
          (setf s1i (* s1i celmr))
          (setf s2r (* s2r celmr))
          (setf s2i (* s2i celmr))
         label262))
      (if (/= n 1) (go label270))
      (setf s1r s2r)
      (setf s1i s2i)
      (go label270)
     label264
      (setf kflag 1)
      (setf inub (f2cl-lib:int-add i 1))
      (setf s2r (f2cl-lib:fref cyr (j) ((1 2))))
      (setf s2i (f2cl-lib:fref cyi (j) ((1 2))))
      (setf j (f2cl-lib:int-sub 3 j))
      (setf s1r (f2cl-lib:fref cyr (j) ((1 2))))
      (setf s1i (f2cl-lib:fref cyi (j) ((1 2))))
      (if (<= inub inu) (go label225))
      (if (/= n 1) (go label240))
      (setf s1r s2r)
      (setf s1i s2i)
      (go label240)
     label270
      (f2cl-lib:fset (f2cl-lib:fref yr (1) ((1 n))) s1r)
      (f2cl-lib:fset (f2cl-lib:fref yi (1) ((1 n))) s1i)
      (if (= n 1) (go label280))
      (f2cl-lib:fset (f2cl-lib:fref yr (2) ((1 n))) s2r)
      (f2cl-lib:fset (f2cl-lib:fref yi (2) ((1 n))) s2i)
     label280
      (setf ascle (f2cl-lib:fref bry (1) ((1 3))))
      (multiple-value-bind
            (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9 var-10
             var-11)
          (zkscl zdr zdi fnu n yr yi nz rzr rzi ascle tol elim)
        (declare (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-7 var-8 var-9
                         var-10 var-11))
        (setf nz var-6))
      (setf inu (f2cl-lib:int-sub n nz))
      (if (<= inu 0) (go end_label))
      (setf kk (f2cl-lib:int-add nz 1))
      (setf s1r (f2cl-lib:fref yr (kk) ((1 n))))
      (setf s1i (f2cl-lib:fref yi (kk) ((1 n))))
      (f2cl-lib:fset (f2cl-lib:fref yr (kk) ((1 n)))
                     (* s1r (f2cl-lib:fref csrr (1) ((1 3)))))
      (f2cl-lib:fset (f2cl-lib:fref yi (kk) ((1 n)))
                     (* s1i (f2cl-lib:fref csrr (1) ((1 3)))))
      (if (= inu 1) (go end_label))
      (setf kk (f2cl-lib:int-add nz 2))
      (setf s2r (f2cl-lib:fref yr (kk) ((1 n))))
      (setf s2i (f2cl-lib:fref yi (kk) ((1 n))))
      (f2cl-lib:fset (f2cl-lib:fref yr (kk) ((1 n)))
                     (* s2r (f2cl-lib:fref csrr (1) ((1 3)))))
      (f2cl-lib:fset (f2cl-lib:fref yi (kk) ((1 n)))
                     (* s2i (f2cl-lib:fref csrr (1) ((1 3)))))
      (if (= inu 2) (go end_label))
      (setf t2 (+ fnu (f2cl-lib:int-sub kk 1)))
      (setf ckr (* t2 rzr))
      (setf cki (* t2 rzi))
      (setf kflag 1)
      (go label250)
     label290
      (setf koded 2)
      (setf iflag 1)
      (setf kflag 2)
      (go label120)
     label300
      (setf s1r coefr)
      (setf s1i coefi)
      (setf s2r coefr)
      (setf s2i coefi)
      (go label210)
     label310
      (setf nz -2)
      (go end_label)
     end_label
      (return (values nil nil nil nil nil nil nil nz nil nil nil)))))


;================================================
;   TROD.LSP --- Taper Rod
;   Functions :
;      tr : tapered rod
;      tu : tapered U shape
;      tm : tapered M shape
;      2tl : 2 tapered lines
;      pr : parallel rod
;      pu : parallel U shape
;      pm : parallel M shape
;      2pl : 2 parallel lines
;      2rc : 2 rounded corner,
;            (2rc ip p2 radius) 89/11/23 added
;--- add 89/11/23, used in LRING.LSP
;      vline : vertical line,
;              (vline ip p2 rad) or (vline ip angle rad)
;      rfillet : rod fillet, (rfillet ip p2 rad)
;      prf : parallel rod with fillets, (prf ip p2 rad rf)
;      c:prf() : interactive command to call prf().
;--- add 91/01/13, tr_f, c:tr_f : taper rod with fillets
;       (tr_f ip p0 r1 r2 rf)
;
;   Programmer : Tien-Tung Chung,  Jan. 10, 1997
;================================================
;(defun c:ld( / ) (load "trod"))
;(defun c:ee( / ) (command "pe2" "trod.lsp"))
(defun c:da (/)
 (command "erase" "c" "-10000,-10000" "10000,10000" "")
)
;================================================
(defun tr (ip p0 r1 r2 / ) (tr0 ip p0 r1 r2 t t t)(princ))
(defun tu (ip p0 r1 r2 / ) (tr0 ip p0 r1 r2 t t nil)(princ))
(defun tm (ip p0 r1 r2 / ) (tr0 ip p0 r1 r2 nil t t)(princ))
(defun 2tl (ip p0 r1 r2 / ) (tr0 ip p0 r1 r2 nil t nil)(princ))
(defun pr (ip p0 r / ) (tr0 ip p0 r r t t t)(princ))
(defun pu (ip p0 r / ) (tr0 ip p0 r r t t nil)(princ))
(defun pm (ip p0 r / ) (tr0 ip p0 r r nil t t)(princ))
(defun 2pl (ip p0 r / ) (tr0 ip p0 r r nil t nil)(princ))
;================================================
(defun c:trod ( / ) (c:tr) (princ))
(defun c:tr_f ( / ip p0 r1 r2 rf)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r1 (getdist ip "\nInput first radius <exit>: "))
           (setq r2 (getdist p0 "\nInput second radius <exit>: "))
           (setq rf (getdist p0 "\nInput fillet radius <exit>: "))
      )
      (progn (tr_f ip p0 r1 r2 rf) )
  )
  (redraw)  (princ)
)
;================================================
(defun c:tr ( / ip p0 r1 r2)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r1 (getdist ip "\nInput first radius <exit>: "))
           (setq r2 (getdist p0 "\nInput second radius <exit>: "))
      )
      (progn (tr0 ip p0 r1 r2 t t t) )
  )
  (redraw)  (princ)
)
;================================================
;--- parallel U shape
(defun c:pu ( / ip p0 r)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r (getdist ip "\nInput radius <exit>: "))
      )
      (progn (pu ip p0 r) )
  )
  (redraw)  (princ)
)
;================================================
;--- parallel M shape
(defun c:pm ( / ip p0 r)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r (getdist ip "\nInput radius <exit>: "))
      )
      (progn (pm ip p0 r) )
  )
  (redraw)  (princ)
)
;================================================
;--- 2 parallel lines
(defun c:2pl ( / ip p0 r)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r (getdist ip "\nInput radius <exit>: "))
      )
      (progn (2pl ip p0 r) )
  )
  (redraw)  (princ)
)
;================================================
;=== parallel rod
(defun c:pr ( / ip p0 r)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r (getdist ip "\nInput radius <exit>: "))
      )
      (progn (pr ip p0 r) )
  )
  (redraw)  (princ)
)
;================================================
;--- 2 Taper Lines
(defun c:2tl ( / ip p0 r1 r2)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r1 (getdist ip "\nInput first radius <exit>: "))
           (setq r2 (getdist p0 "\nInput second radius <exit>: "))
      )
      (progn (2tl ip p0 r1 r2) )
  )
  (redraw)  (princ)
)
;================================================
(defun c:tm ( / ip p0 r1 r2)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r1 (getdist ip "\nInput first radius <exit>: "))
           (setq r2 (getdist p0 "\nInput second radius <exit>: "))
      )
      (progn (tm ip p0 r1 r2) )
  )
  (redraw)  (princ)
)
;================================================
(defun c:tu ( / ip p0 r1 r2)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput insertion point <exit>: "))
           (setq p0 (getpoint ip "\nInput the end point <exit>: "))
           (setq r1 (getdist ip "\nInput first radius <exit>: "))
           (setq r2 (getdist p0 "\nInput second radius <exit>: "))
      )
      (progn (tu ip p0 r1 r2) )
  )
  (redraw)  (princ)
)
;================================================
(defun tr0 (ip p0 r1 r2 f1 f2 f3 / p1 p2 p3 p4 th1 th2 th3)
  (setq
        th1 (angle ip p0)
        th2 (+ th1 (/ pi 2.0))
        th3 (- th2 pi)
        p1 (polar ip th2 r1)
        p2 (polar ip th3 r1)
        p3 (polar p0 th2 r2)
        p4 (polar p0 th3 r2)
  )
  (if (and (not (equal r1 0.0 0.0001)) f1)
      (progn
        (command "line" p1 p2 "")
      )
  )
  (if (and (not (equal len 0.0 0.0001)) f2)
      (progn
        (command "line" p1 p3 "")
        (command "line" p2 p4 "")
      )
  )
  (if (and (not (equal r2 0.0 0.0001)) f3)
      (progn
        (command "line" p3 p4 "")
      )
  )
  (princ)
)
;================================================
(defun 2rc (ip p2 r / p3 p4 p5 p6 rf ang th1 th2)
  (setq rf (distance ip p2)
        ang (angle ip p2)
        th1 (+ ang (/ pi 2.0))
        th2 (- ang (/ pi 2.0))
        p3 (polar ip th1 (+ r rf))
        p6 (polar ip th2 (+ r rf))
        p4 (polar p2 th1 r)
        p5 (polar p2 th2 r)
  )
  (command "arc" p3 "E" p4 "R" rf)
  (command "arc" p5 "E" p6 "R" rf)
  (princ)
);end-2rc()
;================================================
;--- ang can be an angle or a point
(defun vline (ip ang r / th1 th2 p1 p2)
  (if (listp ang)(setq ang (angle ip ang)))
  (setq th1 (+ ang (/ pi 2.0))
        th2 (- ang (/ pi 2.0))
        p1 (polar ip th1 r)
        p2 (polar ip th2 r)
  )
  (command "line" p1 p2 "")
  (princ)
)
;================================================
;--- rod fillet
(defun rfillet (ip p2 r / rf ang r2 th1 th2 p3 p4 p5 p6 )
  (setq ang (angle ip p2)
        rf (distance ip p2)
        th1 (+ ang (/ pi 2.0))
        th2 (- ang (/ pi 2.0))
        p3 (polar ip th1 (- r rf))
        p5 (polar ip th2 (- r rf))
        p4 (polar p2 th1 r)
        p6 (polar p2 th2 r)
  )
  (command "arc" p4 "E" p3 "R" rf)
  (command "arc" p5 "E" p6 "R" rf)
  (princ)
);end-rfillet()
;================================================
(defun prf (ip pe r rf /  ang len p2 p3 )
  (setq ang (angle ip pe)
        len (distance ip pe)
        p2 (polar ip ang rf)
        p3 (polar ip ang (- len rf))
  )
  (vline ip p2 (- r rf))
  (rfillet ip p2 r)
  (2pl p2 p3 r)
  (rfillet pe p3 r)
  (vline pe ang (- r rf))
  (redraw)(princ)
);end-prf()
;================================================
(defun c:prf (/ ip pe r rf)
  (graphscr)
  (if (and (setq ip (getpoint "\nInput the insertion point <exit>: "))
           (setq pe (getpoint ip "\nInput the end point <exit>: "))
           (setq r (getdist ip "\nInput the rod radius <exit>: "))
           (setq rf (getdist ip "\nInput the fillet radius <exit>: "))
      )
      (princ
        (prf ip pe r rf)
      )
  );end-if
  (princ)
);end-c:prf()
;================================================
; Taper Rod with Fillets
(defun tr_f (ip p0 r1 r2 rf / p1 p2 p3 p4 th1 th2 th3 e1 e2 e3 e4)
  (setq th1 (angle ip p0)
        th2 (+ th1 (/ pi 2.0))
        th3 (- th2 pi)
        p1 (polar ip th2 r1)
        p2 (polar ip th3 r1)
        p3 (polar p0 th2 r2)
        p4 (polar p0 th3 r2)
  )
        (command "line" p1 p2 "")(setq e1 (entlast))
        (command "line" p1 p3 "")(setq e2 (entlast))
        (command "line" p2 p4 "")(setq e3 (entlast))
        (command "line" p3 p4 "")(setq e4 (entlast))
        (command "fillet" "R" rf)
        (command "fillet" e1 e2)
        (command "fillet" e1 e3)
        (command "fillet" e4 e2)
        (command "fillet" e4 e3)

  (princ)
)
;================================================
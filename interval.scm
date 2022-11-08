;Constructor & Selector
(define (make-interval lower upper) (cons lower upper))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
(define (make-center-percent c p)
  (make-interval (+ c (* c p)) (- c (* c p))))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))

;Add
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))
;Sub
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				(- (upper-bound x) (lower-bound y))))
;Mul
; patt |  min  |  max 
; ++++ | al bl | ah bh 
; ++-+ | ah bl | ah bh 
; ++-- | ah bl | al bh 
; -+++ | al bh | ah bh 
; -+-+ | trouble case 
; -+-- | ah bl | al bl 
; --++ | al bh | ah bl 
; ---+ | al bh | al bl 
; ---- | ah bh | al bl 
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y))) 
		(p3 (* (upper-bound x) (lower-bound y))) 
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))
;Div
(define (div-interval x y)
  (if (>= 0 (* (lower-bound y) (upper-bound y)))
	(error "Division error (interval spans 0)" y) 
	(mul-interval
	  x 
	  (make-interval (/ 1.0 (upper-bound y))
					 (/ 1.0 (lower-bound y))))))

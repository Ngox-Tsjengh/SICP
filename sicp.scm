(define small 0.00001)
(define nil '())

(define square (lambda (x) (* x x)))
(define cube (lambda (x) (* x x x)))
(define average (lambda (x y) (/ (+ x y) 2)))


(define tolerance small)
(define (fixed-point func first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2))
			tolerance)
	)
	(define (try guess)
		(let ( (next (func guess) ))
			(if (close-enough? guess next)
				next
				(try next)
			)
		)
	)
	(try first-guess)
)

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;;;;;;;;;; Excercise 2.5 ;;;;;;;;;;
(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (car a) (divide-remainder a 2))
(define (cdr a) (divide-remainder a 3))

(define (divide-remainder num base)
  (define (dev-rem n b count)
    (let ((rem (/ n b)))
    (if (integer? rem)  ;base = 1, not considered
      (dev-rem rem b (+ 1 count))
      count
    )))
  (dev-rem num base 0)
)

;;;;;;;;;; Excercise 2.6 ;;;;;;;;;;

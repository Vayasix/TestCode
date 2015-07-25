(define (product term a next b)
  (if (> a b)
	1
	(* (term a) (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (identity n) n)
(define (inc x) (+ x 1))

(define (pi-term n)
  (if (even? n)
	(/ (+ n 2) (+ n 1))
	(/ (+ n 1) (+ n 2))))

(display (exact->inexact (* (product pi-term 1 inc 6) 4)))
(newline)
(display (exact->inexact (* (product pi-term 1 inc 100) 4)))


(define (product term a next b)
  (define (iter a res)
	(if (> a b)
	  res
	  (iter (next a) (* (term a) res))))
  (iter a 1))




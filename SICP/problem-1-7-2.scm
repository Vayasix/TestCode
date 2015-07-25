
(define (sqrt-iter2 guess pre-guess x)
  (if (good-enough? guess pre-guess)
	guess
	(sqrt-iter2 (improve guess x) guess x)))

(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess)) guess) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x  y) 2))

(define (sqrt x)
  (sqrt-iter2 1.0 100.0 x))

#?=(sqrt 2)
#?=(sqrt 0.000002)
#?=(sqrt 200000000000000000000)

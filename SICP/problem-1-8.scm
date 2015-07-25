(define (cbrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
	guess
	(cbrt-iter (improve guess x) guess x)))

(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess)) guess) 0.0001))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* guess 2))
	 3))

(define (cbrt x)
  (cbrt-iter 1.0 100.0 x))

#?=(cbrt 8)
#?=(cbrt 27)
#?=(cbrt 0.000002)
#?=(cbrt 200000000000000000000)

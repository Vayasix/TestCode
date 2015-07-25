(define (iterative-improve close-enough? improve)
  (lambda (guess)
	(define (iter guess)
	  (if (close-enough? guess)
		guess
		(iter (improve guess))))
	(iter guess)))

(define (sqrt first-guess x)
  (define (close-enough? guess)
	(< (abs (- (* guess guess) x)) 0.00001))
  (define (improve guess)
	(/ (+ guess (/ x guess)) 2))
  ((iterative-improve close-enough? improve) first-guess))

(define (fixed-point f first-guess)
  (define (close-enough? guess)
	(< (abs (- guess (f guess))) 0.00001))
  (define (improve guess)
	(f guess))
  ((iterative-improve close-enough? improve) first-guess))


#?= (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.6)
#?= (fixed-point cos 1.0)
#?= (fixed-point sin 1.0)
#?= (fixed-point (lambda (x) (/ 1 x)) 0.4)

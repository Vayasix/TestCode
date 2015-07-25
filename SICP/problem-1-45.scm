(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

(define (repeated f n)
  (if (< n 1)
	(lambda (x) x)
	(compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)


(define (n-th-sqrt x n c)
  (fixed-point ((repeated average-damp c) 
				(lambda (y) (/ x (expt y (- n 1))))) 1.0))

#?=(n-th-sqrt (expt 3 3) 3 1)

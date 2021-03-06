(define dx 0.00001)

(define (deriv g)
  (lambda (x)
	(/ (- (g (+ x dx)) (g x)) dx)))

(define (cube x) (* x x x))



(define (newton g)
  (lambda (x)
	(- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton g) guess))


(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

(define tolerance 0.00001)
(define (square x) (* x x))

(display (sqrt 9))
  

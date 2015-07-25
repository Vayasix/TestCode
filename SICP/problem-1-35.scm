(define tolerance 0.0000001)
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
	(display guess)
	(newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))


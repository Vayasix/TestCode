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

(define (x-to-x1 y)
  (fixed-point (lambda (x) (/ (log y) (log x))) 10.0))
(define (x-to-x2 y)
  (fixed-point (lambda (x) (average x (/ (log y) (log x)))) 10.0))

(define (average x y) (/ (+ x y) 2))

(display (x-to-x1 1000))
(newline)
(display (x-to-x2 1000))


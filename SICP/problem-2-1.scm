(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
	(cons (/ n g) (/ d g)))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))

(define (mal-rat x y)
  (make-rat (* (numer x) (denom y))
			(* (denom x) (denom y))))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat one-half)
(print-rat one-third)
(print-rat (add-rat one-half one-third))
(print-rat (mal-rat one-half one-third))
(print-rat (add-rat one-third one-third))


(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(define (accumulate-n op initial sequence)
  (if (null? (car sequence))
	nil
	(cons (accumulate op initial
					  (map (lambda (x)
							 (car x))
						   sequence))
		  (accumulate-n op initial
						(map (lambda (x)
							   (cdr x))
							 sequence)))))


;(define m ((1 2 3 4) (4 5 6 7) (6 7 8 9)))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))


(define (matrix-*-vector m v)
  (map (lambda (row)
		 (dot-product row v))
	   m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
	(map (lambda (x)
		   (matrix-*-vector cols x))
		 m)))

(define ml '((1 2 3 4) (2 3 4 5) (3 4 5 6)))

(define nl '((7 8 9) (8 9 0) (9 0 1) (0 1 2)))

(display (matrix-*-matrix ml nl))

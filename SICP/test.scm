(define (unique-trio n)
  (flatmap (lambda (i)
			 (flatmap (lambda (j)
						(map (lambda (k)
							   (list i j k))
							 (enumerate-interval (+ j 1) n)))
					  (enumerate-interval (+ i 1) n)))
		   (enumerate-interval 1 n)))
;３つの組の合計をする
(define (sum-of-trio trio)
  (+ (car trio) (cadr trio) (caddr trio)))

;nとsが等しい組を返す
(define (equal-sum-of-trio n s)
  (filter (lambda (x) (= (sum-of-trio x) s)) (unique-trio n)))

(define (filter predicate seq)
  (cond ((null? seq) nil)
		((predicate (car seq))
		 (cons (car seq)
			   (filter predicate (cdr seq))))
		(else (filter predicate (cdr seq)))))

;sub method

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op initial seq)
  (if (null? seq)
	initial
	(op (car seq)
		(accumulate op initial (cdr seq)))))
(define nil ())
(define (enumerate-interval low high)
  (if (> low high)
	nil
	(cons low (enumerate-interval (+ low 1) high))))

(display (unique-trio 6))
(newline)
(display (equal-sum-of-trio 6 6))
(newline)
(display (equal-sum-of-trio 6 8))
(newline)
(display (equal-sum-of-trio 6 12))
(newline)
(display (equal-sum-of-trio 6 15))
(newline)
(display (equal-sum-of-trio 6 16))



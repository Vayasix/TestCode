(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(define (map proc sequence)
  (accumulate (lambda (first already-accumulated)
				(cons (proc first) already-accumulated))
			  nil
			  sequence))

;test
(define x (list 1 2 3 4 5))
(define (square x) (* x x))
(display (map square x))

(newline)


(define (append list1 list2)
  (accumulate cons list2 list1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

;test
(display (length x))

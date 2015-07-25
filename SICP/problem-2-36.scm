
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


(display 
  (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))


;test
(define seq-car
  (map (lambda (x)
	   (car x))
	 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))

(define seq-cdr
  (map (lambda (x)
		 (cdr x))
	 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))


(accumulate + 0 seq-car)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (count-leaves t)
  (accumulate (lambda (element count)
				(cond ((null? element) count)
					  ((not (pair? element)) (+ count 1))
					  (else
						(+ (count-leaves element) count))))
			  0
			  t))

(define x (list 1 2 3 4 5 6 7 8 9 10))

(display (count-leaves x))




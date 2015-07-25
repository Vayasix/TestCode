(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))



(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-tems) 
				#?= (+ (* x higher-tems) this-coeff))
			  0
			  coefficient-sequence))
;test
(display (horner-eval 2 (list 1 3 0 5 0 1)))


;(horner-eval 2 (list 1 3 0 5 0 1)
; (accumulate (lambda (this-coeff higher-tems)
;				(+ (* 2 higher-tems) this-coeff))
;				0
;				(list 1 3 0 5 0 1))
;
; :

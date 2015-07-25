(define (tan-cf x k)
  (cont-frac (lambda (i)
			   (if (= i 1) 
				 x 
				 (- (* x x))))
			 (lambda (i)
			   (- (* i 2) 1))
			 k))

(define (cont-frac n d k)
  (define (iter i)
	(if (= i k)
	  (/ (n i) (d i))
	  (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (iter-a-to-b f a b)
  (newline)
  (display a)
  (display " -> ")
  (if (> a b)
	(f a)
	(and (display (f a))
		 (iter-a-to-b f (+ a 1) b))))

(iter-a-to-b
  (lambda (k) (tan-cf 1.0 k))
  1
  20)


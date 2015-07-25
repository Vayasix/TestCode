(define (e-euler k)
  (+ 2.0 (cont-frac (lambda (i) 1)
					(lambda (i)
					  (if (= (remainder i 3) 2)
						(/ (+ i 1) 1.5)
						1))
					k)))

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
	(and (display (f a)) (iter-a-to-b f (+ a 1) b))))


(iter-a-to-b
  e-euler 
  1
  20)



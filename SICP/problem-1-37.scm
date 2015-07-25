(define (cont-frac n d k)
  (define (loop result term)
	(if (= term 0)
	  result
	  (loop (/ (n term) (+ (d term) result)) (- term 1))))
  (loop 0 k))

(define (cont-frac n d k)
  (cond ((= k 0) 0)
		(else (/ (n k) (+ (d k) (cont-frac n d (- k 1)))))))

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
  (lambda (k)
	(cont-frac (lambda (i) 1.0)
			   (lambda (i) 1.0)
			   k))
  1
  20)

(define (f n)
  (if (< n 3) n
	(+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

(define (ff n)
  (define (iter new old old2 count)
	(if (>= count n) new
	  (iter (+ new old old2) new old (+ count 1))))
  (iter 3 2 1 3))

#?= (f 10)
#?= (ff 10)


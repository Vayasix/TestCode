(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (double f)
  (lambda (x) (f (f x))))

#?= ((double inc) 1)
#?= ((double square) 2)
#?= (((double (double double)) inc) 5)

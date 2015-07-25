(define (scale-list items factor)
  (if (null? items)
    '()
    (cons (* (car items) factor)
          (scale-list (cdr items) factor))))

(define (map proc items)
  (if (null? items)
    '()
    (cons (proc (car items))
          (map proc (cdr items)))))

(display (map abs (list -10 2.5 -11.6 17)))

(display (map (lambda (x) (* x x))
               (list 1 2 3 4)))

(display (scale-list (list 1 2 3 4 5) 10))

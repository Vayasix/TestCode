(define (last-pair items)
  (define (last-pair-iter items result)
    (if (null? items)
      result
      (last-pair-iter (cdr items) items)))
  (last-pair-iter items items))

(define list (list 1 2 3 4 5 6 7))

(display (last-pair list))

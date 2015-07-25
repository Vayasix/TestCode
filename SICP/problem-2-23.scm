(define (for-each proc items)
  (if (null? items)
    #f
    (and (proc (car items)) (for-each proc (cdr items)))))

(for-each (lambda (x) (newline) (display x))
          (list 45 75 286))



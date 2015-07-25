(define (my-reverse my-list)
  (let loop ((src my-list)
             (dst '()))
    (if (null? src)
      dst
      (loop (cdr src) (cons (car src) dst)))))

(define my-list (list 1 2 3 4 5 6 7))
(display (my-reverse my-list))

(define (reverse items)
  (define (iter items result)
    (if (null? items)
      result
      (iter (cdr items) (cons (car items) result))))
  (iter items nil))

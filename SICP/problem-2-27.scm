(define x (list (list 1 2) (list 3 4)))

(define nil '())

(define (reverse items)
  (define (rev-imp items result)
    (if (null? items)
      result
      (rev-imp (cdr items) (cons (car items) result))))
  (rev-imp items nil))

(define (reverse2 items)
  (let loop ((src items)
             (dst nil))
    (if (null? src)
      dst
      (loop (cdr src) (cons (car src) dst)))))


(define (deep-reverse items)
  (define (iter items result)
    (if (null? items)
      result
      (let ((first (car items)))
        (iter (cdr items)
              (cons (if (not (pair? first))
                             first
                             (deep-reverse first))
                    result)))))
  (iter items nil))

(define (deep-reverse2 items)
  (let loop ((src items) (dst nil))
    (cond ((null? src) dst)
          ((list? (car src))
           (loop (cdr src) (cons (deep-reverse2 (car src)) dst)))
          (else
            (loop (cdr src) (cons (car src) dst))))))


(display (reverse x))
(newline)
(display (reverse2 x))
(newline)
(display (deep-reverse x))
(newline)
(display (deep-reverse2 x))

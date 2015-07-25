(define (same-parity first . rest)
  (define (iter source dist remainder-val)
    (if (null? source)
      dist
      (iter (cdr source)
            (if (= (remainder (car source) 2) remainder-val)
              (append dist (list (car source)))
              dist)
            remainder-val)))
  (iter rest (list first) (remainder first 2)))

(display (same-parity 1 2 3 4 5 6 7 8))



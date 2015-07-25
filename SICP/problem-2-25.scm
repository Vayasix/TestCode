(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))


;(display (car y))
;(newline)
;(display (cdr y))
;(newline)
;(display (car (cdr y))) ;
;(newline)
;(display (cadr y))
;(display (cdaddr y))
;(newline)
;(display (cdr (car (cdr y))))  ;((3,4))
;(newline)
;(display (car (cdr (car (cdr y))))) ;( 3,4 )
;(newline)
;(display (cdr (car (cdr (car (cdr y)))))) ;4
;(newline)
;(display (car (cdr (car (cdr (car (cdr y)))))))

(display (car (cdr (car (cdr (cdr x))))))
(newline)
(display (car (car y)))
(newline)
(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z)))))))))))))

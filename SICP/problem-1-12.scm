(define (pascal x y)
  (cond ((= y 1) 1)
		((= x y) 1)
		(else (+ (pascal (- x 1) (- y 1))
				 (pascal (- x 1) y)))))

#?=(pascal 1 1)
#?=(pascal 2 1)
#?=(pascal 2 2)
#?=(pascal 3 1)
#?=(pascal 3 2)
#?=(pascal 3 3)
#?=(pascal 4 1)
#?=(pascal 4 2)
#?=(pascal 4 3)
#?=(pascal 4 4)



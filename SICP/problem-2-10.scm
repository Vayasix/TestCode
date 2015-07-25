(define (div-interval x y)
  (let ((y_l (lower-bound y))
		(y_u (upper-bound y)))
	(if (<= (* y_l y_u) 0)
	  (error "エラーだよー")
	  (mul-interval x 
					(make-interval (/ 1.0 y_u)
								   (/ 1.0 y_l))))))

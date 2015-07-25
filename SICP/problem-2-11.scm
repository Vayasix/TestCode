(define (mul-interval x y)
  (let ((x_l (lower-bound x))
		(x_u (upper-bound x))
		(y_l (lower-bound y))
		(y_u (upper-bound y)))
	(cond ((< 0 x_l)
		   (cond ((< 0 y_l)
				  (make-interval (* x_l y_l) (* x_u y_u)))
				 ((< y_u 0)
				  (make-interval (* x_u y_l) (* x_l y_u)))
				 (else
				   (make-interval (* x_l y_l) (* x_u y_u))))
		   ((< x_u 0)
			(cond ((< 0 y_l)
				   (make-interval (* x_l y_u) (* x_u y_u)))
				  ((< y_u 0)
				   (make-interval (* x_u y_l) (* x_l y_l)))
				  ;ここが二回以上の演算が必要な箇所。
				  ;x の区間それぞれの絶対値の大小関係と、
				  ;y の区間それぞれの絶対値の大小関係が、
				  ;上限値、下限値を算出する際に関わってくる。
				  ;が、面倒なので、総当たりで値を取得しちゃう。
				  (else
					(let ((ll (* x_l y_l))
						  (lu (* x_l y_u))
						  (ul (* x_u y_l))
						  (uu (* x_u y_u)))
					  (make-interval (min ll lu ul uu)
									 (max ll lu ul uu))))))
		   (else
			 (cond ((< 0 y_l) (make-interval (* x_l y_u) (* x_u y_l)))
				   ((< y_u 0) (make-interval (* x_u y_u) (* x_l y_l)))
				   (else
					 (make-interval (* x_l y_u) (* x_l y_l))))))))

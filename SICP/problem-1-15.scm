(define (sin angle c)
  (if (not (> (abs angle) 0.1))
	angle
	(p (sin (/ angle 3.0) #?=(+ c 1)))))
(define (p x)
  (- (* 3 x) (* 4 x x x)))

#?= (sin 12.15 0)

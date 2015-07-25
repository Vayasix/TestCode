(define (make-mobile left right) 
  (list left right))
(define (make-branch length structure) 
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define (structure-is-mobile? structure) (pair? structure))




;weight
(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (structure-is-mobile? s)
      (total-weight s)
      s)))


(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


;make-mobile
(define mobile-1 (make-mobile (make-branch 2 1)
                              (make-branch 1 2)))
(define mobile-2 (make-mobile (make-branch 3 mobile-1)
                              (make-branch 9 1)))
(define mobile-3 (make-mobile (make-branch 4 mobile-2)
                              (make-branch 8 2)))
(define mobile-4 (make-mobile (make-branch 10 1000) 
                              (make-branch 1 mobile-3))) 


;balance
(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (branch-moment left)
            (branch-moment right))
         (branch-balanced? left)
         (branch-balanced? right))))

(define (branch-moment branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (branch-balanced? branch)
  (let ((s (branch-structure branch)))
    (if (structure-is-mobile? s)
      (balanced? s)
      true)))

(define true #t)



;test


(list #?= mobile-1 #?= mobile-2 #?= mobile-3 #?= mobile-4)
(newline)
(display (total-weight mobile-1))
(newline)
(display (total-weight mobile-2))
(newline)
(display (total-weight mobile-3))
(newline)
(display (total-weight mobile-4))
(newline)


#?=(balanced? mobile-1)
#?=(balanced? mobile-2)
#?=(balanced? mobile-3)
#?=(balanced? mobile-4)

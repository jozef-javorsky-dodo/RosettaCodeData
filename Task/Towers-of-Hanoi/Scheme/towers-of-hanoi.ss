(define (towers-of-hanoi n from to spare)
  (define (print-move from to)
    (display "Move[")
    (display from)
    (display ", ")
    (display to)
    (display "]")
    (newline))
  (cond ((= n 0) "done")
        (else
         (towers-of-hanoi (- n 1) from spare to)
         (print-move from to)
         (towers-of-hanoi (- n 1) spare to from))))

(towers-of-hanoi 3 "A" "B" "C")
#lang racket
(define (feigenbaum #:max-it (max-it 13) #:max-it-j (max-it-j 10))
  (displayln " i       d" (current-error-port))
  (define-values (_a _a1 d)
    (for/fold ((a 1) (a1 0) (d 3.2))
              ((i (in-range 2 (add1 max-it))))
      (let* ((a′ (for/fold ((a (+ a (/ (- a a1) d))))
                           ((j (in-range max-it-j)))
                   (let-values (([x y] (for/fold ((x 0) (y 0))
                                                 ((k (expt 2 i)))
                                         (values (- a (* x x))
                                                 (- 1 (* 2 y x))))))
                     (- a (/ x y)))))
             (d′ (/ (- a a1) (- a′ a))))
        (eprintf "~a   ~a\n" (~a i #:width 2) (real->decimal-string d′ 8))
        (values a′ a d′))))
  d)

(module+ main
  (feigenbaum))

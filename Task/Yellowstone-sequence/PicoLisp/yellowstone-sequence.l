(load "@lib/frac.l")
(de yellow (N)
   (let (L (list 3 2 1)  I 4  C 3  D)
      (while (> N C)
         (when
            (and
               (not (idx 'D I))
               (=1 (gcd I (get L 1)))
               (> (gcd I (get L 2)) 1) )
            (push 'L I)
            (idx 'D I T)
            (setq I 4)
            (inc 'C) )
         (inc 'I) )
      (flip L) ) )
(println (yellow 30))

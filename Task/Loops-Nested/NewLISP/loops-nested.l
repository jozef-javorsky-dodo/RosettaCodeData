(let (a (array 10 10))
  (dotimes (i 10)
    (dotimes (j 10)
      (setf (a i j) (rand 21))))
  (catch
      (dotimes (i 10)
	(dotimes (j 10)
	  (print (a i j))
	  (print " ")
	  (if (= 20 (a i j))
	      (throw))))))
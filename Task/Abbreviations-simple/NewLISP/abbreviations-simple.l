(define (foo text)
  (let (command-table '()   toks
         (map upper-case (parse (trim "
            add 1  alter 3  backup 2  bottom 1  Cappend 2  change 1
            Schange  Cinsert 2  Clast 3 compress 4 copy 2 count 3
            Coverlay 3 cursor 3  delete 3 Cdelete 2  down 1
            duplicate 3 xEdit 1 expand 3 extract 3  find 1 Nfind 2
            Nfindup 6 NfUP 3 Cfind 2 findUP 3 fUP 2 forward 2  get
            help 1 hexType 4  input 1 powerInput 3  join 1 split 2
            spltJOIN load locate 1 Clocate 2 lowerCase 3 upperCase
            3 Lprefix 2  macro  merge 2 modify 3 move 2 msg  next 1
            overlay 1 parse preserve 4 purge 3 put putD query 1
            quit  read recover 3 refresh renum 3 repeat 3 replace 1
            Creplace 2 reset 3 restore 4 rgtLEFT right 2 left 2
            save  set  shift 2  si  sort  sos  stack 3 status 4 top
            transfer 3  type 1  up 1"))))
    (local (tok amin word found? result)
      (until (empty? toks)
        (setq tok (pop toks))
        (setq amin
          (or (and (true? toks) (int (first toks)) (int (pop toks)))
              99))
        (push (list tok amin) command-table   -1))
      (dolist (word (parse (trim text)))
        (setq word (upper-case word))
        (setq found? nil)
        (dolist (command-pair command-table   found?)
          (when (or (= word (command-pair 0))
                    (and (starts-with (command-pair 0) word)
                      (>= (length word) (command-pair 1))))
            (setq found? (command-pair 0))))
        (push (or found? "*error*") result  -1))
      (join result " "))))

(println (foo
"riG   rePEAT copies  put mo   rest    types   fup.    6       poweRin"
))

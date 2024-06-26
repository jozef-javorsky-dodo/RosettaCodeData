taskfmt=: {{
  c=. ":each j=.cyclotomic y
  raw=. rplc&'_-' ;:inv}.,'+';"0|.(*|j)#c('(',[,],')'"_)each '*x^',&":L:0 <"0 i.#c
  txt=. raw rplc'(1*x^0)';'1';'(-1*x^0)';'(-1)';'*x^1)';'*x)'
  LF,~'CP[',y,&":']= ',rplc&('(x)';'x';'+ (-1)';'- 1')txt rplc'(1*';'(';'(-1*';'(-'
}}

taskorder=: {{
  r=.$k=.0
  while.y>#r do.k=.k+1
    if.(1+#r) e.|cyclotomic k do.
      r=. r,k
      k=. k-1
    end.
  end.r
}}

   ;taskfmt each 1+i.30
CP[1]= x - 1
CP[2]= x + 1
CP[3]= (x^2) + x + 1
CP[4]= (x^2) + 1
CP[5]= (x^4) + (x^3) + (x^2) + x + 1
CP[6]= (x^2) + (-x) + 1
CP[7]= (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[8]= (x^4) + 1
CP[9]= (x^6) + (x^3) + 1
CP[10]= (x^4) + (-x^3) + (x^2) + (-x) + 1
CP[11]= (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[12]= (x^4) + (-x^2) + 1
CP[13]= (x^12) + (x^11) + (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[14]= (x^6) + (-x^5) + (x^4) + (-x^3) + (x^2) + (-x) + 1
CP[15]= (x^8) + (-x^7) + (x^5) + (-x^4) + (x^3) + (-x) + 1
CP[16]= (x^8) + 1
CP[17]= (x^16) + (x^15) + (x^14) + (x^13) + (x^12) + (x^11) + (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[18]= (x^6) + (-x^3) + 1
CP[19]= (x^18) + (x^17) + (x^16) + (x^15) + (x^14) + (x^13) + (x^12) + (x^11) + (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[20]= (x^8) + (-x^6) + (x^4) + (-x^2) + 1
CP[21]= (x^12) + (-x^11) + (x^9) + (-x^8) + (x^6) + (-x^4) + (x^3) + (-x) + 1
CP[22]= (x^10) + (-x^9) + (x^8) + (-x^7) + (x^6) + (-x^5) + (x^4) + (-x^3) + (x^2) + (-x) + 1
CP[23]= (x^22) + (x^21) + (x^20) + (x^19) + (x^18) + (x^17) + (x^16) + (x^15) + (x^14) + (x^13) + (x^12) + (x^11) + (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[24]= (x^8) + (-x^4) + 1
CP[25]= (x^20) + (x^15) + (x^10) + (x^5) + 1
CP[26]= (x^12) + (-x^11) + (x^10) + (-x^9) + (x^8) + (-x^7) + (x^6) + (-x^5) + (x^4) + (-x^3) + (x^2) + (-x) + 1
CP[27]= (x^18) + (x^9) + 1
CP[28]= (x^12) + (-x^10) + (x^8) + (-x^6) + (x^4) + (-x^2) + 1
CP[29]= (x^28) + (x^27) + (x^26) + (x^25) + (x^24) + (x^23) + (x^22) + (x^21) + (x^20) + (x^19) + (x^18) + (x^17) + (x^16) + (x^15) + (x^14) + (x^13) + (x^12) + (x^11) + (x^10) + (x^9) + (x^8) + (x^7) + (x^6) + (x^5) + (x^4) + (x^3) + (x^2) + x + 1
CP[30]= (x^8) + (x^7) + (-x^5) + (-x^4) + (-x^3) + x + 1

   (,.~#\) taskorder 10
 1     1
 2   105
 3   385
 4  1365
 5  1785
 6  2805
 7  3135
 8  6545
 9  6545
10 10465

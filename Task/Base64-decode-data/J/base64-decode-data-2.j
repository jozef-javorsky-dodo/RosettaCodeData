BASE64=: (a.{~ ,(a.i.'Aa') +/i.26),'0123456789+/'

frombase64=: {{
  pad=. _2 >. (y i. '=') - #y
  pad }. a. {~ #. _8 [\ , (6#2) #: BASE64 i. y
}}
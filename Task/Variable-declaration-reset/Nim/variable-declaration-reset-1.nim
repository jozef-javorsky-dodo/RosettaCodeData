let s = [1, 2, 2, 3, 4, 4, 5]
for i in 0..s.high:
  let curr = s[i]
  if i > 0 and curr == prev:
    echo i
  var prev = curr

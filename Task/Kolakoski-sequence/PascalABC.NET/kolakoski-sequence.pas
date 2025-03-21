function nextInCycle(a: array of integer; index: word) :=  a[index mod a.Length];

function kolakoski(a: array of integer; length: word): array of integer;
begin
  SetLength(result, length);
  var i := 0;
  var k := 0;

  while true do
  begin
    result[i] := nextInCycle(a, k);
    if result[k] > 1 then
      for var j := 1 to result[k] - 1 do
      begin
        i += 1;
        if i = length then exit;
        result[i] := result[i - 1];
      end;
    i += 1;
    if i = length then exit;
    k += 1;
  end;
end;

function possibleKolakoski(a: array of integer): boolean;
begin
  var rle := new List<integer>;
  var prev := a[0];
  var count := 1;
  result := true;

  for var i := 1 to a.Count - 1 do
    if a[i] = prev then
      count += 1
    else
      begin
      rle.Add(count);
      count := 1;
      prev := a[i];
    end;

  foreach var val in rle index i do
    if val <> a[i] then result := false;
end;


begin
  var Ias := |[1, 2], [2, 1], [1, 3, 1, 2], [1, 3, 2, 1]|;
  var Lengths := [20, 20, 30, 30];

  foreach var (length, ia) in Zip(Lengths, Ias) do
  begin
    var kol := kolakoski(ia, length);
    writeln('First ', length, ' members of the sequence generated by ', ia, ':');
    writeln(kol);
    var s := if possibleKolakoski(kol) then 'Yes' else 'No';
    writeln('Possible Kolakoski sequence? ', s, #10);
  end;
end.

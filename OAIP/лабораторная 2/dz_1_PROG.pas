program lab_2;
uses crt;
const Size = 10;
var
    a: array[1..Size] of Integer;
    i, k, s, sum: integer;
begin
 for i:=1 to Size do
    begin
      writeln('Введите a[',i,']');
      readln(a[i]);
      ClrScr;
    end;
  for i:=1 to Size do
    write(a[i],' ');
  writeln();
  writeln('Введите s');
  readln(s);
  k:=0;
  for i:=1 to Size do
    begin
      if (sum+a[i])>s then
        begin
          k := k+1;
          writeln('число k = ',k);
          exit;
        end
      else
        begin
          sum := sum + a[i];
          k:= k + 1;
        end;
    end;
end.
  
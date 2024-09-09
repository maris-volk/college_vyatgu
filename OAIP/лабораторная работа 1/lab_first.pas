program Volk;

var
  x, y: real;

function first(x: real): real;
begin
  if x < -8 then
  y := -x - 6
  else if (x >= -8) and (x < -4) then
    y := 21
  else if (x >= -4) and (x <= 3) then
    y := (ln(x) / ln(10)) * 12   
  else if x > 3 then
    y := x * Power(x, 0.1 * x) + 47 / 36;  

  Result := y;
end;

begin
  x := -10;
  while x <= 5 do
  begin
    y := first(x);
    writeln('x = ', x:0:1, ', y = ', y:0:2);
    x := x + 0.1;
  end;
end.

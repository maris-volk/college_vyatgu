program lab_2;

var
  s: string;
  i, half_string: byte; flag: boolean;
begin
  write('String: ');
  readln(s);
  flag := true;
  half_string := length(s) div 2;
  for i:=1 to half_string do
    if Upcase(s[i]) <> Upcase(s[length(s)-i+1]) then 
      begin
        writeln('no palindrome');
        flag:= false;
        break;
      end;
  if flag then 
    write('palindrome');
  readln
end.
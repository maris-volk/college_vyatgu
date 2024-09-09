program PointerLab;
var
  i: integer;
  i_ptr: ^integer;
begin
  i := 2;          
  i_ptr := @i;     
  writeln('Значение по адресу i_ptr: ', i_ptr^);
end.

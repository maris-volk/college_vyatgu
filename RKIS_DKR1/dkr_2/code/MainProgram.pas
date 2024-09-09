program MainProgram;

uses crt, ManageStaticLis, ManageDynamicLis;
const
  NORM = White;
  SEL = LightGreen;

var
  choice, punkt: integer;
  ch: char;
  menu: array[1..3] of string; 
  
procedure MenuToScr;
var
  i: integer;

begin
  ClrScr;
  for i := 1 to 3 do begin
    if punkt = i then
      TextColor(SEL)
    else
      TextColor(NORM);
    GoToXY(10, 4 + i);
    writeln(menu[i]);
  end;
  TextColor(NORM);
  //writeln(List.Nodes);
end;

begin
    crt.SetWindowTitle('Двусвязный список');
  Randomize;
  punkt := 1;
  menu[1] := '1. Двусвязный список на статической памяти';
  menu[2] := '2. Двусвязный список на динамической памяти';
  menu[3] := '3. Выход';
  punkt := 1;

  repeat
    hidecursor;
    MenuToScr;
    ch := ReadKey;
    case ch of
      #38: if punkt > 1 then Dec(punkt); 
      #40: if punkt < 3 then Inc(punkt); 
      #13:
        begin
          case punkt of
            1: ManageStaticList;
            2: ManageDynamicList;
            3:Exit
          end;
        end;
    end;
  until ch = #27; // ESC
end.

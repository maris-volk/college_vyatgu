unit unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls, LazUTF8,
  Calendar;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var  dt: TDateTime;
  s: String;
begin
   ShortDateFormat:= 'dd.mm.yy';
   s:= FormatDateTime('dd mmmm yyyy - hh:nn:ss', Now);
   dt:= Date;  //получили в dt текущую дату
   ShowMessage(DateTimeToStr(dt));
   ShowMessage(DateTimeToStr(Now));
   ShowMessage(SysToUTF8(s));
   dt:= StrToDateTime('21.10.2013 14:25:30');
   ShowMessage('Указали ' + FormatDateTime('c', dt));
end;




end.


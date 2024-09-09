unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    lClock: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }



procedure TfMain.FormCreate(Sender: TObject);
begin
end;

procedure TfMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  //если нажали Esc, то выходим:
  if Key = #27 then Close;
end;




procedure TfMain.Timer1Timer(Sender: TObject);
var
  i: byte; //для получения случайного числа
begin
  lClock.Caption:= TimeToStr(Now);
  lClock.Left := (fMain.Width - lClock.Width) div 2;
  // Center the lClock vertically
  lClock.Top := (fMain.Height - lClock.Height) div 2;
  // Optionally, make sure the label text is also centered if not already set
  lClock.Alignment := taCenter;
  i:= Random(4);
  //теперь в зависимости от направления двигаем метку:
  case i of
    0: lClock.Left:= lClock.Left + 100;
    1: lClock.Left:= lClock.Left - 100;
    2: lClock.Top:= lClock.Top + 100;
    3: lClock.Top:= lClock.Top - 100;
  end;

  if lClock.Left < 0 then lClock.Left:= 0;
  if lClock.Top < 0 then lClock.Top:= 0;
  if (lClock.Left + lClock.Width) > fMain.Width then
    lClock.Left:= fMain.Width - lClock.Width;
  if (lClock.Top + lClock.Height) > fMain.Height then
    lClock.Top:= fMain.Height - lClock.Height;
end;


end.


unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfMain }

  TfMain = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure MyPrivat;
    procedure MyDouble;
  public

  end;

var
  fMain: TfMain;
  MyNum: real;

implementation

{$R *.lfm}

{ TfMain }

procedure Udvoenie(st: string);
var
  r: real;
begin
  r:= StrToFloat(st);
  r:= r * 2;
  ShowMessage(FloatToStr(r));
end;

procedure TfMain.Button1Click(Sender: TObject);
begin
  Udvoenie(Edit1.Text);
end;

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

function FuncUdvoenie(st: string): string;
var
  r: real;
begin
  r:= StrToFloat(st);
  r:= r * 2;
  Result:= FloatToStr(r);
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  ShowMessage(FuncUdvoenie(Edit1.Text));
end;

procedure UdvoeniePoSsilke(var r: real);
begin
  r:= r * 2;
end;

procedure TfMain.Button3Click(Sender: TObject);
var
  myReal: real;
begin
  myReal:= StrToFloat(Edit1.Text);
  UdvoeniePoSsilke(myReal);
  ShowMessage(FloatToStr(myReal));
end;

procedure TfMain.Button4Click(Sender: TObject);
begin
  MyPrivat;
end;

procedure TfMain.MyPrivat;
var
  r: real;
begin
  r:= StrToFloat(Edit1.Text);
  r:= r * 2;
  ShowMessage(FloatToStr(r));
end;

procedure TfMain.Button5Click(Sender: TObject);
begin
  MyNum:= StrToFloat(Edit1.Text);
  MyDouble;
  ShowMessage(FloatToStr(MyNum));
end;

procedure TfMain.MyDouble;
begin
  MyNum:= MyNum * 2;
end;

end.


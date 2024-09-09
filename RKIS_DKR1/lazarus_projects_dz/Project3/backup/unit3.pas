unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  k1,k2,X: double;
  k3: String;

implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  k1, k2, X: Double;
  overflow: Boolean;
begin
  if TryStrToFloat(Edit1.Text, k1) and TryStrToFloat(Edit2.Text, k2) then
  begin
    try
      begin
           X := Power(k1, k2);
           overflow:=False;
      end;
    except
      on E: Exception do
        begin
             Memo1.Lines.Add('Переполнение типа данных');
             overflow:=True;
        end;
    end;
    if not overflow then
        Memo1.Lines.Add('число ' + FloatToStr(k1) + ' в степени ' + FloatToStr(k2) + ' равно: ' + FloatToStr(X))
  end
  else
    Memo1.Lines.Add('Неверный ввод. Пожалуйста, введите корректные числа.');
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
  k1, k2, X: Double;
  overflow: Boolean;
begin
  if TryStrToFloat(Edit1.Text, k1) and TryStrToFloat(Edit2.Text, k2) then
  begin
    try
      begin
           X := Power(k1, k2);
           overflow:=False;
      end;
    except
      on E: Exception do
        begin
             Memo1.Lines.Add('Переполнение типа данных');
             overflow:=True;
        end;
    end;
    if not overflow then
        Memo1.Lines.Add('число ' + FloatToStr(k1) + ' в степени ' + FloatToStr(k2) + ' равно: ' + FloatToStr(X))
  end
  else
    Memo1.Lines.Add('Неверный ввод. Пожалуйста, введите корректные числа.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Memo1.BorderSpacing.Around := 100;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;


end.


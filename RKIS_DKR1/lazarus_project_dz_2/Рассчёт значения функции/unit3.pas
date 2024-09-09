unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);

    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,b,X,Y: double;
  k3: String;

implementation

{$R *.lfm}

{ TForm1 }







procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not (((X=0) and (Edit1.Text='')) or ((a=0) and (Edit2.Text='')) or ((b=0) and (Edit3.Text=''))) and ((StrToFloat(Edit3.Text)=b) and (StrToFloat(Edit1.Text)=X) and (StrToFloat(Edit2.Text)=a)) then
  begin
    Memo1.Lines.Clear();
    Y:=(((Power(a,2)*X)+(exp(-X)*cos(b*X)))/((b*X)-(exp(-X)*sin(b*X))+1));
    Memo1.Lines.Add('Значение функции = '+FloatToStr(Y));
  end
  else
    Memo1.Lines.Add('Введены не все значения');
end;

procedure TForm1.Edit1Change(Sender: TObject);

begin
  if TryStrToFloat(Edit1.Text, X) then
  begin
    try
      begin
           Memo1.Lines.Clear();
           X:=StrToFloat(Edit1.Text);
           Y:=(((Power(a,2)*X)+(exp(-X)*cos(b*X)))/((b*X)-(exp(-X)*sin(b*X))+1));
      end;
    except
      on E: Exception do
        begin
             Memo1.Lines.Add('Функция не определена для данного аргумента');
        end;
  end;

  end
  else
    Memo1.Lines.Add('Неверный ввод. Пожалуйста, введите корректный аргумент.');
end;

procedure TForm1.Edit2Change(Sender: TObject);

begin
  if TryStrToFloat(Edit2.Text, a) then
  begin
    a:=StrToFloat(Edit2.Text);
    Memo1.Lines.Clear();
  end
  else
    Memo1.Lines.Add('Неверный ввод. Пожалуйста, введите корректный коэффициент.');
end;


procedure TForm1.Edit3Change(Sender: TObject);

begin
  if TryStrToFloat(Edit3.Text, b) then
  begin
    b:=StrToFloat(Edit3.Text);
    Memo1.Lines.Clear();
  end
  else
    Memo1.Lines.Add('Неверный ввод. Пожалуйста, введите корректный коэффициент.');
end;


procedure TForm1.FormCreate(Sender: TObject);
begin

    Memo1.BorderSpacing.Around := 100;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;


end.


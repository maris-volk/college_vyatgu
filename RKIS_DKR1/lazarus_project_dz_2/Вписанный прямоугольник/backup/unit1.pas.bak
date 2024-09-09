unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Math, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  tg,d,S,R, min_katet, max_katet:Double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  temps, temps2:Double;
begin
  if not (((R=0) and (Edit3.Text='')) or ((tg=0) and (Edit2.Text='')) and ((StrToFloat(Edit3.Text)=R) and (StrToFloat(Edit2.Text)=tg))) then
   begin
     Memo1.Lines.Clear;
     d:=R*2;
     min_katet:=sqrt(Power(d,2)/(Power(tg,2)+1));
     max_katet:=tg*min_katet;
     S:=min_katet*max_katet;
     Memo1.Lines.add('Диагональ прямоугольника равна '+FloatToStr(d));
     Memo1.Lines.add('Площадь прямоугольника равна '+FloatToStr(S));
   end
  else
    Memo1.Lines.add('Введены не все значения');
end;


procedure TForm1.Edit2Change(Sender: TObject);
begin
  if TryStrToFloat(Edit2.Text, tg) and (StrToFloat(Edit2.Text)> 0) then
     begin
       tg:=StrToFloat(Edit2.Text);
       Memo1.Lines.Clear;
     end
  else
  begin
  Memo1.Lines.add('Введено некорректное значение отношений сторон');
  end;

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
    if TryStrToFloat(Edit3.Text, R) and (StrToFloat(Edit3.Text)> 0) then
     begin
       R:=StrToFloat(Edit3.Text);
       Memo1.Lines.Clear;
     end
    else
      Memo1.Lines.add('Введено некорректное для радиуса значение ');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

end.


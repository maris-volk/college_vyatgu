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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,b,h,temp,temp2,X:Double;

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
  temps:=a;
  temps2:=b;
  if not (((a=0) and (Edit1.Text='')) or ((b=0) and (Edit2.Text='')) or ((h=0) and (Edit3.Text=''))) and ((StrToFloat(Edit3.Text)=h) and (StrToFloat(Edit1.Text)=a) and (StrToFloat(Edit2.Text)=b)) then
   begin
    if h>0 then
     begin
       X:=Power(a,2);
     end
    else if h<0 then
       X:=Power(b,2);
    Memo1.Lines.add(FloatToStr(a)+' в квадрате равно '+FloatToStr(X));
   if h<0 then
    begin
      while b>a do
        begin
          b:=b+h;
          X:=Power(b,2);
          Memo1.Lines.add(FloatToStr(b)+' в квадрате равно '+FloatToStr(X));
        end;
    end
   else if h>0 then
    begin
      while a < b do
        begin
          if (a+h) > temps2 then
           break;
          a:=a+h;
          X:=Power(a,2);
          Memo1.Lines.add(FloatToStr(a)+' в квадрате равно '+FloatToStr(X));
        end;
    end;

   end
  else
    Memo1.Lines.add('Введены не все занчения');
  a:=temps;
  b:=temps2;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if TryStrToFloat(Edit1.Text, a) then
     begin
       temp:=StrToFloat(Edit1.Text);
       if Edit2.Text <> '' then
          begin
              temp2:=b;
              if temp>temp2 then
                 begin
                  Memo1.Lines.add('Левая граница не может быть больше правой');
                  a:=0;
                 end
              else
                  a:=StrToFloat(Edit1.Text);
          end
       else
            a:=StrToFloat(Edit1.Text);
       end
  else
  begin
    Memo1.Lines.add('Введено некорректное значение левой гарницы');
    a:=0;
  end;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if TryStrToFloat(Edit2.Text, b) then
     begin
       temp:=StrToFloat(Edit2.Text);
       if Edit2.Text <>'' then
          begin
              temp2:=a;
              if temp<temp2 then
                 begin
                  Memo1.Lines.add('Правая граница не может быть меньше левой');
                  b:=0;
                 end
              else
                  b:=StrToFloat(Edit2.Text);
          end
       else
            b:=StrToFloat(Edit2.Text);
       end
  else
  begin
  Memo1.Lines.add('Введено некорректное значение правой гарницы');
  b:=0;
  end;

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
    if TryStrToFloat(Edit3.Text, h) then
     begin
       h:=StrToFloat(Edit3.Text);
     end
    else
      Memo1.Lines.add('Введено некорректное для шага значение ');
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

end.


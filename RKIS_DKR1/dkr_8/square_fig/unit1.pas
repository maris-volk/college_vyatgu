unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, RegExpr;

type

  { TFind_Figure_Square }

  TFind_Figure_Square = class(TForm)
    Select_Figure: TRadioGroup;
    Formula_Picture: TImage;
    First_val_for_calcs: TEdit;
    Second_val_for_calcs: TEdit;
    Third_val_for_calcs: TEdit;
    Calculate_Square: TButton;
    Answer_Field: TMemo;
    Label_for_first_val: TLabel;
    Label_for_second_val: TLabel;
    Label_for_third_val: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure Answer_FieldClick(Sender: TObject);
    procedure Select_FigureClick(Sender: TObject);
    procedure Calculate_SquareClick(Sender: TObject);
  private
    procedure UpdateUIForSelectedFigure;
    function IsNumber(const S: string): Boolean;
  public

  end;

var
  Find_Figure_Square: TFind_Figure_Square;

implementation

{$R *.lfm}

{ TFind_Figure_Square }

procedure TFind_Figure_Square.Answer_FieldClick(Sender: TObject);
begin

end;

procedure TFind_Figure_Square.FormCreate(Sender: TObject);
begin

end;

procedure TFind_Figure_Square.Select_FigureClick(Sender: TObject);
begin
  First_val_for_calcs.Text := '';
  Second_val_for_calcs.Text := '';
  Third_val_for_calcs.Text := '';
  Answer_Field.Text := '';
  Find_Figure_Square.Height := 550;
  UpdateUIForSelectedFigure;
end;

procedure TFind_Figure_Square.UpdateUIForSelectedFigure;
begin
  // Скрываем все компоненты
  Formula_Picture.Visible := False;
  First_val_for_calcs.Visible := False;
  Second_val_for_calcs.Visible := False;
  Third_val_for_calcs.Visible := False;
  Calculate_Square.Visible := False;
  Answer_Field.Visible := False;
  Label_for_first_val.Visible := False;
  Label_for_second_val.Visible := False;
  Label_for_third_val.Visible := False;

  // Обновляем UI в зависимости от выбранной фигуры
  case Select_Figure.ItemIndex of
    0: // Круг
    begin
      Formula_Picture.Picture.LoadFromFile('square_circles.png');
      Formula_Picture.Visible := True;
      First_val_for_calcs.Hint := 'Радиус';
      First_val_for_calcs.Visible := True;
      Calculate_Square.Visible := True;
      Label_for_first_val.Caption := 'R =';
      Label_for_first_val.Visible := True;
    end;
    1: // Прямоугольник
    begin
      Formula_Picture.Picture.LoadFromFile('square_rectangles.png');
      Formula_Picture.Visible := True;
      First_val_for_calcs.Hint := 'Длина';
      Second_val_for_calcs.Hint := 'Ширина';
      First_val_for_calcs.Visible := True;
      Second_val_for_calcs.Visible := True;
      Calculate_Square.Visible := True;
      Label_for_first_val.Caption := 'a =';
      Label_for_second_val.Caption := 'b =';
      Label_for_first_val.Visible := True;
      Label_for_second_val.Visible := True;
    end;
    2: // Треугольник
    begin
      Formula_Picture.Picture.LoadFromFile('square_triangle.png');
      Formula_Picture.Visible := True;
      First_val_for_calcs.Hint := 'Основание';
      Second_val_for_calcs.Hint := 'Высота';
      First_val_for_calcs.Visible := True;
      Second_val_for_calcs.Visible := True;
      Calculate_Square.Visible := True;
      Label_for_first_val.Caption := 'a =';
      Label_for_second_val.Caption := 'h =';
      Label_for_first_val.Visible := True;
      Label_for_second_val.Visible := True;
    end;
    3: // Трапеция
    begin
      Formula_Picture.Picture.LoadFromFile('square_trapezoid.png');
      Formula_Picture.Visible := True;
      First_val_for_calcs.Hint := 'Основание 1';
      Second_val_for_calcs.Hint := 'Основание 2';
      Third_val_for_calcs.Hint := 'Высота';
      First_val_for_calcs.Visible := True;
      Second_val_for_calcs.Visible := True;
      Third_val_for_calcs.Visible := True;
      Calculate_Square.Visible := True;
      Label_for_first_val.Caption := 'a =';
      Label_for_second_val.Caption := 'b =';
      Label_for_third_val.Caption := 'h =';
      Label_for_first_val.Visible := True;
      Label_for_second_val.Visible := True;
      Label_for_third_val.Visible := True;
    end;
  end;
end;

function TFind_Figure_Square.IsNumber(const S: string): Boolean;
var
  TempStr: string;
  Regex: TRegExpr;
begin
  TempStr := StringReplace(S, ',', '.', [rfReplaceAll]); // Заменяем запятые на точки для проверки
  Regex := TRegExpr.Create;
  try
    Regex.Expression := '^[0-9]+([.,][0-9]+)?$'; // Регулярное выражение для проверки числового значения с точкой или запятой
    Result := Regex.Exec(TempStr);
  finally
    Regex.Free;
  end;
end;

procedure TFind_Figure_Square.Calculate_SquareClick(Sender: TObject);
var
  Area, Value1, Value2, Value3: Double;
begin
  if First_val_for_calcs.Visible then
  begin
    if (First_val_for_calcs.Text = '') or not IsNumber(First_val_for_calcs.Text) or (StrToFloat(StringReplace(First_val_for_calcs.Text, '.', ',', [rfReplaceAll])) < 0) then
    begin
      ShowMessage('Пожалуйста, введите корректное значение для ' + First_val_for_calcs.Hint);
      Exit;
    end;
  end;
  if Second_val_for_calcs.Visible then
  begin
    if (Second_val_for_calcs.Text = '') or (not IsNumber(Second_val_for_calcs.Text)) or (StrToFloat(StringReplace(Second_val_for_calcs.Text, '.', ',', [rfReplaceAll])) < 0) then
    begin
      ShowMessage('Пожалуйста, введите корректное значение для ' + Second_val_for_calcs.Hint);
      Exit;
    end;
  end;

  if Third_val_for_calcs.Visible then
  begin
    if (Third_val_for_calcs.Text = '') or not IsNumber(Third_val_for_calcs.Text) or (StrToFloat(StringReplace(Third_val_for_calcs.Text, '.', ',', [rfReplaceAll])) < 0) then
    begin
      ShowMessage('Пожалуйста, введите корректное значение для ' + Third_val_for_calcs.Hint);
      Exit;
    end;
  end;

  Value1 := StrToFloatDef(StringReplace(First_val_for_calcs.Text, '.', ',', [rfReplaceAll]),0);
  Value2 := StrToFloatDef(StringReplace(Second_val_for_calcs.Text, '.', ',', [rfReplaceAll]),0);
  Value3 := StrToFloatDef(StringReplace(Third_val_for_calcs.Text, '.', ',', [rfReplaceAll]),0);

  case Select_Figure.ItemIndex of
    0: // Круг
      Area := Pi * Sqr(Value1);
    1: // Прямоугольник
      Area := Value1 * Value2;
    2: // Треугольник
      Area := 0.5 * Value1 * Value2;
    3: // Трапеция
      Area := 0.5 * (Value1 + Value2) * Value3;
  end;

  Find_Figure_Square.Height := 700;
  Answer_Field.Visible := True;
  Answer_Field.Lines.Add('Рассчитанная площадь: ' + FloatToStr(Area));
end;

end.


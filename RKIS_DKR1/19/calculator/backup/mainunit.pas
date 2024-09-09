unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, strutils;

type

  { TCalculator }

  TCalculator = class(TForm)
  // Declaration of components in the form
    CleanEntry: TButton;
    Clear: TButton;
    DelLast: TButton;
    Num9: TButton;
    ShowCurrentCalc: TLabel;
    square: TButton;
    Equal_S: TButton;
    Num1: TButton;
    EnterField: TEdit;
    Num0: TButton;
    minus: TButton;
    multi: TButton;
    division: TButton;
    point: TButton;
    Num2: TButton;
    Num3: TButton;
    Num4: TButton;
    Num5: TButton;
    Num6: TButton;
    Num7: TButton;
    Num8: TButton;
    plus: TButton;
    inverse: TButton;
    sqroot: TButton;

    procedure CleanEntryClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure DelLastClick(Sender: TObject);
    procedure ClickNums(Sender: TObject);
    procedure ClickOperations(Sender: TObject);
    procedure Equal_SClick(Sender: TObject);
    procedure inverseClick(Sender: TObject);
    procedure squareClick(Sender: TObject);
    procedure sqrootClick(Sender: TObject);


  private

  public

  end;

var
  Calculator: TCalculator;
  before_operation_value, current_value, answer: Real;
  show_calc: String;
  char_check: String;
  except_found: boolean;
  equals_found: boolean;


implementation

{$R *.lfm}

{ TCalculator }
function IsDigit(c: Char): Boolean;
begin
  IsDigit := (c >= '0') and (c <= '9');
end;


function GetReal(str: String):Real;
var
  i:integer;
begin
  for i:=1 to (length(str)) do
    begin
    if str[i]=',' then
      str[i]:='.';
    end;
end;

function GetValue(expression: String): Real;
var
  temp1, temp2, temp3: String;
  temp1_f, temp2_f, temp3_f: Real;
  lengTotal: Integer;
  change_relative: Boolean;
  relative_index: Integer;
  current_index: Integer;
  relative_index2: Integer;
  operand_index: Integer;
  operand: Char;
  in_search,decimalSeen: Boolean;
  to_edit: String;
  i: Integer;
  value, currentNumber: Real;
  currentOp: Char;
  numStr: String;
  FormatSettings: TFormatSettings;
begin
  // Processing the expression to compute the result
  lengTotal := Length(expression);
  relative_index := 1;
  relative_index2 := 1;
  current_index := 1;
  operand_index:=0;
  change_relative:=False;
  in_search := False;
  // Loop through the expression to identify operands and calculate
  while (current_index <= lengTotal) do
  begin
  if (in_search=True) and ((expression[current_index] = '*') or (expression[current_index] = '/') or (expression[current_index] = '-') or (expression[current_index] = '+') or (current_index=lengTotal)) then
  begin
    if current_index = lengTotal then
    begin
      relative_index2:=lengTotal;
    end
    else
      relative_index2 := current_index - 1;
    temp1 := Copy(expression, relative_index, abs(operand_index - relative_index));
    temp2 := Copy(expression, operand_index + 1, relative_index2 - operand_index);
    temp1_f := StrToFloat(temp1);
    temp2_f := StrToFloat(temp2);
    if operand = '*' then
      temp3_f := temp1_f * temp2_f;
    if operand = '/' then
    begin
      if temp2_f = 0 then
      begin
        except_found:=True;
        exit;
      end
      else
        temp3_f := temp1_f / temp2_f;

    end;
    temp3 := FloatToStr(temp3_f);
    to_edit := temp1 + operand + temp2;
    Delete(expression, Pos(to_edit, expression), Length(to_edit));
    Insert(temp3, expression, relative_index);
    current_index:=relative_index;
    lengTotal := Length(expression);
    in_search:=False;
    continue;
  end;
  if (expression[current_index] = '*') or (expression[current_index] = '/') then
  begin
   operand := expression[current_index];
   operand_index := current_index;
   in_search := True;
   current_index:=current_index+1;
   continue;
  end;
  if change_relative then
  begin
    relative_index:=current_index;
    current_index:= current_index+1;
    change_relative:=False;
    continue;
  end;
  if (expression[current_index] = '+') or (expression[current_index] = '-') then
  begin
    change_relative:=True;
    current_index:= current_index+1;
    continue;
  end
  else
  begin
    change_relative:=False;
    current_index:= current_index+1;
    continue;
  end;

end;
  FormatSettings := Default(TFormatSettings);
  FormatSettings.DecimalSeparator := '.';
  // Final value calculation logic, based on the parsed numbers and operations
  value := 0.0;
  currentNumber := 0.0;
  currentOp := '+';
  numStr := '';
  i := 1;
  while i <= Length(expression) do
  begin
    while (i <= Length(expression)) and (expression[i] = ' ') do
      Inc(i);
    // Read number, handle operation, calculate current result
    numStr := '';
    while (i <= Length(expression)) and ((expression[i] in ['0'..'9', ',']) or (expression[i] = '.')) do
    begin
      if expression[i] = ',' then
        numStr := numStr + '.'
      else
        numStr := numStr + expression[i];
      Inc(i);
    end;

    if numStr <> '' then
    begin
      currentNumber := StrToFloat(numStr, FormatSettings);
      if currentOp = '+' then
        value := value + currentNumber
      else if currentOp = '-' then
        value := value - currentNumber;
    end;

    if i <= Length(expression) then
    begin
      currentOp := expression[i];
      Inc(i);
    end;
  end;

  Result:=value;
end;






procedure TCalculator.ClickNums(Sender: TObject);
VAR for_check: String;
  has_point: Boolean;
  leng: Integer;
begin
  // Handling numeric button clicks, managing input validation and display
  // Logic to prevent invalid number entries like multiple decimal points
  for_check := EnterField.Text;
  leng := length(for_check);
  if ((EnterField.Text='') and ((Sender as TButton).Caption = ',')) or ((FloatToStr(answer) = for_check) and (show_calc <>'') and (show_calc[length(show_calc)]='=')) or (EnterField.Text='Деление на ноль') and ((Sender as TButton).Caption = ',') then
    begin
    if ((Sender as TButton).Caption = ',') then
      begin
      EnterField.Text:='0,';
      end
    else
      EnterField.Text:='';
    ShowCurrentCalc.Caption := '';
    before_operation_value:=0;
    current_value:=0;
    answer:=0;
    show_calc := '';

  end;
  if ((FloatToStr(answer) = for_check) and (show_calc<>'') and (show_calc[length(show_calc)]='=')) or ((EnterField.Text='Деление на ноль') or (enterField.Text = 'Ошибка')) then
  begin
    EnterField.Clear;
    before_operation_value:=0;
    current_value:=0;
    answer:=0;
    show_calc := '';
    ShowCurrentCalc.Caption := '';
  end;
  for_check := EnterField.Text;
  leng := length(for_check);
  while leng > 0 do
  begin
    if (not IsDigit(for_check[leng])) and (for_check[leng] <> ',') then
      break;
    if for_check[leng] = ',' then
    begin
      has_point := True;
      break;
    end;
    leng := leng - 1;
  end;

  if ((Sender as TButton).Caption = ',') and has_point then
    exit();
  if ((Sender as TButton).Caption = ',') and (length(EnterField.Text)=0) then
    exit();
  if (length(EnterField.Text) = 1) and (EnterField.Text[1]='0') and((Sender as TButton).Caption = '0') then
    exit();
  if (length(EnterField.Text) = 1) and (EnterField.Text[1] = '0') and IsDigit((Sender as TButton).Caption[1]) and ((Sender as TButton).Caption <> '0') then
    begin
    EnterField.Text := '';
    EnterField.Text := EnterField.Text + (Sender as TButton).Caption;
    exit;
    end;
  EnterField.Text := EnterField.Text + (Sender as TButton).Caption;
end;


procedure TCalculator.ClickOperations(Sender: TObject);
var
  for_change_current_calc: String;
begin
  // Handle operation buttons (+, -, *, /), preparing for calculation
  if (EnterField.Text='Деление на ноль') or (EnterField.Text = 'Ошибка') then
    exit();
  if (length(show_calc)=0) and (EnterField.Text='') then
    exit();
  for_change_current_calc := ShowCurrentCalc.Caption;
  if enterField.Text = '' then
    begin
    before_operation_value:=0;
    char_check := (Sender as TButton).Caption;
    show_calc[Length(show_calc)] := (Sender as TButton).Caption[1];
    ShowCurrentCalc.Caption := show_calc;
    exit();
    end
  else
    before_operation_value:=StrToFloat(enterField.Text);
  if (length(for_change_current_calc) > 0) and (for_change_current_calc[length(for_change_current_calc)] = '=') then
  begin
    show_calc := FloatToStr(answer) + (Sender as TButton).Caption;
  end
  else
    show_calc := show_calc  + enterField.Text + (Sender as TButton).Caption;

  ShowCurrentCalc.Caption := show_calc;
  enterField.clear;
  char_check := (Sender as TButton).Caption;
  equals_found:=False;
end;
var
  i:byte;
procedure TCalculator.Equal_SClick(Sender: TObject);
begin
  // Calculate the result when '=' is clicked
  if char_check = '' then
    exit();
  if (show_calc='') then
    exit();
  if ((EnterField.Text=FloatToStr(answer)) and (show_calc[length(show_calc)]='=' ))  then
    exit();
  if (show_calc[length(show_calc)]='=')  then
    exit();
  if ((length(show_calc)=0) and (EnterField.Text='')) or (not IsDigit(show_calc[length(show_calc)]) and (show_calc[length(show_calc)]<>'=') and (EnterField.Text=''))   then
    exit();
  current_value := StrToFloat(enterField.Text);
  for i:=1 to Length(show_calc) do
    if (show_calc[i]=' ') or (show_calc[i]='') then
      Delete(show_calc,i,1);

  case char_check of
  '+': answer := GetValue( show_calc+ enterField.Text);
  '-': answer := GetValue( show_calc+ enterField.Text);
  '*': answer := GetValue( show_calc+ enterField.Text);
  '/': answer := GetValue( show_calc+ enterField.Text);
  end;
  show_calc := show_calc + enterField.Text + ' =';
  enterField.Clear;
  if equals_found then
  begin
    enterField.Text := FloatToStr(answer);
    exit();
  end;
  if except_found then
  begin
    enterField.Text := 'Деление на ноль';
    before_operation_value:=0;
    current_value:=0;
    answer:=0;
    show_calc := '';
    ShowCurrentCalc.Caption := '';
    except_found:= False;
  end
  else
  begin
    enterField.Text := FloatToStr(answer);
    ShowCurrentCalc.Caption := show_calc;
   end;
  equals_found:=True;
end;

procedure TCalculator.inverseClick(Sender: TObject);
begin
  if (EnterField.Text='Деление на ноль') or (EnterField.Text = 'Ошибка') then
  begin
  exit();
  end;
  // Calculate the multiplicative inverse of the current number
  if EnterField.text='' then
    exit();
  before_operation_value:=StrToFloat(EnterField.text);
  if before_operation_value = 0 then
    except_found:=True;
  if except_found then
  begin
    enterField.Text := 'Деление на ноль';
    before_operation_value:=0;
    current_value:=0;
    answer:=0;
    show_calc := '';
    ShowCurrentCalc.Caption := '';
    except_found:= False;
  end
  else
  begin
    before_operation_value:=1/before_operation_value;
    EnterField.Text:=FloatToStr(before_operation_value);
end;


end;


procedure TCalculator.squareClick(Sender: TObject);
begin
  if (EnterField.Text='Деление на ноль') or (EnterField.Text = 'Ошибка') then
  begin
  exit();
  end;
  // Square the current number
  if EnterField.text='' then
    exit();
  before_operation_value:=StrToFloat(EnterField.text);
  before_operation_value:=sqr(before_operation_value);
  EnterField.Text:=FloatToStr(before_operation_value) ;
end;

procedure TCalculator.sqrootClick(Sender: TObject);
begin
  if (EnterField.Text='Деление на ноль') or (EnterField.Text = 'Ошибка') then
  begin
  exit();
  end;
  // Calculate the square root of the current number
  if EnterField.text='' then
    exit();
  before_operation_value:=StrToFloat(EnterField.text);
    if before_operation_value < 0 then
    except_found:=True;
    if except_found then
    begin
    enterField.Text := 'Ошибка';
    before_operation_value:=0;
    current_value:=0;
    answer:=0;
    show_calc := '';
    ShowCurrentCalc.Caption := '';
    except_found:= False;
  end
  else
  begin
    before_operation_value:=sqrt(before_operation_value);
    EnterField.Text:=FloatToStr(before_operation_value) ;
end;

end;




procedure TCalculator.DelLastClick(Sender: TObject);
var
  entry: String;
begin
  // Delete the last character in the input field
  if (EnterField.Text='Деление на ноль') or (EnterField.Text = 'Ошибка') then
  begin
      EnterField.Clear;
      before_operation_value:=0;
      current_value:=0;
      answer:=0;
      show_calc := '';
      ShowCurrentCalc.Caption := '';
  end;

  if length(EnterField.text)=0 then
  exit;
  if (show_calc<>'') and (show_calc[length(show_calc)]='=') then
  begin
      before_operation_value:=0;
      current_value:=0;
      answer:=0;
      show_calc := '';
      ShowCurrentCalc.Caption := '';
  end;
  entry:=EnterField.text;
  if entry <> '' then
    Delete(entry, Length(entry),1);
  EnterField.text:= entry;
end;

procedure TCalculator.CleanEntryClick(Sender: TObject);
begin
  // Clear the current input field
  EnterField.Clear;
end;

procedure TCalculator.ClearClick(Sender: TObject);
begin
  // Clear all fields and reset the calculator
  EnterField.Clear;
  before_operation_value:=0;
  current_value:=0;
  answer:=0;
  show_calc := '';
  ShowCurrentCalc.Caption := '';
end;






end.


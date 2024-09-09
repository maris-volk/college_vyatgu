unit createRec;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TcreateRec }

  TcreateRec = class(TForm)
    mCancel: TBitBtn;
    mSave: TBitBtn;
    Dir_of_philosophy_label_list: TComboBox;
    Year_of_1st_composition_edit: TEdit;
    Materialist_chkbx: TCheckBox;
    Year_of_birth_edit: TEdit;
    FIO_edit: TEdit;
    Dir_of_philosophy_label: TLabel;
    Year_of_1st_composition_label: TLabel;
    Materialist_label: TLabel;
    Year_Of_Birth_label: TLabel;
    FIO_label: TLabel;
    procedure eYearCompKeyPress(Sender: TObject; var Key: char);
    procedure eYearKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  createRecord: TcreateRec;

implementation

{$R *.lfm}

{ TcreateRec }


procedure TcreateRec.FormShow(Sender: TObject);
begin
  FIO_edit.SetFocus;
  Year_of_1st_composition_edit.OnKeyPress := @eYearCompKeyPress;
  Year_of_birth_edit.OnKeyPress := @eYearKeyPress;
end;

procedure TcreateRec.eYearCompKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0; // Отменяем ввод, если это не цифра и не backspace
  end;
end;

procedure TcreateRec.eYearKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0; // Отменяем ввод, если это не цифра и не backspace
  end;
end;



end.


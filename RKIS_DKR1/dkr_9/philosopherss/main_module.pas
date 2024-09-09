unit main_module;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, createRec;

type

  { TmForm }

  TmForm = class(TForm)
    Add_Note: TBitBtn;
    Edit_Note: TBitBtn;
    Del_Note: TBitBtn;
    Panel: TPanel;
    mRec: TStringGrid;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Add_NoteClick(Sender: TObject);
    procedure Del_NoteClick(Sender: TObject);
    procedure Edit_NoteClick(Sender: TObject);
    procedure PanelClick(Sender: TObject);
  private

  public

  end;

type
  Philosopher = record
    FIO: string[100];
    Year_of_birth: integer;
    Materialist: boolean;
    Year_of_1st_composition: integer;
    Direct_of_philosophy: string[30];
  end;

var
  mForm: TmForm;
  adres: string;

implementation

{$R *.lfm}

{ TmForm }

procedure TmForm.FormCreate(Sender: TObject);
var
  new_Philosopher: Philosopher; //для очередной записи
  f: file of Philosopher; //файл данных
  i: integer; //счетчик цикла
begin
  adres:= ExtractFilePath(ParamStr(0));
  mRec.Cells[0, 0]:= 'ФИО';
  mRec.Cells[1, 0]:= 'Год рождения';
  mRec.Cells[2, 0]:= 'Материалист';
  mRec.Cells[3, 0]:= 'Год издания первого сочинения';
  mRec.Cells[4, 0]:= 'Направление философии';

  //если файла данных нет, просто выходим:
  if not FileExists(adres + 'philosophers.dat') then exit;
  //иначе файл есть, открываем его для чтения и
  //считываем данные в сетку:
  try
    AssignFile(f, adres + 'philosophers.dat');
    Reset(f);
    //теперь цикл - от первой до последней записи сетки:
    while not Eof(f) do begin
      //считываем новую запись:
      Read(f, new_Philosopher);
      //добавляем в сетку новую строку, и заполняем её:
        mRec.RowCount:= mRec.RowCount + 1;
        mRec.Cells[0, mRec.RowCount-1]:= new_Philosopher.FIO;
        mRec.Cells[1, mRec.RowCount-1]:= IntToStr(new_Philosopher.Year_of_birth);
        if (new_Philosopher.Materialist) then mRec.Cells[2, mRec.RowCount-1]:= 'Да'
        else mRec.Cells[2, mRec.RowCount-1]:='Нет';
        mRec.Cells[3, mRec.RowCount-1]:= FloatToStr(new_Philosopher.Year_of_1st_composition);
        mRec.Cells[4, mRec.RowCount-1]:= new_Philosopher.Direct_of_philosophy;
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TmForm.Add_NoteClick(Sender: TObject);
begin
  //очищаем поля, если там что-то есть:
  createRecord.FIO_edit.Text:= '';
  createRecord.Year_of_birth_edit.Text:= '';
  createRecord.Year_of_1st_composition_edit.Text:= '';
  //устанавливаем ModalResult редактора в mrNone:
  createRecord.ModalResult:= mrNone;
  //теперь выводим форму:
  createRecord.ShowModal;
  //если пользователь ничего не ввел - выходим:
  if (createRecord.FIO_edit.Text= '') or (createRecord.Year_of_birth_edit.Text= '') or (createRecord.Year_of_1st_composition_edit.Text= '') then exit;
  //если пользователь не нажал "Сохранить" - выходим:
  if createRecord.ModalResult <> mrOk then exit;
  //иначе добавляем в сетку строку, и заполняем её:
  mRec.RowCount:= mRec.RowCount + 1;
  mRec.Cells[0, mRec.RowCount-1]:= createRecord.FIO_edit.Text;
  mRec.Cells[1, mRec.RowCount-1]:= createRecord.Year_of_birth_edit.Text;
  if (createRecord.Materialist_chkbx.Checked) then mRec.Cells[2, mRec.RowCount-1]:= 'Да'
  else mRec.Cells[2, mRec.RowCount-1]:='Нет';
  mRec.Cells[3, mRec.RowCount-1]:= createRecord.Year_of_1st_composition_edit.Text;
  mRec.Cells[4, mRec.RowCount-1]:= createRecord.Dir_of_philosophy_label_list.Text;
end;

procedure TmForm.Del_NoteClick(Sender: TObject);
begin
  //если данных нет - выходим:
  if mRec.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить запись "' +
                mRec.Cells[0, mRec.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         mRec.DeleteRow(mRec.Row);
end;

procedure TmForm.Edit_NoteClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if mRec.RowCount = 1 then exit;
  //иначе записываем данные в форму редактора:
  createRecord.FIO_edit.Text:= mRec.Cells[0, mRec.Row];
  createRecord.Year_of_birth_edit.Text:= mRec.Cells[1, mRec.Row];
  if (mRec.Cells[2, mRec.RowCount-1] = 'Да') then createRecord.Materialist_chkbx.Checked := True
  else createRecord.Materialist_chkbx.Checked := False;
  createRecord.Year_of_1st_composition_edit.Text:= mRec.Cells[3, mRec.Row];
  createRecord.Dir_of_philosophy_label_list.Text:= mRec.Cells[4, mRec.Row];
  //устанавливаем ModalResult редактора в mrNone:
  createRecord.ModalResult:= mrNone;
  //теперь выводим форму:
  createRecord.ShowModal;
  //сохраняем в сетку возможные изменения,
  //если пользователь нажал "Сохранить":
  if createRecord.ModalResult = mrOk then begin
    mRec.Cells[0, mRec.Row]:= createRecord.FIO_edit.Text;
    mRec.Cells[1, mRec.Row]:= createRecord.Year_of_birth_edit.Text;
    if (createRecord.Materialist_chkbx.Checked) then mRec.Cells[2, mRec.RowCount-1]:= 'Да'
    else mRec.Cells[2, mRec.RowCount-1]:='Нет';
    mRec.Cells[3, mRec.Row]:= createRecord.Year_of_1st_composition_edit.Text;
    mRec.Cells[4, mRec.Row]:= createRecord.Dir_of_philosophy_label_list.Text;
  end;
end;

procedure TmForm.PanelClick(Sender: TObject);
begin

end;

procedure TmForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  new_Philosopher: Philosopher; //для очередной записи
  f: file of Philosopher; //файл данных
  i: integer; //счетчик цикла
begin
  //если строки данных пусты, просто выходим:
  if mRec.RowCount = 1 then exit;
  //иначе открываем файл для записи:
  try
    AssignFile(f, adres + 'philosophers.dat');
    Rewrite(f);
    //теперь цикл - от первой до последней записи сетки:
    for i:= 1 to mRec.RowCount-1 do begin
      //получаем данные текущей записи:
      new_Philosopher.FIO:= mRec.Cells[0, i];
      new_Philosopher.Year_of_birth:= StrToInt(mRec.Cells[1, i]);
      if (mRec.Cells[2, mRec.RowCount-1] = 'Да') then new_Philosopher.Materialist := True
      else new_Philosopher.Materialist := False;
      new_Philosopher.Year_of_1st_composition:= StrToInt(mRec.Cells[3, i]);
      new_Philosopher.Direct_of_philosophy:= mRec.Cells[4, i];
      //записываем их:
      Write(f, new_Philosopher);
    end;
  finally
    CloseFile(f);
  end;
end;


end.


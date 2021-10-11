unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, Mask, Buttons, ComCtrls,Printers, ExtCtrls,
  DBCtrls, Grids, DBGrids,ClipBrd, Menus,DBITYPES, DBIPROCS,DBIERRS,OleServer;

type
  TForm1 = class(TForm)
    MaskEdit1: TMaskEdit;
    DataSource1: TDataSource;
    Table1: TTable;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    SpeedButton3: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListBox1: TListBox;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Mpack: TMenuItem;
    MdelAll: TMenuItem;
    DosWin: TMenuItem;
    N7: TMenuItem;
    BatchMove1: TBatchMove;
    DataSource2: TDataSource;
    Table2: TTable;
    MdellInd: TMenuItem;
    Button1: TButton;
    WINDOS: TMenuItem;
    Mzap: TMenuItem;
    N9: TMenuItem;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Button2: TButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MpackClick(Sender: TObject);
    procedure MdelAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DosWinClick(Sender: TObject);
    procedure MdellIndClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WINDOSClick(Sender: TObject);
    procedure MzapClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MyEsc: Boolean;
  end;

var
  Form1: TForm1;

implementation

uses About;

{$R *.DFM}

{Поиск значения в колонке тавлицы Функция требует на входе аргумент
типа TTable (например, Table1), что ищем, имя поля где ищем.
 Возвращает номер первого символа или ноль}
function Isk( oTable: TTable;var Istr:String; var Pstr:String): Integer;
var RRecno: TBookmark;
    Napr: Integer;
label ZYes,ZNo,ZNo2,Nach;
begin
////SetWindowsHookEx()
Napr:=0;
Result := 0;
Form1.MyEsc:=False;
   RRecno:=oTable.GetBookmark;
   oTable.Next;
  Nach:
   while not oTable.Eof do
   begin
         Result :=AnsiPos(Istr,oTable.FieldByName(Pstr).AsString);
//        MyBrowse.SetFocus;
         if Form1.MyEsc then goto ZNo;
         if Result >0 then goto ZYes;
         Application.ProcessMessages();
         oTable.next;
         If (Rrecno = TBookmark(oTable.Recno)) then goto Zno;
   end;
ZNo:
   oTable.GotoBookmark(Rrecno);
//   ShowMessage('Не найдено ' + Istr);
  if (Napr = 0) and
    (MessageDlg('Не найдено ' + Istr+'. Продолжить поиск с начала ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes)
   then
   begin
     Napr:=1;
     oTable.First;
     goto Nach;
   end else showmessage('Не найдено ' + Istr);
   goto ZNo2;
ZYes:
  oTable.CursorPosChanged; 
  MessageBeep(MB_OK);
  Napr:=0;
ZNo2:
  Form1.MyEsc:=False;
  oTable.FreeBookmark(Rrecno);
end;


procedure MyDisplay();
var i,ii: Integer;
    F: TFieldDef;
    Ln,D: String;
begin
Form1.Table1.Active := True;
//--------------------------------
// имена полей
   Form1.ComboBox2.Items.Clear;
   for ii := 0 to Form1.table1.Fields.Count-1 do
   begin
     Form1.ComboBox2.Items.Add(Form1.Table1.Fields[ii].DisplayLabel);
   end;
   Form1.ComboBox2.ItemIndex:=0;
//--------------------------------
Form1.Table1.GetIndexNames(Form1.ComboBox1.Items);
Form1.ComboBox1.Items.Add('No Index');
Form1.ListBox1.Items.Add('            ФАЙЛ '+ Trim(Form1.MaskEdit1.Text));
   if (Form1.ComboBox1.Items.Count <> -1)and(Form1.ComboBox1.Items[0] <> 'No Index') then
 begin
  for  i:=0  to Form1.ComboBox1.Items.Count-2 do
  begin
        Form1.ListBox1.Items.Add('     Индекс:'+Form1.ComboBox1.Items[i]);
        Form1.ListBox1.Items.Add('     Инд.выражение:'+Form1.Table1.IndexDefs.Items[i].Expression);
  end;
 end;
with Form1.Table1 do begin
for i := 0 to FieldDefs.Count - 1 do begin
F := FieldDefs.Items[i];
case F.DataType of
ftUnknown: D := 'Unknown';
ftString: D := 'String';
ftSmallint: D := 'SmallInt';
ftInteger: D := 'Integer';
ftWord: D := 'Word';
ftBoolean: D := 'Boolean';
ftFloat: D := 'Float';     // а надо ftBytes
ftCurrency: D := 'Currency';
ftBCD: D := 'BCD';
ftDate: D := 'Date';
ftTime: D := 'Time';
ftDateTime: D := 'DateTime';
ftBytes: D := 'Bytes';
ftVarBytes: D := '';
ftBlob: D := 'BLOB';
ftMemo: D := 'Memo';
ftGraphic: D := 'Graphic';
else
D := '';
Ln:=''
end;
 Ln := 'FieldDefs.Items[i].Size='+ IntToStr(FieldDefs.Items[i].Size);
Ln := Ln+' Fields[i].DataSize='+IntToStr(Fields[i].DataSize);
Form1.ListBox1.Items.Add('        '+IntToStr(i)+'. '+F.Name + ', ' + D+', '+Ln);
end;
end;
//Form1.Table1.Active := False;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 Form1.ListBox1.Items.Clear;
 Form1.ComboBox1.Items.Clear;
 Form1.ComboBox1.Items.Add('No Index');
 If Length(Table1.TableName)<>0 then
 begin
 Table1.Active:=False;
 end;
   If OpenDialog1.Execute then
   begin
     if Length(Opendialog1.Files[0])<>0 then
     begin
      Table1.TableName:=Opendialog1.FileName;
//      Table1.TableName:=
      MaskEdit1.Text:= Table1.TableName;
      MyDisplay();
     end;
   end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var P:TextFile;
 ii: integer;
begin
 //PrinterSetupDialog1.Execute;
 //PrintDialog1.Execute;
 if Length(Table1.TableName) <> 0
 then
  begin
   AssignPrn(P);
   Rewrite(P);
   //   Writeln(P,'            Файл '+ Trim(Form1.MaskEdit1.Text));
   //   if (ComboBox1.Items.Count <> -1)and(ComboBox1.Items[0] <> 'No Index') then
   // begin
   //  for  ii:=0  to ComboBox1.Items.Count-2 do
   //  begin
   //        Writeln(P,'     Индекс:'+ComboBox1.Items[ii]);
   //        Writeln(P,'     Инд.выражение:'+Table1.IndexDefs.Items[ii].Expression);
   //  end;
   // end;
   for ii:=0  to Listbox1.Items.Count-1 do
    Writeln(P,Listbox1.Items[ii]);
   System.CloseFile(P);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
If Length(Table1.TableName)<>0 then
 begin
 Table1.Active:=False;
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
If Length(Table1.TableName)<>0 then
 begin
 Table1.Active:=False;
 end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if (ComboBox1.ItemIndex <> -1) and (ComboBox1.Items[ComboBox1.ItemIndex] <> 'No Index') then
 begin
  Form1.Table1.IndexName:=ComboBox1.Items[ComboBox1.ItemIndex];
  Edit1.Text:=Table1.IndexDefs.Items[ComboBox1.ItemIndex].Expression;
 end
 else
 Form1.Table1.IndexName:='';
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var L: string;
 ii: integer;
begin
// dbl copy to clip
L:='';
for ii:=0  to Listbox1.Items.count-1 do
begin
 L:=L+Listbox1.Items[ii];
 if ii <> (Listbox1.Items.count-1) then L:=L+' '#13' ';
end;
clipboard.AsText := L; //Данные - в буфер!!!
//clipboard.GetTextBuf(PChar,Size);
ShowMessage('Данные в буфере');
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
bm : TBookMark;
pch,pch1:  PChar;
s,s2 : string;
i,j : integer;
begin
// Скопировать в буфер обмена
//Копирование информации из DBGrid-а в Clipboard
//Копирует DBGrid в буфер обмена,
//после чего данные отлично переносятся
//как в простой текстовый редактор, так и в Excell

s := '';
for j := 0 to Form1.Dbgrid1.Columns.Count-1 do
s := s + Form1.Dbgrid1.Columns.Items[j].Title.Caption +#9 ;
s := s + #13+#10;
if not Form1.Dbgrid1.DataSource.DataSet.active then
begin
ShowMessage('Нет активной!!!');
Exit;
end;
try
Form1.Dbgrid1.Visible := False; //Делаем грид невидимым, чтобы не тратилось время
//на его перерисовку при прокрутке DataSet - просто и
//эффективно
bm := Form1.Dbgrid1.DataSource.DataSet.GetBookmark; // для того чтобы не
// потерять текущую запись
Form1.Dbgrid1.DataSource.DataSet.First;
while not Form1.Dbgrid1.DataSource.DataSet.EOF do
begin
s2 := '';
for j := 0 to Form1.Dbgrid1.Columns.Count-1 do
begin
s2 := s2 + Form1.Dbgrid1.Columns.Items[j].Field.AsString +#9;
end;
s := s + s2 + #13+#10;
Form1.Dbgrid1.DataSource.DataSet.Next;
end;
//Переключаем клавиатуру "в русский режим",
//иначе - проблемы с кодировкой
GetMem(pch,100);
GetMem(pch1,100);
GetKeyboardLayoutName(pch);
StrCopy(pch1,pch);
while pch <> '00000419' do
begin
ActivateKeyboardLayout(HKL_NEXT,0);
GetKeyboardLayoutName(pch);
if strComp(pch, pch1) = 0 then
//Круг замкнулся - нет такого языка '00000419'
StrCopy(pch,'00000419');
end;

clipboard.AsText := s; //Данные - в буфер!!!

//Возвращаем режим клавиатуры
while strComp(pch, pch1)<>0 do
begin
ActivateKeyboardLayout(HKL_NEXT,0);
GetKeyboardLayoutName(pch);
end;
FreeMem(pch);
FreeMem(pch1);
Form1.Dbgrid1.DataSource.DataSet.GotoBookmark( bm );
ShowMessage('Данные успешно скопированы в буфер обмена.');
finally
Form1.Dbgrid1.Visible := True;
end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
S : String;
begin
 //AboutBox.ShowModal;
 //s:=ExpandFileName(Application.ExeName);
 //s:=DateTimeToStr(FileDateToDateTime(FileAge(s)));       //FileGetDate
 //s:=s+' '#13#10' #'+CurrentFileInfo(Application.ExeName);
 Application.CreateForm(TAboutBox, AboutBox);
 AboutBox.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
// Выход
 Table1.Active:=False;
 Form1.Close;
end;

procedure TForm1.MpackClick(Sender: TObject);
var rdir,newname:string;
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
// Упаковать   packtable
   getdir(0,rdir);
if FileExists('Temp.dbf') then
//  if MessageDlg('Do you really want to delete ' + ExtractFileName(FileName) + '?'), []) = IDYes then
    DeleteFile('Temp.dbf');
    Table1.active:=False;
      with BatchMove1 do
       begin
          Source := Table1;
          Table2.Tablename:='Temp.dbf';
          Table2.DatabaseName:=Table1.DatabaseName;
          Destination := Table2;
          Mode := batCopy;
          Execute;
       end;
       Table1.active:=False;
       Table2.active:=False;
       Session.Close; // CloseDataBase;
       newname:=ChangeFileExt(Table1.Tablename, '.BAK');
       DeleteFile(newname);
       if not RenameFile(UpperCase(OpenDialog1.FileName),UpperCase(newname)) then
       showmessage('Не удалось переименовать '+OpenDialog1.FileName+' в '+newname);
       if not RenameFile(UpperCase(Table2.Tablename),UpperCase(OpenDialog1.FileName)) then
       showmessage('Не удалось переименовать '+Table2.Tablename+' в '+OpenDialog1.FileName);
       //       RenameFile
       Table1.Tablename:= OpenDialog1.FileName;
       Table1.active:=True;
end;

procedure TForm1.MdelAllClick(Sender: TObject);
var rdir,newname:string;
var usego: integer;
begin
// Очистить
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
if FileExists('Temp.dbf') then
//  if MessageDlg('Do you really want to delete ' + ExtractFileName(FileName) + '?'), []) = IDYes then
    DeleteFile('Temp.dbf');
   usego:= Table1.RecordCount;
    Table1.active:=False;
      with BatchMove1 do
       begin
          Source := Table1;
          Table2.Tablename:='Temp.dbf';
          Table2.DatabaseName:=Table1.DatabaseName;
          if usego > 0 then RecordCount:=1;
          Destination := Table2;
          Mode := batCopy;
          Execute;
       end;
       if usego > 0 then
       begin
          Table1.active:=False;
          Table2.active:=True;
          Table2.Delete;
          Table2.active:=False;
       end;
      with BatchMove1 do
       begin
          Source := Table2;
          Destination := Table1;
          Mode := batCopy;
          Execute;
       end;
       Session.Close; // CloseDataBase;
       Table1.active:=True;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
 Form1.ListBox1.Items.Clear;
 Form1.ComboBox1.Items.Clear;
end;

procedure TForm1.DosWinClick(Sender: TObject);
// dos- win
var stroka,dstroka,tek:string;
var   F: TFieldDef;
var ii:integer;
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
                Table1.First;
                 while not Table1.Eof do
                begin
                   Table1.Edit;
                   for ii := 0 to Table1.FieldCount - 1 do
                   begin
                       F := Table1.FieldDefs.Items[ii];
                       If F.DataType = ftString Then
                       begin
                         Tek:=Table1.Fields[ii].FieldName;
                          Stroka:= Trim(Table1.FieldByName(Tek).AsString);
                          if length(stroka) <> 0 then
                          begin
                             Dstroka:=Stroka;
                             OemToChar(PChar(Stroka),PChar(DStroka));
                              //OemToChar DOS->WIN CharToOem WinToDos
                             Table1.Fields[ii].Value:=DStroka;
                          end;
                       end;
                   end;
                   Table1.Post;
                   Table1.Next;
                 end;
                 Table1.First;
end;

procedure TForm1.MdellIndClick(Sender: TObject);
// Удалить индексный
// обнуляем признак наличия индексного-файла
var
 FileHandler : Integer;
 Buf : Byte;
 newname: string;
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
 Table1.active:=false;
 Table1.IndexName:='';
 Session.Close;
 Buf := 3;
 FileHandler:=FileOpen(Table1.TableName,fmOpenWrite);
 try
  FileSeek(FileHandler,0,0);
  FileWrite(FileHandler,Buf,1); // обнуляем признак наличия CDX-файла
  Buf :=0;
  FileSeek(FileHandler,28,0);
  FileWrite(FileHandler,Buf,1); // обнуляем признак наличия CDX-файла
 finally
  FileClose(FileHandler);
 end;
  newname:=ChangeFileExt(Table1.Tablename, '.CDX');
  DeleteFile(newname);
  Form1.ComboBox1.Items.Clear;
  Form1.ComboBox1.Items.Add('No Index');
  Table1.active:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
// Удалить группу
 if table1.active then
 begin
     if MessageDlg('Удалить выделенные записи ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dbgrid1.SelectedRows.Delete;
 end;
end;

procedure TForm1.WINDOSClick(Sender: TObject);
// WinToDos
var stroka,dstroka,tek:string;
var   F: TFieldDef;
var ii:integer;
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
                Table1.First;
                 while not Table1.Eof do
                begin
                   Table1.Edit;
                   for ii := 0 to Table1.FieldCount - 1 do
                   begin
                       F := Table1.FieldDefs.Items[ii];
                       If F.DataType = ftString Then
                       begin
                         Tek:=Table1.Fields[ii].FieldName;
                          Stroka:= Trim(Table1.FieldByName(Tek).AsString);
                          if length(stroka) <> 0 then
                          begin
                             Dstroka:=Stroka;
                             CharToOem(PChar(Stroka),PChar(DStroka));
                              //OemToChar DOS->WIN CharToOem WinToDos
                             Table1.Fields[ii].Value:=DStroka;
                          end;
                       end;
                   end;
                   Table1.Post;
                   Table1.Next;
                 end;
                 Table1.First;

end;

procedure TForm1.MzapClick(Sender: TObject);
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
     MdelAllClick(Sender);
     MpackClick(Sender);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 if Form1.ListBox1.Items.Count = 0 then
 begin
  ShowMessage('Сначало выберите таблицу, а уж потом...');
  exit;
 end;
     MdelAllClick(Sender);
     MpackClick(Sender);
     MdellIndClick(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
var rtext,rpole:string;
begin
 // поиск по полю
 Rtext:=Edit2.Text;
 Rpole:=Table1.Fields[ComboBox2.ItemIndex].FieldName;
 Dbgrid1.visible:=False;
 Isk(Table1,Rtext, Rpole);
 Dbgrid1.visible:=True;
end;

end.

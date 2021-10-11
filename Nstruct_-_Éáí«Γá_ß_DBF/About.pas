unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, OleServer, Outlook8;

type
  TAboutBox = class(TForm)
    btnOK: TButton;
    Comments: TLabel;
    Copyright: TLabel;
    ProgramIcon: TImage;
    Label1: TLabel;
    ProductName: TLabel;
    Bevel1: TBevel;
    procedure CopyrightClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CommentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}
uses ShellAPI;

function CurrentFileInfo(NameApp : string) : string;
var dump: DWORD;
    size: integer;
    buffer: PChar;
    VersionPointer, TransBuffer: PChar;
    Temp: integer;
    CalcLangCharSet: string;
begin
  size := GetFileVersionInfoSize(PChar(NameApp), dump);
  buffer := StrAlloc(size+1);
  try
   GetFileVersionInfo(PChar(NameApp), 0, size, buffer);

   VerQueryValue(buffer, '\VarFileInfo\Translation', pointer(TransBuffer),
dump);
   if dump >= 4 then
    begin
     temp:=0;
     StrLCopy(@temp, TransBuffer, 2);
     CalcLangCharSet:=IntToHex(temp, 4);
     StrLCopy(@temp, TransBuffer+2, 2);
     CalcLangCharSet := CalcLangCharSet+IntToHex(temp, 4);
    end;

   VerQueryValue(buffer, pchar('\StringFileInfo\'+CalcLangCharSet+
             '\'+'FileVersion'), pointer(VersionPointer), dump);
   if (dump > 1) then
    begin
     SetLength(Result, dump);
     StrLCopy(Pchar(Result), VersionPointer, dump);
    end
   else Result := '0.0.0.0';
  finally
    StrDispose(Buffer);
  end;
end;


procedure TAboutBox.CopyrightClick(Sender: TObject);
var sa: string;
begin
//
 sa := 'mailto:gorohov@narod.ru?Subject=NStruct '+
  Label1.Caption+'&Body=Здравствуйте Юрий Николаевич !'+' '#13' '+' ';
  ShellExecute(self.Handle,nil, pchar(sa),
 nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var
 s: string;
Begin
 s:=ExpandFileName(Application.ExeName);
 s:=DateTimeToStr(FileDateToDateTime(FileAge(s))); // FileGetDate
 s:=s+'  # '+CurrentFileInfo(Application.ExeName);
 Label1.Caption:='Версия от '+S;
end;

procedure TAboutBox.CommentsClick(Sender: TObject);
begin
 ShellExecute(self.Handle,nil, 'http://gorohov.narod.ru/index.htm', nil, nil, SW_SHOWNORMAL);
end;

end.


unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

end.
  unit Email;
interface
uses Windows, SusUtils, Classes;
function SendEmail(const RecipName, RecipAddress, Subject, Attachment: string): Boolean;
function IsOnline: Boolean;
implementation
uses
 Mapi;
function SendEmail(const RecipName, RecipAddress, Subject, Attachment: string): Boolean;
var  MapiMessage: TMapiMessage;
  MapiFileDesc: TMapiFileDesc;
  MapiRecipDesc: TMapiRecipDesc;
  i: integer;
  s: string;
begin
  with MapiRecipDesc do
 begin
      ulRecerved:= 0;
      ulRecipClass:= MAPI_TO;
     lpszName:= PChar(RecipName);
     lpszAddress:= PChar(RecipAddress);
     ulEIDSize:= 0;
     lpEntryID:= nil;
  end;
 with MapiFileDesc do
 begin
      ulReserved:= 0;
      flFlags:= 0;
      nPosition:= 0;
      lpszPathName:= PChar(Attachment);
      lpszFileName:= nil;
     lpFileType:= nil;
  end;
  with MapiMessage do
  begin
      ulReserved := 0;
      lpszSubject := nil;
      lpszNoteText := PChar(Subject);
      lpszMessageType := nil;
      lpszDateReceived := nil;
      lpszConversationID := nil;
      flFlags := 0;
      lpOriginator := nil;
      nRecipCount := 1;
      lpRecips := @MapiRecipDesc;
      if length(Attachment) > 0 then
      begin
          nFileCount:= 1;
          lpFiles := @MapiFileDesc;
      end
      else
      begin
          nFileCount:= 0;
         lpFiles:= nil;
      end;
    end;
  Result:= MapiSendMail(0, 0, MapiMessage, MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0) =
SUCCESS_SUCCESS;
end;
function IsOnline: Boolean;
var  RASConn: TRASConn;
  dwSize,dwCount: DWORD;
begin
  RASConns.dwSize:= SizeOf(TRASConn);
  dwSize:= SizeOf(RASConns);
  Res!:=RASEnumConnectionsA(@RASConns, @dwSize, @dwCount);
  Result:= (Res = 0) and (dwCount > 0);
end;
end.

program NStruct;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  About in 'About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Browse DBF';
  Application.CreateForm(TForm1, Form1);
//  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.

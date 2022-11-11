program pe_example;

uses
  Forms,
  UMain in '..\example\UMain.pas' {Form28},
  pic_empty in '..\source\pic_empty.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm28, Form28);
  Application.Run;
end.

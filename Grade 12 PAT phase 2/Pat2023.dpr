program Pat2023;

uses
  Forms,
  frm_Login in 'frm_Login.pas' {Form1},
  dm_CO2 in 'dm_CO2.pas' {DMCO2: TDataModule},
  u_SignIn in 'u_SignIn.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMCO2, DMCO2);
  Application.Run;
end.

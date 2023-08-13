program Pat2023;

uses
  Forms,
  u_Login in 'u_Login.pas' {Form1},
  dm_CO2 in 'dm_CO2.pas' {DMCO2: TDataModule},
  u_SignIn in 'u_SignIn.pas',
  u_Signup in 'u_Signup.pas' {frmSignup},
  u_Cars in 'u_Cars.pas' {frm_Cars},
  u_organisation in 'u_organisation.pas' {frmOrganisation};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMCO2, DMCO2);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(Tfrm_Cars, frm_Cars);
  Application.CreateForm(TfrmOrganisation, frm_Organisation);
  Application.Run;
end.

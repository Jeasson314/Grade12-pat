program Pat2023;

uses
  Forms,
  u_Login in 'u_Login.pas' {Form1},
  dm_CO2 in 'dm_CO2.pas' {DMCO2: TDataModule},
  u_SignIn in 'u_SignIn.pas',
  u_Signup in 'u_Signup.pas' {frmSignup},
  u_Cars in 'u_Cars.pas' {frm_Cars},
  u_organisation in 'u_organisation.pas' {frmOrganisation},
  u_User in 'u_User.pas' {frm_Users},
  u_graph in 'u_graph.pas' {Form3},
  u_UserNormal in 'u_UserNormal.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AApplication.CreateForm(TForm1, Form1);
  AApplication.CreateForm(TDMCO2, DMCO2);
  AApplication.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(Tfrm_Cars, frm_Cars);
  Application.CreateForm(Tfrm_Organisation, frm_Organisation);
  Application.CreateForm(Tfrm_Users, frm_Users);
  Application.CreateForm(TForm3, Form3);
  lication.Run;
end.

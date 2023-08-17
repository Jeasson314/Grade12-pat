program Pat2023;

uses
  Forms,
  u_Login in 'u_Login.pas' {frm_Login},
  dm_CO2 in 'dm_CO2.pas' {DMCO2: TDataModule},
  u_SignIn in 'u_SignIn.pas',
  u_Signup in 'u_Signup.pas' {frm_Signup},
  u_Cars in 'u_Cars.pas' {frm_Cars},
  u_organisation in 'u_organisation.pas' {frmOrganisation},
  u_User in 'u_User.pas' {frm_Users},
  u_graph in 'u_graph.pas' {frm_Graph},
  u_UserNormal in 'u_UserNormal.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.CreateForm(TDMCO2, DMCO2);
  Application.CreateForm(Tfrm_Signup, frm_Signup);
  Application.CreateForm(Tfrm_Cars, frm_Cars);
  Application.CreateForm(TfrmOrganisation, frm_Organisation);
  Application.CreateForm(Tfrm_Users, frm_Users);
  Application.CreateForm(Tfrm_Graph, frm_Graph);
  Application.Run;
end.

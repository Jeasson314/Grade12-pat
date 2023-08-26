program Pat2023;

uses
  Forms,
  u_Login in '.\Units\u_Login.pas' {frm_Login},
  dm_CO2 in '.\Units\dm_CO2.pas' {DMCO2: TDataModule},
  u_SignIn in '.\Units\u_SignIn.pas',
  u_Signup in '.\Units\u_Signup.pas' {frm_Signup},
  u_Cars in '.\Units\u_Cars.pas' {frm_Cars},
  u_organisation in '.\Units\u_organisation.pas' {frm_Organisation},
  u_User in '.\Units\u_User.pas' {frm_Users},
  u_graph in '.\Units\u_graph.pas' {frm_Graph},
  u_UserNormal in '.\Units\u_UserNormal.pas',
  u_passwordhasher in '.\Units\u_passwordhasher.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.CreateForm(TDMCO2, DMCO2);
  Application.CreateForm(Tfrm_Signup, frm_Signup);
  Application.CreateForm(Tfrm_Cars, frm_Cars);
  Application.CreateForm(Tfrm_Organisation, frm_Organisation);
  Application.CreateForm(Tfrm_Users, frm_Users);
  Application.CreateForm(Tfrm_Graph, frm_Graph);
  Application.Run;
end.

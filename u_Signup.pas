unit u_Signup;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, u_SignIn, u_Organisation, u_Cars,
  ComCtrls;

type
  Tfrm_Signup = class(TForm)
    btnSignup: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtFirst_name: TEdit;
    edtLast_name: TEdit;
    btnGenerate_name: TButton;
    Label2: TLabel;
    pnlUsername: TPanel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    redoutCarsSignup: TRichEdit;
    GroupBox3: TGroupBox;
    pnlOrganisation: TPanel;
    btnOrganisation: TButton;
    redoutOrganisation: TRichEdit;
    ChkOrganisation: TCheckBox;
    Label3: TLabel;
    edtPasswordOriginal: TEdit;
    Label4: TLabel;
    edtPasswordSecond: TEdit;
    Panel1: TPanel;
    edtEmail: TEdit;
    edtPersonalgoal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnGenerate_nameClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure btnOrganisationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ChkOrganisationClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frm_Signup: Tfrm_Signup;
  objSignup: SignUp;

implementation

{$R *.dfm}

procedure Tfrm_Signup.btnGenerate_nameClick(Sender: TObject);
var
  sFirstname, sLastname: string;
begin
  sFirstname := edtFirst_name.Text;
  sLastname := edtLast_name.Text;

  pnlUsername.Caption := objSignup.UsernameGeneration(sFirstname, sLastname);
end;

procedure Tfrm_Signup.btnOrganisationClick(Sender: TObject);
begin
  frm_Organisation.ShowModal;
end;

procedure Tfrm_Signup.btnSignupClick(Sender: TObject);
begin
  if objSignup.passwordvalidate(edtPasswordOriginal.Text,
    edtPasswordSecond.Text) = true then
begin
    objSignup.addPassword(edtPasswordOriginal.Text);
    objSignup.addEmailGoal(edtEmail.Text, edtPersonalgoal.Text);
    if objSignup.addUser = true then
      frm_Signup.Close;
end
  else
  begin
    MessageDlg('Please check your password', mtWarning, [mbOk], 0);
  end;

end;

procedure Tfrm_Signup.Button1Click(Sender: TObject);
begin
  frm_Cars.ShowModal;
end;

procedure Tfrm_Signup.ChkOrganisationClick(Sender: TObject);
begin
  if ChkOrganisation.Checked then
  begin
    pnlOrganisation.Visible := true;
    objSignup.IsMember(true);
  end
  else
  begin
    objSignup.IsMember(false);
    pnlOrganisation.Visible := false;
  end;

end;

procedure Tfrm_Signup.FormActivate(Sender: TObject);
begin
  objSignup := SignUp.create();
end;

end.

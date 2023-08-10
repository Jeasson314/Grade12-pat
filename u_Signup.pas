unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, u_SignIn,u_Organisation,u_Cars;

type
  TfrmSignup = class(TForm)
    edtFirst_name: TEdit;
    edtLast_name: TEdit;
    pnlUsername: TPanel;
    btnGenerate_name: TButton;
    edtPasswordOriginal: TEdit;
    Label1: TLabel;
    btnOrganisation: TButton;
    Button1: TButton;
    tdb_organisation: TDBEdit;
    edtPasswordSecond: TEdit;
    btnSignup: TButton;
    procedure btnGenerate_nameClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure btnOrganisationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;
  objSignup: SignUp;

implementation

{$R *.dfm}

procedure TfrmSignup.btnGenerate_nameClick(Sender: TObject);
var
  sFirstname, sLastname: string;
begin
  sFirstname := edtFirst_name.Text;
  sLastname := edtLast_name.Text;
  objSignup := SignUp.create();
  pnlUsername.Caption := objSignup.UsernameGeneration;
end;

procedure TfrmSignup.btnOrganisationClick(Sender: TObject);
begin
frm_Organsiation.ShowModal;
end;

procedure TfrmSignup.btnSignupClick(Sender: TObject);
begin
  if objSignup.passwordvalidate(edtPasswordOriginal.Text,
    edtPasswordSecond.Text) = true then
    objSignUp.addPassword(edtPasswordOriginal.Text)
  else
    MessageDlg('Please check your password', mtWarning, [mbOk], 0);
end;

procedure TfrmSignup.Button1Click(Sender: TObject);
begin
frm_Cars.ShowModal;
end;

end.

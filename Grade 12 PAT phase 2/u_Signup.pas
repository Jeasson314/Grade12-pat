unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, u_SignIn;

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
    DBMemo1: TDBMemo;
    tdb_organisation: TDBEdit;
    edtPasswordSecond: TEdit;
    btnSignup: TButton;
    procedure btnGenerate_nameClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
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
  objSignup := SignUp.create(sFirstname, sLastname);
  pnlUsername.Caption := objSignup.UsernameGeneration;
end;

procedure TfrmSignup.btnSignupClick(Sender: TObject);
begin
  if objSignup.passwordvalidate(edtPasswordOriginal.Text,
    edtPasswordSecond.Text) = true then
    SignUp.addPassword(edtPasswordOriginal.Text)
  else
    MessageDlg('Please check your password', mtWarning, [mbOk], 0);
end;

end.

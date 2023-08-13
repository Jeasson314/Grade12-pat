unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, u_SignIn, u_Organisation, u_Cars,
  ComCtrls;

type
  TfrmSignup = class(TForm)
    btnSignup: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtFirst_name: TEdit;
    edtLast_name: TEdit;
    btnGenerate_name: TButton;
    Label2: TLabel;
    pnlUsername: TPanel;
    GroupBox2: TGroupBox;
    btnOrganisation: TButton;
    Button1: TButton;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    edtPasswordOriginal: TEdit;
    edtPasswordSecond: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnGenerate_nameClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure btnOrganisationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

  pnlUsername.Caption := objSignup.UsernameGeneration;
end;

procedure TfrmSignup.btnOrganisationClick(Sender: TObject);
begin
  frm_Organisation.ShowModal;
end;

procedure TfrmSignup.btnSignupClick(Sender: TObject);
begin
  if objSignup.passwordvalidate(edtPasswordOriginal.Text,
    edtPasswordSecond.Text) = true then
    objSignup.addPassword(edtPasswordOriginal.Text)
  else
    MessageDlg('Please check your password', mtWarning, [mbOk], 0);
end;

procedure TfrmSignup.Button1Click(Sender: TObject);
begin
  frm_Cars.ShowModal;
end;

procedure TfrmSignup.FormActivate(Sender: TObject);
begin
 objSignup := SignUp.create();
end;

end.

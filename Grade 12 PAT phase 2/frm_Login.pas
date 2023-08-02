unit frm_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtPassword: TEdit;
    btnSignin: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CHKCookie: TCheckBox;
    edtUsername: TEdit;
    procedure btnSigninClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  // objSignin: SignIn;
  tfCookie: textfile;

implementation

uses u_SignIn;
{$R *.dfm}

procedure TForm1.btnSigninClick(Sender: TObject);
var
  sHashed_password, sUsername: string;
begin

  try
    Signin.SetLogin(edtUsername.Text, edtPassword.Text);
    if PasswordCheck = true then

      finally
        if edtUsername.Text = '' then
          MessageDlg('Please type in a username or create an account.',
            mtWarning, [mbOk], 0);
        if edtPassword.Text = '' then
          MessageDlg('Please type in a password.', mtWarning, [mbOk], 0);
        edtPassword.Color := clRed
      end;
    // showmessage((hash(edtPassword.Text)));
  end;

  procedure TForm1.FormActivate(Sender: TObject);
  begin
    try
      assignfile(tfCookie, '.Textfile/tfUserCookie.txt');
      reset(tfCookie);
      if readln(tfCookie) = '' then
        exit
      else
        finally

        end;
    end;

end.

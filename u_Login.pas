unit u_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,u_SignIn, StdCtrls,u_Signup;

type
  TForm1 = class(TForm)
    Button1: TButton;
    CHKCookie: TCheckBox;
    btnSignin: TButton;
    edtPassword: TEdit;
    edtUsername: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    procedure btnSigninClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  objSignin: SignIn;
  tfCookie: textfile;

implementation

{$R *.dfm}

procedure TForm1.btnSigninClick(Sender: TObject);
var
  sHashed_password, sUsername: string;
begin

  try
    objSignin.SetLogin(edtUsername.Text, edtPassword.Text);
    if objSignin.PasswordCheck = true then

      finally
        {if edtUsername.Text = '' then
          MessageDlg('Please type in a username or create an account.',
            mtWarning, [mbOk], 0);
        if edtPassword.Text = '' then
          MessageDlg('Please type in a password.', mtWarning, [mbOk], 0);
        edtPassword.Color := clRed}
      end;
    // showmessage((hash(edtPassword.Text)));
  end;

  procedure TForm1.Button1Click(Sender: TObject);
begin
frmSignup.ShowModal;
end;

procedure TForm1.FormActivate(Sender: TObject);
  var sReadln:string;
  begin
    try
      objSignin := SignIn.create();
      assignfile(tfCookie, 'tfUserCookie.txt');
      reset(tfCookie);
      readln(tfCookie,sReadln);
      if  sReadln= '' then
          exit

      else
      edtUsername.Text:=sReadln;
      readln(tfCookie,sReadln);
      edtPassword.text:=sReadln;
      closefile(tfCookie)
        finally

        end;
    end;

eprocedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

nd.

unit frm_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,u_SignIn;

type
  TForm1 = class(TForm)
    edtPassword: TEdit;
    btnSignin: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CHKCookie: TCheckBox;
    procedure btnSigninClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;

implementation
 uses u_passwordhasher;
{$R *.dfm}

procedure TForm1.btnSigninClick(Sender: TObject);
var sHashed_password,sUsername:string;
begin

try

finally
end;
showmessage((hash(edtPassword.Text)));
end;

end.

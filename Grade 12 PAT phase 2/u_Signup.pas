unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls,u_SignIn;

type
  TfrmSignup = class(TForm)
    edtFirst_name: TEdit;
    edtLast_name: TEdit;
    pnlUsername: TPanel;
    btnGenerate_name: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    btnOrganisation: TButton;
    Button1: TButton;
    DBMemo1: TDBMemo;
    tdb_organisation: TDBEdit;
    Edit1: TEdit;
    procedure btnGenerate_nameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;
  objSignup: SignUp;

implementation

{$R *.dfm}

procedure TfrmSignup.btnGenerate_nameClick(Sender: TObject);
var sFirstname,sLastname:string;
begin
sFirstname:=edtFirst_name.Text;
sLastname:=edtLast_name.Text;
objSignup:=signup.create(sFirstname,sLastname) ;
end;

end.

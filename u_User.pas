unit u_User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,u_SignIn,dm_co2,u_UserNormal,u_Signup;

type
  Tfrm_Users = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    btnGraph: TButton;
    DBGridUsers: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Users: Tfrm_Users;
  objUser:Signup;
  objUserdata: UserData;

implementation

{$R *.dfm}

procedure Tfrm_Users.FormActivate(Sender: TObject);
begin
objUser:=UserData.Usercreate(SignIn.AccessUsername);
if objuser.isFirstAccess=true then

end;

end.

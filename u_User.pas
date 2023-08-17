unit u_User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, u_SignIn, dm_co2,
  u_UserNormal, u_Signup,u_graph;

type
  Tfrm_Users = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    btnGraph: TButton;
    DBGridUsers: TDBGrid;
    Edit1: TEdit;
    Panel1: TPanel;
    pnlFirst: TPanel;
    Edit2: TEdit;
    edtMileage: TEdit;
    Label1: TLabel;
    btnAdd: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Users: Tfrm_Users;
  objUser: Signup;
  objUserdata: UserData;

implementation
 uses u_Login;
{$R *.dfm}

procedure Tfrm_Users.btnGraphClick(Sender: TObject);
begin
frm_Graph.ShowModal;
end;

procedure Tfrm_Users.FormActivate(Sender: TObject);
begin
  objUserdata := UserData.Usercreate(u_Login.objSignin.AccessUsername);
  if objUserdata.isFirstAccess = true then
    pnlFirst.Visible := true
  else
    pnlFirst.Visible := true

end;

end.

unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

end.

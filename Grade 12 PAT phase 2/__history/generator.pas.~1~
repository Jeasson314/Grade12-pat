unit generator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
const hashcharacters:string=('1234567890qwertyuioplkjhgfdsazxcvbnmQAZXSWEDCVFRTGBNHYUJMKILOP');
{$R *.dfm}
var arrvalues:array[1..8836] of string;
    iloop,iloop2,location:integer;
    value:string;
procedure TForm1.Button1Click(Sender: TObject);
begin
 for iloop := 1 to 8836 do
 begin
      value:=copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1);
      showmessage(value);
      arrvalues[iloop]:=value;
 end;
 showmessage('Hi')
end;

procedure TForm1.FormActivate(Sender: TObject);
begin


  //



  end;

end.

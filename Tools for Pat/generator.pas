 unit generator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
var arrvalues:array[1..8930] of string;
    iloop,iloop2,iloop3,irichedit,irichedit1,check,location:integer;
    value:string;
    password:textfile;
procedure TForm1.Button1Click(Sender: TObject);
begin
 for iloop := 1 to 8930 do
 begin
      value:=copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1);
      arrvalues[iloop]:=value;
 end;
 showmessage('Hi');
  for iloop2 := 1 to 8930 - 1 do
    for iloop3 := 1 to 8930 - 1 do
      if arrvalues[iloop2]=arrvalues[iloop3] then
        begin
          value:=copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1)+copy(hashcharacters,random(62),1);
          arrvalues[iloop3]:=value
        end;
        check:=1;
 value:='';
 richedit1.Lines.Add('const Matrix : array[0..7, 0..7] of String =');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
assignfile(password,'Generated password.txt');
rewrite(password);
iloop2:=1;
for iloop := 1 to 94 do
begin
value:='(';
for iloop3 := 1 to 94 do
begin
value:=value+quotedstr(arrvalues[iloop3*iloop])+',';
end;
value:=value+'),';
richedit1.Lines.Add(value);
writeln(password,value);
end;
showmessage('Done');
closefile(password);
end;
end.

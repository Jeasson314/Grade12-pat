program password;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const arrconvert : array[32] of array[32..126] of byte=('');
  var chrpassword:char;
      ifirst,isecond:integer;
begin
  try
  readln(chrpassword);
  writeln(inttostr(Ord(chrpassword)));
  readln;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

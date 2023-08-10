unit u_SignIn;

interface

uses
  u_passwordhasher, dm_CO2, Dialogs, Forms, sysUtils;

type
  SignIn = class(tObject)
  private
    fUsername: String;
    fPassword: string;
    fAttempts: integer;
  public
    constructor create;
    procedure SetLogin(sUsername, sPassword: string);
    Function PasswordCheck: boolean;
  end;

  Signup = class(tObject)
  private
    fFirst_name: string;
    fLast_name: string;
    fUsername: string;
    fPassword: string;
  public
    constructor create();
    function UsernameGeneration: string;
    function passwordvalidate(sPasswordOrginal, sPasswordSecond: string)
      : boolean;
    procedure addPassword(sPassword:string);
  end;

implementation

{ SignIn }

constructor SignIn.create();
begin
  fUsername := '';
  fPassword := '';
  fAttempts := 0;
end;

function SignIn.PasswordCheck: boolean;
begin
  if fAttempts <= 3 then
  begin
    with dmCO2 do
    begin
      ADOUsers.first;
      while not ADOUsers.eof do
      begin
        if (fUsername = ADOUsers['Username']) and
          (hash(fPassword) = ADOUsers['Password']) then
          result := true
        else
          ADOUsers.Next;
      end;
      result := false;
      inc(fAttempts);
      MessageDlg('Please check your username and password.', mtWarning, [mbOk],
        0);
      exit;
    end;

  end
  else
    MessageDlg('Maxmium number of attempts reached. Terminating program.',
      mtError, [mbOk], 0);
  application.Terminate;

end;

procedure SignIn.SetLogin(sUsername, sPassword: string);
begin
  fUsername := sUsername;
  fPassword := sPassword;
end;

{ Signup }

procedure Signup.addPassword(sPassword:string);
begin
  fPassword := sPassword;
end;

constructor Signup.create();
begin
    fFirst_name:='';
    fLast_name:='';

end;

function Signup.passwordvalidate(sPasswordOrginal, sPasswordSecond: string): boolean;
var
  icharacterloop: integer;
  chrPassword: char;
  bSpecialchr, bNumber, bCapital: boolean;
begin
  bNumber := false;
  bSpecialchr := false;
  bCapital:=false;
  if (sPasswordOrginal = '') or (sPasswordSecond = '') then
  begin
    result := false;
    MessageDlg('Please type in a password', mtWarning, [mbOk], 0);
    exit;
  end
  else
    result := true;

  if sPasswordOrginal = sPasswordSecond then
    result := true
  else
    result := false;
  exit;
  MessageDlg('Password must match', mtWarning, [mbOk], 0);
  if length(sPasswordOrginal) < 8 then
  begin
    result := false;
    MessageDlg('Please make sure your password is more than 8 character long',
      mtWarning, [mbOk], 0);
    exit;
  end
  else
    result := true;
  for icharacterloop := 1 to length(sPasswordOrginal) do
    chrPassword := sPasswordOrginal[icharacterloop];
  case ord(chrPassword) of
    48 .. 57:
      bNumber := true;
    58 .. 64:
      bSpecialchr := true;
    92 .. 96:
      bSpecialchr := true;
    123, 125:
      bSpecialchr := true;
    65 .. 90:
      bCapital := true;

  end;
  if bNumber = false then
    MessageDlg('Please use a number in your password', mtWarning, [mbOk], 0);
  result := false;
  if bSpecialchr = false then
    MessageDlg('Please use a special character(Such as "@") in your password',
      mtWarning, [mbOk], 0);
  result := false;
  if bCapital = false then
    MessageDlg('Please use a capital letter in your password in your password',
      mtWarning, [mbOk], 0);
  result := false;

end;

function Signup.UsernameGeneration: string;
begin
  fUsername := fFirst_name + fLast_name + inttostr(random(100));
  result := fUsername;
end;

end.

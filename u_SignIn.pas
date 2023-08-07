unit u_SignIn;

interface

uses
  u_passwordhasher, dm_CO2, Dialogs, Forms,sysUtils;

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
  Signup= class(tObject)
    private
    fFirst_name:string;
    fLast_name:string;
    fUsername:string;
    fPassword:string;
    public
    constructor create(sFirst_name,sLast_name:string);
    function UsernameGeneration:string;
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

constructor Signup.create(sFirst_name, sLast_name: string);
begin
fFirst_name:=sFirst_name;
fLast_name:=sLast_name;
end;

function Signup.UsernameGeneration: string;
begin
fUsername:=fFirst_name+fLast_name+inttostr(random(100));
end;

end.

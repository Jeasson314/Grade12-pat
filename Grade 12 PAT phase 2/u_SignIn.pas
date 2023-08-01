unit u_SignIn;

interface

uses
  u_passwordhasher, dm_CO2;

type
  SignIn = class(tObject)
  private
    fFirst_name: string;
    flast_name: string;
    fUsername: String;
    fPassword: string;
    fAttempts: string;
  public
    procedure SetLogin(sUsername, sPassword: string);
    Function PasswordCheck: boolean;
  end;

implementation

{ SignIn }

function SignIn.PasswordCheck: boolean;
begin
  with dmCO2 do
  begin
    ADOUsers.first;
    while not ADOUsers.eof do
    begin
      if (hash(fPassword) = ADOUsers['Password']) and
        (fUsername = ADOUsers['Username']) then
        result:='true';
      end;
      // while dmCO2.tblUser.Eof do

    end;
  end;

  procedure SignIn.SetLogin(sUsername, sPassword: string);
  begin
    fUsername := sUsername;
    fPassword := sPassword;
  end;

end.

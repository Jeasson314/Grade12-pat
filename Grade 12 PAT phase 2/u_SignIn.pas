unit u_SignIn;

interface

uses
  u_passwordhasher, dm_CO2, Dialogs, Forms;

type
  SignIn = class(tObject)
  private
    fFirst_name: string;
    flast_name: string;
    fUsername: String;
    fPassword: string;
    fAttempts: integer;
  public
    procedure SetLogin(sUsername, sPassword: string);
    Function PasswordCheck: boolean;
  end;

implementation

{ SignIn }

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

end.

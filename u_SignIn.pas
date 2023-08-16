unit u_SignIn;
interface

uses
  u_passwordhasher, dm_CO2, Dialogs, Forms, sysUtils, StrUtils;

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
    fArraylength: integer;
    fFirst_name: string;
    fLast_name: string;
    fUsername: string;
    fPassword: string;
    fCarsID: string;
    fCarsModel: string;
    fCarsMake: string;
    fOrganisation: string;
    fOrganisationID: integer;
    fIsAdmin: boolean;
    fIsMember: boolean;
    fEmail: string;
    fGoal: integer;
  public
    arrCar: Array of integer;
    constructor create();
    function UsernameGeneration(sFirst_name, sLast_name: string): string;
    function passwordvalidate(sPasswordOrginal, sPasswordSecond: string)
      : boolean;
    procedure addPassword(sPassword: string);
    procedure addCar(sCarsID, sCarsMake, sCarsModel: string);
    function CarsToString(): string;
    procedure addOrganisation(sOrgaganisationID: integer;
      sOrganisation: string; bIsAdmin: boolean);
    function Organisationtostring(): string;
    procedure IsMember(bMember: boolean);
    procedure addEmailGoal(sEmail: string; sGoal: string);
    function addUser(): boolean;
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

procedure Signup.addCar(sCarsID, sCarsMake, sCarsModel: string);
begin
  inc(fArraylength);
  setlength(arrCar, fArraylength);
  arrCar[fArraylength] := strtoint(sCarsID);
  fCarsModel := fCarsModel + ',' + sCarsModel;
  fCarsMake := fCarsMake + ',' + sCarsMake;
end;

procedure Signup.addEmailGoal(sEmail, sGoal: string);
begin
  if ansipos('@', sEmail) > 0 then
  begin
    try
      fEmail := sEmail;
      fGoal := strtoint(sGoal);
    except
      showmessage('Please check that you have typed in number in the goal box');
    end
  end
  else
    showmessage('Please type in a valid email')

end;

procedure Signup.addOrganisation(sOrgaganisationID: integer;
  sOrganisation: string; bIsAdmin: boolean);
begin
  fOrganisation := sOrganisation;
  fOrganisationID := sOrgaganisationID;
  fIsAdmin := bIsAdmin;
end;

procedure Signup.addPassword(sPassword: string);
begin
  fPassword := hash(sPassword);
end;

function Signup.addUser: boolean;
var
  sCarIDtemp: string;
  iUserID, iloop: integer;
  bFound: boolean;
begin
  try
    with dmCO2 do
    begin
      if ADOUsers.Active then
      begin
        ADOUsers.Insert;

        ADOUsers['First_name'] := fFirst_name;
        ADOUsers['Last_name'] := fLast_name;
        ADOUsers['Username'] := fUsername;
        ADOUsers['Password'] := fPassword;
        ADOUsers['OrganisationID'] := fOrganisationID;
        ADOUsers['Admin'] := fIsAdmin;
        ADOUsers['OrganisationMembership'] := fIsMember;
        ADOUsers['Goal'] := fGoal;
        ADOUsers['Email'] := fEmail;
        ADOUsers.post;
      end;
      ADOUsers.first;
      bFound := true;
      while (not ADOUsers.eof) and (bFound = false) do
        if ADOUsers['Username'] = fUsername then
        begin
          iUserID := ADOUsers['UserID'];
          bFound := false;
        end
        else
          ADOUsers.Next;
    end;

    for iloop := 1 to fArraylength do
    begin
      dmCO2.ADOCarList.Insert;
      dmCO2.ADOCarList['UserID'] := iUserID;
      dmCO2.ADOCarList['CarID'] := arrCar[iloop];
      dmCO2.ADOCarList.post;
    end;

    result := true except showmessage(
      'There was an error trying to add new user')
  end;
end;

function Signup.CarsToString: string;
begin
  result := 'Make: ' + fCarsMake + #13 + 'Model: ' + fCarsModel;
end;

constructor Signup.create();
begin
  fFirst_name := '';
  fLast_name := '';
  fCarsID := '';
  fCarsModel := '';
  fCarsMake := '';
  fOrganisation := '';
  fEmail := '';
  fUsername := '';
  fPassword := '';
  fArraylength := 0;
end;

procedure Signup.IsMember(bMember: boolean);
begin
  fIsMember := bMember;
end;

function Signup.Organisationtostring: string;
begin
  result := fOrganisation
end;

function Signup.passwordvalidate(sPasswordOrginal, sPasswordSecond: string)
  : boolean;
var
  icharacterloop: integer;
  chrPassword: char;
  bSpecialchr, bNumber, bCapital: boolean;
begin
  result := true;
  bNumber := false;
  bSpecialchr := false;
  bCapital := false;
  if (sPasswordOrginal = '') or (sPasswordSecond = '') then
  begin
    result := false;
    MessageDlg('Please type in a password or retype password', mtWarning,
      [mbOk], 0);
    exit;
  end
  else
    result := true;

  if sPasswordOrginal = sPasswordSecond then
    result := true
  else
  begin
    result := false;
    MessageDlg('Password must match', mtWarning, [mbOk], 0);
    exit;
  end;
  if length(sPasswordOrginal) < 8 then
  begin
    result := false;
    MessageDlg('Please make sure your password is more than 8 character long',
      mtWarning, [mbOk], 0);
    exit;
  end
  else
  begin
    result := true;
    for icharacterloop := 1 to length(sPasswordOrginal) do
    begin
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
    end;
  end;
  if bNumber = false then
  begin
    MessageDlg('Please use a number in your password', mtWarning, [mbOk], 0);
    result := false;
  end;
  if bSpecialchr = false then
  begin
    MessageDlg('Please use a special character(Such as "@") in your password',
      mtWarning, [mbOk], 0);
    result := false;
  end;
  if bCapital = false then
  begin
    MessageDlg('Please use a capital letter in your password in your password',
      mtWarning, [mbOk], 0);
    result := false;
  end;

end;

function Signup.UsernameGeneration(sFirst_name, sLast_name: string): string;
begin
  fFirst_name := sFirst_name;
  fLast_name := sLast_name;
  fUsername := fFirst_name + fLast_name + inttostr(random(100));
  if dmCO2.ADOUsers.locate('Username', fUsername, []) = true then
    fUsername := fFirst_name + fLast_name + inttostr(random(100));
  result := fUsername;
end;

end.

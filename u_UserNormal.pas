unit u_UserNormal;

interface

uses dm_co2,sysutils;

type
  UserData = class(tObject)
  Private
    fUsername: string;
    fArrCarList: array of array of integer;
    fUserID: integer;
    fisFirst: boolean;
  public
    constructor UserCreate(sUsername: string);
    function isFirstAccess: boolean;
    procedure LoadCar;
    function accessUserId:string;

  end;

implementation

{ UserData }

function UserData.accessUserId: string;
begin
result:=inttostr(fUserID);
end;

function UserData.isFirstAccess: boolean;
begin
  result := fisFirst
end;

procedure UserData.LoadCar;
var
  iCarlength, iColumn: integer;
begin



end;

constructor UserData.UserCreate(sUsername: string);
var
  bFound: boolean;
begin
  fUsername := sUsername;
  with dmco2 do
  begin
    ADOUsers.First;
    bFound := false;
    while (not ADOUsers.Eof) and (bFound = false) do
    begin
      if ADOUsers['Username'] = fUsername then
      begin
        fUserID := ADOUsers['UserID'];
        if ADOUsers['Carbon_Footprint'] = 0 then
          fisFirst := true;

        bFound := true;
      end;
      ADOUsers.Next;

    end;
  end;
end;

end.

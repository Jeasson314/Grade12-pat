unit u_UserNormal;

interface

uses dm_co2, sysutils,DateUtils;

type
  UserData = class(tObject)
  Private
    fUsername: string;
    fArrCarList: array of array of integer;
    fUserID: integer;
    fisFirst: boolean;
    finOrganisation:Boolean;
    fIsAdmin:boolean;
  public
    constructor UserCreate(sUsername: string);
    function isFirstAccess: boolean;
    function accessUserId: string;
    procedure CheckOrganisation;
    function CanDelete(dRecordDate:tdate):boolean;
    function Admin:boolean;
  end;

implementation

{ UserData }

function UserData.accessUserId: string;
begin
  result := inttostr(fUserID);
end;

function UserData.Admin: boolean;
begin
result:=fisAdmin;
end;

function UserData.CanDelete(dRecordDate: tdate): boolean;
begin
if (fInOrganisation=true) and (WithinPastDays(date,dmco2.ADOFootPrint['EmissionDate'],3))
then result:=true
else result:=false;
if fInOrganisation=false then
  result:=true;
end;

procedure UserData.CheckOrganisation;
var
  bFound: boolean;
begin
  with dmco2 do
  begin
    ADOUsers.first;
    bFound := false;
    while not(ADOUsers.eof) and (bFound = false) do
    begin
      if (ADOUsers['UserID'] = accessUserId) then
      begin
    finOrganisation:= ADOUsers['OrganisationMembership'];
    fisAdmin:=ADOUsers['Admin'];
      end
      else
        ADOUsers.next;
    end;
  end;
end;

function UserData.isFirstAccess: boolean;
var
  bFound: boolean;
begin
  with dmco2 do
  begin
    ADOUsers.first;
    bFound := false;
    while not(ADOUsers.eof) and (bFound = false) do
    begin
      if (ADOUsers['UserID'] = accessUserId) then
      begin
      if ADOUsers['Last Updated'].isNull then
      begin
        result:=true;
        bFound := false;
      end;
      end
      else
        ADOUsers.next;
    end;
  end;
end;


constructor UserData.UserCreate(sUsername: string);
var
  bFound: boolean;
begin
  fUsername := sUsername;

end;

end.

unit u_UserNormal;

interface

uses dm_co2, sysutils, DateUtils, Dialogs,forms;

type
  UserData = class(tObject)
  Private
    fUsername: string;
    fUserID: integer;
    fisFirst: boolean;
    finOrganisation: boolean;
    fOrganisationId:integer;
    fIsAdmin: boolean;
     tfLog:textfile;
  public
    constructor UserCreate(sUsername: string);
    function isFirstAccess: boolean;
    function accessUserId: string;
    function AccessOrganisationID:integer;
    procedure CheckOrganisation;
    function CanDelete(dRecordDate: tdate): boolean;
    function Admin: boolean;
    procedure UpdateLog(sLog:string);

  end;
implementation

{ UserData }

function UserData.AccessOrganisationID: integer;
begin
result:= fOrganisationId;
end;

function UserData.accessUserId: string;
begin
  result := inttostr(fUserID);
end;

function UserData.Admin: boolean;
begin
  result := fIsAdmin;
end;

function UserData.CanDelete(dRecordDate: tdate): boolean;
begin
  if (finOrganisation = true) and (WithinPastDays(date,
      dmco2.ADOFootPrint['EmissionDate'], 3)) then
    result := true
  else
    result := false;
  if finOrganisation = false then
    result := true;
end;

procedure UserData.CheckOrganisation;
var
  bFound: boolean;
  // sUs
begin
try
  with dmco2 do
  begin
    ADOUsers.first;
    bFound := false;
    while not(ADOUsers.eof) and (bFound = false) do
    begin
      if (ADOUsers['UserID'] = fUserID) then
      begin
        finOrganisation := ADOUsers['OrganisationMembership'];
        fIsAdmin := ADOUsers['Admin'];
        bFound := true;
      end
      else
        ADOUsers.next;
    end;
  end;
except
showmessage('Their was an error finding admin');
end;
end;

function UserData.isFirstAccess: boolean;
var
  bFound: boolean;
begin
  with dmco2 do
  begin
    ADOUsers.first;
    result:=false;
    bFound := false;
    while not(ADOUsers.eof) and (bFound = false) do
    begin
      if (ADOUsers['UserID'] = fUserID) then
      begin
        if ADOUsers.fieldbyname('Last Updated').isnull then
        begin
          result := true;
          bFound := true;
        end;
      end;
        ADOUsers.next;
    end;
  end;
end;

procedure UserData.UpdateLog(sLog: string);
var path:string;
begin
//path:='';
assignfile(tfLog,'.\Textfile\tfLog.txt'); //DB Logger
reset(tfLog);
showmessage(sLog+'by:'+fUsername+'At'+Datetostr(date)+Timetostr(time));
writeln(tfLog,sLog+' by '+fUsername+' At '+Datetostr(date)+' '+Timetostr(time));
closefile(tfLog);
end;

constructor UserData.UserCreate(sUsername: string);
var
  bFound: boolean;
begin
  with dmco2 do
  begin
    bFound := false;
    fUsername := sUsername;
    ADOUsers.first;
    while not(ADOUsers.eof) and (bFound = false) do
    begin
      if ADOUsers['Username'] = fUsername then
      begin
        fUserID := ADOUsers['UserID'];
        fOrganisationId:=ADOUsers['OrganisationID'];
        bFound := true;
      end
      else
        ADOUsers.next;
    end;
  end;

end;

end.

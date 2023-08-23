unit u_UserNormal;

interface
uses dm_co2;
type
UserData = class(tObject)
  Private
  fUsername:string;
  fUserID:integer;
  fisFirst:boolean
  public
   constructor UserCreate(sUsername);
   function isFirstAccess():boolean;

end;
implementation

{ UserData }

function UserData.isFirstAccess: boolean;
begin
result:=fisFirst
end;

procedure UserData.Usercreate(sUsername);
var bFound:boolean;
begin
fUsername:=sUsername;
with dmco2 do
begin
ADOUsers.First;
bFound=false;
while (not ADOUsers.Eof) and bFound= false do
   begin
    if ADOUsers['Username']= fUsername then
    begin
    fUserID:=ADOUsers['UserID'];
    if ADOUsers['Carbon_Footprint']=nil then
      fisFirst:=true
      else
      fisFirst:=false;
    bfound:=true;
    end;
    ADOUsers.Next;

   end;
end;
end;

end.

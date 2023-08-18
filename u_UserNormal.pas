unit u_UserNormal;

interface
uses dm_co2;
type
UserData = class(tObject)
  Private
  fUsername:string;
  fCarList:array of string;
  fUserID:integer;
  fisFirst:boolean;
  public
   constructor UserCreate(sUsername:string);
   function isFirstAccess:boolean;
   procedure LoadCar;

end;
implementation

{ UserData }

function UserData.isFirstAccess: boolean;
begin
result:=fisFirst
end;

procedure UserData.LoadCar;
begin

end;

constructor UserData.UserCreate(sUsername:string);
var bFound:boolean;
begin
fUsername:=sUsername;
with dmco2 do
begin
ADOUsers.First;
bFound:=false;
while (not ADOUsers.Eof) and (bFound= false) do
   begin
    if ADOUsers['Username']= fUsername then
    begin
    fUserID:=ADOUsers['UserID'];
    if ADOUsers['Carbon_Footprint']=0 then
      fisFirst:=true;

    bfound:=true;
    end;
    ADOUsers.Next;

   end;
end;
end;

end.

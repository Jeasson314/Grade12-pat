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
    function AccessUsername(): string;

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

// Function to retrieve the stored access username.
function SignIn.AccessUsername: string;
begin
  result := fUsername; // Return the stored username
end;

// Constructor to initialize a new SignIn object.
constructor SignIn.create();
begin
  fUsername := ''; // Initialize username to an empty string
  fPassword := ''; // Initialize password to an empty string
  fAttempts := 0; // Initialize login attempts counter
end;

// Function to perform password checking and user authentication.
function SignIn.PasswordCheck: boolean;
var
  bAccountFound: boolean; // Flag to track account presence
  sPassword: string; // Stores the hashed password
begin
  bAccountFound := false; // Initialize account flag to false
  result := false; // Initialize function result to false (authentication failure)

  if fAttempts <= 3 then // Check if login attempts are within limit
  begin
    with dmCO2 do
    begin
      sPassword := hash(fPassword); // Hash the provided password
      ADOUsers.first; // Move to the first user record

      // Loop through user records to find a matching username and hashed password
      while (not ADOUsers.eof) and (bAccountFound = false) do
      begin
        if (fUsername = ADOUsers['Username']) and (sPassword = ADOUsers['Password']) then
        begin
          result := true; // Set result to true (authentication success)
          bAccountFound := true; // Set account flag to true
        end
        else
          ADOUsers.Next; // Move to the next user record
      end;

      inc(fAttempts); // Increment login attempts counter
      exit; // Exit the function
    end;
  end
  else
  begin
    // Display an error message and terminate the application due to excessive login attempts
    MessageDlg('Maximum number of attempts reached. Terminating program.', mtError, [mbOk], 0);
    application.Terminate;
    result := true; // Set result to true (application termination)
  end;
end;

// Procedure to set the login credentials in the SignIn object.
procedure SignIn.SetLogin(sUsername, sPassword: string);
begin
  fUsername := sUsername; // Store the provided username
  fPassword := sPassword; // Store the provided password
end;

{ Signup }

// Procedure to add car details to the Signup object.
procedure Signup.addCar(sCarsID, sCarsMake, sCarsModel: string);
begin
  inc(fArraylength); // Increment the array length
  setLength(arrCar, fArraylength); // Resize the array to match the new length
  arrCar[fArraylength - 1] := strtoint(sCarsID); // Store the car ID in the array
  fCarsModel := fCarsModel + ',' + sCarsModel; // Append the car model to the list
  fCarsMake := fCarsMake + ',' + sCarsMake; // Append the car make to the list
end;

// Procedure to add email and goal to the Signup object.
procedure Signup.addEmailGoal(sEmail, sGoal: string);
begin
  if ansipos('@', sEmail) > 0 then // Check if the provided email contains '@'
  begin
    try
      fEmail := sEmail; // Store the provided email
      fGoal := strtoint(sGoal); // Convert and store the provided goal as integer
    except
      showmessage('Please check that you have typed in a number in the goal box');
    end;
  end
  else
    showmessage('Please type in a valid email');
end;

// Procedure to add organization details to the Signup object.
procedure Signup.addOrganisation(sOrgaganisationID: integer;
  sOrganisation: string; bIsAdmin: boolean);
begin
  fOrganisation := sOrganisation; // Store the organization name
  fOrganisationID := sOrgaganisationID; // Store the organization ID
  fIsAdmin := bIsAdmin; // Store whether the user is an admin
end;

// Procedure to hash and store the provided password in the Signup object.
procedure Signup.addPassword(sPassword: string);
begin
  fPassword := hash(sPassword); // Hash the provided password and store it
end;

// Function to add a new user based on the stored Signup object data.
function Signup.addUser: boolean;
var
  sCarIDtemp: string; // Temporary variable to store car ID
  iUserID, iloop: integer; // Temporary variables for user and loop indexes
  isOkay: boolean; // Flag to indicate successful user addition

  {
    // Procedure to fill in car details in the database.
    procedure fillInCars;
    var
      iloop: integer; // Loop index
    begin
      if isOkay then
      BEGIN
        for iloop := 0 to Length(arrCar) - 1 do
        begin
          dmCO2.ADOCarList.Insert; // Insert a new car record
          dmCO2.ADOCarList['UserID'] := dmCO2.ADOUsers.FieldByName('ID').AsInteger(); // Assign user ID to the car record
          dmCO2.ADOCarList['CarID'] := arrCar[iloop]; // Assign car ID to the car record
          dmCO2.ADOCarList['CurrentMileage'] := 0; // Initialize current mileage
          dmCO2.ADOCarList.Post; // Post the car record
        end;
        isOkay := true; // Set the flag to true
      END;
    end;
    }
begin
  with dmCO2 do // Use the CO2 data module
  BEGIN
    try
      isOkay := false; // Initialize the flag to false
      if ADOUsers.Active then // Check if the users table is active
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
        ADOUsers.Post; // Post the user record
      end;
      ADOUsers.Last; // Move to the last record (most recent inserted)
      isOkay := true; // Set the flag to true (successful addition)
    Except
      isOkay := false; // Set the flag to false (addition failed)
      showmessage('Unable to insert new user...'); // Show error message
    end;

    // fillInCars; // Call the procedure to fill in car details
  END;
  result := isOkay; // Return the flag indicating success or failure
end;


// Function to convert car details to a formatted string.
function Signup.CarsToString: string;
begin
  result := 'Make: ' + fCarsMake + #13 + 'Model: ' + fCarsModel; // Combine car make and model
end;

// Constructor to initialize the Signup object's properties.
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
  fArraylength := 0; // Initialize the car array length
end;

// Procedure to set the membership status of the Signup object.
procedure Signup.IsMember(bMember: boolean);
begin
  fIsMember := bMember; // Store the membership status
end;

// Function to convert organization details to a string.
function Signup.Organisationtostring: string;
begin
  result := fOrganisation; // Return the organization name
end;

// Function to validate password complexity and match.
function Signup.passwordvalidate(sPasswordOrginal, sPasswordSecond: string)
  : boolean;
var
  icharacterloop: integer;
  chrPassword: char;
  bSpecialchr, bNumber, bCapital: boolean;
begin
  result := true; // Default to true
  bNumber := false;
  bSpecialchr := false;
  bCapital := false;

  if (sPasswordOrginal = '') or (sPasswordSecond = '') then
  begin
    result := false; // Passwords are missing
    MessageDlg('Please type in a password or retype password', mtWarning,
      [mbOk], 0);
    exit;
  end
  else
    result := true;

  if sPasswordOrginal <> sPasswordSecond then
  begin
    result := false; // Passwords don't match
    MessageDlg('Password must match', mtWarning, [mbOk], 0);
    exit;
  end;

  if Length(sPasswordOrginal) < 8 then
  begin
    result := false; // Password length is insufficient
    MessageDlg('Please make sure your password is more than 8 characters long',
      mtWarning, [mbOk], 0);
    exit;
  end
  else
  begin
    // Check password complexity
    for icharacterloop := 1 to Length(sPasswordOrginal) do
    begin
      chrPassword := sPasswordOrginal[icharacterloop];
      case ord(chrPassword) of
        48 .. 57:
          bNumber := true; // Numeric character
        58 .. 64:
          bSpecialchr := true; // Special character
        92 .. 96:
          bSpecialchr := true; // Special character
        123, 125:
          bSpecialchr := true; // Special character
        65 .. 90:
          bCapital := true; // Uppercase letter
      end;
    end;
  end;

  if not bNumber then
  begin
    MessageDlg('Please use a number in your password', mtWarning, [mbOk], 0);
    result := false;
  end;

  if not bSpecialchr then
  begin
    MessageDlg('Please use a special character (such as "@") in your password',
      mtWarning, [mbOk], 0);
    result := false;
  end;

  if not bCapital then
  begin
    MessageDlg('Please use a capital letter in your password', mtWarning, [mbOk], 0);
    result := false;
  end;
end;


// Function to generate a username based on the provided first name and last name.
function Signup.UsernameGeneration(sFirst_name, sLast_name: string): string;
begin
  fFirst_name := sFirst_name; // Store the provided first name
  fLast_name := sLast_name; // Store the provided last name

  // Generate a username by concatenating first name, last name, and a random number.
  fUsername := fFirst_name + fLast_name + inttostr(random(100));

  // Check if the generated username already exists in the database.
  if dmCO2.ADOUsers.locate('Username', fUsername, []) then
    fUsername := fFirst_name + fLast_name + inttostr(random(100)); // If exists, regenerate

  result := fUsername; // Return the generated username
end;

end.

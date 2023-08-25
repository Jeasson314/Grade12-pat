unit u_Cars;

interface

// Uses statements for required units
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, dblookup, dm_CO2, StdCtrls, ExtCtrls, jpeg, pngimage,
  DBCtrls, DB, ADODB, u_SignIn, ComCtrls;

type
  Tfrm_Cars = class(TForm)
    GroupBox1: TGroupBox;
    imgAddCars: TImage;
    edtEmission: TEdit;
    Label3: TLabel;
    edtModel: TEdit;
    Label1: TLabel;
    edtMake: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    adoListMakes: TADOQuery;
    dsListMakes: TDataSource;
    Panel1: TPanel;
    lookupMake: TDBLookupComboBox;
    edtSearch: TEdit;
    btnFilterByMake: TButton;
    btnSearch: TButton;
    GroupBox3: TGroupBox;
    imgAddV: TImage;
    redoutCars: TRichEdit;
    btnCompleteCar: TButton;
    Label5: TLabel;
    girdCars: TDBGrid;

    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgAddCarsClick(Sender: TObject);
    procedure btnFilterByMakeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgAddVClick(Sender: TObject);
    procedure btnCompleteCarClick(Sender: TObject);

  private
    // Function to check if a model already exists in the database
    function dbcheck(sModel: string): boolean;

  public
    { Public declarations }
  end;

var
  frm_Cars: Tfrm_Cars;
  sSQL: string;

implementation

uses u_Signup;
{$R *.dfm}

procedure Tfrm_Cars.imgAddVClick(Sender: TObject);
begin
  try
    // Add car details to the signup object and update the display
    objSignup.addCar(inttostr(dmco2.ADOCars['CarID']), dmco2.ADOCars['Make'],
      dmco2.ADOCars['Model']);
    redoutCars.Lines.Add(objSignup.CarsToString);
  except
    showmessage('An error has occurred!?!?');
  end;
end;

procedure Tfrm_Cars.btnCompleteCarClick(Sender: TObject);
begin
  // Close the current form and update the signup form's display
  frm_Cars.Close;
  frm_Signup.redoutCarsSignup.Lines.Add(objSignup.CarsToString)
end;

// Handler for clicking the "Filter by Make" button
procedure Tfrm_Cars.btnFilterByMakeClick(Sender: TObject);
begin
  // Apply a filter to the ADOCars dataset based on the selected make
  if dmco2.ADOCars.Active then
    showmessage('Applying Filter');
  try
    dmco2.ADOCars.Filtered := False;
    dmco2.ADOCars.Filter := 'Make = ' + quotedstr(lookupMake.Text);
    dmco2.ADOCars.Filtered := True;
  except
    showmessage('Error : Unable to apply filter: ' + dmco2.ADOCars.Filter)
  end;
end;

// Handler for clicking the "Search" button
procedure Tfrm_Cars.btnSearchClick(Sender: TObject);
begin
  // Apply a filter to the ADOCars dataset based on the entered search text
  dmco2.ADOCars.Filtered := False;
  dmco2.ADOCars.Filter := 'Model like ' + uppercase(quotedstr(edtSearch.Text));
  dmco2.ADOCars.Filtered := True;
end;

// Function to check if a model already exists in the database
function Tfrm_Cars.dbcheck(sModel: string): boolean;
begin
  result := True;
  with dmco2 do
  begin
    ADOCars.first;
    while not(ADOCars.eof) and (result = True) do
    begin
      if (ADOCars['Model'] = sModel) then
      begin
        result := False;
        exit;
      end
      else
        ADOCars.Next;
    end;
  end;
end;

// Handler for the form's "Activate" event
procedure Tfrm_Cars.FormActivate(Sender: TObject);
var
  iloop: integer;
begin
  // Load and stretches images
  imgAddCars.Picture.LoadFromFile('.\images\Health.png');
  imgAddCars.Stretch := True;
  imgAddV.Picture.LoadFromFile('.\images\Health.png');
  imgAddV.Stretch := True;
end;

// Handler for the form's "Show" event
procedure Tfrm_Cars.FormShow(Sender: TObject);
begin
  try
    // Activate the list of car makes
    self.adoListMakes.Active := True;
  except
    showmessage('Unable to load the list of car makes');
  end;
end;

// Handler for clicking the "Add Cars" image
procedure Tfrm_Cars.imgAddCarsClick(Sender: TObject);
var
  sModel, sMake: string;
  iEmission: integer;
  result: boolean;
begin
  try
    // Get input values
    sMake := uppercase(edtMake.Text);
    sModel := uppercase(edtModel.Text);
    iEmission := strtoint(edtEmission.Text);

    // Check if the model already exists in the database
    result := dbcheck(sMake);

    // If the model already exists, show a warning message and exit
    if result = False then
    begin
      MessageDlg('Car already exists in the database, use top-down memories',
        mtWarning, [mbOk], 0);
      exit;
    end
    else
    begin
      // Insert car details into the ADOCars dataset
      with dmco2 do
      begin
        if ADOCars.Active then
        begin
          TRY
            ADOCars.Insert;
            ADOCars['Make'] := sMake;
            ADOCars['Model'] := sModel;
            ADOCars['CO2 Emissions(g/km)'] := iEmission;
            ADOCars.Post;

            // Add car details to the signup object and update the display
            objSignup.addCar(inttostr(dmco2.ADOCars['CarID']),
              dmco2.ADOCars['Make'], dmco2.ADOCars['Model']);
            redoutCars.Lines.Add(objSignup.CarsToString);
          EXCEPT
            // Handle any exceptions here
          END;
        end;
      end;
    end;
  finally
    // Display warnings if input fields are missing
    if sMake = '' then
      MessageDlg('Please make sure you have a Make', mtWarning, [mbOk], 0);
    if sModel = '' then
      MessageDlg('Please make sure you have a Model', mtWarning, [mbOk], 0);
  end;
end;

end.

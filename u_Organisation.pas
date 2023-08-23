unit u_Organisation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, dm_CO2, ExtCtrls, jpeg, pngimage, ComCtrls;

type
  TfrmOrganisation = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    imgSelectOrganisation: TImage;
    btnSearch: TButton;
    edtSearch: TEdit;
    GroupBox2: TGroupBox;
    edtOrganisation: TEdit;
    Label1: TLabel;
    imgCreateOrganisation: TImage;
    edtEmissions: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    btnAddOrganisation: TButton;
    redoutOrgansiation: TRichEdit;

    // Event handlers
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure imgSelectOrganisationClick(Sender: TObject);
    procedure imgCreateOrganisationClick(Sender: TObject);
    procedure btnAddOrganisationClick(Sender: TObject);

  private
    // Function to check if an organisation already exists in the database
    function dbCheck(sOrganisation: string): boolean;

  public
    { Public declarations }
  end;

var
  frm_Organisation: TfrmOrganisation;

implementation

uses u_Signup;

{$R *.dfm}

// Handler for clicking the "Add Organisation" button
procedure TfrmOrganisation.btnAddOrganisationClick(Sender: TObject);
begin
  // Close the current form and update the signup form's display
  frm_organisation.Close;
  frm_Signup.redoutOrganisation.Lines.Add(objSignup.OrganisationToString)
end;

// Handler for clicking the "Search" button
procedure TfrmOrganisation.btnSearchClick(Sender: TObject);
begin
  try
    // Apply a filter to the ADOOrganisation dataset based on the entered search text
    dmCO2.ADOOrganisation.Filtered := False;
    dmCO2.ADOOrganisation.Filter := 'OrganisationName like ' + (quotedstr(edtSearch.Text));
    dmCO2.ADOOrganisation.Filtered := True;
  except
    begin
      // Display a warning message if search fails
      if edtSearch.Text = '' then
        MessageDlg('Please enter a value to search for', mtWarning, [mbOk], 0);
      showmessage('An error occurred when trying to search');
    end;
  end;
end;

// Function to check if an organisation already exists in the database
function TfrmOrganisation.dbCheck(sOrganisation: string): boolean;
begin
  result := True;
  with dmCO2 do
  begin
    ADOOrganisation.first;
    while (not ADOOrganisation.eof) and (result = True) do
    begin
      if ADOOrganisation['OrganisationName'] = sOrganisation then
      begin
        result := False;
        exit;
      end
      else
        ADOOrganisation.Next;
    end;
  end;
end;

// Handler for the form's "Activate" event
procedure TfrmOrganisation.FormActivate(Sender: TObject);
begin
  // Load and display images
  imgSelectOrganisation.Picture.LoadFromFile('.\images\Health.png');
  imgSelectOrganisation.Stretch := True;
  imgCreateOrganisation.Picture.LoadFromFile('.\images\Health.png');
  imgCreateOrganisation.Stretch := True;
end;

// Handler for clicking the "Create Organisation" image
procedure TfrmOrganisation.imgCreateOrganisationClick(Sender: TObject);
var
  sOrganisation: string;
  iEmission: integer;
begin
  // Get input values
  sOrganisation := edtOrganisation.Text;
  iEmission := strtoint(edtEmissions.Text);

  // Check if the organisation already exists in the database
  if dbCheck(sOrganisation) = False then
    showmessage('Organisation already exists, please use the above grid to select it')
  else
    with dmCO2 do
    begin
      if ADOOrganisation.Active then
      begin
        TRY
          // Insert organisation details into the ADOOrganisation dataset
          ADOOrganisation.Insert;
          ADOOrganisation['OrganisationName'] := sOrganisation;
          ADOOrganisation['OrganiastionGoals'] := iEmission;
          ADOOrganisation.Post;
        except
          showmessage('There was an error while trying to insert the organisation');
        END;
      end;

      // Add organisation details to the signup object and update the display
      objSignup.addOrganisation(ADOOrganisation['OrganisationID'], sOrganisation, True);
      btnAddOrganisation.Enabled := True;
      redoutOrgansiation.Lines.Add(objSignup.OrganisationToString);
    end;
end;

// Handler for clicking the "Select Organisation" image
procedure TfrmOrganisation.imgSelectOrganisationClick(Sender: TObject);
begin
  try
    // Add organisation details to the signup object and update the display
    objSignup.addOrganisation(dmCO2.ADOOrganisation['OrganisationID'],
      dmCO2.ADOOrganisation['OrganisationName'], False);
    btnAddOrganisation.Enabled := True;
    redoutOrgansiation.Lines.Add(objSignup.OrganisationToString);
  except
    showmessage('An error occurred when trying to select an Organisation');
  end;
end;

end.


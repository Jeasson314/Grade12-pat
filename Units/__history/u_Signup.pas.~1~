unit u_Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, u_SignIn, u_Organisation, u_Cars,
  ComCtrls;

type
  Tfrm_Signup = class(TForm)
    btnSignup: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtFirst_name: TEdit;
    edtLast_name: TEdit;
    btnGenerate_name: TButton;
    Label2: TLabel;
    pnlUsername: TPanel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    redoutCarsSignup: TRichEdit;
    GroupBox3: TGroupBox;
    pnlOrganisation: TPanel;
    btnOrganisation: TButton;
    redoutOrganisation: TRichEdit;
    ChkOrganisation: TCheckBox;
    Label3: TLabel;
    edtPasswordOriginal: TEdit;
    Label4: TLabel;
    edtPasswordSecond: TEdit;
    Panel1: TPanel;
    edtEmail: TEdit;
    edtPersonalgoal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnGenerate_nameClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure btnOrganisationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ChkOrganisationClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frm_Signup: Tfrm_Signup;
  objSignup: SignUp;

implementation

{$R *.dfm}

// Handler for the "Generate Name" button click
procedure Tfrm_Signup.btnGenerate_nameClick(Sender: TObject);
var
  sFirstname, sLastname: string;
begin
  try
    // Get input values for generating a username
    sFirstname := edtFirst_name.Text;
    sLastname := edtLast_name.Text;

    // Generate and display the generated username
    pnlUsername.Caption := objSignup.UsernameGeneration(sFirstname, sLastname);
  except
    showmessage('There was an error trying to generate a username');
  end;
end;

// Handler for the "Organisation" button click
procedure Tfrm_Signup.btnOrganisationClick(Sender: TObject);
begin
  try
    // Show the Organisation form as a modal dialog
    frm_Organisation.ShowModal;
  except
    showmessage('There was an error trying to show the Organisation form');
  end;
end;

// Handler for the "Sign Up" button click
procedure Tfrm_Signup.btnSignupClick(Sender: TObject);
begin
  try
    // Validate passwords, add password and email/goal information to the signup object
    if objSignup.passwordvalidate(edtPasswordOriginal.Text, edtPasswordSecond.Text) = true then
    begin
      objSignup.addPassword(edtPasswordOriginal.Text);
      objSignup.addEmailGoal(edtEmail.Text, edtPersonalgoal.Text);
      // If user is successfully added, close the signup form
      if objSignup.addUser = true then
        frm_Signup.Close;
    end
    else
    begin
      MessageDlg('Please check your password', mtWarning, [mbOk], 0);
    end;
  except
    showmessage('There was an error trying to sign you up');
  end;
end;

// Handler for the "Add Car" button click
procedure Tfrm_Signup.Button1Click(Sender: TObject);
begin
  try
    // Show the Cars form as a modal dialog
    frm_Cars.ShowModal;
  finally
    showmessage('There was an error trying to display the car form');
  end;
end;

// Handler for the "Organisation" checkbox click
procedure Tfrm_Signup.ChkOrganisationClick(Sender: TObject);
begin
  try
    // Toggle visibility of the organisation panel and update signup object
    if ChkOrganisation.Checked then
    begin
      pnlOrganisation.Visible := true;
      objSignup.IsMember(true);
    end
    else
    begin
      objSignup.IsMember(false);
      pnlOrganisation.Visible := false;
    end;
  except
    showmessage('There was an error trying to select if you were a member or not');
  end;
end;

// Handler for the form's "Activate" event
procedure Tfrm_Signup.FormActivate(Sender: TObject);
begin
  try
    // Create an instance of the SignUp class
    objSignup := SignUp.create();
  except
    showmessage('There was an error trying to create objSignup');
  end;
end;

end.


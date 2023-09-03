unit u_Graph;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, DB, ADODB,
  dm_co2, ComCtrls, u_UserNormal, DBChart, Grids, DBGrids, Spin;

type
  Tfrm_Graph = class(TForm)
    ADOGraphQuery: TADOQuery;
    ADOGraphQuerySource: TDataSource;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    btnUpdateGraph: TButton;
    RadioGraph: TRadioGroup;
    DateTimeTo: TDateTimePicker;
    pnlDate: TPanel;
    User: TPageControl;
    DateTimeFrom: TDateTimePicker;
    DBChart1: TDBChart;
    SeriesFootPrint: TBarSeries;
    SeriesPie: TPieSeries;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    RadioAdmin: TRadioGroup;
    btnUpdateAdminGraph: TButton;
    Label2: TLabel;
    pnlYear: TPanel;
    Label1: TLabel;
    spinYear: TSpinEdit;

    // Event handlers
    procedure btnUpdateGraphClick(Sender: TObject);
    procedure RadioGraphClick(Sender: TObject);
    procedure btnUpdateAdminGraphClick(Sender: TObject);
    procedure RadioAdminClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    procedure UpdateGraphs(sField1, sfield2: string);
    procedure UpdateQuery(sSQL: string);
    procedure UpdatePieGraph(sField1, sfield2: string);

  public
    { Public declarations }
  end;

var
  frm_Graph: Tfrm_Graph;

implementation

{$R *.dfm}

uses
  u_User;

// Handler for the "Update Admin Graph" button click
procedure Tfrm_Graph.btnUpdateAdminGraphClick(Sender: TObject);
begin
  try
    // Check the selected radio button for graph type
    case RadioAdmin.ItemIndex of
      0:
        begin
          SeriesPie.Visible := True; // Show the pie chart series
          SeriesFootPrint.Visible := False; // Hide the footprint chart series
          // Query user data for the organization and update pie chart
          UpdateQuery('SELECT Carbon_Footprint, Username FROM tblUsers' +
              ' WHERE OrganisationID = ' + IntToStr
              (objUserdata.AccessOrganisationID) + ';');
          UpdatePieGraph('Username', 'Carbon_Footprint'); // Update the pie chart with the queried data
        end;
      1:
        begin
          SeriesPie.Visible := False; // Hide the pie chart series
          SeriesFootPrint.Visible := True; // Show the footprint chart series
          // Query emission data for the organization and year, update footprint chart
          UpdateQuery(
            'SELECT Sum(tblFootprint.Emission) AS SumOfEmission, Month(tblFootprint.EmissionDate) AS EmissionDate '
              +
              'FROM tblUsers INNER JOIN tblFootprint ON tblUsers.UserID = tblFootprint.UserID '
              + 'WHERE (((tblUsers.OrganisationID) = ' + IntToStr
              (objUserdata.AccessOrganisationID) +
              ')) AND (Year(tblFootprint.EmissionDate) = ' + IntToStr
              (spinYear.Value) +
              ') GROUP BY Month(tblFootprint.EmissionDate);');
          UpdateGraphs('EmissionDate', 'SumOfEmission'); // Update the footprint chart with the queried data
        end;
    end;
  except
    ShowMessage('There was an error trying to load the graph.');
  end;
end;


// Handler for the "Update Graph" button click
procedure Tfrm_Graph.btnUpdateGraphClick(Sender: TObject);
begin
  try
    case RadioGraph.ItemIndex of
      0:
        begin
          SeriesPie.Visible := False; // Hide the pie chart series
          SeriesFootPrint.Visible := True; // Show the footprint chart series
          UpdateQuery(
            'SELECT EmissionDate, Emission FROM tblFootPrint WHERE (UserID = '
              + objUserdata.AccessUserId + ') AND (EmissionDate BETWEEN #' +
              FormatDateTime('yyyy/mm/dd',
              DateTimeFrom.Date) + '# AND #' + FormatDateTime('yyyy/mm/dd',
              DateTimeTo.Date) + '#);'); // Retrieve emission data for the selected user within the specified date range
          UpdateGraphs('EmissionDate', 'Emission'); // Update the footprint chart with retrieved data
        end;
      1:
        begin
          SeriesFootPrint.Visible := False; // Hide the footprint chart series
          SeriesPie.Visible := True; // Show the pie chart series
          UpdateQuery(
            'SELECT tblCar.Model AS Model, tblCar.[CO2 Emissions(g/km)] AS Emission FROM tblCar INNER JOIN tblCarList '
              +
              'ON tblCar.CarID = tblCarList.CarID WHERE tblCarList.UserID = ' + objUserdata.AccessUserId + ';'); // Retrieve car model and emission data for the selected user
          UpdatePieGraph('Model', 'Emission'); // Update the pie chart with retrieved data
        end;
    end;
  except
    ShowMessage('There was an error trying to load the graph.'); // Display an error message if an exception occurs
  end;
end;


// Handler for the form's "Activate" event
procedure Tfrm_Graph.FormActivate(Sender: TObject);
begin
  try
    if objUserdata.Admin = True then
      TabSheet2.TabVisible := True
    else
      TabSheet2.TabVisible := False;
  except
    ShowMessage('Failed to handle tab visibility.');
  end;
end;

// Handler for the Admin radio button group click
procedure Tfrm_Graph.RadioAdminClick(Sender: TObject);
begin
  try
    case RadioAdmin.ItemIndex of
      0:
        pnlDate.Visible := True;
      1:
        pnlDate.Visible := False;
    end;
  except
    ShowMessage('Failed to handle the error.');
  end;
end;

// Handler for the Graph radio button group click
procedure Tfrm_Graph.RadioGraphClick(Sender: TObject);
begin
  case RadioGraph.ItemIndex of
    0:
      pnlYear.Visible := True;
    1:
      pnlYear.Visible := False;
  end;
end;

// Update the bar graph data
procedure Tfrm_Graph.UpdateGraphs(sField1, sfield2: string);
begin
  with SeriesFootPrint do
  begin
    DataSource := ADOGraphQuery;
    XLabelsSource := sField1;
    YValues.ValueSource := sfield2;
    CheckDataSource;
  end;
end;

// Update the pie chart data
procedure Tfrm_Graph.UpdatePieGraph(sField1, sfield2: string);
begin
  with SeriesPie do
  begin
    DataSource := ADOGraphQuery;
    PieValues.ValueSource := sfield2;
    XLabelsSource := sField1;
    CheckDataSource;
  end;
end;

// Update the SQL query for the ADOQuery
procedure Tfrm_Graph.UpdateQuery(sSQL: string);
begin
  ADOGraphQuery.SQL.Clear;
  ADOGraphQuery.SQL.Add(sSQL);
  ADOGraphQuery.Open;
end;

end.

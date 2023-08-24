unit u_graph;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, DB, ADODB,
  dm_co2, ComCtrls, u_UserNormal, DBChart, Grids, DBGrids;

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
    pagecontrol: TPageControl;
    DateTimeFrom: TDateTimePicker;
    DBChart1: TDBChart;
    SeriesFootPrint: TBarSeries;
    SeriesPie: TPieSeries;
    procedure btnUpdateGraphClick(Sender: TObject);
    procedure RadioGraphClick(Sender: TObject);
  private
    procedure UpdateGraphs(sField1, sfield2: string);
    procedure UpdateQuery(sSQL: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Graph: Tfrm_Graph;

implementation

{$R *.dfm}

uses u_User;

procedure Tfrm_Graph.btnUpdateGraphClick(Sender: TObject);
begin
  case RadioGraph.ItemIndex of
    0:
      begin
        SeriesPie.Visible := false;
        SeriesFootPrint.Visible := true;
        UpdateQuery(
          'SELECT EmissionDate, Emission FROM tblFootPrint WHERE (UserID = ' +
            objUserdata.accessUserId + ') AND (EmissionDate BETWEEN #' +
            FormatDateTime('yyyy/mm/dd',
            DateTimeFrom.Date) + '# AND #' + FormatDateTime('yyyy/mm/dd',
            DateTimeTo.Date) + '#);');
        UpdateGraphs('EmissionDate', 'Emission');
        // DateTimeFrom.DateTime
      end;
    1:
      begin
        SeriesFootPrint.Visible := false;
        SeriesPie.Visible := true;
        UpdateQuery(
          'SELECT tblCar.Model AS Model,tblCar.[CO2 Emissions(g/km)] AS Emission FROM tblCar INNER JOIN tblCarList'
          +' ON tblCar.CarID = tblCarList.CarID WHERE tblCarList.UserID = '
           + objUserdata.accessUserId +';');
        with SeriesPie do
        begin
        datasource := ADOGraphQuery;
        pievalues
        checkdatasource;
        end;
      end;
  end;
end;

procedure Tfrm_Graph.RadioGraphClick(Sender: TObject);
begin
  case RadioGraph.ItemIndex of
    0:
      pnlDate.Visible := true;
    1:
      pnlDate.Visible := false;

  end;
end;

procedure Tfrm_Graph.UpdateGraphs(sField1, sfield2: string);
begin
  with SeriesFootPrint do
  begin
    datasource := ADOGraphQuery;
    xlabelssource := sField1;
    YValues.Valuesource := sfield2;
    checkdatasource;
  end;

end;

procedure Tfrm_Graph.UpdateQuery(sSQL: string);
begin
  ADOGraphQuery.SQL.Clear;
  ADOGraphQuery.SQL.Add(sSQL);
  ADOGraphQuery.open;
end;

end.

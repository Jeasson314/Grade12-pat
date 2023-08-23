unit u_graph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, DB, ADODB,
  dm_co2;

type
  Tfrm_Graph = class(TForm)
    ChartCo2: TChart;
    GroupBox1: TGroupBox;
    btnUpdateGraph: TButton;
    Series1: TBarSeries;
    ADOGraphQuery: TADOQuery;
    ADOGraphQuerySource: TDataSource;
    RadioGroup1: TRadioGroup;
  private
    procedure UpdateGraphs(Field1, sfield2: string);
    procedure UpdateQuery(sSQL:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Graph: Tfrm_Graph;

implementation

{$R *.dfm}

procedure Tfrm_Graph.UpdateGraphs(sField1, sField2: string);
begin
  with Series1 do
  begin
    datasource := ADOGraphQuery;
    xlabelssource := sField1;
    YValues.Valuesource := sField2;
    checkdatasource;
  end;

end;

procedure Tfrm_Graph.UpdateQuery(sSQL: string);
begin
 ADOGraphQuery.SQL.Clear;
 ADOGraphQuery
end;

end.

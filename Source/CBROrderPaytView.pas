unit CBROrderPaytView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomView, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ActnList, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxCheckBox,
  Menus, cxLabel, cxDBLabel, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxCalc, UIClasses, CBROrderPaytPresenter;

type
  TfrCBROrderPaytView = class(TfrCustomView, ICBROrderPaytView)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    grOrder: TcxGrid;
    grOrderView: TcxGridDBBandedTableView;
    grOrderViewColumnID: TcxGridDBBandedColumn;
    grOrderViewColumnRECNO: TcxGridDBBandedColumn;
    grOrderViewColumnMARK: TcxGridDBBandedColumn;
    grOrderViewColumnDISH: TcxGridDBBandedColumn;
    grOrderViewColumnUNT: TcxGridDBBandedColumn;
    grOrderViewColumnQTY: TcxGridDBBandedColumn;
    grOrderViewColumnPRICE: TcxGridDBBandedColumn;
    grOrderViewColumnSUMM: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxDBLabel4: TcxDBLabel;
    cxGroupBox8: TcxGroupBox;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    dsHead: TDataSource;
    dsItems: TDataSource;
    pnMenu: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    btClose: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btOrderClose: TcxButton;
    cxLabel3: TcxLabel;
    lbSummRet: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    edSummPayt: TcxCalcEdit;
    procedure edSummPaytPropertiesEditValueChanged(Sender: TObject);
  private
  protected
    //ICBROrderPaytView
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
    function GetSummPayt: double;
    procedure OnInitialize; override;
  end;

var
  frCBROrderPaytView: TfrCBROrderPaytView;

implementation

{$R *.dfm}

{ TfrCBROrderPaytView }

procedure TfrCBROrderPaytView.edSummPaytPropertiesEditValueChanged(
  Sender: TObject);
begin
  WorkItem.Commands[COMMAND_PAYT_CHANGED].Execute;
end;

function TfrCBROrderPaytView.GetSummPayt: double;
begin
  Result := edSummPayt.Value;
end;

procedure TfrCBROrderPaytView.LinkHeadData(ADataSet: TDataSet);
begin
  LinkDataSet(dsHead, ADataSet);
end;

procedure TfrCBROrderPaytView.LinkItemsData(ADataSet: TDataSet);
begin
  LinkDataSet(dsItems, ADataSet);
end;

procedure TfrCBROrderPaytView.OnInitialize;
begin
  WorkItem.Commands[COMMAND_CLOSE].AddInvoker(btClose, 'OnClick');
  WorkItem.Commands[COMMAND_ORDER_CLOSE].AddInvoker(btOrderClose, 'OnClick');
end;

end.

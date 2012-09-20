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
  cxDropDownEdit, cxCalc, UIClasses, CBROrderPaytPresenter, cxCurrencyEdit,
  dxCore;

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
    popupCalc: TcxPopupEdit;
    edSummPayt: TcxCurrencyEdit;
    pnCalc: TcxGroupBox;
    btCalc: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    cxButton13: TcxButton;
    procedure edSummPaytPropertiesChange(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure CalcButtonClick(Sender: TObject);
    procedure edSummPaytPropertiesEditValueChanged(Sender: TObject);
  private
    procedure doCalcButton(AButtonIndex: integer);
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

type
  TDummyCurrencyEdit = class(TcxCurrencyEdit)

  end;
{ TfrCBROrderPaytView }

procedure TfrCBROrderPaytView.btCalcClick(Sender: TObject);
begin
  popupCalc.DroppedDown := true;
end;

procedure TfrCBROrderPaytView.CalcButtonClick(Sender: TObject);
begin
  doCalcButton(TComponent(Sender).Tag);
end;

procedure TfrCBROrderPaytView.doCalcButton(AButtonIndex: integer);
const
  BUTTON_ENTER = 12;
  BUTTON_CHARS: array[0..11] of char =
    ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', Char(VK_BACK));
begin
  edSummPayt.SelStart := Length(edSummPayt.Text);

  case AButtonIndex of
    BUTTON_ENTER: popupCalc.DroppedDown := false;
  else
    SendKeyPress(edSummPayt, BUTTON_CHARS[AButtonIndex]);
  end;

  edSummPayt.EditValue := edSummPayt.Text;
end;

procedure TfrCBROrderPaytView.edSummPaytPropertiesChange(Sender: TObject);
begin
  edSummPayt.PostEditValue;
end;

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
  popupCalc.Height := 0;
  WorkItem.Commands[COMMAND_CLOSE].AddInvoker(btClose, 'OnClick');
  WorkItem.Commands[COMMAND_ORDER_CLOSE].AddInvoker(btOrderClose, 'OnClick');
end;

end.

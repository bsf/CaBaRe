unit CBROrderDeskView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomView, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ActnList, cxGroupBox,
  CBROrderDeskPresenter, Menus, StdCtrls, cxButtons, UIClasses, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, cxTextEdit, cxMemo,
  cxLabel, cxDBLabel, cxDBEdit, cxSplitter, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, cxCheckBox;

type
  TfrCBROrderDeskView = class(TfrCustomView, ICBROrderDeskView, ICommandBar)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    grOrder: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    grOrderView: TcxGridDBBandedTableView;
    grOrderViewColumnID: TcxGridDBBandedColumn;
    grOrderViewColumnRECNO: TcxGridDBBandedColumn;
    grOrderViewColumnMARK: TcxGridDBBandedColumn;
    grOrderViewColumnDISH: TcxGridDBBandedColumn;
    grOrderViewColumnUNT: TcxGridDBBandedColumn;
    grOrderViewColumnQTY: TcxGridDBBandedColumn;
    grOrderViewColumnPRICE: TcxGridDBBandedColumn;
    grOrderViewColumnSUMM: TcxGridDBBandedColumn;
    dsMenuGrp: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dsMenu: TDataSource;
    cxGroupBox2: TcxGroupBox;
    dsHead: TDataSource;
    cxStyle2: TcxStyle;
    cxGroupBox11: TcxGroupBox;
    pnMenuGrp: TcxGroupBox;
    dsItems: TDataSource;
    cxGroupBox12: TcxGroupBox;
    btItemPrior: TcxButton;
    btItemNext: TcxButton;
    cxGroupBox13: TcxGroupBox;
    cxDBMemo1: TcxDBMemo;
    cxGroupBox14: TcxGroupBox;
    btItemQtyDec: TcxButton;
    btItemQtyInc: TcxButton;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox15: TcxGroupBox;
    btPreCheck: TcxButton;
    cxGroupBox16: TcxGroupBox;
    btClose: TcxButton;
    btPayt: TcxButton;
    btKORD: TcxButton;
    cxGroupBox10: TcxGroupBox;
    btItemCancel: TcxButton;
    cxButton7: TcxButton;
    cxDBLabel3: TcxDBLabel;
    pnMenu: TcxGroupBox;
    grMenu: TcxGrid;
    grMenuView: TcxGridDBBandedTableView;
    grMenuViewColumnID: TcxGridDBBandedColumn;
    grMenuViewColumnNAME: TcxGridDBBandedColumn;
    grMenuCardView: TcxGridDBCardView;
    grMenuCardViewRowID: TcxGridDBCardViewRow;
    grMenuCardViewRowNAME: TcxGridDBCardViewRow;
    cxGridLevel2: TcxGridLevel;
    cxGroupBox7: TcxGroupBox;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxGroupBox8: TcxGroupBox;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    grMenuGrp: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBCardView1: TcxGridDBCardView;
    cxGridDBCardViewRow1: TcxGridDBCardViewRow;
    cxGridDBCardViewRow2: TcxGridDBCardViewRow;
    cxGridLevel3: TcxGridLevel;
    procedure grMenuGrpViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grMenuViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure LinkMenuGrpDataSet(ADataSet: TDataSet);
    procedure LinkMenuData(ADataSet: TDataSet);
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
    procedure HideMenu;
  protected
    procedure AddCommand(const AName, ACaption: string; const AShortCut: string = '';
     const AGroup: string = ''; ADefault: boolean = false); overload;

    function CommandBar: ICommandBar; override;
    procedure OnInitialize; override;
  end;


implementation

{$R *.dfm}

{ TfrCBROrderDeskView }

procedure TfrCBROrderDeskView.AddCommand(const AName, ACaption, AShortCut,
  AGroup: string; ADefault: boolean);
begin

end;

function TfrCBROrderDeskView.CommandBar: ICommandBar;
begin
  Result := Self as ICommandBar;
end;

procedure TfrCBROrderDeskView.grMenuGrpViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  WorkItem.Commands[COMMAND_MENU_OPEN].Data['GRP_ID'] :=
    ACellViewInfo.GridRecord.Values[0];
  WorkItem.Commands[COMMAND_MENU_OPEN].Execute;
end;

procedure TfrCBROrderDeskView.grMenuViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  WorkItem.Commands[COMMAND_ITEM_ADD].Data['MENU_ID'] :=
    ACellViewInfo.GridRecord.Values[0];
  WorkItem.Commands[COMMAND_ITEM_ADD].Execute;
end;

procedure TfrCBROrderDeskView.HideMenu;
begin
  pnMenu.Visible := false;
  pnMenuGrp.Visible := false;
end;

procedure TfrCBROrderDeskView.LinkHeadData(ADataSet: TDataSet);
begin
  dsHead.DataSet := ADataSet;
end;

procedure TfrCBROrderDeskView.LinkItemsData(ADataSet: TDataSet);
begin
  dsItems.DataSet := ADataSet;
end;

procedure TfrCBROrderDeskView.LinkMenuData(ADataSet: TDataSet);
begin
  dsMenu.DataSet := ADataSet;
end;

procedure TfrCBROrderDeskView.LinkMenuGrpDataSet(ADataSet: TDataSet);
begin
  dsMenuGrp.DataSet := ADataSet;
end;

procedure TfrCBROrderDeskView.OnInitialize;
begin
  WorkItem.Commands[COMMAND_CLOSE].AddInvoker(btClose, 'OnClick');

  WorkItem.Commands[COMMAND_ITEM_PRIOR].AddInvoker(btItemPrior, 'OnClick');
  WorkItem.Commands[COMMAND_ITEM_NEXT].AddInvoker(btItemNext, 'OnClick');

  WorkItem.Commands[COMMAND_ITEM_QTY_INC].AddInvoker(btItemQtyInc, 'OnClick');
  WorkItem.Commands[COMMAND_ITEM_QTY_DEC].AddInvoker(btItemQtyDec, 'OnClick');

  WorkItem.Commands[COMMAND_ITEM_CANCEL].AddInvoker(btItemCancel, 'OnClick');

  WorkItem.Commands[COMMAND_KORD].AddInvoker(btKORD, 'OnClick');
  WorkItem.Commands[COMMAND_PRECHECK].AddInvoker(btPreCheck, 'OnClick');
  WorkItem.Commands[COMMAND_PAYT].AddInvoker(btPayt, 'OnClick');
end;

end.

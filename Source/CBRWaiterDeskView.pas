unit CBRWaiterDeskView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomView, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ActnList, cxGroupBox,
  cxPCdxBarPopupMenu, cxPC, Menus, cxLabel, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLabel, UIClasses, cxNavigator, cxDBNavigator,
  CBRWaiterDeskPresenter, cxGridBandedTableView, cxGridDBBandedTableView,
  cxTextEdit, cxScrollBar, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView;

type
  TfrCBRWaiterDeskView = class(TfrCustomView, ICBRWaiterDeskView)
    dsRomms: TDataSource;
    dsTables: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dsTableInfo: TDataSource;
    dsOrders: TDataSource;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    btClose: TcxButton;
    btRoomNext: TcxButton;
    cxGroupBox9: TcxGroupBox;
    grTables: TcxGrid;
    grTablesView: TcxGridDBCardView;
    grTablesViewRowID: TcxGridDBCardViewRow;
    grTablesViewRowROOM: TcxGridDBCardViewRow;
    grTablesViewRowNAME: TcxGridDBCardViewRow;
    cxGridLevel2: TcxGridLevel;
    pnTableInfo: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    grOrders: TcxGrid;
    grOrdersView: TcxGridDBCardView;
    cxGridDBCardViewRowID: TcxGridDBCardViewRow;
    cxGridDBCardViewRowSTATE: TcxGridDBCardViewRow;
    cxGridDBCardViewRowSUMM: TcxGridDBCardViewRow;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    cxButton2: TcxButton;
    btOrderNew: TcxButton;
    grOrdersViewRowTIME: TcxGridDBCardViewRow;
    cxStyle2: TcxStyle;
    cxGroupBox1: TcxGroupBox;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBLabel2: TcxDBLabel;
    procedure grTablesViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grOrdersViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private


  protected
    //ICBRWaiterDeskView
    procedure LinkRoomsDataSet(ADataSet: TDataSet);
    procedure LinkTablesDataSet(ADataSet: TDataSet);
    procedure TableInfoShow(ATableInfo, AOrders: TDataSet);
    procedure TableInfoHide;

  protected
    procedure OnInitialize; override;
  end;

var
  frCBRWaiterDeskView: TfrCBRWaiterDeskView;

implementation

{$R *.dfm}

{ TfrCBRWaiterDeskView }

procedure TfrCBRWaiterDeskView.grOrdersViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  WorkItem.Commands[COMMAND_ORDER_ITEM].Data['ID'] := ACellViewInfo.GridRecord.Values[0];
  WorkItem.Commands[COMMAND_ORDER_ITEM].Execute;
end;

procedure TfrCBRWaiterDeskView.grTablesViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  WorkItem.Commands[COMMAND_TABLE_INFO_SHOW].Data['TBL_ID'] := ACellViewInfo.GridRecord.Values[0];
  WorkItem.Commands[COMMAND_TABLE_INFO_SHOW].Execute;
end;

procedure TfrCBRWaiterDeskView.LinkRoomsDataSet(ADataSet: TDataSet);
begin
  dsRomms.DataSet := ADataSet;
end;

procedure TfrCBRWaiterDeskView.LinkTablesDataSet(ADataSet: TDataSet);
begin
  dsTables.DataSet := ADataSet;
end;

procedure TfrCBRWaiterDeskView.OnInitialize;
begin

  WorkItem.Commands[COMMAND_CLOSE].AddInvoker(btClose, 'OnClick');

  WorkItem.Commands[COMMAND_ROOM_NEXT].AddInvoker(btRoomNext, 'OnClick');

  WorkItem.Commands[COMMAND_ORDER_NEW].AddInvoker(btOrderNew, 'OnClick');
end;


procedure TfrCBRWaiterDeskView.TableInfoHide;
begin
  pnTableInfo.Visible := false;
end;

procedure TfrCBRWaiterDeskView.TableInfoShow(ATableInfo, AOrders: TDataSet);
begin
  dsTableInfo.DataSet := ATableInfo;
  dsOrders.DataSet := AOrders;
  pnTableInfo.Visible := true;
end;

end.

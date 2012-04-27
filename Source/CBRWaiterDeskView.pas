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
  cxTextEdit;

type
  TfrCBRWaiterDeskView = class(TfrCustomView, ICBRWaiterDeskView)
    dsRomms: TDataSource;
    dsTables: TDataSource;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    btClose: TcxButton;
    cxGroupBox4: TcxGroupBox;
    cxDBLabel2: TcxDBLabel;
    cxGroupBox8: TcxGroupBox;
    btRoomPrior: TcxButton;
    btRoomNext: TcxButton;
    cxGroupBox9: TcxGroupBox;
    cxGroupBox10: TcxGroupBox;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    grTables: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    pnTableInfo: TcxGroupBox;
    cxDBLabel1: TcxDBLabel;
    cxGroupBox3: TcxGroupBox;
    cxButton2: TcxButton;
    btOrderNew: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    grOrders: TcxGrid;
    grOrdersLevel1: TcxGridLevel;
    grTablesView: TcxGridDBBandedTableView;
    grTablesViewColumnNAME: TcxGridDBBandedColumn;
    grTablesViewColumnSTATUS: TcxGridDBBandedColumn;
    grTablesViewColumnSTATUSFLAG: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    grTablesViewColumnID: TcxGridDBBandedColumn;
    dsTableInfo: TDataSource;
    grOrdersView: TcxGridDBBandedTableView;
    dsOrders: TDataSource;
    cxDBLabel3: TcxDBLabel;
    procedure grTablesViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    procedure LinkRoomsDataSet(ADataSet: TDataSet);
    procedure LinkTablesDataSet(ADataSet: TDataSet);
    procedure ShowTableInfo(ATableInfo, AOrders: TDataSet);
  protected
    procedure OnInitialize; override;
  end;

var
  frCBRWaiterDeskView: TfrCBRWaiterDeskView;

implementation

{$R *.dfm}

{ TfrCBRWaiterDeskView }

procedure TfrCBRWaiterDeskView.grTablesViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  WorkItem.Commands[COMMAND_TABLE_INFO].Data['TBL_ID'] := ACellViewInfo.GridRecord.Values[0];
  WorkItem.Commands[COMMAND_TABLE_INFO].Execute;
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

  WorkItem.Commands[COMMAND_ROOM_PRIOR].AddInvoker(btRoomPrior, 'OnClick');
  WorkItem.Commands[COMMAND_ROOM_NEXT].AddInvoker(btRoomNext, 'OnClick');

  WorkItem.Commands[COMMAND_ORDER_NEW].AddInvoker(btOrderNew, 'OnClick');
end;


procedure TfrCBRWaiterDeskView.ShowTableInfo(ATableInfo, AOrders: TDataSet);
begin
  dsTableInfo.DataSet := ATableInfo;
  dsOrders.DataSet := AOrders;
  pnTableInfo.Visible := true;
end;

end.

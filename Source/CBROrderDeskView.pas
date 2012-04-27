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
  cxLabel, cxDBLabel, cxDBEdit;

type
  TfrCBROrderDeskView = class(TfrCustomView, ICBROrderDeskView)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    grOrder: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox10: TcxGroupBox;
    cxButton9: TcxButton;
    btCancel: TcxButton;
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
    cxGroupBox5: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    grMenuGrp: TcxGrid;
    grMenuGrpView: TcxGridDBBandedTableView;
    grMenuGrpViewColumnID: TcxGridDBBandedColumn;
    grMenuGrpViewColumnNAME: TcxGridDBBandedColumn;
    grMenuGrpLevel1: TcxGridLevel;
    cxGroupBox8: TcxGroupBox;
    cxGroupBox9: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton8: TcxButton;
    grMenu: TcxGrid;
    grMenuView: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    dsMenu: TDataSource;
    grMenuViewColumnID: TcxGridDBBandedColumn;
    grMenuViewColumnNAME: TcxGridDBBandedColumn;
    cxGroupBox2: TcxGroupBox;
    cxDBLabel1: TcxDBLabel;
    dsHead: TDataSource;
    dsItems: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxStyle2: TcxStyle;
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
  protected
    procedure OnInitialize; override;
  end;


implementation

{$R *.dfm}

{ TfrCBROrderDeskView }

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
  WorkItem.Commands[COMMAND_CLOSE].AddInvoker(btCancel, 'OnClick');
end;

end.

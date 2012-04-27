unit CBROrderDeskPresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses;

const
  ACTIVITY_ORDER_DESK_NEW =  'views.CBR_ORDER_DESK.New';

  ENT = 'CBR_OD_VIEW';
  COMMAND_MENU_OPEN = '{4E9854DA-9576-454F-8880-EAF384FB3DA7}';
  COMMAND_ITEM_ADD = '{FBA0B203-BEFE-493A-8A06-22BA9E561BD9}';

type
  ICBROrderDeskView = interface
  ['{1DE7E4AC-1306-4661-87ED-396196986516}']
    procedure LinkMenuGrpDataSet(ADataSet: TDataSet);
    procedure LinkMenuData(ADataSet: TDataSet);
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
  end;


  TCBROrderDeskPresenter = class(TCustomPresenter)
  private
    function GetEVHead: IEntityView;
    function GetEVItems: IEntityView;
    function GetEVMenuGrp: IEntityView;
    function GetEVMenu: IEntityView;
    function View: ICBROrderDeskView;
    procedure UpdateCommandStatus;
    procedure OpenOrderHeader;
    procedure CmdOpenMenu(Sender: TObject);
    procedure CmdItemAdd(Sender: TObject);
    procedure CreateNewHeader;
  protected
    procedure OnViewReady; override;
  end;

implementation

{ TCBROrderDeskPresenter }

procedure TCBROrderDeskPresenter.CmdItemAdd(Sender: TObject);
var
  cmd: ICommand;
  ds: TDataSet;
begin
  Sender.GetInterface(ICommand, cmd);

  ds := GetEVItems.DataSet;
//  ds.Last;
  GetEVItems.Params.ParamValues['MENU_ID'] := cmd.Data['MENU_ID'];
  ds.Append;
//  Insert;
end;

procedure TCBROrderDeskPresenter.CmdOpenMenu(Sender: TObject);
var
  cmd: ICommand;
begin
  Sender.GetInterface(ICommand, cmd);

  GetEVMenu.Load([cmd.Data['GRP_ID']]);
  View.LinkMenuData(GetEVMenu.DataSet);
end;

procedure TCBROrderDeskPresenter.CreateNewHeader;
begin

end;

function TCBROrderDeskPresenter.GetEVMenu: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Menu', WorkItem);
end;

function TCBROrderDeskPresenter.GetEVMenuGrp: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('MenuGrp', WorkItem);

  Result.Load(false);

end;

function TCBROrderDeskPresenter.GetEVHead: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Header', WorkItem);
end;

function TCBROrderDeskPresenter.GetEVItems: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Items', WorkItem);
end;

procedure TCBROrderDeskPresenter.OnViewReady;
begin
  ViewTitle := 'Заказ';

  if ViewInfo.ActivityClass = ACTIVITY_ORDER_DESK_NEW then
  begin
    WorkItem.State['ID'] :=
      (WorkItem.Services[IEntityService] as IEntityService).
         Entity[ENT].GetOper('CreateHeader', WorkItem).Execute([
           WorkItem.State['TBL_ID']])['ID'];
  end;

  GetEVHead.Load([WorkItem.State['ID']]);

  GetEVItems.ImmediateSave := true;
  GetEVItems.Load([WorkItem.State['ID']]);

  View.LinkHeadData(GetEVHead.DataSet);
  View.LinkItemsData(GetEVItems.DataSet);

  View.LinkMenuGrpDataSet(GetEVMenuGrp.DataSet);

  WorkItem.Commands[COMMAND_MENU_OPEN].SetHandler(CmdOpenMenu);
  WorkItem.Commands[COMMAND_ITEM_ADD].SetHandler(CmdItemAdd);

end;


procedure TCBROrderDeskPresenter.OpenOrderHeader;
begin

end;

procedure TCBROrderDeskPresenter.UpdateCommandStatus;
begin

end;

function TCBROrderDeskPresenter.View: ICBROrderDeskView;
begin
  Result := GetView as ICBROrderDeskView;
end;

end.

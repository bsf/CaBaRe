unit CBRWaiterDeskPresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses;

const
  ENT = 'CBR_WD_VIEW';
  ENT_ROOM = 'CBR_ROOM';
  ENT_TBL = 'CBR_TBL';
  COMMAND_ROOM_PRIOR = '{6C48FDFC-FEEE-47C8-B685-8FE4A3205C2E}';
  COMMAND_ROOM_NEXT = '{AEDD37FF-27CE-422C-A271-7B0030EA9D6B}';
  COMMAND_TABLE_INFO = '{B8BF467A-774E-41E4-8CC1-DF575BEC6322}';
  COMMAND_ORDER_NEW = '{E327F129-EDE4-4A8D-B314-5220B4C89ABD}';

  ACTIVITY_ORDER_NEW = 'views.CBR_ORDER_DESK.New';
  ACTIVITY_ORDER_ITEM = 'views.CBR_ORDER_DESK.Item';


type
  ICBRWaiterDeskView = interface
  ['{030E0E52-EF49-4287-A1E3-F4B81FEF3495}']
    procedure LinkRoomsDataSet(ADataSet: TDataSet);
    procedure LinkTablesDataSet(ADataSet: TDataSet);
    procedure ShowTableInfo(ATableInfo, AOrders: TDataSet);
  end;


  TCBRWaiterDeskPresenter = class(TCustomPresenter)
  private
    function GetEVRooms: IEntityView;
    function GetEVTables: IEntityView;
    function GetEVTableInfo: IEntityView;
    function GetEVOrders: IEntityView;
    function View: ICBRWaiterDeskView;
    procedure UpdateCommandStatus;
    procedure CmdRoomPrior(Sender: TObject);
    procedure CmdRoomNext(Sender: TObject);
    procedure CmdTableInfo(Sender: TObject);
    procedure CmdOrderNew(Sender: TObject);
  protected
    procedure OnViewReady; override;
  end;
implementation

{ TCBRWaiterDeskPresenter }

procedure TCBRWaiterDeskPresenter.CmdOrderNew(Sender: TObject);
var
  activity: IActivity;
begin
  activity := WorkItem.Activities[ACTIVITY_ORDER_NEW];
  activity.Params['TBL_ID'] := GetEVTableInfo.DataSet['ID'];
  activity.Execute(WorkItem);
end;

procedure TCBRWaiterDeskPresenter.CmdRoomNext(Sender: TObject);
begin
  if not GetEVRooms.DataSet.Eof then
    GetEVRooms.DataSet.Next;
  UpdateCommandStatus;
end;

procedure TCBRWaiterDeskPresenter.CmdRoomPrior(Sender: TObject);
begin
  if not GetEVRooms.DataSet.Bof then
    GetEVRooms.DataSet.Prior;
  UpdateCommandStatus;
end;

procedure TCBRWaiterDeskPresenter.CmdTableInfo(Sender: TObject);
var
  cmd: ICommand;
begin

  Sender.GetInterface(ICommand, cmd);

  GetEVTableInfo.Load([cmd.Data['TBL_ID']]);

  GetEVOrders.Load(true); //[cmd.Data['TBL_ID']]);
  View.ShowTableInfo(GetEVTableInfo.DataSet, GetEVOrders.DataSet);
end;

function TCBRWaiterDeskPresenter.GetEVOrders: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Orders', WorkItem);

//  Result.Load(false);

end;

function TCBRWaiterDeskPresenter.GetEVRooms: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT_ROOM].GetView('Lookup', WorkItem);

  Result.Load(false);

end;

function TCBRWaiterDeskPresenter.GetEVTableInfo: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('TableInfo', WorkItem);

//  Result.Load(false);

end;

function TCBRWaiterDeskPresenter.GetEVTables: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Tables', WorkItem);

  Result.Load(false);
end;

procedure TCBRWaiterDeskPresenter.OnViewReady;
begin
  ViewTitle :=  'Заказы';

  View.LinkRoomsDataSet(GetEVRooms.DataSet);
  View.LinkTablesDataSet(GetEVTables.DataSet);

  WorkItem.Commands[COMMAND_ROOM_PRIOR].SetHandler(CmdRoomPrior);
  WorkItem.Commands[COMMAND_ROOM_NEXT].SetHandler(CmdRoomNext);
  WorkItem.Commands[COMMAND_TABLE_INFO].SetHandler(CmdTableInfo);

  WorkItem.Commands[COMMAND_ORDER_NEW].SetHandler(CmdOrderNew);
end;

procedure TCBRWaiterDeskPresenter.UpdateCommandStatus;
begin
  if GetEVRooms.DataSet.Bof then
    WorkItem.Commands[COMMAND_ROOM_PRIOR].Status := csDisabled
  else
    WorkItem.Commands[COMMAND_ROOM_PRIOR].Status := csEnabled;


  if GetEVRooms.DataSet.Eof then
    WorkItem.Commands[COMMAND_ROOM_NEXT].Status := csDisabled
  else
    WorkItem.Commands[COMMAND_ROOM_NEXT].Status := csEnabled;


end;

function TCBRWaiterDeskPresenter.View: ICBRWaiterDeskView;
begin
  Result := GetView as ICBRWaiterDeskView;
end;

end.

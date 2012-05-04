unit CBROrderDeskPresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses, CBRConst, sysutils;

const
  ENT = 'CBR_ORD_DESK';
  COMMAND_MENU_OPEN = '{4E9854DA-9576-454F-8880-EAF384FB3DA7}';
  COMMAND_ITEM_ADD = '{FBA0B203-BEFE-493A-8A06-22BA9E561BD9}';
  COMMAND_ITEM_QTY_INC = '{D397B9F8-8D6E-4E94-9BC6-C716C0380AC6}';
  COMMAND_ITEM_QTY_DEC = '{0B452758-1D53-4871-958E-E1790A9B5EC7}';
  COMMAND_ITEM_CANCEL = '{7FA180AF-7B6E-431A-AD3C-FB884BD0D5BC}';

  COMMAND_ITEM_PRIOR = '{ECAA2DAF-280A-4CBB-9441-C9B0DF9D1835}';
  COMMAND_ITEM_NEXT = '{9C1AC964-59DF-462B-B451-7BBEF033D0F1}';

  COMMAND_KORD = '{84528DE7-D306-4011-BDD5-A511F0BAD3C5}';
  COMMAND_PRECHECK = '{35A920C6-BC75-41D2-A83E-EB0DC44F52F9}';
  COMMAND_PAYT = '{D1ADF96C-9003-4C8F-AC1E-347808602886}';

type
  ICBROrderDeskView = interface
  ['{1DE7E4AC-1306-4661-87ED-396196986516}']
    procedure LinkMenuGrpDataSet(ADataSet: TDataSet);
    procedure LinkMenuData(ADataSet: TDataSet);
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
    procedure HideMenu;
  end;


  TCBROrderDeskPresenter = class(TCustomPresenter)
  private
    function GetEVHead: IEntityView;
    function GetEVItems: IEntityView;
    function GetEVMenuGrp: IEntityView;
    function GetEVMenu: IEntityView;
    function View: ICBROrderDeskView;
    procedure ItemsAfterScroll(ADataSet: TDataSet);
    procedure UpdateCommandStatus;


    procedure CmdOpenMenu(Sender: TObject);
    procedure CmdItemAdd(Sender: TObject);
    procedure CmdItemQtyInc(Sender: TObject);
    procedure CmdItemQtyDec(Sender: TObject);
    procedure SetItemQty(const AValue: Variant);
    procedure CmdItemCancel(Sender: TObject);
    procedure CmdItemPrior(Sender: TObject);
    procedure CmdItemNext(Sender: TObject);
    procedure CmdKORD(Sender: TObject);
    procedure CmdPRECHECK(Sender: TObject);
    procedure CmdPayt(Sender: TObject);
    procedure ExecActivityAndClose(const URI: string);
  protected
    function OnGetWorkItemState(const AName: string; var Done: boolean): Variant; override;
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
  GetEVItems.Params.ParamValues['MENU_ID'] := cmd.Data['MENU_ID'];
  try
    ds.Append;
    ds.Post;
  except
    ds.Cancel;
    raise;
  end;

//  Insert;
end;

procedure TCBROrderDeskPresenter.CmdItemCancel(Sender: TObject);
var
  ds: TDataSet;
begin
  ds := GetEVItems.DataSet;
  if ds['FKORD'] = 0 then
  begin
    ds.Delete;
  end
end;

procedure TCBROrderDeskPresenter.CmdItemNext(Sender: TObject);
begin
  GetEVItems.DataSet.Next;
end;

procedure TCBROrderDeskPresenter.CmdItemPrior(Sender: TObject);
begin
  GetEVItems.DataSet.Prior;
end;

procedure TCBROrderDeskPresenter.CmdItemQtyDec(Sender: TObject);
begin
  SetItemQty(GetEVItems.DataSet['QTY'] - 1);
end;

procedure TCBROrderDeskPresenter.CmdItemQtyInc(Sender: TObject);
begin
  SetItemQty(GetEVItems.DataSet['QTY'] + 1);
end;

procedure TCBROrderDeskPresenter.CmdKORD(Sender: TObject);
begin
  ExecActivityAndClose(ACTIVITY_KORDER_CREATE);
end;

procedure TCBROrderDeskPresenter.CmdOpenMenu(Sender: TObject);
var
  cmd: ICommand;
begin
  Sender.GetInterface(ICommand, cmd);

  GetEVMenu.Load([cmd.Data['GRP_ID']]);
  View.LinkMenuData(GetEVMenu.DataSet);
end;

procedure TCBROrderDeskPresenter.CmdPayt(Sender: TObject);
begin
  ExecActivityAndClose(ACTIVITY_ORD_PAYT);
end;

procedure TCBROrderDeskPresenter.CmdPRECHECK(Sender: TObject);
begin
  ExecActivityAndClose(ACTIVITY_ORD_PRECHECK);
end;

procedure TCBROrderDeskPresenter.ExecActivityAndClose(const URI: string);
var
  callerWI: TWorkItem;
  KOrderActivity: IActivity;
begin

  callerWI := WorkItem.Root.WorkItems.Find(callerURI);
  if callerWI = nil then
    callerWI := WorkItem.Parent;

  KOrderActivity := WorkItem.Activities[URI];

  KOrderActivity.Params['ORD_ID'] := WorkItem.State['ID'];

  KOrderActivity.Execute(callerWI);

  CloseView(false);


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

procedure TCBROrderDeskPresenter.ItemsAfterScroll(ADataSet: TDataSet);
begin
  UpdateCommandStatus;
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

function TCBROrderDeskPresenter.OnGetWorkItemState(const AName: string;
  var Done: boolean): Variant;
begin
  {if SameText(AName, 'ID') then
  begin
    WorkItem.State.
    Result := WorkItem.State['ID'];
    Done := true;
  end;}
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
  GetEVItems.DataSet.AfterScroll := ItemsAfterScroll;

  if GetEVHead.DataSet['STATE_ID'] > 1 then
  begin
    WorkItem.Commands[COMMAND_ITEM_ADD].Status := csDisabled;
    View.HideMenu;
  end;

  if GetEVHead.DataSet['STATE_ID'] >= 2 then
  begin
    WorkItem.Commands[COMMAND_KORD].Status := csDisabled;
    WorkItem.Commands[COMMAND_PRECHECK].Status := csDisabled;
  end;

  View.LinkHeadData(GetEVHead.DataSet);
  View.LinkItemsData(GetEVItems.DataSet);

  View.LinkMenuGrpDataSet(GetEVMenuGrp.DataSet);

  WorkItem.Commands[COMMAND_MENU_OPEN].SetHandler(CmdOpenMenu);

  WorkItem.Commands[COMMAND_ITEM_ADD].SetHandler(CmdItemAdd);
  WorkItem.Commands[COMMAND_ITEM_QTY_INC].SetHandler(CmdItemQtyInc);
  WorkItem.Commands[COMMAND_ITEM_QTY_DEC].SetHandler(CmdItemQtyDec);
  WorkItem.Commands[COMMAND_ITEM_CANCEL].SetHandler(CmdItemCancel);

  WorkItem.Commands[COMMAND_ITEM_PRIOR].SetHandler(CmdItemPrior);
  WorkItem.Commands[COMMAND_ITEM_NEXT].SetHandler(CmdItemNext);

  WorkItem.Commands[COMMAND_KORD].SetHandler(CmdKORD);
  WorkItem.Commands[COMMAND_PRECHECK].SetHandler(CmdPRECHECK);
  WorkItem.Commands[COMMAND_PAYT].SetHandler(CmdPAYT);

  UpdateCommandStatus;
end;


procedure TCBROrderDeskPresenter.SetItemQty(const AValue: Variant);
var
  ds: TDataSet;
begin
  if  AValue <= 0 then Exit;

  ds := GetEVItems.DataSet;
  try
    ds.Edit;
    ds['QTY'] := AValue;
    ds.Post;
  finally
    ds.Cancel;
  end;
end;

procedure TCBROrderDeskPresenter.UpdateCommandStatus;
begin
  WorkItem.Commands[COMMAND_ITEM_QTY_INC].Status := csDisabled;
  WorkItem.Commands[COMMAND_ITEM_QTY_DEC].Status := csDisabled;
  WorkItem.Commands[COMMAND_ITEM_CANCEL].Status := csDisabled;

  if not GetEVItems.DataSet.IsEmpty then
  begin
    if GetEVItems.DataSet['FKORD'] = 0 then
    begin
      WorkItem.Commands[COMMAND_ITEM_QTY_INC].Status := csEnabled;
      WorkItem.Commands[COMMAND_ITEM_QTY_DEC].Status := csEnabled;
      WorkItem.Commands[COMMAND_ITEM_CANCEL].Status := csEnabled;
    end;

  end;
end;

function TCBROrderDeskPresenter.View: ICBROrderDeskView;
begin
  Result := GetView as ICBROrderDeskView;
end;

end.

unit CBROrderDeskPresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses, CBRConst, sysutils,
  variants, ShellIntf;

const
  ENT = 'CBR_ORD_DESK';
  COMMAND_MENU_OPEN = '{4E9854DA-9576-454F-8880-EAF384FB3DA7}';
  COMMAND_ITEM_ADD = '{FBA0B203-BEFE-493A-8A06-22BA9E561BD9}';
  COMMAND_ITEM_QTY_INC = '{D397B9F8-8D6E-4E94-9BC6-C716C0380AC6}';
  COMMAND_ITEM_QTY_DEC = '{0B452758-1D53-4871-958E-E1790A9B5EC7}';
  COMMAND_ITEM_CANCEL = '{7FA180AF-7B6E-431A-AD3C-FB884BD0D5BC}';
  COMMAND_ITEM_ADDON = '{BC859346-0415-4FE4-8744-2BAB90D4B192}';

  COMMAND_KORD = '{84528DE7-D306-4011-BDD5-A511F0BAD3C5}';
  COMMAND_PRECHECK = '{35A920C6-BC75-41D2-A83E-EB0DC44F52F9}';
  COMMAND_PAYT = '{D1ADF96C-9003-4C8F-AC1E-347808602886}';
  COMMAND_MOVE = '{E8B21D1B-FFCD-4C10-AB8C-B8FA233C4D40}';

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
  const
    KORDER_REPORT = 'reports.korder';
    PRECHECK_REPORT = 'reports.precheck';
  private
    FLastItem: Variant;
    function GetEVHead: IEntityView;
    function GetEVItems: IEntityView;
    function GetEVItemInit: IEntityView;
    function GetEVMenuGrp: IEntityView;
    function GetEVMenu: IEntityView;
    function View: ICBROrderDeskView;
    function GetCallerWI: TWorkItem;
    procedure ItemsAfterScroll(ADataSet: TDataSet);
    procedure UpdateCommandStatus;

    procedure CmdOpenMenu(Sender: TObject);
    procedure CmdItemAddon(Sender: TObject);
    procedure CmdItemAdd(Sender: TObject);
    procedure CmdItemQtyInc(Sender: TObject);
    procedure CmdItemQtyDec(Sender: TObject);
    procedure SetItemQty(const AValue: Variant);
    procedure CmdItemCancel(Sender: TObject);
    procedure CmdKORD(Sender: TObject);
    procedure CmdPRECHECK(Sender: TObject);
    procedure CmdPayt(Sender: TObject);
    procedure CmdMove(Sender: TObject);
    procedure ExecActivityAndClose(const URI: string);
  protected
    function OnGetWorkItemState(const AName: string; var Done: boolean): Variant; override;
    procedure OnViewReady; override;
    procedure OnViewClose; override;
  end;

implementation

{ TCBROrderDeskPresenter }

procedure TCBROrderDeskPresenter.CmdItemAdd(Sender: TObject);
var
  cmd: ICommand;
  ds: TDataSet;
  dsNew: TDataSet;
  i: integer;
  field: TField;
begin
  Sender.GetInterface(ICommand, cmd);

  ds := GetEVItems.DataSet;
  if (not ds.IsEmpty)
      and (ds['MENU_ID'] = cmd.Data['MENU_ID'])
      and (ds['FKORD'] = 0) then
    SetItemQty(GetEVItems.DataSet['QTY'] + 1)
  else begin

    try
      ds.Append;

      dsNew := GetEVItemInit.Load([WorkItem.State['ID'],
        GetEVMenu.DataSet['ID'],
        GetEVMenu.DataSet['PARENT_ID']]);

      for I := 0 to dsNew.FieldCount - 1 do
      begin
        field := ds.FindField(dsNew.Fields[I].FieldName);
        if assigned(field) then
          field.Value := dsNew.Fields[I].Value;
      end;

      if VarIsNull(ds['PARENT_ID']) then
        FLastItem := ds['ID'];
      ds.Post;

    except
      ds.Cancel;
      raise;
    end;
  end;

  GetEVHead.Load(true);
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
  end;
  GetEVHead.Load(true);
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
var
  KORD_ID: Variant;
  printActivity: IActivity;
begin
  if GetEVItems.DataSet.IsEmpty then Exit;

  KORD_ID := App.Entities.Entity['CBR_KORD'].GetOper('Create', WorkItem).
    Execute([WorkItem.State['ID']]).FieldValues['ID'];

  if VarToStr(KORD_ID) <> '' then
  begin
    printActivity := WorkItem.Activities[KORDER_REPORT];
    printActivity.Params['ID'] := KORD_ID;
    printActivity.Params['LaunchMode'] := 2;
    printActivity.Execute(GetCallerWI);
    CloseView(false);
  end
  else
    App.UI.MessageBox.InfoMessage('Нет заказа!');

end;

procedure TCBROrderDeskPresenter.CmdMove(Sender: TObject);
begin
  ExecActivityAndClose(ACTIVITY_ORDER_MOVE);
end;

procedure TCBROrderDeskPresenter.CmdItemAddon(Sender: TObject);
begin
  GetEVMenu.Load([null, GetEVItems.DataSet.FieldValues['ID']]);
  View.LinkMenuData(GetEVMenu.DataSet);
end;

procedure TCBROrderDeskPresenter.CmdOpenMenu(Sender: TObject);
var
  cmd: ICommand;
begin
  Sender.GetInterface(ICommand, cmd);

  GetEVMenu.Load([cmd.Data['GRP_ID'], null]);
  View.LinkMenuData(GetEVMenu.DataSet);
end;

procedure TCBROrderDeskPresenter.CmdPayt(Sender: TObject);
var
  KORD_ID: Variant;
  activity: IActivity;
begin
  if GetEVItems.DataSet.IsEmpty then Exit;

  KORD_ID := App.Entities.Entity['CBR_KORD'].GetOper('Create', WorkItem).
    Execute([WorkItem.State['ID']]).FieldValues['ID'];

  if VarToStr(KORD_ID) <> '' then
  begin
    activity := WorkItem.Activities[KORDER_REPORT];
    activity.Params['ID'] := KORD_ID;
    activity.Params['LaunchMode'] := 2;
    activity.Execute(WorkItem);
  end;

  App.Entities.Entity['CBR_ORD'].
    GetOper('PreCheck', WorkItem).Execute([WorkItem.State['ID']]);

  activity := WorkItem.Activities[PRECHECK_REPORT];
  activity.Params['ID'] := WorkItem.State['ID'];
  activity.Params['LaunchMode'] := 2;
  activity.Execute(WorkItem);

  activity := WorkItem.Activities[ACTIVITY_ORDER_PAYT];
  activity.Params['ID'] := WorkItem.State['ID'];
  activity.Execute(GetCallerWI);

  CloseView(false);
 
end;

procedure TCBROrderDeskPresenter.CmdPreCheck(Sender: TObject);
var
  printActivity: IActivity;
begin
  if GetEVItems.DataSet.IsEmpty then Exit;

  App.Entities.Entity['CBR_ORD'].GetOper('PreCheck', WorkItem).Execute([WorkItem.State['ID']]);

  printActivity := WorkItem.Activities[PRECHECK_REPORT];
  printActivity.Params['ID'] := WorkItem.State['ID'];
  printActivity.Params['LaunchMode'] := 2;
  printActivity.Execute(GetCallerWI);

  CloseView(false);
//  ExecActivityAndClose(ACTIVITY_ORD_PRECHECK);
end;

procedure TCBROrderDeskPresenter.ExecActivityAndClose(const URI: string);
var
  callerWI: TWorkItem;
  activity: IActivity;
begin

  callerWI := WorkItem.Root.WorkItems.Find(callerURI);
  if callerWI = nil then
    callerWI := WorkItem.Parent;

  activity := WorkItem.Activities[URI];
  activity.Params['ORD_ID'] := WorkItem.State['ID'];
  activity.Execute(callerWI);

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

function TCBROrderDeskPresenter.GetCallerWI: TWorkItem;
begin
  Result := WorkItem.Root.WorkItems.Find(callerURI);
  if Result = nil then
    Result := WorkItem.Parent;
end;

function TCBROrderDeskPresenter.GetEVHead: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Header', WorkItem);
end;

function TCBROrderDeskPresenter.GetEVItemInit: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('ItemInit', WorkItem);
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

procedure TCBROrderDeskPresenter.OnViewClose;
begin
  if (ViewInfo.ActivityClass = ACTIVITY_ORDER_NEW) and
    GetEVItems.DataSet.IsEmpty then
    try
      App.Entities.Entity['CBR_ORD'].GetOper('Delete', WorkItem).
        Execute([WorkItem.State['ID']]);
    except
      on E: Exception do
        App.UI.MessageBox.ErrorMessage(E.Message);
    end;
end;

procedure TCBROrderDeskPresenter.OnViewReady;
begin
  ViewTitle := 'Заказ';

  if ViewInfo.ActivityClass = ACTIVITY_ORDER_NEW then
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


  View.LinkHeadData(GetEVHead.DataSet);
  View.LinkItemsData(GetEVItems.DataSet);

  View.LinkMenuGrpDataSet(GetEVMenuGrp.DataSet);

  WorkItem.Commands[COMMAND_MENU_OPEN].SetHandler(CmdOpenMenu);

  WorkItem.Commands[COMMAND_ITEM_ADD].SetHandler(CmdItemAdd);
  WorkItem.Commands[COMMAND_ITEM_QTY_INC].SetHandler(CmdItemQtyInc);
  WorkItem.Commands[COMMAND_ITEM_QTY_DEC].SetHandler(CmdItemQtyDec);
  WorkItem.Commands[COMMAND_ITEM_CANCEL].SetHandler(CmdItemCancel);
  WorkItem.Commands[COMMAND_ITEM_ADDON].SetHandler(CmdItemAddon);

  WorkItem.Commands[COMMAND_KORD].SetHandler(CmdKORD);
  WorkItem.Commands[COMMAND_PRECHECK].SetHandler(CmdPRECHECK);
  WorkItem.Commands[COMMAND_PAYT].SetHandler(CmdPayt);

  WorkItem.Commands[COMMAND_MOVE].SetHandler(CmdMove);
  WorkItem.Commands[COMMAND_MOVE].Status := csUnavailable;
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
    ds['SUMM'] := ds['QTY'] * ds['PRICE'];
    ds.Post;
  finally
    ds.Cancel;
  end;
  GetEVHead.Load(true);
end;

procedure TCBROrderDeskPresenter.UpdateCommandStatus;
begin
  WorkItem.Commands[COMMAND_KORD].Status := csDisabled;
  WorkItem.Commands[COMMAND_PRECHECK].Status := csDisabled;
  WorkItem.Commands[COMMAND_PAYT].Status := csDisabled;

  WorkItem.Commands[COMMAND_ITEM_QTY_INC].Status := csDisabled;
  WorkItem.Commands[COMMAND_ITEM_QTY_DEC].Status := csDisabled;
  WorkItem.Commands[COMMAND_ITEM_CANCEL].Status := csDisabled;
  WorkItem.Commands[COMMAND_ITEM_ADDON].Status := csUnavailable;

  if not GetEVItems.DataSet.IsEmpty then
  begin
    if GetEVItems.DataSet['FKORD'] = 0 then
    begin
      WorkItem.Commands[COMMAND_ITEM_QTY_INC].Status := csEnabled;
      WorkItem.Commands[COMMAND_ITEM_QTY_DEC].Status := csEnabled;
      WorkItem.Commands[COMMAND_ITEM_CANCEL].Status := csEnabled;
    end;

    if (GetEVItems.DataSet['FKORD'] = 0) and
       (GetEVItems.DataSet['ID'] = FLastItem) then
      WorkItem.Commands[COMMAND_ITEM_ADDON].Status := csEnabled;

    WorkItem.Commands[COMMAND_KORD].Status := csEnabled;
    WorkItem.Commands[COMMAND_PRECHECK].Status := csEnabled;
    WorkItem.Commands[COMMAND_PAYT].Status := csEnabled;

  end;
end;

function TCBROrderDeskPresenter.View: ICBROrderDeskView;
begin
  Result := GetView as ICBROrderDeskView;
end;

end.

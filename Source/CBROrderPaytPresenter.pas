unit CBROrderPaytPresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses, CBRConst, sysutils,
  UIClasses;

const
  ENT = 'CBR_ORD_DESK';
  COMMAND_ORDER_CLOSE = '{D51BCA3E-FFF8-46A9-99B3-7F08456C3A2A}';
  COMMAND_PAYT_CHANGED = '{64031CB0-DBC0-489A-980D-34B94B1B3087}';

type
  ICBROrderPaytView = interface
  ['{1DE7E4AC-1306-4661-87ED-396196986516}']
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
    function GetSummPayt: double;
  end;


  TCBROrderPaytPresenter = class(TCustomPresenter)
  private
    function GetEVHead: IEntityView;
    function GetEVItems: IEntityView;
    function View: ICBROrderPaytView;
    procedure CmdOrderClose(Sender: TObject);
    procedure CmdPaytChanged(Sender: TObject);
  protected
    function OnGetWorkItemState(const AName: string; var Done: boolean): Variant; override;
    procedure OnViewReady; override;
  end;
implementation

{ TCBROrderPaytPresenter }

procedure TCBROrderPaytPresenter.CmdOrderClose(Sender: TObject);
var
  nextActionID: string;
  nextAction: IActivity;
  callerWI: TWorkItem;
begin

  GetEVHead.Save;

  callerWI := WorkItem.Root.WorkItems.Find(CallerURI);
  if callerWI = nil then
    callerWI := WorkItem.Parent;

  if ViewInfo.OptionExists('ReloadCaller') then
    callerWI.Commands[COMMAND_RELOAD].Execute;

  nextAction := nil;
  nextActionID := WorkItem.State['NEXT_ACTION'];
  if nextActionID <> '' then
    nextAction := WorkItem.Activities[nextActionID];

  if Assigned(nextAction) then
    nextAction.Params.Assign(WorkItem);

  CloseView;

  if Assigned(nextAction) then
    nextAction.Execute(callerWI);

end;

procedure TCBROrderPaytPresenter.CmdPaytChanged(Sender: TObject);
var
  ds: TDataSet;
  summPayt: double;
  summRet: double;
begin
  WorkItem.Commands[COMMAND_ORDER_CLOSE].Status := csDisabled;

  summPayt := View.GetSummPayt;

  ds := GetEVHead.DataSet;
  ds.Edit;

  ds.FieldByName('SUMM_PAYT').AsFloat := summPayt;

  summRet := ds.FieldByName('SUMM_PAYT').AsFloat - ds.FieldByName('SUMM').AsFloat;

  if summRet > 0 then
    ds.FieldByName('SUMM_RET').AsFloat := summRet
  else
    ds.FieldByName('SUMM_RET').AsFloat := 0;

  ds.Post;

  if ds.FieldByName('SUMM_PAYT').AsFloat >= ds.FieldByName('SUMM').AsFloat then
     WorkItem.Commands[COMMAND_ORDER_CLOSE].Status := csEnabled;
end;

function TCBROrderPaytPresenter.GetEVHead: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Payt', WorkItem);
end;

function TCBROrderPaytPresenter.GetEVItems: IEntityView;
begin
  Result := (WorkItem.Services[IEntityService] as IEntityService).
    Entity[ENT].GetView('Items', WorkItem);
end;

function TCBROrderPaytPresenter.OnGetWorkItemState(const AName: string;
  var Done: boolean): Variant;
begin

end;

procedure TCBROrderPaytPresenter.OnViewReady;
begin
  inherited;
  ViewTitle := 'Оплата заказа';

  GetEVHead.Load([WorkItem.State['ID']]);
  GetEVItems.Load([WorkItem.State['ID']]);


  View.LinkHeadData(GetEVHead.DataSet);
  View.LinkItemsData(GetEVItems.DataSet);

  WorkItem.Commands[COMMAND_ORDER_CLOSE].Status := csDisabled;
  WorkItem.Commands[COMMAND_ORDER_CLOSE].SetHandler(CmdOrderClose);
  WorkItem.Commands[COMMAND_PAYT_CHANGED].SetHandler(CmdPaytChanged);
end;

function TCBROrderPaytPresenter.View: ICBROrderPaytView;
begin
  Result := GetView as ICBROrderPaytView;
end;

end.

unit CBRController;

interface
uses CoreClasses, SysUtils, CBRConst, UIClasses, variants,
  CBRWaiterDeskPresenter, CBRWaiterDeskView,
  CBROrderDeskPresenter, CBROrderDeskView,
  CBROrderMovePresenter, CBROrderMoveView,
  CBROrderPaytPresenter, CBROrderPaytView,
  ShellIntf;


type
  TCBRController = class(TWorkItemController)
  protected
    //
    procedure Initialize; override;

  type
    TOrderPaytHandler = class(TActivityHandler)
    const
      ENT = 'CBR_ORD';
      EView = 'Payt';
    public
      procedure Execute(Sender: TWorkItem; Activity: IActivity); override;

    end;

    TPreCheckHandler = class(TActivityHandler)
    const
      ENT = 'CBR_ORD';
      EView = 'PreCheck';
      ACTIVITY_PRINT = 'reports.precheck';
    public
      procedure Execute(Sender: TWorkItem; Activity: IActivity); override;
    end;

    TCBR_KORD_Create_Handler = class(TActivityHandler)
    const
      ENT = 'CBR_KORD';
      EView = 'Create';
      ACTIVITY_PRINT = 'reports.korder'; //'views.CBR_MENU.List';//'reports.korder';
    public
      procedure Execute(Sender: TWorkItem; Activity: IActivity); override;

    end;
  end;

implementation

{ TCBRController }

procedure TCBRController.Initialize;
begin

  WorkItem.Activities['views.CBR_WAITER_DESK.view'].
    RegisterHandler(TViewActivityHandler.Create(TCBRWaiterDeskPresenter, TfrCBRWaiterDeskView));

  WorkItem.Activities[ACTIVITY_ORDER_NEW].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderDeskPresenter, TfrCBROrderDeskView));

  WorkItem.Activities[ACTIVITY_ORDER_DESK].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderDeskPresenter, TfrCBROrderDeskView));
  WorkItem.Activities[ACTIVITY_ORDER_DESK].Params['ID'] := Unassigned;

  WorkItem.Activities[ACTIVITY_ORDER_MOVE].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderMovePresenter, TfrCBROrderMoveView));

  WorkItem.Activities[ACTIVITY_ORDER_PAYT].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderPaytPresenter, TfrCBROrderPaytView));
    WorkItem.Activities[ACTIVITY_ORDER_PAYT].Params['ID'] := Unassigned;

  WorkItem.Activities[ACTIVITY_KORDER_CREATE].
    RegisterHandler(TCBR_KORD_Create_Handler.Create);

  WorkItem.Activities[ACTIVITY_ORD_PRECHECK].
    RegisterHandler(TPreCheckHandler.Create);

  WorkItem.Activities[ACTIVITY_ORD_PAYT].
    RegisterHandler(TOrderPaytHandler.Create);

end;

{ TCBRController.TCBR_KORD_Create_Handler }


procedure TCBRController.TCBR_KORD_Create_Handler.Execute(Sender: TWorkItem;
  Activity: IActivity);
var
  KORD_ID: Variant;

begin
  KORD_ID := App.Entities.Entity[ENT].GetOper(EView, Sender).
    Execute([Activity.Params['ORD_ID']]).FieldValues['ID'];

  if VarToStr(KORD_ID) <> '' then
  begin
    Sender.Activities[ACTIVITY_PRINT].Params['ID'] := KORD_ID;
    Sender.Activities[ACTIVITY_PRINT].Params['LaunchMode'] := 2;
    Sender.Activities[ACTIVITY_PRINT].Execute(Sender);
  end;

end;

{ TCBRController.TPreCheckHandler }

procedure TCBRController.TPreCheckHandler.Execute(Sender: TWorkItem;
  Activity: IActivity);
begin
  App.Entities.Entity[ENT].GetOper(EVIEW, Sender).Execute([Activity.Params['ORD_ID']]);
  Sender.Activities[ACTIVITY_PRINT].Params['ID'] := Activity.Params['ORD_ID'];
  Sender.Activities[ACTIVITY_PRINT].Params['LaunchMode'] := 2;
  Sender.Activities[ACTIVITY_PRINT].Execute(Sender);

end;

{ TCBRController.TOrderPaytHandler }

procedure TCBRController.TOrderPaytHandler.Execute(Sender: TWorkItem;
  Activity: IActivity);
begin
  App.Entities.Entity[ENT].GetOper(EVIEW, Sender).Execute([Activity.Params['ORD_ID']]);
end;

end.


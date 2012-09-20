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

end;


end.


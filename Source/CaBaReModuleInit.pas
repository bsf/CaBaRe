unit CaBaReModuleInit;


interface
uses classes, CoreClasses, ShellIntf, Graphics, UIClasses, CBRConst,
  CBRWaiterDeskPresenter, CBRWaiterDeskView,
  CBROrderDeskPresenter, CBROrderDeskView;


type
  TCBRModule = class(TModule)
  public
    procedure Load; override;
  end;

implementation


{ TCBRModule }

procedure TCBRModule.Load;
begin
 WorkItem.Activities['views.CBR_WAITER_DESK.view'].
    RegisterHandler(TViewActivityHandler.Create(TCBRWaiterDeskPresenter, TfrCBRWaiterDeskView));

 WorkItem.Activities[ACTIVITY_ORDER_NEW].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderDeskPresenter, TfrCBROrderDeskView));

 WorkItem.Activities[ACTIVITY_ORDER_ITEM].
    RegisterHandler(TViewActivityHandler.Create(TCBROrderDeskPresenter, TfrCBROrderDeskView));

end;

initialization
  RegisterModule(TCBRModule);
end.

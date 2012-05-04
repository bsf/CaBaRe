unit CaBaReModuleInit;


interface
uses classes, CoreClasses, CBRController;

type
  TCBRModule = class(TModule)
  public
    procedure Load; override;
  end;

implementation


{ TCBRModule }

procedure TCBRModule.Load;
begin
  WorkItem.WorkItems.Add(TCBRController);

end;

initialization
  RegisterModule(TCBRModule);
end.

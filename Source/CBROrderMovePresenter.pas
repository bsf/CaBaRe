unit CBROrderMovePresenter;

interface
uses CustomPresenter, db, EntityServiceIntf, CoreClasses, CBRConst, sysutils;

const
  ENT = 'CBR_ORD_DESK';


type
  ICBROrderMoveView = interface
  ['{1DE7E4AC-1306-4661-87ED-396196986516}']
    procedure LinkMenuGrpDataSet(ADataSet: TDataSet);
    procedure LinkMenuData(ADataSet: TDataSet);
    procedure LinkHeadData(ADataSet: TDataSet);
    procedure LinkItemsData(ADataSet: TDataSet);
    procedure HideMenu;
  end;


  TCBROrderMovePresenter = class(TCustomPresenter)
  private

  protected
    function OnGetWorkItemState(const AName: string; var Done: boolean): Variant; override;
    procedure OnViewReady; override;
  end;
implementation

{ TCBROrderMovePresenter }

function TCBROrderMovePresenter.OnGetWorkItemState(const AName: string;
  var Done: boolean): Variant;
begin

end;

procedure TCBROrderMovePresenter.OnViewReady;
begin
  inherited;
    ViewTitle := 'Переброска заказа';
end;

end.

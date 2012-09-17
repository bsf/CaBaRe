program CaBaRe;

{$R 'CaBaReRes.res' 'CaBaReRes.rc'}

uses
  Forms,
  midaslib,
  bfwApp,
  bfwModules,
  CaBaReModuleInit;

{$R *.res}

type
  TCaBaReApp = class(TApp)
  end;

begin
  //Application.Initialize;  // for enabled applicaion options editor

//  Application.MainFormOnTaskbar := True;

  TCaBaReApp.AppInstance.Run;
end.

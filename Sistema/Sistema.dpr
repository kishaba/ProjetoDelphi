program Sistema;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFormPadrao in 'units\uFormPadrao.pas' {frmPadrao},
  uCadProduto in 'units\uCadProduto.pas' {frmCadProduto},
  uTabGlobal in 'units\uTabGlobal.pas' {dtmGlobal: TDataModule};

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFormPadrao in 'units\uFormPadrao.pas' {frmPadrao},
  uCadProduto in 'units\uCadProduto.pas' {frmCadProduto},

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFormPadrao in 'units\uFormPadrao.pas' {frmPadrao},
  uCadProduto in 'units\uCadProduto.pas' {frmCadProduto},

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TdtmGlobal, dtmGlobal);
  Application.CreateForm(TdtmGlobal, dtmGlobal);
  Application.CreateForm(TdtmGlobal, dtmGlobal);
  Application.Run;
end.

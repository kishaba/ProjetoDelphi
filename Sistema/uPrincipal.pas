unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    pnpTitulo: TPanel;
    pnpPrincipal: TPanel;
    Panel2: TPanel;
    pnpSair: TPanel;
    Image2: TImage;
    pnpPedidoVenda: TPanel;
    Image1: TImage;
    pnpPedidoCompra: TPanel;
    Image3: TImage;
    pnpCada: TPanel;
    Image4: TImage;
    pnpCadastros: TPanel;
    Panel3: TPanel;
    pnpVoltar: TPanel;
    Image5: TImage;
    pnpCadClientes: TPanel;
    Image7: TImage;
    pnpCadProdutos: TPanel;
    Image8: TImage;
    procedure pnpCadaMouseEnter(Sender: TObject);
    procedure pnpCadaMouseLeave(Sender: TObject);
    procedure pnpCadaClick(Sender: TObject);
    procedure pnpSairClick(Sender: TObject);
    procedure pnpVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnpCadProdutosClick(Sender: TObject);
    procedure pnpPedidoVendaClick(Sender: TObject);

  private
    { Private declarations }
    procedure selecionaMenu(nMenu: Integer);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadProduto, uLanPedidoVenda;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  selecionaMenu(1);
end;


procedure TfrmPrincipal.pnpCadaClick(Sender: TObject);
begin
  selecionaMenu(2);
end;

procedure TfrmPrincipal.pnpCadaMouseEnter(Sender: TObject);
begin
  if not(Sender is TPanel) then
    exit;
  (Sender as TPanel).Color := RGB(43, 162, 182)
end;

procedure TfrmPrincipal.pnpCadaMouseLeave(Sender: TObject);
begin
  if not(Sender is TPanel) then
    exit;
  (Sender as TPanel).Color :=clSkyBlue;
end;

procedure TfrmPrincipal.pnpCadProdutosClick(Sender: TObject);
begin
  try
   frmCadProduto := TfrmCadProduto.Create(self);
   frmCadProduto.ShowModal
  finally
    FreeAndNil(frmCadProduto);
  end;
end;

procedure TfrmPrincipal.pnpPedidoVendaClick(Sender: TObject);
begin
  frmLanPedido.ShowModal;
end;

procedure TfrmPrincipal.pnpSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.pnpVoltarClick(Sender: TObject);
begin
  selecionaMenu(1);
end;

procedure TfrmPrincipal.selecionaMenu(nMenu: Integer);
begin
  if nMenu = 0  then     //esconde menu
  begin
    pnpPrincipal.Visible := False;
    pnpCadastros.Visible := False;
  end
  else if nMenu = 1  then     //mostra menu principal
  begin
    pnpPrincipal.Visible := true;
    pnpCadastros.Visible := False;
  end
  else if nMenu  = 2 then //mostra menu cadastros
  begin
    pnpPrincipal.Visible := false;
    pnpCadastros.Visible := true;
  end;

end;

end.

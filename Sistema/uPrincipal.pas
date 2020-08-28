unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

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
    procedure pnpCadaMouseEnter(Sender: TObject);
    procedure pnpCadaMouseLeave(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


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

end.

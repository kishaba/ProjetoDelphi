unit uLanPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPickers;

type
  TfrmLanPedido = class(TfrmPadrao)
    grpPedido: TGroupBox;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtReferencia: TDBEdit;
    Label3: TLabel;
    edtNumeroPedido: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtTipoOperacao: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtCodigoCliente: TDBEdit;
    grdProdutos: TDBGrid;
    grpProduto: TGroupBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Image1: TImage;
    Image2: TImage;
    dsItens: TDataSource;
    Panel3: TPanel;
    Image3: TImage;
    edtData: TDatePicker;
    Image4: TImage;
    btnPesquisar: TImage;
    procedure actSalvarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaPedido(CodPedido: Integer);
  public
    { Public declarations }
  end;

var
  frmLanPedido: TfrmLanPedido;

implementation

{$R *.dfm}

uses uTabGlobal, uPesquisa;

procedure TfrmLanPedido.actIncluirExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Close;
  dsPadrao.DataSet.Active := true;
  dsPadrao.DataSet.Open;
  inherited;
end;

procedure TfrmLanPedido.actSalvarExecute(Sender: TObject);
begin
  dsPadrao.DataSet.FieldByName('DATAEMISSAO').AsDateTime := edtData.Date;
  inherited;

end;

procedure TfrmLanPedido.BuscaPedido(CodPedido: Integer);
begin
  dtmGlobal.qryConsultaPedido.Close;
  dtmGlobal.qryConsultaPedido.ParamByName('codpedido').AsInteger := CodPedido;
  dtmGlobal.qryConsultaPedido.Open;

  edtReferencia.Text := dtmGlobal.qryConsultaPedidoREFERENCIA.AsString;
  edtNumeroPedido.Text := dtmGlobal.qryConsultaPedidoNUMEROPEDIDO.AsString;
  edtData.Date := dtmGlobal.qryConsultaPedidoDATAEMISSAO.AsDateTime;
  edtTipoOperacao.Text := dtmGlobal.qryConsultaPedidoTIPOPERACAO.AsString;
  edtCodigoCliente.Text := dtmGlobal.qryConsultaPedidoCODIGOCLIENTE.AsString;
end;

procedure TfrmLanPedido.btnPesquisarClick(Sender: TObject);
begin
  frmPesquisa := tfrmPesquisa.Create(self, ['referencia', 'codpedido',
    'numeropedido'], 'pedido', 'codpedido');
  try
    if frmPesquisa.ShowModal = mrYes then
    begin
      edtCodigo.Text := frmPesquisa.edtRetorno.Text;
      BuscaPedido(StrToInt(frmPesquisa.edtRetorno.Text));
    end
    else
      edtCodigo.Clear;
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

end.

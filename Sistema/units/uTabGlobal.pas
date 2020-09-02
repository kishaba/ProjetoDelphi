unit uTabGlobal;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery;

type
  TdtmGlobal = class(TDataModule)
    Conexao: TIBDatabase;
    upProduto: TIBUpdateSQL;
    transProduto: TIBTransaction;
    qryPedido: TIBQuery;
    transPedido: TIBTransaction;
    upPedido: TIBUpdateSQL;
    qryPedidoCODPEDIDO: TIntegerField;
    qryPedidoREFERENCIA: TIBStringField;
    qryPedidoNUMEROPEDIDO: TIntegerField;
    qryPedidoDATAEMISSAO: TDateField;
    qryPedidoCODIGOCLIENTE: TIntegerField;
    qryPedidoTIPOPERACAO: TIBStringField;
    qryPedidoTOTALPEDIDO: TIBBCDField;
    qryItemPedido: TIBQuery;
    transItemPedido: TIBTransaction;
    upItemPedido: TIBUpdateSQL;
    qryItemPedidoCODPEDIDO: TIntegerField;
    qryItemPedidoNUMEROPEDIDO: TIntegerField;
    qryItemPedidoITEMPEDIDO: TIntegerField;
    qryItemPedidoCODPRODUTO: TIntegerField;
    qryItemPedidoQUANTIDADE: TIBBCDField;
    qryItemPedidoUNIDADE: TIBStringField;
    qryItemPedidoVALORUNITARIO: TIBBCDField;
    qryItemPedidoVALORTOTALITEM: TIBBCDField;
    qryConsultaPedido: TIBQuery;
    transConsultaPedido: TIBTransaction;
    qryConsultaPedidoCODPEDIDO: TIntegerField;
    qryConsultaPedidoREFERENCIA: TIBStringField;
    qryConsultaPedidoNUMEROPEDIDO: TIntegerField;
    qryConsultaPedidoDATAEMISSAO: TDateField;
    qryConsultaPedidoCODIGOCLIENTE: TIntegerField;
    qryConsultaPedidoTIPOPERACAO: TIBStringField;
    qryConsultaPedidoTOTALPEDIDO: TIBBCDField;
    qryProduto: TIBQuery;
    qryProdutoCODPRODUTO: TIntegerField;
    qryProdutoDESCRICAO: TIBStringField;
    qryProdutoSITUACAO: TIBStringField;
    procedure qryProdutoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmGlobal: TdtmGlobal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmGlobal.qryProdutoAfterPost(DataSet: TDataSet);
begin
  qryProduto.ApplyUpdates;
  transProduto.commit;
end;

end.

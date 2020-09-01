unit uTabGlobal;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery;

type
  TdtmGlobal = class(TDataModule)
    Conexao: TIBDatabase;
    qrProduto: TIBQuery;
    upProduto: TIBUpdateSQL;
    transProduto: TIBTransaction;
    qrProdutoCODPRODUTO: TIntegerField;
    qrProdutoDESCRICAO: TIBStringField;
    qrProdutoSITUACAO: TIBStringField;
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

end.

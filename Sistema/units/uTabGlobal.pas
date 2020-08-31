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

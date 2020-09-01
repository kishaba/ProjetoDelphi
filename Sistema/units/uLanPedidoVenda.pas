unit uLanPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPickers;

type
  TfrmLanPedido = class(TfrmPadrao)
    grpPedido: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
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
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLanPedido: TfrmLanPedido;

implementation

{$R *.dfm}

uses uTabGlobal;

procedure TfrmLanPedido.actSalvarExecute(Sender: TObject);
begin
  dsPadrao.DataSet.FieldByName('DATAEMISSAO').AsDateTime := edtData.Date;
  inherited;

end;

end.

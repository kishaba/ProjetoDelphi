unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    cbCampos: TComboBox;
    cbFiltro: TComboBox;
    edtBusca: TEdit;
    btnPesquisa: TImage;
    qrySql: TIBQuery;
    transSql: TIBTransaction;
    dtsPesquisa: TDataSource;
    edtRetorno: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    cCampos, cCampoRetorno, cTabela: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; par_lstCampos: Array of string;
      par_cTabela, par_cCampoResult: string);
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses uTabGlobal;

{ TfrmPesquisa }

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
begin
  if qrySql.Active then
     qrySql.Close;
  with qrySql.SQL do
      begin
        Clear;
        add('Select '+cCampos);
        add('from '+cTabela);
        add('where '+trim(cbCAMPOS.Text)+' like :cParametro');
      end;
  if cbFiltro.Text = 'parte' then
     qrySql.ParamByName('cParametro').AsString := '%'+trim(edtBusca.Text)+'%'
  else if cbFiltro.Text = 'inicio' then
     qrySql.ParamByName('cParametro').AsString := trim(edtBusca.Text)+'%'
  else if cbFiltro.Text = 'igual' then
     qrySql.ParamByName('cParametro').AsString := trim(edtBusca.Text) ;
  qrySql.Open;

end;

constructor TfrmPesquisa.Create(AOwner: TComponent;
  par_lstCampos: array of string; par_cTabela, par_cCampoResult: string);
var
  n: Integer;
begin
  inherited Create(AOwner);
  // Conexao.Open;
  cCampoRetorno := par_cCampoResult;
  cCampos := '';
  cbCampos.Clear;
  cTabela := par_cTabela;
  for n := 0 to Length(par_lstCampos) - 1 do
  begin
    cbCampos.Items.Add(par_lstCampos[n]);
    if n = 0 then
      cCampos := par_lstCampos[n]
    else
      cCampos := cCampos + ',' + par_lstCampos[n];
  end;
  cbCampos.ItemIndex := 1;
  if qrySql.Active then
    qrySql.Close;
  with qrySql.SQL do
  begin
    Clear;
    Add('Select ' + cCampos);
    Add('from ' + cTabela)
  end;
  qrySql.Open;

end;

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  edtRetorno.Clear;
  edtRetorno.Text := qrySql.FieldByName(cCampoRetorno).AsVariant;
  qrySql.Close;
  frmPesquisa.ModalResult := mrYes;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  edtBusca.SetFocus;
end;

end.

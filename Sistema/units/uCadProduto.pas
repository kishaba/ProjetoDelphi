unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Data.DB,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls;

type
  TfrmCadProduto = class(TfrmPadrao)
    grdConsulta: TDBGrid;
    edtlocalizar: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    procedure edtLocalizarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure grdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uTabGlobal;

procedure TfrmCadProduto.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  grdConsulta.Enabled := true;
end;

procedure TfrmCadProduto.btnIncluiClick(Sender: TObject);
begin
  inherited;
  grdConsulta.Enabled := False;
  edtDescricao.SetFocus;
end;

procedure TfrmCadProduto.btnSalvaClick(Sender: TObject);
begin
  inherited;
  grdConsulta.Enabled := true;
end;


procedure TfrmCadProduto.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
   btnSalvaClick(Sender);
  end;

end;

procedure TfrmCadProduto.edtLocalizarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    grdConsulta.SetFocus;
  end
  else
  if Length(edtlocalizar.Text)>0 then
  begin
   dsPadrao.DataSet.Locate('DESCRICAO', edtlocalizar.Text,
       [loPartialKey,loCaseInsensitive]);
  end
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  edtlocalizar.SetFocus;
end;

procedure TfrmCadProduto.grdConsultaKeyPress(Sender: TObject; var Key: Char);
Var
   xVarNome : String;
begin
  if key = #13 then
  begin
   if InputQuery('Pesquisar ' +
      TDBGrid(Sender).Columns[TDBGrid(Sender).SelectedIndex].FieldName,
      'Digite o conteúdo',xVarNome) then
      TDBGrid(Sender).DataSource.DataSet.Locate(TDBGrid(Sender).
       Columns[TDBGrid(Sender).SelectedIndex].FieldName, xVarNome,
       [loPartialKey,loCaseInsensitive]);
  end;
end;

end.

unit uFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnInclui: TImage;
    btnEdita: TImage;
    btnExclui: TImage;
    btnSalva: TImage;
    BtnCancela: TImage;
    dsPadrao: TDataSource;
    procedure btnIncluiClick(Sender: TObject);
    procedure btnEditaClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnProcuraClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ControlaBotoes;
    procedure HabilitaEdicao(status:boolean);
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

uses uTabGlobal;

{ TfrmPadrao }

procedure TfrmPadrao.BtnCancelaClick(Sender: TObject);
begin
  dsPadrao.DataSet.Cancel;
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.btnEditaClick(Sender: TObject);
begin
  dsPadrao.DataSet.Edit;
  ControlaBotoes;
  HabilitaEdicao(true);
end;

procedure TfrmPadrao.btnExcluiClick(Sender: TObject);
  begin
  if MessageDlg('Deseja mesmo Excluir(Inativar) o produto?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
     dsPadrao.DataSet.Delete
  end;
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.btnIncluiClick(Sender: TObject);
begin
  dsPadrao.DataSet.Insert;
  ControlaBotoes;
  HabilitaEdicao(true);
end;

procedure TfrmPadrao.btnProcuraClick(Sender: TObject);
begin
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.btnSalvaClick(Sender: TObject);
begin
  dsPadrao.DataSet.post;
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.ControlaBotoes;
begin
  btnInclui.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnEdita.Visible   := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnExclui.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnSalva.Visible   := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  BtnCancela.Visible := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.HabilitaEdicao(status: boolean);
var i: integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if Components[i] is TDBEdit then
    begin
      TDBEdit(Components[i]).Enabled    := status;
      TDBEdit(Components[i]).Color      := clWhite;
      TDBEdit(Components[i]).Font.Color := clBlack;
    end
    else if Components[i] is TDBComboBox then
    begin
      TDBComboBox(Components[i]).Enabled    := status;
      TDBComboBox(Components[i]).Color      := clWhite;
      TDBComboBox(Components[i]).Font.Color := clBlack;
    end
    else if Components[i] is TDBLookupComboBox then
    begin
      TDBLookupComboBox(Components[i]).Enabled    := status;
      TDBLookupComboBox(Components[i]).Color      := clWhite;
      TDBLookupComboBox(Components[i]).Font.Color := clBlack;
    end;
  end;
end;

end.

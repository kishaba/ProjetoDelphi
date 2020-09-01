unit uFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions, Vcl.ActnList;

type
  TfrmPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnInclui: TImage;
    btnEdita: TImage;
    btnExclui: TImage;
    btnSalva: TImage;
    btnCancela: TImage;
    dsPadrao: TDataSource;
    lblF2: TLabel;
    lblF3: TLabel;
    lblF4: TLabel;
    lblF5: TLabel;
    lblF6: TLabel;
    ActionList1: TActionList;
    actIncluir: TAction;
    actEdita: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    procedure FormShow(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditaExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
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

procedure TfrmPadrao.actCancelarExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Cancel;
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.actEditaExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Edit;
  ControlaBotoes;
  HabilitaEdicao(true);
end;

procedure TfrmPadrao.actExcluirExecute(Sender: TObject);
begin
  if MessageDlg('Deseja mesmo Excluir(Inativar) o produto?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
     dsPadrao.DataSet.Delete
  end;
  ControlaBotoes;
  HabilitaEdicao(false);
end;

procedure TfrmPadrao.actIncluirExecute(Sender: TObject);
begin
  dsPadrao.DataSet.Insert;
  ControlaBotoes;
  HabilitaEdicao(true);
end;

procedure TfrmPadrao.actSalvarExecute(Sender: TObject);
begin
  dsPadrao.DataSet.post;
  ControlaBotoes;
  HabilitaEdicao(false);
end;


procedure TfrmPadrao.ControlaBotoes;
begin
  btnInclui.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  lblF2.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnEdita.Visible   := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  lblF3.Visible   := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnExclui.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  lblF4.Visible  := not(dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  btnSalva.Visible   := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  lblF5.Visible   := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  BtnCancela.Visible := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
  lblF6.Visible := (dsPadrao.DataSet.State in [dsInsert,dsEdit]);
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

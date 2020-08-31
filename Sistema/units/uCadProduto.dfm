inherited frmCadProduto: TfrmCadProduto
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 95
    Top = 170
    Width = 117
    Height = 13
    Caption = 'Pesquisa por Descri'#231#227'o: '
  end
  inherited Panel1: TPanel
    Caption = 'Cadastro de Produtos'
    ExplicitWidth = 796
  end
  inherited Panel2: TPanel
    ExplicitHeight = 556
  end
  object grdConsulta: TDBGrid [3]
    Left = 92
    Top = 216
    Width = 696
    Height = 378
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPadrao
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = grdConsultaKeyPress
  end
  object edtlocalizar: TEdit [4]
    Left = 95
    Top = 189
    Width = 333
    Height = 21
    TabOrder = 3
    OnKeyUp = edtLocalizarKeyUp
  end
  object GroupBox1: TGroupBox [5]
    Left = 92
    Top = 47
    Width = 696
    Height = 117
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 14
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = edtCodigo
    end
    object Label2: TLabel
      Left = 12
      Top = 61
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtDescricao
    end
    object edtCodigo: TDBEdit
      Left = 11
      Top = 31
      Width = 134
      Height = 21
      DataField = 'CODPRODUTO'
      DataSource = dsPadrao
      Enabled = False
      TabOrder = 0
    end
    object edtDescricao: TDBEdit
      Left = 11
      Top = 80
      Width = 520
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsPadrao
      TabOrder = 1
      OnKeyPress = edtDescricaoKeyPress
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = dtmGlobal.qrProduto
    Left = 456
    Top = 64
  end
end

inherited frmCadProduto: TfrmCadProduto
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 92
    Top = 113
    Width = 110
    Height = 13
    Caption = 'Pesquisa por Descri'#231#227'o'
    FocusControl = edtDescricao
  end
  inherited Panel1: TPanel
    Caption = 'Cadastro de Produtos'
  end
  object grdConsulta: TDBGrid [3]
    Left = 92
    Top = 168
    Width = 723
    Height = 421
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPadrao
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = grdConsultaKeyPress
  end
  object GroupBox1: TGroupBox [4]
    Left = 92
    Top = 47
    Width = 723
    Height = 60
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitWidth = 696
    object Label1: TLabel
      Left = 476
      Top = 3
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = edtCodigo
      Visible = False
    end
    object Label2: TLabel
      Left = 11
      Top = 3
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtDescricao
    end
    object edtCodigo: TDBEdit
      Left = 476
      Top = 22
      Width = 134
      Height = 21
      DataField = 'CODPRODUTO'
      DataSource = dsPadrao
      Enabled = False
      TabOrder = 0
      Visible = False
    end
    object edtDescricao: TDBEdit
      Left = 11
      Top = 22
      Width = 446
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsPadrao
      TabOrder = 1
      OnKeyPress = edtDescricaoKeyPress
    end
  end
  object edtlocalizar: TEdit [5]
    Left = 92
    Top = 132
    Width = 457
    Height = 21
    TabOrder = 4
    OnKeyUp = edtLocalizarKeyUp
  end
  inherited dsPadrao: TDataSource
    DataSet = dtmGlobal.qryProduto
    Left = 16
    Top = 248
  end
  inherited ActionList1: TActionList
    Left = 16
    Top = 296
  end
end

object dtmGlobal: TdtmGlobal
  OldCreateOrder = False
  Height = 408
  Width = 547
  object Conexao: TIBDatabase
    Connected = True
    DatabaseName = 'H:\GitHub\ProjetoDelphi\PROJETO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 32
    Top = 8
  end
  object qrProduto: TIBQuery
    Database = Conexao
    Transaction = transProduto
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PRODUTO'
      'order by DESCRICAO')
    UpdateObject = upProduto
    GeneratorField.Field = 'CODPRODUTO'
    GeneratorField.Generator = 'GEN_CODPRODUTO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 64
    object qrProdutoCODPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPRODUTO'
      Origin = 'PRODUTO.CODPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrProdutoDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 100
    end
    object qrProdutoSITUACAO: TIBStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'PRODUTO.SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object upProduto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODPRODUTO,'
      '  DESCRICAO,'
      '  SITUACAO'
      'from PRODUTO '
      'where'
      '  CODPRODUTO = :CODPRODUTO')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  CODPRODUTO = :CODPRODUTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  SITUACAO = :SITUACAO'
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      '  (CODPRODUTO, DESCRICAO)'
      'values'
      '  (:CODPRODUTO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'update PRODUTO'
      'set'
      '  SITUACAO = '#39'I'#39
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    Left = 32
    Top = 120
  end
  object transProduto: TIBTransaction
    Active = True
    DefaultDatabase = Conexao
    Left = 96
    Top = 64
  end
end

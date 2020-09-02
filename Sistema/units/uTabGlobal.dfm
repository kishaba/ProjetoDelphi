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
  object upProduto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from produto '
      'where'
      '  CODPRODUTO = :CODPRODUTO')
    ModifySQL.Strings = (
      'update produto'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  SITUACAO = :SITUACAO'
      'where'
      '  CODPRODUTO = :OLD_CODPRODUTO')
    InsertSQL.Strings = (
      'insert into produto'
      '  (CODPRODUTO, DESCRICAO, SITUACAO)'
      'values'
      '  (:CODPRODUTO, :DESCRICAO, :SITUACAO)')
    DeleteSQL.Strings = (
      'delete from produto'
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
  object qryPedido: TIBQuery
    Database = Conexao
    Transaction = transPedido
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PEDIDO')
    UpdateObject = upPedido
    GeneratorField.Field = 'CODPEDIDO'
    GeneratorField.Generator = 'GEN_CODPEDIDO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 176
    object qryPedidoCODPEDIDO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPEDIDO'
      Origin = 'PEDIDO.CODPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoREFERENCIA: TIBStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
      Origin = 'PEDIDO.REFERENCIA'
      Required = True
      Size = 10
    end
    object qryPedidoNUMEROPEDIDO: TIntegerField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'NUMEROPEDIDO'
      Origin = 'PEDIDO.NUMEROPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoDATAEMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      Origin = 'PEDIDO.DATAEMISSAO'
    end
    object qryPedidoCODIGOCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CODIGOCLIENTE'
      Origin = 'PEDIDO.CODIGOCLIENTE'
    end
    object qryPedidoTIPOPERACAO: TIBStringField
      DisplayLabel = 'Tipo opera'#231#227'o'
      FieldName = 'TIPOPERACAO'
      Origin = 'PEDIDO.TIPOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryPedidoTOTALPEDIDO: TIBBCDField
      DisplayLabel = 'Total Pedido'
      FieldName = 'TOTALPEDIDO'
      Origin = 'PEDIDO.TOTALPEDIDO'
      Precision = 18
      Size = 4
    end
  end
  object transPedido: TIBTransaction
    DefaultDatabase = Conexao
    Left = 96
    Top = 176
  end
  object upPedido: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODPEDIDO,'
      '  REFERENCIA,'
      '  NUMEROPEDIDO,'
      '  DATAEMISSAO,'
      '  CODIGOCLIENTE,'
      '  TIPOPERACAO,'
      '  TOTALPEDIDO'
      'from PEDIDO '
      'where'
      '  CODPEDIDO = :CODPEDIDO and'
      '  NUMEROPEDIDO = :NUMEROPEDIDO')
    ModifySQL.Strings = (
      'update PEDIDO'
      'set'
      '  REFERENCIA = :REFERENCIA,'
      '  NUMEROPEDIDO = :NUMEROPEDIDO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  CODIGOCLIENTE = :CODIGOCLIENTE,'
      '  TIPOPERACAO = :TIPOPERACAO,'
      '  TOTALPEDIDO = :TOTALPEDIDO'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  NUMEROPEDIDO = :OLD_NUMEROPEDIDO')
    InsertSQL.Strings = (
      'insert into PEDIDO'
      
        '  (REFERENCIA, NUMEROPEDIDO, DATAEMISSAO, CODIGOCLIENTE, TIPOPER' +
        'ACAO, TOTALPEDIDO)'
      'values'
      
        '  (:REFERENCIA, :NUMEROPEDIDO, :DATAEMISSAO, :CODIGOCLIENTE, :TI' +
        'POPERACAO, '
      '   :TOTALPEDIDO)')
    DeleteSQL.Strings = (
      'delete from PEDIDO'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  NUMEROPEDIDO = :OLD_NUMEROPEDIDO')
    Left = 32
    Top = 232
  end
  object qryItemPedido: TIBQuery
    Database = Conexao
    Transaction = transItemPedido
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPEDIDO')
    GeneratorField.Field = 'ITEMPEDIDO'
    GeneratorField.Generator = 'GEN_CODPEDIDO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 168
    Top = 176
    object qryItemPedidoCODPEDIDO: TIntegerField
      FieldName = 'CODPEDIDO'
      Origin = 'ITEMPEDIDO.CODPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemPedidoNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'ITEMPEDIDO.NUMEROPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemPedidoITEMPEDIDO: TIntegerField
      FieldName = 'ITEMPEDIDO'
      Origin = 'ITEMPEDIDO.ITEMPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemPedidoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Origin = 'ITEMPEDIDO.CODPRODUTO'
      Required = True
    end
    object qryItemPedidoQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'ITEMPEDIDO.QUANTIDADE'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryItemPedidoUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      Origin = 'ITEMPEDIDO.UNIDADE'
      Required = True
      Size = 6
    end
    object qryItemPedidoVALORUNITARIO: TIBBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'ITEMPEDIDO.VALORUNITARIO'
      Required = True
      Precision = 18
      Size = 4
    end
    object qryItemPedidoVALORTOTALITEM: TIBBCDField
      FieldName = 'VALORTOTALITEM'
      Origin = 'ITEMPEDIDO.VALORTOTALITEM'
      Required = True
      Precision = 18
      Size = 4
    end
  end
  object transItemPedido: TIBTransaction
    DefaultDatabase = Conexao
    Left = 248
    Top = 176
  end
  object upItemPedido: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODPEDIDO,'
      '  NUMEROPEDIDO,'
      '  ITEMPEDIDO,'
      '  CODPRODUTO,'
      '  QUANTIDADE,'
      '  UNIDADE,'
      '  VALORUNITARIO,'
      '  VALORTOTALITEM'
      'from ITEMPEDIDO '
      'where'
      '  CODPEDIDO = :CODPEDIDO and'
      '  NUMEROPEDIDO = :NUMEROPEDIDO and'
      '  ITEMPEDIDO = :ITEMPEDIDO')
    ModifySQL.Strings = (
      'update ITEMPEDIDO'
      'set'
      '  CODPRODUTO = :CODPRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  UNIDADE = :UNIDADE,'
      '  VALORUNITARIO = :VALORUNITARIO,'
      '  VALORTOTALITEM = :VALORTOTALITEM'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  NUMEROPEDIDO = :OLD_NUMEROPEDIDO and'
      '  ITEMPEDIDO = :OLD_ITEMPEDIDO')
    InsertSQL.Strings = (
      'insert into ITEMPEDIDO'
      
        '  (CODPRODUTO, QUANTIDADE, UNIDADE, VALORUNITARIO, VALORTOTALITE' +
        'M)'
      'values'
      
        '  (:CODPRODUTO, :QUANTIDADE, :UNIDADE, :VALORUNITARIO, :VALORTOT' +
        'ALITEM)')
    DeleteSQL.Strings = (
      'delete from ITEMPEDIDO'
      'where'
      '  CODPEDIDO = :OLD_CODPEDIDO and'
      '  NUMEROPEDIDO = :OLD_NUMEROPEDIDO and'
      '  ITEMPEDIDO = :OLD_ITEMPEDIDO')
    Left = 168
    Top = 232
  end
  object qryConsultaPedido: TIBQuery
    Database = Conexao
    Transaction = transConsultaPedido
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PEDIDO where pedido.codpedido = :codpedido')
    GeneratorField.Field = 'CODPEDIDO'
    GeneratorField.Generator = 'GEN_CODPEDIDO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 112
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codpedido'
        ParamType = ptUnknown
      end>
    object qryConsultaPedidoCODPEDIDO: TIntegerField
      FieldName = 'CODPEDIDO'
      Origin = 'PEDIDO.CODPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaPedidoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'PEDIDO.REFERENCIA'
      Required = True
      Size = 10
    end
    object qryConsultaPedidoNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMEROPEDIDO'
      Origin = 'PEDIDO.NUMEROPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaPedidoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'PEDIDO.DATAEMISSAO'
    end
    object qryConsultaPedidoCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'PEDIDO.CODIGOCLIENTE'
    end
    object qryConsultaPedidoTIPOPERACAO: TIBStringField
      FieldName = 'TIPOPERACAO'
      Origin = 'PEDIDO.TIPOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaPedidoTOTALPEDIDO: TIBBCDField
      FieldName = 'TOTALPEDIDO'
      Origin = 'PEDIDO.TOTALPEDIDO'
      Precision = 18
      Size = 4
    end
  end
  object transConsultaPedido: TIBTransaction
    DefaultDatabase = Conexao
    Left = 184
    Top = 312
  end
  object qryProduto: TIBQuery
    Database = Conexao
    Transaction = transProduto
    ForcedRefresh = True
    AfterPost = qryProdutoAfterPost
    Active = True
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from produto')
    UpdateObject = upProduto
    GeneratorField.Field = 'CODPRODUTO'
    GeneratorField.Generator = 'GEN_CODPEDIDO'
    Left = 32
    Top = 64
    object qryProdutoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Origin = 'PRODUTO.CODPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 100
    end
    object qryProdutoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'PRODUTO.SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
end

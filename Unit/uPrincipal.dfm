object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 387
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBUltimGrid1: TJvDBUltimGrid
    Left = 8
    Top = 8
    Width = 465
    Height = 177
    DataSource = dsFactura
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object JvDBUltimGrid2: TJvDBUltimGrid
    Left = 8
    Top = 202
    Width = 465
    Height = 159
    DataSource = dsDetalleFactura
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FACTURA'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCTO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 320
    Top = 272
    Width = 81
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Conn: TFDConnection
    Params.Strings = (
      'Database=D:\BD\BASE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = Transaccion
    Left = 424
    Top = 24
  end
  object Transaccion: TFDTransaction
    Connection = Conn
    Left = 424
    Top = 80
  end
  object qFactura: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'Select * from FACTURA')
    Left = 24
    Top = 72
    object qFacturaID: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFacturaNUM_FACTURA: TStringField
      DisplayLabel = 'N'#176' Factura'
      DisplayWidth = 12
      FieldName = 'NUM_FACTURA'
      Origin = 'NUM_FACTURA'
    end
    object qFacturaFECHA_FACTURA: TDateField
      DisplayLabel = 'Fecha Factura'
      DisplayWidth = 14
      FieldName = 'FECHA_FACTURA'
      Origin = 'FECHA_FACTURA'
    end
    object qFacturaCLIENTE_FACTURA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE_FACTURA'
      Origin = 'CLIENTE_FACTURA'
      Size = 100
    end
  end
  object dsFactura: TDataSource
    DataSet = qFactura
    Left = 72
    Top = 72
  end
  object Driver: TFDPhysFBDriverLink
    Left = 424
    Top = 128
  end
  object Cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 440
    Top = 184
  end
  object qDetalleFactura: TFDQuery
    Active = True
    IndexFieldNames = 'ID_FACTURA'
    MasterSource = dsFactura
    MasterFields = 'ID'
    DetailFields = 'ID_FACTURA'
    Connection = Conn
    FetchOptions.AssignedValues = [evDetailServerCascade]
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'Select * from DETALLE_FACTURA WHERE ID_FACTURA = :ID')
    Left = 16
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qDetalleFacturaID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDetalleFacturaID_FACTURA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID_FACTURA'
      Origin = 'ID_FACTURA'
    end
    object qDetalleFacturaPRODUCTO: TStringField
      DisplayWidth = 23
      FieldName = 'PRODUCTO'
      Origin = 'PRODUCTO'
      Size = 50
    end
    object qDetalleFacturaCANTIDAD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
    end
    object qDetalleFacturaVALOR_UNITARIO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
    end
    object qDetalleFacturaSUB_TOTAL: TSmallintField
      Alignment = taLeftJustify
      DisplayWidth = 12
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
    end
  end
  object dsDetalleFactura: TDataSource
    DataSet = qDetalleFactura
    Left = 104
    Top = 168
  end
end

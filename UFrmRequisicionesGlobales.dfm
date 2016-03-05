object FrmRequisicionesGlobales: TFrmRequisicionesGlobales
  Left = 0
  Top = 0
  Caption = 'Requisiciones'
  ClientHeight = 340
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPageControl1: TNxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 508
    Height = 334
    ActivePage = NxTabSheet1
    ActivePageIndex = 0
    Align = alClient
    TabOrder = 0
    BackgroundColor = clGradientActiveCaption
    BackgroundKind = bkSolid
    Margin = 0
    Options = [pgBoldActiveTab, pgTopBorder]
    Spacing = 0
    TabHeight = 17
    object NxTabSheet1: TNxTabSheet
      Caption = 'Reportes'
      PageIndex = 0
      ParentTabFont = False
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'Tahoma'
      TabFont.Style = []
      object FiltroDos: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 502
        Height = 57
        Align = alTop
        Caption = 'Rango Fechas'
        ParentBackground = False
        TabOrder = 0
        object Label22: TLabel
          Left = 73
          Top = 26
          Width = 38
          Height = 13
          Caption = 'F. Inicio'
        end
        object Label23: TLabel
          Left = 266
          Top = 26
          Width = 35
          Height = 13
          Caption = 'F. Final'
        end
        object FechaInicio: TDateTimePicker
          Left = 112
          Top = 22
          Width = 81
          Height = 21
          Date = 40992.638837592590000000
          Time = 40992.638837592590000000
          Enabled = False
          TabOrder = 0
          OnChange = FechaInicioChange
        end
        object FechaFinal: TDateTimePicker
          Left = 306
          Top = 22
          Width = 80
          Height = 21
          Date = 40992.638837592590000000
          Time = 40992.638837592590000000
          Enabled = False
          TabOrder = 1
          OnChange = FechaFinalChange
        end
        object chkFechas: TCheckBox
          Left = 391
          Top = 23
          Width = 121
          Height = 17
          Caption = 'Filtrar por fechas.'
          TabOrder = 2
          OnClick = chkFechasClick
        end
      end
      object FiltroUno: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 66
        Width = 502
        Height = 57
        Align = alTop
        Caption = 'Proveedores'
        ParentBackground = False
        TabOrder = 1
        object cboProveedores: TDBLookupComboBox
          Left = 16
          Top = 24
          Width = 369
          Height = 21
          Enabled = False
          KeyField = 'sIdProveedor'
          ListField = 'sRazon'
          ListSource = dsProveedores
          TabOrder = 0
          OnCloseUp = cboProveedoresCloseUp
        end
        object chkTodosProveedores: TCheckBox
          Left = 391
          Top = 26
          Width = 121
          Height = 17
          Caption = 'Seleccionar todos'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkTodosProveedoresClick
        end
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 129
        Width = 502
        Height = 57
        Align = alTop
        Caption = 'Referencias'
        ParentBackground = False
        TabOrder = 2
        object cboReferencias: TDBLookupComboBox
          Left = 16
          Top = 24
          Width = 369
          Height = 21
          Enabled = False
          KeyField = 'sNumeroOrden'
          ListField = 'sNumeroOrden'
          ListSource = dsReferencias
          TabOrder = 0
          OnCloseUp = cboReferenciasCloseUp
        end
        object ChkTodasReferencias: TCheckBox
          Left = 391
          Top = 26
          Width = 121
          Height = 17
          Caption = 'Seleccionar todos'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = ChkTodasReferenciasClick
        end
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 192
        Width = 502
        Height = 65
        Align = alTop
        Caption = 'Materiales '
        ParentBackground = False
        TabOrder = 3
        object cboMateriales: TDBLookupComboBox
          Left = 16
          Top = 22
          Width = 370
          Height = 21
          Enabled = False
          KeyField = 'sIdInsumo'
          ListField = 'mDescripcion'
          ListSource = dsMateriales
          TabOrder = 1
          OnCloseUp = cboMaterialesCloseUp
        end
        object chkTodosMateriales: TCheckBox
          Left = 392
          Top = 14
          Width = 121
          Height = 38
          Caption = 'Seleccionar todos'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkTodosMaterialesClick
        end
      end
      object btnImprimir: TButton
        Left = 370
        Top = 263
        Width = 126
        Height = 41
        Caption = '&Imprimir'
        TabOrder = 4
        OnClick = btnImprimirClick
      end
    end
  end
  object zConceptos: TZQuery
    Connection = connection.zConnection
    SQL.Strings = (
      'Select '
      '  p.sMedida,'
      '  p.sIdinsumo,'
      '  p.mDescripcion,'
      '  (Select '
      
        '    Group_concat(Concat(oc.sOrdenCompra, " = ", (pp.cantidadSuma' +
        '))) '
      '   From anexo_pedidos as oc '
      '   '
      '   Inner join'
      
        '     (Select x.*, Sum(x.dCantidad) as cantidadSuma from anexo_pp' +
        'edido as x /*where x.sContrato = :Contrato*/ group by  x.sContra' +
        'to,x.iFolioPedido, x.sIdInsumo  ) as pp'
      
        '   on(pp.iFolioPedido = oc.iFolioPedido /*and pp.sStatus = '#39'Entr' +
        'egado'#39'*/)'
      '   '
      '   Where'
      
        '    (/*oc.sFolioRequisicion = r.sNumFolio and*/ pp.sIdInsumo = p' +
        '.sIdInsumo and oc.sContrato = :Contrato and oc.SStatus = "AUTORI' +
        'ZADO")) as OC,'
      '   '
      '   (Select '
      '    Sum(pp.dCantidad)'
      '   From anexo_pedidos as oc '
      '   '
      '   Inner join'
      '     anexo_ppedido as pp'
      
        '   on(pp.iFolioPedido = oc.iFolioPedido /*and pp.sStatus = '#39'Entr' +
        'egado'#39'*/)'
      '   '
      '   Where'
      
        '     (/*oc.sFolioRequisicion = r.sNumFolio and*/ pp.sIdInsumo = ' +
        'p.sIdInsumo and oc.sContrato = :Contrato and oc.SStatus = "AUTOR' +
        'IZADO")) as CantOC'
      '  '
      'from '
      '  anexo_requisicion as r'
      'inner join'
      '  anexo_prequisicion as p'
      
        'on (p.iFolioRequisicion = r.sNumFolio and p.sContrato = r.sContr' +
        'ato)'
      'left join'
      '  insumos as i'
      'on (i.sIdInsumo = p.sIdInsumo)'
      'Where'
      
        '  ((:Folio = -1 or (:Folio <> -1 and r.sNumFolio = :Folio)) and ' +
        '(r.sContrato = :Contrato))  and'
      
        '  (:IdInsumo = -1 or (:IdInsumo <> -1 and p.sIdInsumo= :IdInsumo' +
        ')) and '
      
        '  (:Inicio = -1 or (:Inicio <> -1 and r.dFechaSolicitado BETWEEN' +
        ' :Inicio and :Termino)) and '
      
        '  (:Referencia = -1 or (:Referencia <> -1 and r.sReferencia = :R' +
        'eferencia)) and '
      
        '  (:Proveedor = -1 or (:Proveedor <> -1 and i.sIdProveedor = :Pr' +
        'oveedor))'
      'group by  p.sIdinsumo;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
  end
  object zRequisiciones: TZQuery
    Connection = connection.zConnection
    SQL.Strings = (
      '/*Requisiones*/'
      'Select '
      '  r.sNumFolio '
      'from '
      '  anexo_requisicion as r'
      'inner join'
      '  anexo_prequisicion as p'
      
        'on (p.iFolioRequisicion = r.sNumFolio  and p.sContrato = r.sCont' +
        'rato)'
      ''
      'left join'
      '  insumos as i'
      'on (i.sIdInsumo = p.sIdInsumo)'
      ''
      'Where'
      
        '  ((:Folio = -1 or (:Folio <> -1 and r.sNumFolio = :Folio)) and ' +
        '(r.sContrato = :Contrato))  and'
      
        '  (:IdInsumo = -1 or (:IdInsumo <> -1 and p.sIdInsumo= :IdInsumo' +
        ')) and '
      
        '  (:Inicio = -1 or (:Inicio <> -1 and r.dFechaSolicitado BETWEEN' +
        ' :Inicio and :Termino)) and '
      
        '  (:Referencia = -1 or (:Referencia <> -1 and r.sReferencia = :R' +
        'eferencia)) and '
      
        '  (:Proveedor = -1 or (:Proveedor <> -1 and i.sIdProveedor = :Pr' +
        'oveedor))'
      'group by r.sNumFolio'
      'Order by r.sContrato, r.sNumFolio;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
  end
  object zCantidades: TZQuery
    Connection = connection.zConnection
    SQL.Strings = (
      '/*Cantidades*/'
      'Select '
      '  r.snumFolio,'
      '  r.sContrato,'
      '  p.sContrato,'
      '  p.sIdinsumo,'
      '  p.mDescripcion,'
      ' SUM( p.dCantidad) as dCantidad,'
      '  p.dFechaRequerimiento'
      'from '
      '  anexo_requisicion as r'
      'inner join'
      '  anexo_prequisicion as p'
      
        'on (p.iFolioRequisicion = r.sNumFolio  and p.sContrato = r.sCont' +
        'rato)'
      ''
      'left join'
      '  insumos as i'
      'on (i.sIdInsumo = p.sIdInsumo)'
      ''
      'Where'
      
        '  ((:Folio = -1 or (:Folio <> -1 and r.sNumFolio = :Folio)) and ' +
        '(r.sContrato = :Contrato)) and'
      
        '  (:IdInsumo = -1 or (:IdInsumo <> -1 and p.sIdInsumo= :IdInsumo' +
        ')) and '
      
        '  (:Inicio = -1 or (:Inicio <> -1 and r.dFechaSolicitado BETWEEN' +
        ' :Inicio and :Termino)) and '
      
        '  (:Referencia = -1 or (:Referencia <> -1 and r.sReferencia = :R' +
        'eferencia)) and '
      
        '  (:Proveedor = -1 or (:Proveedor <> -1 and i.sIdProveedor = :Pr' +
        'oveedor))'
      'group by r.sContrato, r.sNumFolio, p.sIdInsumo'
      'Order by r.sContrato, r.sNumFolio;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Folio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdInsumo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Referencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proveedor'
        ParamType = ptUnknown
      end>
  end
  object qryProveedores: TZReadOnlyQuery
    Connection = connection.zConnection
    SQL.Strings = (
      'select sIdProveedor, sRazon from proveedores')
    Params = <>
    Left = 184
    Top = 127
  end
  object dsProveedores: TDataSource
    DataSet = qryProveedores
    Left = 224
    Top = 127
  end
  object qryReferencias: TZReadOnlyQuery
    Connection = connection.zConnection
    SQL.Strings = (
      
        'select sNumeroOrden from ordenesdetrabajo where sContrato =:Cont' +
        'rato')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 191
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object dsReferencias: TDataSource
    DataSet = qryReferencias
    Left = 304
    Top = 191
  end
  object qryMateriales: TZReadOnlyQuery
    Connection = connection.zConnection
    SQL.Strings = (
      'Select '
      'p.sMedida,'
      ' p.sIdinsumo,'
      ' substring( p.mDescripcion,1,255) as mDescripcion'
      'from '
      '  anexo_requisicion as r'
      'inner join'
      '  anexo_prequisicion as p'
      
        'on (p.iFolioRequisicion = r.sNumFolio and p.sContrato = r.sContr' +
        'ato)'
      ''
      'Where'
      ' (r.sContrato = :Contrato)'
      'group by  p.sIdinsumo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 295
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptUnknown
      end>
  end
  object dsMateriales: TDataSource
    DataSet = qryMateriales
    Left = 336
    Top = 303
  end
end

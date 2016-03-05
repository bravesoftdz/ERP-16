object frm_Notificaciones: Tfrm_Notificaciones
  Left = 0
  Top = 0
  Caption = 'Notificaciones'
  ClientHeight = 550
  ClientWidth = 927
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid_Notificaciones: TcxGrid
    Left = 72
    Top = 0
    Width = 855
    Height = 320
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Grid_NotificacionesDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ds_Notificaciones
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      object Grid_NotificacionesDBTableView1Column2: TcxGridDBColumn
        Caption = 'Fecha de Alerta'
        DataBinding.FieldName = 'dFecha'
        Options.Editing = False
        Width = 93
      end
      object ColFechaE: TcxGridDBColumn
        Caption = 'Fecha de Evento'
        DataBinding.FieldName = 'dFechaEvento'
        Options.Editing = False
        Width = 98
      end
      object ColFechaI: TcxGridDBColumn
        Caption = 'Fecha Inicio'
        DataBinding.FieldName = 'dFechaInicio'
        Width = 73
      end
      object ColFechaF: TcxGridDBColumn
        Caption = 'Fecha Final'
        DataBinding.FieldName = 'dFechaFinal'
        Width = 71
      end
      object ColTitulo: TcxGridDBColumn
        Caption = 'Titulo'
        Width = 179
      end
      object ColConcepto: TcxGridDBColumn
        Caption = 'Concepto'
        DataBinding.FieldName = 'sConcepto'
        Options.Editing = False
        Width = 169
      end
      object Grid_NotificacionesDBTableView1Column4: TcxGridDBColumn
        Caption = 'Descripci'#243'n'
        DataBinding.FieldName = 'sDescripcion'
        Options.Editing = False
        Width = 273
      end
      object ColReceptor: TcxGridDBColumn
        Caption = 'Receptor'
        DataBinding.FieldName = 'sIdUsuarioR'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'sIdUsuario'
        Properties.ListColumns = <
          item
            FieldName = 'sNombre'
          end>
        Properties.ListSource = ds_Usuarios
        Options.Editing = False
        Width = 167
      end
      object Grid_NotificacionesDBTableView1Column7: TcxGridDBColumn
        Caption = 'Estatus'
        DataBinding.FieldName = 'sStatus'
        Options.Editing = False
        Width = 84
      end
    end
    object Grid_NotificacionesLevel1: TcxGridLevel
      GridView = Grid_NotificacionesDBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 320
    Align = alBottom
    Caption = 'Elegir Tipo de Notificacion'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 5
    Height = 230
    Width = 927
    object cxPageControl1: TcxPageControl
      Left = 3
      Top = 42
      Width = 921
      Height = 178
      Align = alBottom
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 172
      ClientRectLeft = 2
      ClientRectRight = 915
      ClientRectTop = 29
      object cxTabSheet1: TcxTabSheet
        Caption = 'Eventos'
        ImageIndex = 0
        object cxLabel9: TcxLabel
          Left = 8
          Top = 15
          Caption = 'Titulo'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 8
          Top = 41
          Caption = 'Fecha de Alerta'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel3: TcxLabel
          Left = 8
          Top = 68
          Caption = 'Fecha de Evento'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtFechaE: TcxDBDateEdit
          Left = 104
          Top = 67
          DataBinding.DataField = 'dFechaEvento'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          OnEnter = edtFechaEEnter
          OnExit = edtFechaEExit
          OnKeyPress = edtFechaEKeyPress
          Width = 121
        end
        object edtFechaA: TcxDBDateEdit
          Left = 104
          Top = 40
          DataBinding.DataField = 'dFecha'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          OnEnter = edtFechaAVEnter
          OnExit = edtFechaAVExit
          OnKeyPress = edtFechaAVKeyPress
          Width = 121
        end
        object cxLabel4: TcxLabel
          Left = 331
          Top = 14
          Caption = 'Descripci'#243'n'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtDesc: TcxDBMemo
          Left = 402
          Top = 14
          DataBinding.DataField = 'sDescripcion'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 6
          OnEnter = edtDescEnter
          OnExit = edtDescExit
          OnKeyPress = edtDescKeyPress
          Height = 75
          Width = 224
        end
        object lkpReceptor: TcxDBLookupComboBox
          Left = 711
          Top = 14
          DataBinding.DataField = 'sIdUsuarioR'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.KeyFieldNames = 'sIdUsuario'
          Properties.ListColumns = <
            item
              FieldName = 'sNombre'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = ds_Usuarios
          Properties.ReadOnly = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 7
          OnEnter = lkpReceptorEnter
          OnExit = lkpReceptorExit
          OnKeyPress = lkpReceptorKeyPress
          Width = 193
        end
        object cxLabel5: TcxLabel
          Left = 654
          Top = 15
          Caption = 'Receptor'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 654
          Top = 42
          Caption = 'Repetir'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtRepetir: TcxDBComboBox
          Left = 711
          Top = 41
          DataBinding.DataField = 'sRepetir'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Todos los d'#237'as'
            'Todas las semanas'
            'Todos los meses')
          Properties.ReadOnly = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 10
          OnEnter = edtRepetirEnter
          OnExit = edtRepetirExit
          OnKeyPress = edtRepetirKeyPress
          Width = 193
        end
        object cxLabel7: TcxLabel
          Left = 654
          Top = 69
          Caption = 'Estatus'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cbStatus: TcxDBComboBox
          Left = 711
          Top = 68
          DataBinding.DataField = 'sStatus'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Cerrado'
            'Abierto')
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 12
          OnEnter = cbStatusEnter
          OnExit = cbStatusExit
          OnKeyPress = cbStatusKeyPress
          Width = 193
        end
        object edtTitulo: TcxDBTextEdit
          Left = 104
          Top = 13
          DataBinding.DataField = 'sTitulo'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 13
          OnEnter = edtTituloEnter
          OnExit = edtTituloExit
          OnKeyPress = edtTituloKeyPress
          Width = 193
        end
        object edtTiempo: TcxDBTimeEdit
          Left = 711
          Top = 95
          DataBinding.DataField = 'tTiempo'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.TimeFormat = tfHourMin
          TabOrder = 14
          Width = 95
        end
        object cxLabel23: TcxLabel
          Left = 654
          Top = 96
          Caption = 'Tiempo'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel24: TcxLabel
          Left = 812
          Top = 96
          Caption = '(Horas:Minutos)'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Vigencias'
        ImageIndex = 1
        object cxLabel1: TcxLabel
          Left = 8
          Top = 15
          Caption = 'Modulo'
          ParentFont = False
          Transparent = True
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 42
          Caption = 'Concepto'
          ParentFont = False
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 8
          Top = 68
          Caption = 'Fecha de Alerta'
          ParentFont = False
          Transparent = True
        end
        object edtFechaAV: TcxDBDateEdit
          Left = 99
          Top = 67
          DataBinding.DataField = 'dFecha'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 3
          OnEnter = edtFechaAVEnter
          OnExit = edtFechaAVExit
          OnKeyPress = edtFechaAVKeyPress
          Width = 121
        end
        object cbConceptoV: TcxDBComboBox
          Left = 99
          Top = 41
          DataBinding.DataField = 'sConcepto'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 4
          OnEnter = cbConceptoVEnter
          OnExit = cbConceptoVExit
          OnKeyPress = cbConceptoVKeyPress
          Width = 193
        end
        object lkpModuloV: TcxComboBox
          Left = 99
          Top = 14
          ParentFont = False
          Properties.Items.Strings = (
            'Almac'#233'n'
            'Control Administrativo'
            'Control de obra'
            'Nomina'
            'Precios Unitarios'
            'Recursos Humanos'
            'Ventas')
          Properties.OnChange = lkpModuloVPropertiesChange
          TabOrder = 5
          OnEnter = lkpModuloVEnter
          OnExit = lkpModuloVExit
          OnKeyPress = lkpModuloVKeyPress
          Width = 193
        end
        object edtDescV: TcxDBMemo
          Left = 397
          Top = 14
          DataBinding.DataField = 'sDescripcion'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 6
          OnEnter = edtDescVEnter
          OnExit = edtDescVExit
          OnKeyPress = edtDescVKeyPress
          Height = 95
          Width = 224
        end
        object cxLabel13: TcxLabel
          Left = 333
          Top = 15
          Caption = 'Descripci'#243'n'
          ParentFont = False
          Transparent = True
        end
        object cxLabel15: TcxLabel
          Left = 651
          Top = 15
          Caption = 'Repetir'
          ParentFont = False
          Transparent = True
        end
        object cxLabel16: TcxLabel
          Left = 651
          Top = 42
          Caption = 'Estatus'
          ParentFont = False
          Transparent = True
        end
        object cbStatusV: TcxDBComboBox
          Left = 709
          Top = 41
          DataBinding.DataField = 'sStatus'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Cerrado'
            'Abierto')
          TabOrder = 10
          OnEnter = cbStatusVEnter
          OnExit = cbStatusVExit
          OnKeyPress = cbStatusVKeyPress
          Width = 193
        end
        object edtRepetirV: TcxDBComboBox
          Left = 709
          Top = 14
          DataBinding.DataField = 'sRepetir'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Todos los d'#237'as'
            'Todas las semanas'
            'Todos los meses')
          Properties.ReadOnly = False
          TabOrder = 11
          OnEnter = edtRepetirVEnter
          OnExit = edtRepetirVExit
          OnKeyPress = edtRepetirVKeyPress
          Width = 193
        end
        object cxLabel12: TcxLabel
          Left = 651
          Top = 68
          Caption = 'A partir de'
          ParentFont = False
          Transparent = True
        end
        object edtFechaIV: TcxDBDateEdit
          Left = 709
          Top = 67
          DataBinding.DataField = 'dFechaInicio'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 13
          OnEnter = edtFechaIVEnter
          OnExit = edtFechaIVExit
          OnKeyPress = edtFechaIVKeyPress
          Width = 85
        end
        object cxLabel14: TcxLabel
          Left = 654
          Top = 96
          Caption = 'Tiempo'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtTiempoV: TcxDBTimeEdit
          Left = 711
          Top = 95
          DataBinding.DataField = 'tTiempo'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.TimeFormat = tfHourMin
          TabOrder = 15
          OnEnter = edtTiempoVEnter
          OnExit = edtTiempoVExit
          Width = 95
        end
        object cxLabel17: TcxLabel
          Left = 812
          Top = 96
          Caption = '(Horas:Minutos)'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'Criterios'
        ImageIndex = 2
        object cxLabel8: TcxLabel
          Left = 8
          Top = 15
          Caption = 'Modulo'
          ParentFont = False
          Transparent = True
        end
        object cxLabel18: TcxLabel
          Left = 8
          Top = 42
          Caption = 'Concepto'
          ParentFont = False
          Transparent = True
        end
        object cxLabel19: TcxLabel
          Left = 8
          Top = 68
          Caption = 'Fecha de Alerta'
          ParentFont = False
          Transparent = True
        end
        object edtFechaAC: TcxDBDateEdit
          Left = 94
          Top = 68
          DataBinding.DataField = 'dFecha'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 3
          OnEnter = edtFechaACEnter
          OnExit = edtFechaACExit
          OnKeyPress = edtFechaACKeyPress
          Width = 121
        end
        object cbConceptoC: TcxDBComboBox
          Left = 94
          Top = 41
          DataBinding.DataField = 'sConcepto'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 4
          OnEnter = cbConceptoCEnter
          OnExit = cbConceptoCExit
          OnKeyPress = cbConceptoCKeyPress
          Width = 193
        end
        object lkpModuloC: TcxComboBox
          Left = 94
          Top = 14
          ParentFont = False
          Properties.Items.Strings = (
            'Almacen'
            'Control Administrativo'
            'Control de obra'
            'Nomina'
            'Precios Unitarios'
            'Recursos Humanos'
            'Ventas')
          Properties.OnChange = lkpModuloCPropertiesChange
          TabOrder = 5
          OnEnter = lkpModuloCEnter
          OnExit = lkpModuloCExit
          OnKeyPress = lkpModuloCKeyPress
          Width = 193
        end
        object cxLabel20: TcxLabel
          Left = 337
          Top = 14
          Caption = 'Descripci'#243'n'
          ParentFont = False
          Transparent = True
        end
        object edtDescC: TcxDBMemo
          Left = 401
          Top = 14
          DataBinding.DataField = 'sDescripcion'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          TabOrder = 7
          OnEnter = edtDescCEnter
          OnExit = edtDescCExit
          OnKeyPress = edtDescCKeyPress
          Height = 75
          Width = 224
        end
        object cxLabel21: TcxLabel
          Left = 654
          Top = 15
          Caption = 'Repetir'
          ParentFont = False
          Transparent = True
        end
        object cxLabel22: TcxLabel
          Left = 654
          Top = 42
          Caption = 'Estatus'
          ParentFont = False
          Transparent = True
        end
        object cbStatusC: TcxDBComboBox
          Left = 709
          Top = 41
          DataBinding.DataField = 'sStatus'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Cerrado'
            'Abierto')
          TabOrder = 10
          OnEnter = cbStatusCEnter
          OnExit = cbStatusCExit
          OnKeyPress = cbStatusCKeyPress
          Width = 193
        end
        object edtRepetirC: TcxDBComboBox
          Left = 709
          Top = 14
          DataBinding.DataField = 'sRepetir'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.Items.Strings = (
            'Todos los d'#237'as'
            'Todas las semanas'
            'Todos los meses')
          Properties.ReadOnly = False
          TabOrder = 11
          OnEnter = edtRepetirCEnter
          OnExit = edtRepetirCExit
          OnKeyPress = edtRepetirCKeyPress
          Width = 193
        end
        object cxLabel25: TcxLabel
          Left = 654
          Top = 68
          Caption = 'Tiempo'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object edtTiempoC: TcxDBTimeEdit
          Left = 711
          Top = 67
          DataBinding.DataField = 'tTiempo'
          DataBinding.DataSource = ds_Notificaciones
          ParentFont = False
          Properties.TimeFormat = tfHourMin
          TabOrder = 13
          Width = 95
        end
        object cxLabel26: TcxLabel
          Left = 812
          Top = 68
          Caption = '(Horas:Minutos)'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
    end
    object rbEventos: TcxRadioButton
      Left = 13
      Top = 19
      Width = 68
      Height = 17
      Caption = 'Eventos'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbEventosClick
    end
    object rbVigencias: TcxRadioButton
      Left = 89
      Top = 19
      Width = 79
      Height = 17
      Caption = 'Vigencias'
      TabOrder = 2
      OnClick = rbVigenciasClick
    end
    object rbRegistros: TcxRadioButton
      Left = 176
      Top = 19
      Width = 75
      Height = 17
      Caption = 'Criterios'
      TabOrder = 3
      OnClick = rbRegistrosClick
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'PopupPrincipal')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = frmrepositorio.IconosBarra
    ImageOptions.LargeImages = frmrepositorio.IconosBarra
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <
      item
      end>
    UseSystemFont = False
    Left = 496
    Top = 112
    DockControlHeights = (
      72
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Personalizado 1'
      CaptionButtons = <>
      DockedDockingStyle = dsLeft
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsLeft
      FloatLeft = 629
      FloatTop = 323
      FloatClientWidth = 68
      FloatClientHeight = 304
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxInsertar'
        end
        item
          Visible = True
          ItemName = 'dxEditar'
        end
        item
          Visible = True
          ItemName = 'dxGuardar'
        end
        item
          Visible = True
          ItemName = 'dxCancelar'
        end
        item
          Visible = True
          ItemName = 'dxEliminar'
        end
        item
          Visible = True
          ItemName = 'dxImprimir'
        end
        item
          Visible = True
          ItemName = 'dxRefrescar'
        end
        item
          Visible = True
          ItemName = 'dxSalir'
        end>
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxInsertar: TdxBarLargeButton
      Tag = 1
      Caption = '&Insertar'
      Category = 1
      Visible = ivAlways
      LargeImageIndex = 0
      ShortCut = 16429
      OnClick = dxInsertarClick
      AutoGrayScale = False
    end
    object dxEditar: TdxBarLargeButton
      Tag = 2
      Caption = '&Editar'
      Category = 1
      Visible = ivAlways
      LargeImageIndex = 1
      ShortCut = 16453
      OnClick = dxEditarClick
      AutoGrayScale = False
    end
    object dxGuardar: TdxBarLargeButton
      Tag = 9
      Caption = '&Guardar'
      Category = 1
      Enabled = False
      Hint = 'Guardar'
      Visible = ivAlways
      LargeImageIndex = 2
      ShortCut = 121
      OnClick = dxGuardarClick
      AutoGrayScale = False
    end
    object dxCancelar: TdxBarLargeButton
      Tag = 9
      Caption = '&Cancelar'
      Category = 1
      Enabled = False
      Visible = ivAlways
      LargeImageIndex = 3
      ShortCut = 122
      OnClick = dxCancelarClick
      AutoGrayScale = False
    end
    object dxEliminar: TdxBarLargeButton
      Tag = 3
      Caption = 'Eliminar'
      Category = 1
      Visible = ivAlways
      LargeImageIndex = 4
      ShortCut = 16452
      OnClick = dxEliminarClick
      AutoGrayScale = False
    end
    object dxRefrescar: TdxBarLargeButton
      Caption = 'Actualizar'
      Category = 1
      Hint = 'Actualizar'
      Visible = ivAlways
      LargeImageIndex = 6
      ShortCut = 116
      OnClick = dxRefrescarClick
      AutoGrayScale = False
    end
    object dxSalir: TdxBarLargeButton
      Caption = 'Salir'
      Category = 1
      Visible = ivAlways
      LargeImageIndex = 7
      ShortCut = 16472
      OnClick = dxSalirClick
      AutoGrayScale = False
    end
    object dxImprimir: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 1
      Hint = 'Imprimir'
      Visible = ivAlways
      LargeImageIndex = 5
      AutoGrayScale = False
    end
  end
  object zq_Notificaciones: TZQuery
    Connection = connection.zConnection
    SQL.Strings = (
      'select n.*'
      'from nuc_notificaciones n'
      ' where (n.sIdUsuarioE=:Usuario or n.sIdUsuarioR=:Usuario) and'
      'n.sTipoAlert=:TipoAlert')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoAlert'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TipoAlert'
        ParamType = ptUnknown
      end>
  end
  object ds_Notificaciones: TDataSource
    DataSet = zq_Notificaciones
    Left = 576
    Top = 72
  end
  object zq_Usuarios: TZQuery
    Connection = connection.zConnection
    SQL.Strings = (
      'SELECT * FROM usuarios ORDER BY sNombre')
    Params = <>
    Left = 536
    Top = 112
  end
  object ds_Usuarios: TDataSource
    DataSet = zq_Usuarios
    Left = 576
    Top = 112
  end
end

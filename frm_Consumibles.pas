unit frm_Consumibles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, frm_connection, global, frm_barra, Grids, DBGrids, StdCtrls, masUtilerias, 
  ExtCtrls, DBCtrls, Mask, DB, Menus, frxClass, frxDBSet, Utilerias, Jpeg,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, RXDBCtrl, rxToolEdit,
  NxCollection, sLabel, rxCurrEdit, Buttons, RXSpin,
  AdvCircularProgress, udbgrid, unitexcepciones, unittbotonespermisos,
  UnitValidaTexto, UnitExcel, ComObj, UnitTablasImpactadas, unitactivapop,
  UFunctionsGHH, ComCtrls, DBDateTimePicker, UnitValidacion, ExtDlgs, NxEdit,
  JvExControls, JvLabel, Newpanel, AdvDBLookupComboBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, ExportaExcel, cxPropertiesStore,
  dxLayoutContainer, dxLayoutControlAdapters, dxLayoutControl, cxSplitter,
  dxLayoutcxEditAdapters, cxDBEdit, cxGroupBox, FormAutoScaler;
type
  TfrmConsumibles = class(TForm)
    DBTotalesxCategoria: TfrxDBDataset;
    PopupPrincipal: TPopupMenu;
    Insertar1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Registrar1: TMenuItem;
    Can1: TMenuItem;
    N2: TMenuItem;
    Eliminar1: TMenuItem;
    Refresh1: TMenuItem;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N4: TMenuItem;
    Salir1: TMenuItem;
    ds_insumos: TDataSource;
    insumos: TZQuery;
    grupos: TZReadOnlyQuery;
    dsGrupos: TDataSource;
    Precios: TZQuery;
    dtsPrecios: TDataSource;
    BuscaObjeto: TZReadOnlyQuery;
    ds_buscaobjeto: TDataSource;
    PreciossDescripcion: TStringField;
    PreciosdIdFecha: TDateField;
    PreciossContrato: TStringField;
    PreciossNumeroActividad: TStringField;
    PreciosdPrecios: TFloatField;
    PreciossIdGrupo: TStringField;
    frxInsumos: TfrxReport;
    ImprimeMaterialesStockMin1: TMenuItem;
    ImprimeMaterialesStockMax1: TMenuItem;
    NxHeaderPanel2: TNxHeaderPanel;
    ds_imp_insumos: TDataSource;
    Imp_Insumos: TZQuery;
    ImprimeProductosPerecederos1: TMenuItem;
    ImprimeporUbicacion1: TMenuItem;
    ds_almacen: TDataSource;
    almacen: TZReadOnlyQuery;
    Label17: TLabel;
    ds_DistribuciondeMaterial: TDataSource;
    DistribuciondeMaterial: TZQuery;
    DistribuciondeMaterialiAnno: TIntegerField;
    DistribuciondeMaterialsMes: TStringField;
    DistribuciondeMaterialdIdFecha: TDateField;
    DistribuciondeMaterialdCantidad: TFloatField;
    DistribuciondeMaterialsIdMaterial: TStringField;
    AnexoDMA: TZReadOnlyQuery;
    ImprimeAnexoDMA1: TMenuItem;
    ImprimeAnexoF1: TMenuItem;
    frxAnexoDMA: TfrxReport;
    DBAnexoDMA: TfrxDBDataset;
    dsProveedores: TDataSource;
    Proveedores: TZReadOnlyQuery;
    N6: TMenuItem;
    N5: TMenuItem;
    ImportarMaterialesCatalogoMaestro1: TMenuItem;
    SelccionarMateriales1: TMenuItem;
    DesglocedePrecioMaterial1: TMenuItem;
    ExportaaPlantillaExcel1: TMenuItem;
    SaveDialog1: TSaveDialog;
    insumossContrato: TStringField;
    insumossIdInsumo: TStringField;
    insumossIdProveedor: TStringField;
    insumossIdAlmacen: TStringField;
    insumossTipoActividad: TStringField;
    insumosmDescripcion: TMemoField;
    insumosdFecha: TDateField;
    insumosdFechaInicio: TDateField;
    insumosdFechaFinal: TDateField;
    insumosdCostoMN: TFloatField;
    insumosdCostoDll: TFloatField;
    insumosdVentaMN: TFloatField;
    insumosdVentaDLL: TFloatField;
    insumossMedida: TStringField;
    insumosdCantidad: TFloatField;
    insumosdInstalado: TFloatField;
    insumossIdFase: TStringField;
    insumosdPorcentaje: TFloatField;
    insumosdNuevoPrecio: TFloatField;
    insumosdExistencia: TFloatField;
    insumossUbicacion: TStringField;
    insumosdStockMax: TFloatField;
    insumosdStockMin: TFloatField;
    insumoslAplicaFecha: TStringField;
    insumosdFechaCaducidad: TDateField;
    insumossDescripcion: TStringField;
    insumossNumeroserie: TStringField;
    SaveImage: TSaveDialog;
    OpenPicture: TOpenPictureDialog;
    PopupSecundario: TPopupMenu;
    MenuItem1: TMenuItem;
    ImprimirMaterialesFotografia1: TMenuItem;
    SeguimientodeMAteriales1: TMenuItem;
    insumossModelo: TStringField;
    insumosiIdSubfamilia: TIntegerField;
    insumossIdMarca: TStringField;
    qrySubfamilia: TZQuery;
    ds_Subfamilia: TDataSource;
    qryMarcas: TZQuery;
    qryTipoSubFamilia: TZQuery;
    ds_Marcas: TDataSource;
    ds_TipoSubFamilia: TDataSource;
    qryMarcassIdMarca: TStringField;
    qryMarcassMarca: TStringField;
    qryTipoSubFamiliaiIdTipoSubFamilia: TIntegerField;
    qryTipoSubFamiliaiIdSubFamilia: TIntegerField;
    qryTipoSubFamiliasTipo: TStringField;
    insumosiIdTipoSubFamilia: TIntegerField;
    insumosdTalla: TStringField;
    MainMenu1: TMainMenu;
    zkardex: TZQuery;
    Panel: tNewGroupBox;
    JvLabel1: TJvLabel;
    BitBtn2: TBitBtn;
    dskardex: TDataSource;
    BitBtn3: TBitBtn;
    zdac: TZReadOnlyQuery;
    contra: TEdit;
    insumossEstado: TStringField;
    grupossIdFamilia: TStringField;
    grupossDescripcion: TStringField;
    qrySubfamiliaiIdSubfamilia: TIntegerField;
    qrySubfamiliasIdFamilia: TStringField;
    qrySubfamiliasDescripcion: TStringField;
    insumossIdGrupo: TStringField;
    insumosiId: TIntegerField;
    zqMedidas: TZQuery;
    dsMedidas: TDataSource;
    styleGrid: TcxStyleRepository;
    cxstylBlue: TcxStyle;
    cxstylRed: TcxStyle;
    cxstylBlack: TcxStyle;
    ExportaraExcel1: TMenuItem;
    zq_contratos: TZQuery;
    zqTipoInsumo: TZQuery;
    Label12: TLabel;
    insumosmDescripcionIngles: TMemoField;
    Cantidades1: TMenuItem;
    Montos1: TMenuItem;
    AnexoDMAsIdInsumo: TStringField;
    AnexoDMAsMedida: TStringField;
    AnexoDMAdCantidad: TFloatField;
    AnexoDMAdMensual: TFloatField;
    AnexoDMAsIdEquipo: TStringField;
    AnexoDMAsDescripcion: TMemoField;
    AnexoDMAdMensualMonto: TFloatField;
    AnexoDMAdVentaMN: TFloatField;
    AnexoDMAdVentaDLL: TFloatField;
    AnexoDMAdMes: TIntegerField;
    AnexoDMAdAnno: TIntegerField;
    cxPropertiesStore1: TcxPropertiesStore;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    tsNumeroActividad: TDBEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    dbProveedores: TDBLookupComboBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    tsDescripcion: TDBMemo;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item4: TdxLayoutItem;
    tsDescripcionIngles: TDBMemo;
    dxLayoutControl1Item5: TdxLayoutItem;
    btnProveedores: TBitBtn;
    dxLayoutControl1Item6: TdxLayoutItem;
    sTipoActividad: TComboBox;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item7: TdxLayoutItem;
    dbGrupos: TDBLookupComboBox;
    dxLayoutControl1Group3: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Group4: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item9: TdxLayoutItem;
    tsdCantidad: TDBEdit;
    dxLayoutControl1Item10: TdxLayoutItem;
    BitBtn5: TBitBtn;
    dxLayoutControl1Group5: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item11: TdxLayoutItem;
    btnMedidas: TBitBtn;
    dxLayoutControl1Item12: TdxLayoutItem;
    btnGrupoFamilia: TBitBtn;
    dxLayoutControl1Item13: TdxLayoutItem;
    AjustarCantidad: TRxCalcEdit;
    dxLayoutControl1Item14: TdxLayoutItem;
    rSumarExistencia: TRadioButton;
    dxLayoutControl1Item15: TdxLayoutItem;
    rRestarExistencia: TRadioButton;
    dxLayoutControl1Group8: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Group9: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item16: TdxLayoutItem;
    tsdModelo: TDBEdit;
    dxLayoutControl1Item17: TdxLayoutItem;
    tsdTalla: TDBEdit;
    dxLayoutControl1Item18: TdxLayoutItem;
    tsdVenta: TDBEdit;
    dxLayoutControl1Item19: TdxLayoutItem;
    tsdCosto: TDBEdit;
    dxLayoutControl1Item20: TdxLayoutItem;
    tsdPrecioDLL: TDBEdit;
    dxLayoutControl1Item21: TdxLayoutItem;
    tsdPrecioMN: TDBEdit;
    dxLayoutControl1Item22: TdxLayoutItem;
    dbSubfamilia: TDBLookupComboBox;
    dxLayoutControl1Group10: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item23: TdxLayoutItem;
    btnSubFamilia: TBitBtn;
    dxLayoutControl1Group12: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item24: TdxLayoutItem;
    tdFecha: TDBDateTimePicker;
    dxLayoutControl1Item25: TdxLayoutItem;
    dbNuevoPrecio: TDBEdit;
    dxLayoutControl1Group14: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item26: TdxLayoutItem;
    tdFechaInicio: TDBDateTimePicker;
    dxLayoutControl1Group15: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item27: TdxLayoutItem;
    tdFechaFinal: TDBDateTimePicker;
    dxLayoutControl1Group16: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item28: TdxLayoutItem;
    dbeNroSerie: TDBEdit;
    dxLayoutControl1Group17: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item29: TdxLayoutItem;
    dFechaCaducidad: TDBDateTimePicker;
    dxLayoutControl1Group18: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item30: TdxLayoutItem;
    chkFecha: TDBCheckBox;
    dxLayoutControl1Item31: TdxLayoutItem;
    dbMarca: TDBLookupComboBox;
    dxLayoutControl1Item32: TdxLayoutItem;
    btnMarcas: TBitBtn;
    dxLayoutControl1Group20: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item33: TdxLayoutItem;
    dbTipo: TDBLookupComboBox;
    dxLayoutControl1Item34: TdxLayoutItem;
    BitBtn6: TBitBtn;
    dxLayoutControl1Group21: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item35: TdxLayoutItem;
    mUbicacion: TDBMemo;
    dxLayoutControl1Item36: TdxLayoutItem;
    dStokMax: TDBEdit;
    dxLayoutControl1Group22: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item37: TdxLayoutItem;
    dStockMin: TDBEdit;
    dxLayoutControl1Group23: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item38: TdxLayoutItem;
    dbExistencia: TDBEdit;
    dxLayoutControl1Group19: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Item39: TdxLayoutItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    bImagen: TImage;
    btnPreview: TBitBtn;
    btnExaminar: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    gbTarifaDiaria: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    rxDistribucion: TRxDBGrid;
    tsMes: TComboBox;
    tiAnno: TRxSpinEdit;
    btnDistribuir: TBitBtn;
    tdCantidadMensual: TCurrencyEdit;
    dxLayoutControl1Group7: TdxLayoutAutoCreatedGroup;
    Panel1: TPanel;
    frmBarra1: TfrmBarra;
    NxHeaderPanel1: TNxHeaderPanel;
    sWebLabel3: TsWebLabel;
    Label24: TLabel;
    lblFiltrar: TsWebLabel;
    dbAlmacen: TDBLookupComboBox;
    ProgressBar1: TProgressBar;
    grid_embarcaciones: TcxGrid;
    grid_embarcacionesDBTableView1: TcxGridDBTableView;
    col_idMaterial: TcxGridDBColumn;
    Col_Descripcion: TcxGridDBColumn;
    col_Cantidad: TcxGridDBColumn;
    col_Medida: TcxGridDBColumn;
    col_costoMn: TcxGridDBColumn;
    col_VentaMn: TcxGridDBColumn;
    Col_Estado: TcxGridDBColumn;
    col_Existencia: TcxGridDBColumn;
    grid_embarcacionesLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    dbFamilias: TComboBox;
    cmbProveedor: TComboBox;
    BitBtn4: TBitBtn;
    cxGroupBox1: TcxGroupBox;
    dxLayoutControl1Item40: TdxLayoutItem;
    edtMedida: TcxDBTextEdit;
    tsMedida: TDBLookupComboBox;
    dxLayoutControl1Group11: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Group6: TdxLayoutAutoCreatedGroup;
    frmtsclr1: TFormAutoScaler;
    Col_costoDLS: TcxGridDBColumn;
    procedure tsNumeroActividadKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tsIdTipoEmbarcacionKeyPress(Sender: TObject; var Key: Char);
    procedure frmBarra1btnAddClick(Sender: TObject);
    procedure frmBarra1btnEditClick(Sender: TObject);
    procedure frmBarra1btnPostClick(Sender: TObject);
    procedure frmBarra1btnCancelClick(Sender: TObject);
    procedure frmBarra1btnDeleteClick(Sender: TObject);
    procedure frmBarra1btnRefreshClick(Sender: TObject);
    procedure frmBarra1btnExitClick(Sender: TObject);
    procedure tsDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure Insertar1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Registrar1Click(Sender: TObject);
    procedure Can1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure tsNumeroActividaddEnter(Sender: TObject);
    procedure tsNumeroActividadActividadExit(Sender: TObject);
    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);
    procedure tsdVentaEnter(Sender: TObject);
    procedure tsdVentaExit(Sender: TObject);
    procedure frmBarra1btnPrinterClick(Sender: TObject);
    procedure tsMedidaEnter(Sender: TObject);
    procedure tsMedidaExit(Sender: TObject);
    procedure tsMedidaKeyPress(Sender: TObject; var Key: Char);
    procedure sTipoActividadEnter(Sender: TObject);
    procedure sTipoActividadExit(Sender: TObject);
    procedure sTipoActividadKeyPress(Sender: TObject; var Key: Char);
    procedure tsdVentaKeyPress(Sender: TObject; var Key: Char);
    procedure tsdCostoEnter(Sender: TObject);
    procedure tsdCostoExit(Sender: TObject);
    procedure tsdCostoKeyPress(Sender: TObject; var Key: Char);
    procedure tsdCantidadEnter(Sender: TObject);
    procedure tsdCantidadExit(Sender: TObject);
    procedure tsdCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure tdFechaEnter(Sender: TObject);
    procedure tdFechaExit(Sender: TObject);
    procedure tdFechaKeyPress(Sender: TObject; var Key: Char);
    procedure tsdPrecioDLLKeyPress(Sender: TObject; var Key: Char);
    procedure tsdPrecioMNEnter(Sender: TObject);
    procedure tsdPrecioMNExit(Sender: TObject);
    procedure tsdPrecioDLLEnter(Sender: TObject);
    procedure tsdPrecioDLLExit(Sender: TObject);

    procedure insumosBeforePost(DataSet: TDataSet);
    procedure PreciosAfterInsert(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PreciosCalcFields(DataSet: TDataSet);
    procedure dbFamiliasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure txtIdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbGruposMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure grid_embarcacionesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Imprimir1Click(Sender: TObject);
    procedure ImprimeMaterialesStockMin1Click(Sender: TObject);
    procedure ImprimeMaterialesStockMax1Click(Sender: TObject);
    procedure mUbicacionEnter(Sender: TObject);
    procedure mUbicacionExit(Sender: TObject);
    procedure dStokMaxKeyPress(Sender: TObject; var Key: Char);
    procedure dStockMinKeyPress(Sender: TObject; var Key: Char);
    procedure dStokMaxEnter(Sender: TObject);
    procedure dStokMaxExit(Sender: TObject);
    procedure dStockMinEnter(Sender: TObject);
    procedure dStockMinExit(Sender: TObject);
    procedure dbGruposKeyPress(Sender: TObject; var Key: Char);
    procedure tsdPrecioMNKeyPress(Sender: TObject; var Key: Char);
    procedure dbNuevoPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure dbGruposEnter(Sender: TObject);
    procedure dbGruposExit(Sender: TObject);
    procedure dbNuevoPrecioEnter(Sender: TObject);
    procedure dbNuevoPrecioExit(Sender: TObject);
    procedure frxInsumosGetValue(const VarName: string; var Value: Variant);
    procedure chkFechaClick(Sender: TObject);
    procedure chkFechaKeyPress(Sender: TObject; var Key: Char);
    procedure dFechaCaducidadKeyPress(Sender: TObject; var Key: Char);
    procedure dFechaCaducidadEnter(Sender: TObject);
    procedure dFechaCaducidadExit(Sender: TObject);
    procedure dbAlmacenChange(Sender: TObject);
    procedure dbFamiliasChange(Sender: TObject);
    procedure dbAlmacenMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbAlmacenExit(Sender: TObject);
    procedure dbFamiliasKeyPress(Sender: TObject; var Key: Char);
    procedure tdFechaInicioKeyPress(Sender: TObject; var Key: Char);
    procedure tdFechaInicioEnter(Sender: TObject);
    procedure tdFechaInicioExit(Sender: TObject);
    procedure tdFechaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure tdFechaFinalEnter(Sender: TObject);
    procedure tdFechaFinalExit(Sender: TObject);
    procedure btnDistribuirClick(Sender: TObject);
    procedure DistribuciondeMaterialCalcFields(DataSet: TDataSet);
    procedure BuscaMaterial(Id: string; accion: string);
    procedure BuscaInsumo(Id: string; accion: string);
    procedure BuscaMateriales(Id: string);
    procedure ImprimeAnexoF1Click(Sender: TObject);
    procedure ImprimeProductosPerecederos1Click(Sender: TObject);
    procedure ImprimeporUbicacion1Click(Sender: TObject);
    procedure dbProveedoresKeyPress(Sender: TObject; var Key: Char);
    procedure dbProveedoresEnter(Sender: TObject);
    procedure dbProveedoresExit(Sender: TObject);
    procedure lblFiltrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblFiltrarClick(Sender: TObject);
    procedure cmbProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure ImportarMaterialesCatalogoMaestro1Click(Sender: TObject);
    procedure SelccionarMateriales1Click(Sender: TObject);
    procedure InsertaActividad(Sender: TObject);
    procedure procBuscaPartida(Sender: TObject);
    procedure procCalculaCosto(Sender: TObject);
    procedure procCalculaFlete(Sender: TObject);
    procedure procCalculaDerecho(Sender: TObject);
    procedure procCalculaMerma(Sender: TObject);
    procedure procCalculaCostoDLL(Sender: TObject);
    procedure procCalculaFleteDLL(Sender: TObject);
    procedure procCalculaDerechoDLL(Sender: TObject);
    procedure procCalculaMermaDLL(Sender: TObject);
    procedure procObtiene(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure procObtieneTexto(Sender: TObject);
    procedure DesglocedePrecioMaterial1Click(Sender: TObject);
    procedure procSuma(Sender: TObject);
    procedure procSumaDLL(Sender: TObject);
    procedure procSumaSalir(Sender: TObject);
    procedure dbAlmacenEnter(Sender: TObject);
    procedure cmbProveedorEnter(Sender: TObject);
    procedure cmbProveedorExit(Sender: TObject);
    procedure tiAnnoEnter(Sender: TObject);
    procedure tiAnnoExit(Sender: TObject);
    procedure tsMesEnter(Sender: TObject);
    procedure tsMesExit(Sender: TObject);
    procedure tdCantidadMensualEnter(Sender: TObject);
    procedure tdCantidadMensualExit(Sender: TObject);
    procedure txtIdKeyPress(Sender: TObject; var Key: Char);
    procedure mUbicacionKeyPress(Sender: TObject; var Key: Char);
    procedure dbExistenciaKeyPress(Sender: TObject; var Key: Char);
    procedure tiAnnoKeyPress(Sender: TObject; var Key: Char);
    procedure tsMesKeyPress(Sender: TObject; var Key: Char);
    procedure tdCantidadMensualKeyPress(Sender: TObject; var Key: Char);
    procedure dbExistenciaEnter(Sender: TObject);
    procedure dbExistenciaExit(Sender: TObject);
    procedure grid_embarcacionesMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure grid_embarcacionesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grid_embarcacionesTitleClick(Column: TColumn);
    procedure grid_embarcacionesCellClick(Column: TColumn);
    procedure ExportaaPlantillaExcel1Click(Sender: TObject);
    procedure formatoEncabezado();
    function tablasDependientes(idOrig: string): boolean;
    function posibleBorrar(idOrig: string): boolean;
    procedure tiAnnoBottomClick(Sender: TObject);
    procedure tdFechaFinalChange(Sender: TObject);
    procedure tdFechaInicioChange(Sender: TObject);
    procedure tdCantidadMensualChange(Sender: TObject);
    procedure insumosdCostoMNSetText(Sender: TField; const Text: string);
    procedure insumosdCostoDllSetText(Sender: TField; const Text: string);
    procedure insumosdVentaMNSetText(Sender: TField; const Text: string);
    procedure insumosdVentaDLLSetText(Sender: TField; const Text: string);
    procedure insumosdCantidadSetText(Sender: TField; const Text: string);
    procedure insumosdInstaladoSetText(Sender: TField; const Text: string);
    procedure insumosdPorcentajeSetText(Sender: TField; const Text: string);
    procedure insumosdNuevoPrecioSetText(Sender: TField; const Text: string);
    procedure insumosdExistenciaSetText(Sender: TField; const Text: string);
    procedure insumosdStockMaxSetText(Sender: TField; const Text: string);
    procedure insumosdStockMinSetText(Sender: TField; const Text: string);
    procedure tsdVentaChange(Sender: TObject);
    procedure tsdPrecioDLLChange(Sender: TObject);
    procedure tsdPrecioMNChange(Sender: TObject);
    procedure dbNuevoPrecioChange(Sender: TObject);
    procedure dStokMaxChange(Sender: TObject);
    procedure dStockMinChange(Sender: TObject);
    procedure dbExistenciaChange(Sender: TObject);
    procedure dbeNroSerieKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNroSerieEnter(Sender: TObject);
    procedure dbeNroSerieExit(Sender: TObject);
    procedure btnExaminarClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure cargaImagen();
    procedure muestraImagen();
    procedure grid_embarcacionesMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure ImprimirMaterialesFotografia1Click(Sender: TObject);
    procedure btnGrupoFamiliaClick(Sender: TObject);
    procedure btnProveedoresClick(Sender: TObject);
    procedure SeguimientodeMAteriales1Click(Sender: TObject);
    procedure ImportarMateriales();
    procedure BitBtn1Click(Sender: TObject);
    procedure dbSubfamiliaClick(Sender: TObject);
    procedure rSumarExistenciaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure rRestarExistenciaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnSubFamiliaClick(Sender: TObject);
    procedure dbSubfamiliaKeyPress(Sender: TObject; var Key: Char);
    procedure insumosCalcFields(DataSet: TDataSet);
    procedure dbGruposCloseUp(Sender: TObject);
    procedure btnMarcasClick(Sender: TObject);
    procedure tsdModeloKeyPress(Sender: TObject; var Key: Char);
    procedure tsdTallaKeyPress(Sender: TObject; var Key: Char);
    procedure btnMedidasClick(Sender: TObject);
    procedure grid_embarcacionesDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grid_embarcacionesDBTableView1MouseWheel(Sender: TObject;
      Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure grid_embarcacionesDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ExportaraExcel1Click(Sender: TObject);
    procedure cargar_tipo;
    Procedure llenarCampos ;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure GlobalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AjustarCantidadEnter(Sender: TObject);
    procedure AjustarCantidadExit(Sender: TObject);
    procedure tsdModeloEnter(Sender: TObject);
    procedure tsdModeloExit(Sender: TObject);
    procedure tsdTallaEnter(Sender: TObject);
    procedure tsdTallaExit(Sender: TObject);
    procedure dbSubfamiliaEnter(Sender: TObject);
    procedure dbSubfamiliaExit(Sender: TObject);
    procedure dbMarcaEnter(Sender: TObject);
    procedure dbMarcaExit(Sender: TObject);
    procedure dbTipoEnter(Sender: TObject);
    procedure dbTipoExit(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure tsDescripcionInglesEnter(Sender: TObject);
    procedure tsDescripcionInglesExit(Sender: TObject);
    procedure dbFamiliasEnter(Sender: TObject);
    procedure dbFamiliasExit(Sender: TObject);
    procedure Cantidades1Click(Sender: TObject);
    procedure Montos1Click(Sender: TObject);
    procedure grid_embarcacionesDBTableView1KeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure grid_embarcacionesDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure grid_embarcacionesDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);


  private
    sMenuP: string;
    procedure Llenargrupos;
    { Private declarations }
    procedure ImprimeDistribucion(sParamTipo :string);
  public
    { Public declarations }
    sParam_familia,
    sParam_subfamilia : string;
  end;

var
  frmConsumibles: TfrmConsumibles;
  filtro, buscar, cadena, stock, OldIdInsumo, Actual_almacen: string;
  SavePlace: TBookmark;
  Encuentra: boolean;
  zCatalogo: TZReadOnlyQuery;
  zMonto: TZQuery;
  GridCatalogo: TRxDBGrid;
  sArchivo: string;
  Numero: double;
  Existencia: double;
//  utgrid: ticdbgrid;
  botonpermiso: tbotonespermisos;
  sOpcion: string;
  bImagenDefault: boolean;

  //Exporta elementos a Excel..
  Excel, Libro, Hoja: Variant;
  sIdOrig: string;

  //variable para guardar la cantidad actual
  dCantidad: Double;
  recentInsert:Boolean;
  IdSubfamilia: Integer;
  insumo_agregado : string;


implementation

uses frm_grupofamilias, frm_proveedores, frm_SubFamProductos,
  frm_RecepciondeMateriales, frm_MarcasxSubFam, frm_Medidas, frm_TipoInsumo, frm_detallesubfamilias,
  frm_inteligent, frm_MovimientosInsumos;

{$R *.dfm}




procedure filtra;
Var
  SearchText: String;
begin
  Filtro := '';

  if trim(frmConsumibles.dbFamilias.Text) <> '' then begin
    connection.QryBusca.Active := False;
    connection.QryBusca.SQL.Clear;
    connection.QryBusca.SQL.Add('select sIdFamilia from familias where sDescripcion =:Familia ');
    connection.QryBusca.ParamByName('Familia').AsString := frmConsumibles.dbFamilias.Text;
    connection.QryBusca.Open;

    if connection.QryBusca.RecordCount > 0 then
      Buscar := trim(connection.QryBusca.FieldValues['sIdFamilia']);

      Filtro := ' sIdGrupo = ' + QuotedStr(buscar);

  end;

//  if trim(frmConsumibles.dbAlmacen.Text) <> ''  then
//  begin
//    connection.QryBusca.Active := False;
//    connection.QryBusca.SQL.Clear;
//    connection.QryBusca.SQL.Add('select sIdAlmacen from almacenes where sDescripcion =:Almacen ');
//    connection.QryBusca.ParamByName('Almacen').AsString := frmConsumibles.dbAlmacen.Text;
//    connection.QryBusca.Open;
//
//    if connection.QryBusca.RecordCount > 0 then
//       buscar := trim(connection.QryBusca.FieldValues['sIdAlmacen']);
//    filtro := ' sIdAlmacen = ' + QuotedStr(buscar);
//  end;

  if Filtro <> '' then
  begin
    frmConsumibles.insumos.Filtered := False;
    frmConsumibles.insumos.Filter := Filtro;
    frmConsumibles.insumos.Filtered := True;
  end
  else
    frmConsumibles.insumos.Filtered := False;
end;

procedure filtra2;
begin
  filtro := '';

//   if length(trim(frmConsumibles.cmbProveedor.Text)) > 0  then
//  begin
//      connection.QryBusca.Active := False;
//      connection.QryBusca.SQL.Clear;
//      connection.QryBusca.SQL.Add('select sIdProveedor from proveedores where sRazon =:Razon ');
//      connection.QryBusca.ParamByName('Razon').AsString := frmConsumibles.cmbProveedor.Text;
//      connection.QryBusca.Open;
//
//      if connection.QryBusca.RecordCount > 0 then
//         buscar := trim(connection.QryBusca.FieldValues['sIdProveedor']);
//      filtro := ' sIdProveedor = ' + QuotedStr(buscar);
//  end;
//
//  if trim(frmConsumibles.dbFamilias.Text) <> ''  then
//  begin
//    connection.QryBusca.Active := False;
//    connection.QryBusca.SQL.Clear;
//    connection.QryBusca.SQL.Add('select sIdFamilia from familias where sDescripcion =:Familia ');
//    connection.QryBusca.ParamByName('Familia').AsString := frmConsumibles.dbFamilias.Text;
//    connection.QryBusca.Open;
//
//    if connection.QryBusca.RecordCount > 0 then
//       buscar := trim(connection.QryBusca.FieldValues['sIdFamilia']);
//    filtro := ' sIdGrupo = ' + QuotedStr(buscar);
//  end;
//
//  if trim(frmConsumibles.dbAlmacen.Text) <> ''  then
//  begin
//    connection.QryBusca.Active := False;
//    connection.QryBusca.SQL.Clear;
//    connection.QryBusca.SQL.Add('select sIdAlmacen from almacenes where sDescripcion =:Almacen ');
//    connection.QryBusca.ParamByName('Almacen').AsString := frmConsumibles.dbAlmacen.Text;
//    connection.QryBusca.Open;
//
//    if connection.QryBusca.RecordCount > 0 then
//       buscar := trim(connection.QryBusca.FieldValues['sIdAlmacen']);
//    filtro := ' sIdAlmacen = ' + QuotedStr(buscar);
//  end;

  if filtro <> '' then
  begin
    frmConsumibles.Imp_insumos.Filtered := False;
    frmConsumibles.Imp_insumos.Filter := filtro;
    frmConsumibles.Imp_insumos.Filtered := True;
  end
  else
    frmConsumibles.Imp_insumos.Filtered := False;
end;


procedure TfrmConsumibles.tsNumeroActividadKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    dbProveedores.SetFocus
end;

procedure TfrmConsumibles.txtIdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsnumeroActividad.SetFocus;
end;

procedure TfrmConsumibles.txtIdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  filtra;
end;

procedure TfrmConsumibles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Insumos.Cancel;
  action := cafree;
//  utgrid.Destroy;
  botonpermiso.Free;
end;

procedure TfrmConsumibles.FormShow(Sender: TObject);
begin
  recentInsert:=False;
  sMenuP := stMenu;
  BotonPermiso := TBotonesPermisos.Create(Self, connection.zConnection, global_grupo, 'MnuConsumibles', PopupPrincipal);
  OpcButton := '';
  sIdOrig := '';
  bImagenDefault := True;
  edtMedida.Visible:=True;
  tsMedida.Visible:=False;

  Actual_almacen := '';
  almacen.Active := False;
  almacen.Params.ParamByName('Contrato').AsString := Global_Contrato;
  almacen.Params.ParamByName('Usuario').AsString := Global_Usuario;
  almacen.Open;

  if almacen.recordcount > 0 then
  begin
    dbAlmacen.keyvalue := almacen.fieldbyname('sIdAlmacen').asstring;
    Actual_almacen := almacen.fieldbyname('sIdAlmacen').asstring;
  end;

  //se colocan todos los campos de la consulta debido que no se quiere que se carguen las imagenes ya que cargarian demasiado la consulta,,
  cadena := 'select i.sContrato, i.sIdInsumo, i.sIdProveedor, i.sIdAlmacen, i.sTipoActividad, i.mDescripcion, i.dFecha, i.dFechaInicio, i.dFechaFinal, ' +
    'i.dCostoMN, i.dCostoDLL, i.dVentaMN, i.dVentaDLL, i.sMedida, i.dCantidad, i.dInstalado, i.sIdFase, i.dPorcentaje, ' +
    'i.sIdGrupo, i.dNuevoPrecio, i.dExistencia, i.sUbicacion, i.dStockMax, i.dStockMin, i.lAplicaFecha, i.dFechaCaducidad, ' +
    'f.sDescripcion, a.sDescripcion as almacen  from insumos i ' +
    'left join familias f ON(i.sIdGrupo = f.sIdFamilia) ' +
    'left join almacenes a on(a.sIdAlmacen = i.sIdAlmacen) ' +
    'where i.sContrato = :Contrato and i.sIdAlmacen =:Almacen ';

  Insumos.Active := False;
  Insumos.Params.ParamByName('Contrato').DataType := ftString;
  If Connection.configuracion.fieldValues['sAlmcon'] = 'CONTRATOS' Then
    Insumos.Params.ParamByName('Contrato').Value := global_contrato
  else
    Insumos.Params.ParamByName('Contrato').Value :=-1;
  Insumos.Params.ParamByName('Almacen').Value := Actual_almacen;
  Insumos.Open;

  Proveedores.Active := False;
  Proveedores.Open;

  if Proveedores.RecordCount > 0 then
  begin
    cmbProveedor.Clear;
    while not Proveedores.Eof do
    begin
      cmbProveedor.Items.Add(Proveedores.FieldValues['sRazon']);
      Proveedores.Next;
    end;
  end;
  Llenargrupos;
  {grupos.Active := False;
  grupos.Open;
  grupos.first;
  if grupos.RecordCount > 0 then
  begin
    dbFamilias.Clear;
    dbFamilias.Items.Add('');
    while not grupos.Eof do
    begin
      dbFamilias.Items.Add(grupos.FieldValues['sDescripcion']);
      grupos.Next;
    end;
  end;}

  zq_contratos.Active := False ;
  zq_contratos.Params.ParamByName('sContrato').AsString := global_contrato;
  zq_contratos.Open ;

  qryMarcas.Active := False;
  qryMarcas.Open;

  zqMedidas.Active := False;
  zqMedidas.Open;
  
  qrysubfamilia.Active := False;
  qrysubfamilia.Open;

  qryTipoSubFamilia.Active := False;
  qryTipoSubFamilia.Open;

  btnExaminar.Enabled := False;
  muestraImagen;
  bImagenDefault := False;

  cargar_tipo;
  BotonPermiso.permisosBotones(frmBarra1);
  llenarCampos() ;

end;

procedure TfrmConsumibles.Llenargrupos;
begin
  grupos.Active := False;
  grupos.Open;
  grupos.first;
  if grupos.RecordCount > 0 then
  begin
    dbFamilias.Clear;
    dbFamilias.Items.Add('');
    while not grupos.Eof do
    begin
      dbFamilias.Items.Add(grupos.FieldValues['sDescripcion']);
      grupos.Next;
    end;
  end;
end;

procedure TfrmConsumibles.tsIdTipoEmbarcacionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus
end;


procedure TfrmConsumibles.frmBarra1btnAddClick(Sender: TObject);
begin
  if (vartostr(dbalmacen.Text)) = '' then
  begin
    messageDLG('Seleccione un almacen', mtInformation, [mbOk], 0);
    exit;
  end
  else
    frmBarra1.btnAddClick(Sender);

  tsDescripcion.SetFocus;

  bImagen.Picture.Graphic := Nil;

  bImagenDefault := True;

  sArchivo := '';

  edtMedida.Visible:=False;
  tsMedida.Visible:=True;

  tsdCantidad.Enabled := True;
  Insertar1.Enabled := False;
  Editar1.Enabled := False;
  Registrar1.Enabled := True;
  Can1.Enabled := True;
  Eliminar1.Enabled := False;
  Refresh1.Enabled := False;
  Salir1.Enabled := False;
  btnPreview.Enabled := False;
  btnExaminar.Enabled := True;
  Insumos.Append;
  Insumos.FieldByName('dCantidad').Asfloat := 0;
  Insumos.FieldValues['sContrato'] := Global_Contrato;
  tsdVenta.Text := '0';
  tsdCosto.Text := '0';
  tsdPrecioDLL.Text := '0';
  tsdPrecioMN.Text := '0';
  tsdCantidad.Text := '0';
  dbNuevoPrecio.Text := '0';
  dStokMax.Text := '0';
  dStockMin.Text := '0';
  dbExistencia.Text := '0';
  tdFechaInicio.Date := Date;
  tdFechaFinal.Date := Date;
  tdFecha.Date := Date;
  mUbicacion.Text := 'SIN UBICACION';

  dbGrupos.Enabled := True;
  dbMarca.Enabled := True;
  tsdModelo.Enabled := True;
  tsdTalla.Enabled := True;

  dbSubFamilia.Enabled := True;
  dbMarca.Enabled := True;
  dbTipo.Enabled := True;

  rRestarExistencia.Checked := False;
  rSumarExistencia.Checked := False;

  if dbFamilias.Text <> '' then
  begin
    connection.QryBusca.Active := False;
    connection.QryBusca.SQL.Clear;
    connection.QryBusca.SQL.Add('select sIdFamilia from familias where sDescripcion =:Familia ');
    connection.QryBusca.ParamByName('Familia').AsString := dbFamilias.Text;
    connection.QryBusca.Open;

    if connection.QryBusca.RecordCount > 0 then begin
      dbGrupos.KeyValue := trim(connection.QryBusca.FieldValues['sIdFamilia']);
      insumos.FieldValues['sIdGrupo'] := trim(connection.QryBusca.FieldValues['sIdFamilia']);
    end;

  end;

  //BUSCAMOS EL MAXIMO
  connection.zCommand.Active := False;
  connection.zCommand.SQL.Clear;
  connection.zCommand.SQL.Add('select max(iId) as Folio FROM insumos');
  connection.zCommand.Open;

  if connection.zCommand.RecordCount > 0 then
  begin
     //insumos.FieldByName('iId').AsInteger := Connection.zCommand.FieldByName('Folio').AsInteger + 1;
     insumos.FieldByName('sIdInsumo').AsString := 'CIT-'+formatfloat('000000',(Connection.zCommand.FieldByName('Folio').AsInteger + 1));
  end
  else
  begin
     //insumos.FieldByName('iId').AsInteger := 1;
     insumos.FieldByName('sIdInsumo').AsString := 'CIT-000001';
  end;

  BotonPermiso.permisosBotones(frmBarra1);
  grid_embarcaciones.Enabled := False;
  BloquearItemsPopup(PopupPrincipal, True );
end;

procedure TfrmConsumibles.frmBarra1btnEditClick(Sender: TObject);
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
  bMostrar: boolean;
  Hora: TDateTime;
begin   
  sArchivo := '';

  if Insumos.FieldByName('sContrato').AsString=global_contrato then
  begin

    edtMedida.Visible:=False;
    tsMedida.Visible:=True;

    tsdCantidad.Enabled := True;
    frmBarra1.btnEditClick(Sender);
    Insertar1.Enabled := False;
    Editar1.Enabled := False;
    Registrar1.Enabled := True;
    Can1.Enabled := True;
    Eliminar1.Enabled := False;
    Refresh1.Enabled := False;
    Salir1.Enabled := False;
    sOpcion := 'Edit';

    dbGrupos.Enabled := True;
    dbMarca.Enabled := True;
    tsdModelo.Enabled := True;
    tsdTalla.Enabled := True;

    dbSubFamilia.Enabled := True;
    dbTipo.Enabled := True;

    OldIdInsumo := tsNumeroActividad.Text;
    if (tsdcantidad.text <> '') and (tsdcantidad.text <> ' ') then
      Existencia := StrToFloat(tsdCantidad.Text);
    sIdOrig := insumos.FieldByName('sIdInsumo').AsString;

    try
       Insumos.Edit;
      btnPreview.Enabled := False;
      btnExaminar.Enabled := True;
      zqMedidas.Locate('sNombre',Insumos.FieldByName('smedida').AsString,[]);
      tsMedida.KeyValue:= Insumos.FieldByName('smedida').AsString;
    except
      on e: exception do begin
        UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al agregar registro', 0);
        frmbarra1.btnCancel.Click;
      end;
    end;
    tsDescripcion.SetFocus;
    BotonPermiso.permisosBotones(frmBarra1);
    dCantidad := StrToFloat(tsdCantidad.Text);
    AjustarCantidad.Value := 0;
    rRestarExistencia.Checked := False;
    rSumarExistencia.Checked := False;


    BloquearItemsPopup(PopupPrincipal, True );
  end
  else
    MessageError('Este Insumo solo puede modificarse desde el Contrato: ' + Insumos.FieldByName('sContrato').AsString);
end;

procedure TfrmConsumibles.frmBarra1btnPostClick(Sender: TObject);
var
  cadena: string;
  nombres,
  cadenas: TStringList;
  lEdita: boolean;
  dDiferencia: Double;
  lSuma: Boolean;
  kContrato : String;
  Hora: String;
  dCantidadEscrita, dExistencias, resta: Double;

begin
    {Validaciones de campos}
  nombres := TStringList.Create;
  cadenas := TStringList.Create;

  nombres.Add('Id Material');
  cadenas.Add( Trim( tsNumeroActividad.Text ) );
  nombres.Add('Descripcion');
  cadenas.Add(tsDescripcion.Text);
  nombres.Add('Tipo');
  cadenas.Add(sTipoActividad.Text);
  nombres.Add('Unidad');
  cadenas.Add(tsMedida.Text);
  nombres.Add('Cantidad');
  cadenas.Add(tsdCantidad.Text);
  nombres.Add('Precion MN');
  cadenas.Add(tsdVenta.Text);
  nombres.Add('Precio DLL');
  cadenas.Add(tsdPrecioDLL.Text);
  nombres.Add('Costo MN');
  cadenas.Add(tsdCosto.Text);
  nombres.Add('Costo DLL');
  cadenas.Add(tsdPrecioMN.Text);
  nombres.Add('Familia/Grupo');
  cadenas.Add(dbGrupos.Text);
  nombres.Add('Stock Max');
  cadenas.Add(dStokMax.Text);
  nombres.Add('Stock Min.');
  cadenas.Add(dStockMin.Text);

  if not validaTexto(nombres, cadenas, '', '') then
  begin
    MessageDlg(UnitValidaTexto.errorValidaTexto, mtInformation, [mbOk], 0);
    exit;
  end;

    //Verifica si la fecha final no se menor que la fecha inicial
  if tdFechaFinal.Date < tdFechaInicio.Date then
  begin
    showmessage('La fecha final es menor a la fecha inicial');
    tdFechaFinal.SetFocus;
    exit;
  end;

    {Continua insercion de datos..}

  lEdita := false;
  if insumos.State = dsEdit then
    lEdita := true;

  if (tsNumeroActividad.Text <> OldIdInsumo) and (sOpcion = 'Edit') then
  begin
    if MessageDlg('Si Modifica el Id del Material, Todos los Datos en Requisiciones, Ordenes de Compra, Reportes Diarios.. Cambiaran al Nuevo Id, Desea Continuar?, ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      connection.QryBusca.Active := False;
      connection.QryBusca.SQL.Clear;
      connection.QryBusca.SQL.Add('select sIdInsumo from insumos where sContrato =:Contrato and sIdInsumo =:Insumo and sIdAlmacen =:Almacen ');
      connection.QryBusca.ParamByName('Contrato').AsString := global_contrato;
      connection.QryBusca.ParamByName('Insumo').AsString := tsNumeroActividad.Text;
      connection.QryBusca.ParamByName('Almacen').AsString := dbAlmacen.KeyValue;
      connection.QryBusca.Open;

      if connection.QryBusca.RecordCount > 0 then
      begin
        messageDLG('El Id de Material ya Existe!, Favor de escribir uno Nuevo. ', mtInformation, [mbOk], 0);
        exit;
      end;

    end
    else
      exit;
  end;

  insumos.fieldvalues['dFecha']          := tdfecha.date;
  insumos.fieldvalues['dFechaInicio']    := tdfechaInicio.date;
  insumos.fieldvalues['dFechaFinal']     := tdfechaFinal.date;
  insumos.fieldvalues['dFechaCaducidad'] := dfechaCaducidad.date;
  dCantidadEscrita := AjustarCantidad.Value  ;
  dExistencias     := StrToFloat(dbExistencia.Text);

  if insumos.State = dsInsert then
  begin
      insumos.FieldValues['dInstalado'] := 0;
      insumos.FieldValues['dPorcentaje'] := 0;

      //BUSCAMOS EL MAXIMO
      connection.zCommand.Active := False;
      connection.zCommand.SQL.Clear;
      connection.zCommand.SQL.Add('select max(iId) as Folio FROM insumos');
      connection.zCommand.Open;

      if connection.zCommand.RecordCount > 0 then
         insumos.FieldByName('iId').AsInteger := Connection.zCommand.FieldByName('Folio').AsInteger + 1
      else
         insumos.FieldByName('iId').AsInteger := 1;
  end;

  try
    if rSumarExistencia.Checked then
    begin
      if (dCantidadEscrita > 0) and (dExistencias = 0) then
        insumos.FieldByName('dExistencia').AsFloat := dCantidadEscrita;

      if (dCantidadEscrita > 0) and (insumos.FieldByName('dExistencia').AsFloat > 0) then
        insumos.FieldByName('dExistencia').AsFloat := dExistencias + dCantidadEscrita;

        ShortDateFormat := 'yyyy-mm-dd';

        zkardex.Active := False;
        zkardex.SQL.text := 'SELECT * FROM kardex_sistema';
        zkardex.Open;
        Hora := FormatDateTime('hh:mm:ss', Now) ;
        zkardex.Append;
        zkardex.FieldByName('sContrato').AsString := ''+global_Contrato+'';
        zkardex.FieldByName('sIdUsuario').AsString := ''+global_Usuario+'';
        zkardex.FieldByName('dIdFecha').AsDateTime := Now;
        zkardex.FieldByName('sHora').AsString := Hora;
        zkardex.FieldByName('sDescripcion').AsString := 'Se Realizó una Suma + '''+ AjustarCantidad.Text +''' en el Ajuste de Cantidad , al Insumo; '''+ tsNumeroActividad.Text + '''';
        zkardex.FieldByName('lOrigen').AsString := 'Catalogo de Materiales';
        zkardex.Post;

    end;
    {
    13.marzo.2012 : adal, Permitir corregir la cantidad ingresada y elegir
    en caso de que se haya ingresado mas o menos de lo deseado, en ambos caso
    se resta o se suma a la existencia segun sea el caso
    }
    if rRestarExistencia.Checked then
    begin
      if (dCantidadEscrita > 0) and (dExistencias = 0) then
        insumos.FieldByName('dExistencia').AsFloat := dCantidadEscrita;

      if (dCantidadEscrita > 0) and (insumos.FieldByName('dExistencia').AsFloat > 0) then
      begin
        resta := dExistencias - dCantidadEscrita;
        if resta >= 0 then
        begin
            insumos.FieldByName('dExistencia').AsFloat := resta;
        end else
        begin
          showMessage('No puedes Restarle mas de las Existencias Actuales');
          tsdCantidad.SetFocus;
          exit;
        end;
          ShortDateFormat := 'yyyy-mm-dd';

                zkardex.Active := False;
                zkardex.SQL.text := 'SELECT * FROM kardex_sistema';
                zkardex.Open;
                 Hora := FormatDateTime('hh:mm:ss', Now) ;
                zkardex.Append;
                zkardex.FieldByName('sContrato').AsString := ''+global_Contrato+'';
                zkardex.FieldByName('sIdUsuario').AsString := ''+global_Usuario+'';
                zkardex.FieldByName('dIdFecha').AsDateTime := Now;
                zkardex.FieldByName('sHora').AsString := Hora;
                zkardex.FieldByName('sDescripcion').AsString := 'Se Realizó una Resta - '''+ AjustarCantidad.Text +''' en el Ajuste de Cantidad, al Insumo; '''+ tsNumeroActividad.Text + '''';
                zkardex.FieldByName('lOrigen').AsString := 'Catalogo de Materiales';
                zkardex.Post;
      end;
      if insumos.FieldByName('dExistencia').AsFloat < 0 then
          insumos.FieldByName('dExistencia').AsFloat := 0;
    end;
    Insumos.FieldValues['sContrato'] := Global_Contrato;
    Insumos.FieldValues['sTipoActividad'] := sTipoActividad.Text;

    if chkFecha.Checked then
      Insumos.FieldValues['lAplicaFecha'] := 'Si'
    else
    begin
      Insumos.FieldValues['lAplicaFecha'] := 'No';
      dFechaCaducidad.Date := Date;
    end;

    //////////almacen
    if dbAlmacen.Text <> '' then
       Insumos.FieldValues['sIdAlmacen'] := dbAlmacen.KeyValue;

    ////subfamilia
    if dbSubfamilia.Text = '' then
       Insumos.FieldByName('iIdSubfamilia').AsString := '0'
    else
       Insumos.FieldByName('iIdSubfamilia').AsString := qrySubfamilia.FieldByName('iIdSubfamilia').AsString;

    //////////marca
    if dbMarca.Text <> '' then
       Insumos.FieldByName('sIdMarca').AsString := qryMarcas.FieldByName('sIdMarca').AsString
    else
       Insumos.FieldByName('sIdMarca').AsString := '';

    ////////tipo subfamilia
    if dbTipo.Text <> '' then
       Insumos.FieldByName('iIdTipoSubFamilia').AsString := qryTipoSubFamilia.FieldByName('iIdTipoSubFamilia').AsString
    else
       Insumos.FieldByName('iIdTipoSubFamilia').AsString := '0';

    insumo_agregado := '';
    insumo_agregado := tsNumeroActividad.Text;

    recentInsert:=True;
    Insumos.FieldByName('sMedida').AsString      := tsMedida.Text;

    if dbProveedores.Text <> '' Then
        Insumos.FieldByName('sIdProveedor').AsString := dbProveedores.KeyValue 
    else
       begin
           ShowMessage('Falta Seleccionar Un Proveedor');
           dbProveedores.SetFocus ;
           exit
       end ;
       Insumos.Post;
    if sOpcion = 'Edit' then
    begin
        //Llamada a funcion Buscar materiales en la Base de Datos..
        BuscaMaterial(OldIdInsumo, 'actualizar');
        BuscaInsumo(OldIdInsumo, 'actualizar');

        //se actualiza directamente la tabal de materiales de ordenes de compra .. no actuliza en la funcion..
        connection.qryBusca.Active := False;
        connection.qryBusca.SQL.Clear;
        connection.qryBusca.SQL.Add('update anexo_ppedido set sIdInsumo = :Nuevo, sMedida =:Medida, mDescripcion =:descripcion where sContrato = :Contrato and sIdInsumo =:IdMaterial ');
        connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
        connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
        connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
        connection.qryBusca.Params.ParamByName('Nuevo').Value := insumo_agregado;
        connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
        connection.qryBusca.Params.ParamByName('IdMaterial').Value := OldIdInsumo;
        connection.qryBusca.Params.ParamByName('Medida').DataType := ftString;
        connection.qryBusca.Params.ParamByName('Medida').Value := tsMedida.Text;
        connection.qryBusca.Params.ParamByName('Descripcion').DataType := ftMemo;
        connection.qryBusca.Params.ParamByName('Descripcion').Value := tsDescripcion.Text;
        connection.qryBusca.ExecSQL;
    end;
   // Insumos.Refresh;

    qrysubfamilia.Active := False;
    qrysubfamilia.SQL.text := 'SELECT * FROM subfamilia;';
    qrysubfamilia.open;

    qryTipoSubFamilia.Active := False;
    qryTipoSubFamilia.SQL.Text := 'SELECT * FROM tipo_subfamilia;';
    qryTipoSubFamilia.Open;

    dbGrupos.Enabled := False;
    dbMarca.Enabled := False;
    dbSubFamilia.Enabled := False;
    dbTipo.Enabled := False;
    tsdModelo.Enabled := False;
    tsdTalla.Enabled := False;

    CargaImagen();
    recentInsert:=False;

    AjustarCantidad.Value := 0;
    tsdCantidad.Enabled := False;
    Insertar1.Enabled := True;
    Editar1.Enabled := True;
    Registrar1.Enabled := False;
    Can1.Enabled := False;
    Eliminar1.Enabled := True;
    Refresh1.Enabled := True;
    Salir1.Enabled := True;
    btnPreview.Enabled := True;
    btnExaminar.Enabled := False;
    AjustarCantidad.Enabled := false;
    rRestarExistencia.Checked := False;
    rSumarExistencia.Checked := False;
    AjustarCantidad.Value := 0;
    frmBarra1.btnPostClick(Sender);
    BotonPermiso.permisosBotones(frmBarra1);
    BloquearItemsPopup(PopupPrincipal, False );
    edtMedida.Visible:=True;
    tsMedida.Visible:=False;
  except
    on e: exception do begin
      UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al salvar registro', 0);
      frmBarra1.btnCancel.Click;
      lEdita := false; //cancelar la actualizacion de tablas dependientes
    end;
  end;

  //if (lEdita) and (insumos.FieldByName('sIdInsumo').AsString <> sIdOrig) then
       //tablasDependientes(sIdOrig);

  Insumos.Refresh;

    if sOpcion = 'Edit' then
    begin
      grid_embarcaciones.Enabled := True;
      sOpcion := '';
    end;

    grid_embarcaciones.Enabled := True;
    if frmRecepciondeMateriales<>nil then
    begin
      try
        frmRecepciondeMateriales.ZQuery1.Refresh;
        frmRecepciondeMateriales.zq_detallesderecepcion.Refresh;
      except

      end;
    end;



end;

procedure TfrmConsumibles.frmBarra1btnCancelClick(Sender: TObject);
begin
  frmBarra1.btnCancelClick(Sender);
  tsdCantidad.Enabled := False;
  Insertar1.Enabled := True;
  Editar1.Enabled := True;
  Registrar1.Enabled := False;
  Can1.Enabled := False;
  Eliminar1.Enabled := True;
  Refresh1.Enabled := True;
  Salir1.Enabled := True;
  btnPreview.Enabled := True;
  btnExaminar.Enabled := False;
  Insumos.Cancel;
  BotonPermiso.permisosBotones(frmBarra1);
  grid_embarcaciones.Enabled := True;
  sOpcion := '';

  AjustarCantidad.Value := 0;
  AjustarCantidad.Enabled := False;
  rRestarExistencia.Checked := False;
  rSumarExistencia.Checked := False;

  dbGrupos.Enabled := False;
  dbMarca.Enabled := False;
  dbSubFamilia.Enabled := False;
  dbTipo.Enabled := False;
  tsdModelo.Enabled := False;
  tsdTalla.Enabled := False;
  BloquearItemsPopup(PopupPrincipal, False );
  edtMedida.Visible:=True;
  tsMedida.Visible:=False;
end;

procedure TfrmConsumibles.frmBarra1btnDeleteClick(Sender: TObject);
begin
  if Insumos.RecordCount > 0 then
    if Insumos.FieldByName('sContrato').AsString=global_contrato then
    begin
      if MessageDlg('Desea eliminar el Registro Activo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if not posibleBorrar(Insumos.FieldByName('sIdInsumo').AsString) then
        begin
          MessageDlg('No es posible eliminar el registro, existen registros dependientes.', mtInformation, [mbOk], 0);
          exit;
        end;
        BuscaMateriales(insumos.FieldValues['sIdInsumo']);
        if Encuentra then
          MessageDlg(' El Material seleccionado ya fue utilizado por un Reporte diario, Requisicion u Orden de Compra, No se puede Eliminar! ', mtConfirmation, [mbOk], 0)
        else
        try
          connection.zCommand.Active := False;
          connection.zCommand.SQL.Clear;
          connection.zCommand.SQL.Add('delete from insumos_precios where sContrato =:Contrato and sIdMaterial =:Insumo');
          connection.zCommand.ParamByName('Contrato').AsString := global_contrato;
          connection.zCommand.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
          connection.zCommand.ExecSQL;

          Insumos.Delete;
        except
          on e: exception do begin
            UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al eliminar registro', 0);
          end;
        end;
      end
    end
    else
      MessageError('Este Insumo solo puede eliminarse desde el Contrato: ' + Insumos.FieldByName('sContrato').AsString);
end;

procedure TfrmConsumibles.frmBarra1btnRefreshClick(Sender: TObject);
begin
  Insumos.Refresh;
end;

procedure TfrmConsumibles.frxInsumosGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'sStock') = 0 then
    Value := stock;
end;

procedure TfrmConsumibles.GlobalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Perform( CM_DIALOGKEY, VK_TAB, 0 );
    Key := 0;
  end;
end;

procedure TfrmConsumibles.grid_embarcacionesCellClick(Column: TColumn);
begin
  if sOpcion = 'Edit' then
    frmbarra1.btnCancel.Click;

  if bImagenDefault = True then
    //muestraImagen;
    btnPreview.Click;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if sOpcion = 'Edit' then
    frmbarra1.btnCancel.Click;

  if bImagenDefault = True then
    //muestraImagen;
    btnPreview.Click;

    llenarCampos() ;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if bImagenDefault = True then
    //muestraImagen;
    btnPreview.Click;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  llenarCampos() ;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  llenarcampos() ;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1MouseWheel(
  Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if bImagenDefault = True then
  begin
    muestraImagen;
    bImagenDefault := False;
  end;
end;

procedure TfrmConsumibles.grid_embarcacionesDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  AColumn, BColumn, CColumn: TcxCustomGridTableItem;
begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('sEstado');
  if VarToStr(ARecord.Values[AColumn.Index]) = 'Normal' then AStyle := cxstylBlack;
  if VarToStr(ARecord.Values[AColumn.Index]) = 'Minimo' then AStyle := cxstylRed;
  if VarToStr(ARecord.Values[AColumn.Index]) = 'Maximo' then AStyle := cxstylBlue;
end;

procedure TfrmConsumibles.grid_embarcacionesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Sender as TrxDBGrid).DataSource.DataSet.State = dsBrowse then
    if insumos.RecordCount > 0 then
    begin
      AFont.Color := clBlack;
      if insumos.FieldValues['dExistencia'] <= insumos.FieldValues['dStockMin'] then
      begin
        try
          if Field.Name = 'insumossEstado' then
            AFont.Color := clRed;
        except
          ;
        end;

      end;

      if (insumos.FieldValues['dExistencia'] >= insumos.FieldValues['dStockMax']) and (insumos.FieldValues['dStockMax'] > 0) then
      begin
        try
          if Field.Name = 'insumossEstado' then
            AFont.Color := clBlue;
        except
          ;
        end;
      end;
    end;
end;

procedure TfrmConsumibles.grid_embarcacionesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//  UtGrid.dbGridMouseMoveCoord(x, y);
end;

procedure TfrmConsumibles.grid_embarcacionesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  UtGrid.DbGridMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmConsumibles.grid_embarcacionesMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if bImagenDefault = True then
  begin
    muestraImagen;
    bImagenDefault := False;
  end;
end;

procedure TfrmConsumibles.grid_embarcacionesTitleClick(Column: TColumn);
begin
//  UtGrid.DbGridTitleClick(Column);
end;

procedure TfrmConsumibles.frmBarra1btnExitClick(Sender: TObject);
begin
  frmBarra1.btnExitClick(Sender);
  Insertar1.Enabled := True;
  Editar1.Enabled := True;
  Registrar1.Enabled := False;
  Can1.Enabled := False;
  Eliminar1.Enabled := True;
  Refresh1.Enabled := True;
  Salir1.Enabled := True;
  close
end;

procedure TfrmConsumibles.tsDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    sTipoActividad.SetFocus
end;

procedure TfrmConsumibles.ImportarMaterialesCatalogoMaestro1Click(
  Sender: TObject);

begin
  ImportarMateriales();
end;

procedure TfrmConsumibles.ImportarMateriales();
begin
  try
    if dbAlmacen.Text <> '' then
    begin
      connection.zCommand.Active := False;
      connection.zCommand.SQL.Clear;
      connection.zCommand.SQL.Add('Select sIdInsumo from insumos where sContrato =:Contrato and sIdAlmacen =:Almacen ');
      connection.zCommand.ParamByName('Contrato').AsString := global_contrato;
      connection.zCommand.ParamByName('Almacen').AsString := dbAlmacen.KeyValue;
      connection.zCommand.Open;

      if connection.zCommand.RecordCount > 0 then
      begin
        messageDLG('No se Puede Importar!, ya Existen Materiales en el Almacen [' + dbAlmacen.Text + '] Favor de Verificar o Presione F7 para su Importacion Manual.', mtInformation, [mbOk], 0);
        exit;
      end;

      connection.QryBusca.Active := False;
      connection.QryBusca.SQL.Clear;
      connection.QryBusca.SQL.Add('Select * from insumos where sContrato =:Contrato');
      connection.QryBusca.ParamByName('Contrato').AsString := global_contrato_barco;
      connection.QryBusca.Open;

      if connection.QryBusca.RecordCount > 0 then
      begin
        ProgressBar1.Visible := true;
        ProgressBar1.Min := 1;
        ProgressBar1.Max := connection.QryBusca.RecordCount;
        while not connection.QryBusca.Eof do
        begin
          ProgressBar1.Max := connection.QryBusca.RecNo;
                      //Se insertan los datos basicos....
          connection.zCommand.Active := False;
          connection.zCommand.SQL.Clear;
          connection.zCommand.SQL.Add('INSERT INTO insumos ( sContrato, sIdInsumo, sIdProveedor, sIdAlmacen, sTipoActividad, mDescripcion,dFecha,dFechaInicio,dFechaFinal, dCostoMN, dCostoDLL, dVentaMN, dVentaDLL, sMedida, dCantidad, dInstalado, sIdGrupo, sIdFase, dNuevoPrecio) ' +
            ' VALUES (:contrato, :insumo, :prov, :almacen, :tipoactividad, :Descripcion,:fecha,:fechaI,:fechaF, :costoMN, :costoDLL, :ventaMN, :ventaDLL, :medida, :cantidad, :instalado, :fase,:fase, 0)');
          connection.zCommand.Params.ParamByName('contrato').DataType := ftString;
          connection.zCommand.Params.ParamByName('contrato').value := global_contrato;
          connection.zCommand.Params.ParamByName('insumo').DataType := ftString;
          connection.zCommand.Params.ParamByName('insumo').value := connection.QryBusca.FieldValues['sIdInsumo'];
          connection.zCommand.Params.ParamByName('almacen').DataType := ftString;
          connection.zCommand.Params.ParamByName('almacen').value := dbAlmacen.KeyValue;
          connection.zCommand.Params.ParamByName('prov').DataType := ftString;
          connection.zCommand.Params.ParamByName('prov').value := connection.QryBusca.FieldValues['sIdProveedor'];
          connection.zCommand.Params.ParamByName('tipoactividad').DataType := ftString;
          connection.zCommand.Params.ParamByName('tipoactividad').value := connection.QryBusca.FieldValues['sTipoActividad'];
          connection.zCommand.Params.ParamByName('Descripcion').DataType := ftString;
          connection.zCommand.Params.ParamByName('Descripcion').value := connection.QryBusca.FieldValues['mDescripcion']; ;
          connection.zCommand.Params.ParamByName('fecha').DataType := ftDate;
          if connection.QryBusca.FieldValues['dFecha'] <> null then
            connection.zCommand.Params.ParamByName('fecha').value := connection.QryBusca.FieldValues['dFecha']
          else
            connection.zCommand.Params.ParamByName('fecha').value := connection.QryBusca.FieldValues['dFechaInicio'];
          connection.zCommand.Params.ParamByName('fechaI').DataType := ftDate;
          connection.zCommand.Params.ParamByName('fechaI').value := connection.QryBusca.FieldValues['dFechaInicio'];
          connection.zCommand.Params.ParamByName('fechaF').DataType := ftDate;
          if connection.QryBusca.FieldValues['dFechaFinal'] <> null then
            connection.zCommand.Params.ParamByName('fechaF').value := connection.QryBusca.FieldValues['dFechaFinal']
          else
            connection.zCommand.Params.ParamByName('fechaF').value := connection.QryBusca.FieldValues['dFechaInicio'];
          connection.zCommand.Params.ParamByName('costoMN').DataType := ftFloat;
          connection.zCommand.Params.ParamByName('costoMN').value := connection.QryBusca.FieldValues['dCostoMN'];
          connection.zCommand.Params.ParamByName('costoDLL').DataType := ftFloat;
          connection.zCommand.Params.ParamByName('costoDLL').value := connection.QryBusca.FieldValues['dCostoDLL'];
          connection.zCommand.Params.ParamByName('ventaMN').DataType := ftFloat;
          connection.zCommand.Params.ParamByName('ventaMN').value := connection.QryBusca.FieldValues['dVentaMN'];
          connection.zCommand.Params.ParamByName('ventaDLL').DataType := ftFloat;
          connection.zCommand.Params.ParamByName('ventaDLL').value := connection.QryBusca.FieldValues['dVentaDLL'];
          connection.zCommand.Params.ParamByName('medida').DataType := ftString;
          connection.zCommand.Params.ParamByName('medida').value := connection.QryBusca.FieldValues['sMedida'];
          connection.zCommand.Params.ParamByName('cantidad').DataType := ftInteger;
          connection.zCommand.Params.ParamByName('cantidad').value := connection.QryBusca.FieldValues['dCantidad'];
          connection.zCommand.Params.ParamByName('instalado').DataType := ftFloat;
          connection.zCommand.Params.ParamByName('instalado').value := connection.QryBusca.FieldValues['dInstalado'];
          connection.zCommand.Params.ParamByName('fase').DataType := ftString;
          connection.zCommand.Params.ParamByName('fase').value := connection.QryBusca.FieldValues['sIdGrupo'];
          connection.zCommand.ExecSQL;

                      //Se actualizan los restantes..
          connection.zCommand.Active := False;
          connection.zCommand.SQL.Clear;
          connection.zCommand.SQL.Add('Update insumos set dPorcentaje =:porciento, dNuevoPrecio =:Precio, dExistencia =:Existencia, sUbicacion =:Ubicacion, dStockMin =:Minino, dStockMax =:Maximo, lAplicaFecha =:Aplica ' +
            'Where sContrato =:Contrato and sIdAlmacen =:Almacen and sIdInsumo =:Insumo ');
          connection.zCommand.Params.ParamByName('contrato').DataType := ftString;
          connection.zCommand.Params.ParamByName('contrato').value := global_contrato;
          connection.zCommand.Params.ParamByName('insumo').DataType := ftString;
          connection.zCommand.Params.ParamByName('insumo').value := connection.QryBusca.FieldValues['sIdInsumo'];
          connection.zCommand.Params.ParamByName('almacen').DataType := ftString;
          connection.zCommand.Params.ParamByName('almacen').value := dbAlmacen.KeyValue;
          connection.zCommand.Params.ParamByName('porciento').DataType := ftFloat;
          if connection.QryBusca.FieldValues['dPorcentaje'] <> null then
            connection.zCommand.Params.ParamByName('porciento').value := connection.QryBusca.FieldValues['dPorcentaje']
          else
            connection.zCommand.Params.ParamByName('porciento').value := 0;
          connection.zCommand.Params.ParamByName('Precio').DataType := ftFloat;
          if connection.QryBusca.FieldValues['dNuevoPrecio'] <> null then
            connection.zCommand.Params.ParamByName('Precio').value := connection.QryBusca.FieldValues['dNuevoPrecio']
          else
            connection.zCommand.Params.ParamByName('Precio').value := 0;
          connection.zCommand.Params.ParamByName('Existencia').DataType := ftFloat;
          if connection.QryBusca.FieldValues['dExistencia'] <> null then
            connection.zCommand.Params.ParamByName('Existencia').value := connection.QryBusca.FieldValues['dExistencia']
          else
            connection.zCommand.Params.ParamByName('Existencia').value := 0;
          connection.zCommand.Params.ParamByName('Ubicacion').DataType := ftString;
          if connection.QryBusca.FieldValues['sUbicacion'] <> null then
            connection.zCommand.Params.ParamByName('Ubicacion').value := connection.QryBusca.FieldValues['sUbicacion']
          else
            connection.zCommand.Params.ParamByName('Ubicacion').value := 0;
          connection.zCommand.Params.ParamByName('Minino').DataType := ftFloat;
          if connection.QryBusca.FieldValues['dStockMin'] <> null then
            connection.zCommand.Params.ParamByName('Minino').value := connection.QryBusca.FieldValues['dStockMin']
          else
            connection.zCommand.Params.ParamByName('Minino').value := 0;
          connection.zCommand.Params.ParamByName('Maximo').DataType := ftFloat;
          if connection.QryBusca.FieldValues['dStockMax'] <> null then
            connection.zCommand.Params.ParamByName('Maximo').value := connection.QryBusca.FieldValues['dStockMax']
          else
            connection.zCommand.Params.ParamByName('Maximo').value := 0;
          connection.zCommand.Params.ParamByName('Aplica').DataType := ftString;
          if connection.QryBusca.FieldValues['lAplicaFecha'] <> null then
            connection.zCommand.Params.ParamByName('Aplica').value := connection.QryBusca.FieldValues['lAplicaFecha']
          else
            connection.zCommand.Params.ParamByName('Aplica').value := 'No';
          connection.zCommand.ExecSQL;

          connection.QryBusca.Next;
        end;
        ProgressBar1.Visible := false;
        MessageDlg('Proceso Terminado.', mtInformation, [mbOk], 0);
        Kardex('Importacion de Datos', 'Catalogo Master al Almacen [' + dbAlmacen.Text + ']', 'Frente de Trabajo', '', '', '', '');
        insumos.Refresh;
      end
      else
      begin
        messageDLG('No exciten materiales a Importar!', mtInformation, [mbOk], 0);
        exit;
      end;

    end
    else
      MessageDLG('Debe seleccionar un Almacen para Continuar!', mtInformation, [mbOk], 0);
  except
    on e: exception do begin
      UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al Importar Materiales Catalogo Maestro', 0);
    end;
  end;

end;

procedure TfrmConsumibles.ImprimeAnexoF1Click(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos_anexo.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_anexo.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add(cadena + ' order by a.sDescripcion, i.sIdinsumo');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
    Imp_Insumos.Open;

    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_anexo.fr3');
    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.ImprimeMaterialesStockMax1Click(Sender: TObject);
Var
  Grupo_Productos: String;
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos_stockMin.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_stockMin.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    if frmConsumibles.dbFamilias.Text <> '' then
    begin
      connection.QryBusca.Active := False;
      connection.QryBusca.SQL.Clear;
      connection.QryBusca.SQL.Add('select sIdFamilia from familias where sDescripcion =:Familia ');
      connection.QryBusca.ParamByName('Familia').AsString := frmConsumibles.dbFamilias.Text;
      connection.QryBusca.Open;
      Grupo_Productos := trim(connection.QryBusca.FieldValues['sIdFamilia']);

      Imp_Insumos.Active := False;
      Imp_Insumos.SQL.Clear;
      Imp_Insumos.SQL.Add(' select i.sContrato, i.sIdInsumo, i.sIdProveedor, i.sIdAlmacen, i.sTipoActividad, i.mDescripcion, i.dFecha, i.dFechaInicio, i.dFechaFinal, ' +
        ' i.dCostoMN, i.dCostoDLL, i.dVentaMN, i.dVentaDLL, i.sMedida, i.dCantidad, i.dInstalado, i.sIdFase, i.dPorcentaje, ' +
        ' i.sIdGrupo, i.dNuevoPrecio, i.dExistencia, i.sUbicacion, i.dStockMax, i.dStockMin, i.lAplicaFecha, i.dFechaCaducidad, ' +
        ' f.sDescripcion, a.sDescripcion as almacen  from insumos i ' +
        ' left join familias f ON(i.sIdGrupo = f.sIdFamilia) ' +
        ' left join almacenes a on(a.sIdAlmacen = i.sIdAlmacen) ' +
        ' where i.sContrato = :Contrato and i.sIdAlmacen =:Almacen AND i.sIdGrupo = :Grupo ' +
        ' and i.dExistencia >= i.dStockMax and i.dStockMax > 0 order by i.sIdinsumo ');
      Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
      Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
      Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
      Imp_Insumos.Params.ParamByName('Grupo').AsString := Grupo_Productos;
      Imp_Insumos.Open;

      stock := 'MAXIMO';

      frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_stockMin.fr3');
      frxinsumos.ShowReport();
    end
    else
      ShowMessage('Escoja una familia de productos');
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.ImprimeMaterialesStockMin1Click(Sender: TObject);
Var
  Grupo_Productos: String;
begin

  if not FileExists(global_files + global_miReporte + '_CADinsumos_stockMin.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_stockMin.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;                

  if Insumos.RecordCount > 0 then begin
    if frmConsumibles.dbFamilias.Text <> '' then begin
      connection.QryBusca.Active := False;
      connection.QryBusca.SQL.Clear;
      connection.QryBusca.SQL.Add('select sIdFamilia from familias where sDescripcion =:Familia ');
      connection.QryBusca.ParamByName('Familia').AsString := frmConsumibles.dbFamilias.Text;
      connection.QryBusca.Open;
      Grupo_Productos := trim(connection.QryBusca.FieldValues['sIdFamilia']);

      Imp_Insumos.Active := False;
      Imp_Insumos.SQL.Clear;
      Imp_Insumos.SQL.Add(' select i.sContrato, i.sIdInsumo, i.sIdProveedor, i.sIdAlmacen, i.sTipoActividad, i.mDescripcion, i.dFecha, i.dFechaInicio, i.dFechaFinal, ' +
        ' i.dCostoMN, i.dCostoDLL, i.dVentaMN, i.dVentaDLL, i.sMedida, i.dCantidad, i.dInstalado, i.sIdFase, i.dPorcentaje, ' +
        ' i.sIdGrupo, i.dNuevoPrecio, i.dExistencia, i.sUbicacion, i.dStockMax, i.dStockMin, i.lAplicaFecha, i.dFechaCaducidad, ' +
        ' f.sDescripcion, a.sDescripcion as almacen  from insumos i ' +
        ' left join familias f ON(i.sIdGrupo = f.sIdFamilia) ' +
        ' left join almacenes a on(a.sIdAlmacen = i.sIdAlmacen) ' +
        ' where i.sContrato = :Contrato and i.sIdAlmacen =:Almacen  ' +
        ' and i.dExistencia <= i.dStockMin AND i.sIdGrupo = :Grupo order by i.sIdinsumo');
      Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
      Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
      Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
      Imp_Insumos.Params.ParamByName('Grupo').AsString := Grupo_Productos; //dbFamilias.Items[dbFamilias.ItemIndex]; //qryFamilias.FieldByName('sIdFamilia').AsString;
      Imp_Insumos.Open;

      stock := 'MINIMO';

      frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_stockMin.fr3');
      frxinsumos.ShowReport();
    end
    else
      ShowMessage('Seleccione una familia de productos');
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.ImprimeporUbicacion1Click(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos_ubicacion.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_ubicacion.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add(cadena + ' order by i.sUbicacion, i.sIdinsumo');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
    Imp_Insumos.Open;

    filtra2;
    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_ubicacion.fr3');
    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.ImprimeProductosPerecederos1Click(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos_perecederos.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_perecederos.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add(cadena + ' and i.lAplicaFecha = "Si" order by i.sIdinsumo ');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
    Imp_Insumos.Open;

    filtra2;
    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_perecederos.fr3');
    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.Imprimir1Click(Sender: TObject);
begin
  frmbarra1.btnPrinter.Click;
end;

procedure TfrmConsumibles.ImprimirMaterialesFotografia1Click(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos_fotos.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos_fotos.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add('select i.sContrato, i.sIdInsumo, i.sIdProveedor, i.sIdAlmacen, i.sTipoActividad, i.mDescripcion, i.dFecha, i.dFechaInicio, i.dFechaFinal, ' +
      'i.dCostoMN, i.dCostoDLL, i.dVentaMN, i.dVentaDLL, i.sMedida, i.dCantidad, i.dInstalado, i.sIdFase, i.dPorcentaje, ' +
      'i.sIdGrupo, i.dNuevoPrecio, i.dExistencia, i.sUbicacion, i.dStockMax, i.dStockMin, i.lAplicaFecha, i.dFechaCaducidad, i.bImagen, ' +
      'f.sDescripcion, a.sDescripcion as almacen  from insumos i ' +
      'left join familias f ON(i.sIdGrupo = f.sIdFamilia) ' +
      'left join almacenes a on(a.sIdAlmacen = i.sIdAlmacen) ' +
      'where i.sContrato = :Contrato and i.sIdAlmacen =:Almacen and i.sIdGrupo=:grupo order by i.sIdGrupo, a.sDescripcion, i.sIdinsumo ');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Almacen').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Almacen').Value := dbAlmacen.KeyValue;
    Imp_Insumos.Params.ParamByName('grupo').AsString := grupos.FieldByName('sIdFamilia').AsString;    
    Imp_Insumos.Open;

    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files + global_miReporte + '_CADinsumos_fotos.fr3');

    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.Insertar1Click(Sender: TObject);
begin
  frmBarra1.btnAdd.Click
end;

procedure TfrmConsumibles.chkFechaClick(Sender: TObject);
begin
  if (insumos.State = dsEdit) or (insumos.State = dsInsert) then
  begin
    if chkFecha.Checked then
      dFechaCaducidad.Enabled := True

    else
      dFechaCaducidad.Enabled := False;
  end;
end;

procedure TfrmConsumibles.chkFechaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if chkFecha.Checked then
      dFechaCaducidad.setFocus
    else
      mubicacion.SetFocus;
  end
end;

procedure TfrmConsumibles.cmbProveedorEnter(Sender: TObject);
begin
  cmbproveedor.color := global_color_entradaERP
end;

procedure TfrmConsumibles.cmbProveedorExit(Sender: TObject);
begin
  cmbproveedor.color := global_color_salidaERP;
end;

procedure TfrmConsumibles.cmbProveedorKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #8 then
    cmbProveedor.Text := '';
  filtra

end;

procedure TfrmConsumibles.Copy1Click(Sender: TObject);
begin
 ModificarPortapapeles (self.activecontrol, ftcopiar)
end;

procedure TfrmConsumibles.dbAlmacenChange(Sender: TObject);
begin
  if insumos.State = dsBrowse then
    filtra
end;

procedure TfrmConsumibles.dbAlmacenEnter(Sender: TObject);
begin
  dbalmacen.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbAlmacenExit(Sender: TObject);
begin
  if dbAlmacen.KeyValue <> null then
    Actual_almacen := dbAlmacen.KeyValue
  else
    Actual_almacen := '';
  Insumos.Active := False;
  Insumos.Params.ParamByName('Contrato').DataType := ftString;
  If Connection.configuracion.fieldValues['sAlmcon'] = 'CONTRATOS' Then
    Insumos.Params.ParamByName('Contrato').Value := global_contrato
  else
    Insumos.Params.ParamByName('Contrato').Value :=-1;
  Insumos.Params.ParamByName('Almacen').Value := Actual_almacen;
  Insumos.Open;

  filtra;
  dbalmacen.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dbAlmacenMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if almacen.recordcount > 0 then
    dbAlmacen.Hint := almacen.FieldValues['sDescripcion'];
end;

procedure TfrmConsumibles.dbeNroSerieEnter(Sender: TObject);
begin
  dbeNroSerie.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.dbeNroSerieExit(Sender: TObject);
begin
  dbeNroSerie.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.dbeNroSerieKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbGrupos.SetFocus
end;

procedure TfrmConsumibles.dbExistenciaChange(Sender: TObject);
begin
//  tdbeditchangef(dbExistencia, 'Existencia');
end;

procedure TfrmConsumibles.dbExistenciaEnter(Sender: TObject);
begin
  dbexistencia.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.dbExistenciaExit(Sender: TObject);
begin
  dbexistencia.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.dbExistenciaKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(dbExistencia, key) then
 //   key := #0;
  if key = #13 then
    tianno.SetFocus;
end;

procedure TfrmConsumibles.dbFamiliasChange(Sender: TObject);
begin
  if insumos.State = dsBrowse then
    filtra
end;

procedure TfrmConsumibles.dbFamiliasEnter(Sender: TObject);
begin
  tsDescripcion.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dbFamiliasExit(Sender: TObject);
begin
  dbAlmacen.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbFamiliasKeyPress(Sender: TObject; var Key: Char);
begin
  if insumos.State = dsBrowse then
    filtra
end;

procedure TfrmConsumibles.dbFamiliasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbFamilias.Hint := grupos.FieldValues['sDescripcion'];
end;

procedure TfrmConsumibles.dbGruposCloseUp(Sender: TObject);
begin
  qrysubfamilia.Active := False;
  qrysubfamilia.SQL.Clear;
  qrysubfamilia.SQL.Add('SELECT * FROM subfamilia WHERE sIdFamilia = :Familia ');
  qrysubfamilia.Params.ParamByName('Familia').AsString := grupos.FieldByName('sIdFamilia').AsString;
  qrysubfamilia.Open;
end;

procedure TfrmConsumibles.dbGruposEnter(Sender: TObject);
begin
  dbGrupos.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbGruposExit(Sender: TObject);
begin
  dbGrupos.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dbGruposKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbsubfamilia.SetFocus;
end;

procedure TfrmConsumibles.dbGruposMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  dbGrupos.Hint := grupos.Fieldbyname('sDescripcion').asstring;
end;

procedure TfrmConsumibles.dbMarcaEnter(Sender: TObject);
begin
    dbMarca.color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbMarcaExit(Sender: TObject);
begin
    dbMarca.color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dbNuevoPrecioChange(Sender: TObject);
begin
//  tdbeditchangef(dbNuevoPrecio, 'Nvo. Costo');
end;

procedure TfrmConsumibles.dbNuevoPrecioEnter(Sender: TObject);
begin
  dbNuevoPrecio.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbNuevoPrecioExit(Sender: TObject);
begin
  if dbNuevoPrecio.Text = '' then
     dbNuevoPrecio.Text := '0';
  dbNuevoPrecio.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.dbNuevoPrecioKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(dbNuevoPrecio, key) then
//    key := #0;
  if key = #13 then
    chkFecha.setFocus;
end;

procedure TfrmConsumibles.dbProveedoresEnter(Sender: TObject);
begin
  dbProveedores.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.dbProveedoresExit(Sender: TObject);
begin
  dbProveedores.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.dbProveedoresKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsDescripcion.SetFocus
end;

procedure TfrmConsumibles.dbSubfamiliaClick(Sender: TObject);
begin
    if qrysubfamilia.RecordCount > 0 then
    begin
        qryTipoSubFamilia.Active := False;
        qryTipoSubFamilia.SQL.Text := 'SELECT * FROM tipo_subfamilia WHERE iIdSubFamilia = ' +  qrysubfamilia.FieldByName('iIdSubfamilia').AsString;
        qryTipoSubFamilia.Open;
    end;
end;

procedure TfrmConsumibles.dbSubfamiliaEnter(Sender: TObject);
begin
    dbSubfamilia.color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbSubfamiliaExit(Sender: TObject);
begin
    dbSubfamilia.color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dbSubfamiliaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbNuevoPrecio.SetFocus;
end;

procedure TfrmConsumibles.dbTipoEnter(Sender: TObject);
begin
    dbTipo.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dbTipoExit(Sender: TObject);
begin
    dbTipo.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.DesglocedePrecioMaterial1Click(Sender: TObject);
var
  myForm: TForm;
  zDSMonto: tDataSource;
  sPaquete: string;
begin
  if insumos.RecordCount = 0 then
  begin
    messageDLG('No existe Material para calcular Precio.', mtInformation, [mbOk], 0);
    exit;
  end;

  if (insumos.State <> dsInsert) or (insumos.State <> dsEdit) then
  begin
    myForm := TForm.Create(Self);
    try
      myForm.Position := poDesktopCenter;
      myForm.Caption := 'D E S G L O C E   P R E C I O  D E   M A T E R I A L  [' + insumos.FieldValues['sIdInsumo'] + ']';
      MyForm.BorderIcons := [];
      MyForm.Width := 480;
      MyForm.Height := 250;
      MyForm.BorderStyle := bsSizeable;
      MyForm.Color := $00FEC6BA;

              //Validaciones antes de entrar al Formulario..
      connection.zCommand.Active := False;
      connection.zCommand.SQL.Clear;
      connection.zCommand.SQL.Add('select sIdMaterial from insumos_precios where sContrato =:Contrato and sIdMaterial =:Insumo ');
      connection.zCommand.ParamByName('Contrato').AsString := global_contrato;
      connection.zCommand.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
      connection.zCommand.Open;

      if connection.zCommand.RecordCount = 0 then
      begin
        connection.QryBusca.Active := False;
        connection.QryBusca.SQL.Clear;
        connection.QryBusca.SQL.Add('INSERT INTO insumos_precios ( sContrato, sIdMaterial, dCostoBaseMN, dCostoBaseDLL, dPrecioMN, dPrecioDLL, dFleteMN, dDerechosMN, dMermasMN, dFleteDLL, dDerechosDLL, dMermasDLL )' +
          'VALUES (:Contrato, :Insumo, :PrecioMN, :PrecioDLL, :PrecioMN, :PrecioDLL,0,0,0,0,0,0)');
        connection.QryBusca.ParamByName('Contrato').AsString := global_contrato;
        connection.QryBusca.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
        connection.QryBusca.ParamByName('PrecioMN').AsFloat := insumos.FieldValues['dVentaMN'];
        connection.QryBusca.ParamByName('PrecioDLL').AsFloat := insumos.FieldValues['dVentaDLL'];
        connection.QryBusca.ExecSQL;
      end;

      zMonto := TZQuery.Create(nil);
      zMonto.Connection := connection.zConnection;
      zMonto.Active := False;
      zMonto.Sql.Clear;
      zMonto.Sql.Add('Select * From insumos_precios p ' +
        'where p.sContrato =:Contrato and p.sIdMaterial =:Insumo ');
      zMonto.Params.ParamByName('Contrato').AsString := global_contrato;
      zMonto.Params.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
      zMonto.Open;
      zDSMonto := tDataSource.Create(nil);
      zDSMonto.DataSet := zMonto;

                  // TITULO Costo Base MN...
      with TLabel.Create(Self) do
      begin
        Left := 200;
        Top := 40;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lblA';
        Caption := 'M.N.';
        Anchors := [akRight, akBottom];
      end;

                   // TITULO Costo Base MN...
      with TLabel.Create(Self) do
      begin
        Left := 375;
        Top := 40;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lblB';
        Caption := 'DLL';
        Anchors := [akRight, akBottom];
      end;

                  // Costo Base MN...
      with TLabel.Create(Self) do
      begin
        Left := 20;
        Top := 60;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lbl1';
        Caption := 'Costo Base MN';
        Anchors := [akRight, akBottom];
      end;

      with TEdit.Create(Self) do
      begin
        Left := 130;
        Top := 60;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtCostoBase';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dCostoBaseMN'];
        OnExit := procCalculaCosto;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;

                  //Flete MN..
      with TLabel.Create(Self) do
      begin
        Left := 20;
        Top := 90;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lbl2';
        Caption := 'Flete ';
        Anchors := [akRight, akBottom];
      end;

      with TEdit.Create(Self) do
      begin
        Left := 130;
        Top := 90;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtFlete';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dFleteMN'];
        OnExit := procCalculaFlete;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;

                  //Derechos MN..
      with TLabel.Create(Self) do
      begin
        Left := 20;
        Top := 120;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lbl3';
        Caption := 'Derechos ';
        Anchors := [akRight, akBottom];
      end;

      with TEdit.Create(Self) do
      begin
        Left := 130;
        Top := 120;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtDerecho';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dDerechosMN'];
        OnExit := procCalculaDerecho;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;

                  //Mermas MN..
      with TLabel.Create(Self) do
      begin
        Left := 20;
        Top := 150;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lbl4';
        Caption := 'Mermas ';
        Anchors := [akRight, akBottom];
      end;

      with TEdit.Create(Self) do
      begin
        Left := 130;
        Top := 150;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtMermas';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dMermasMN'];
        OnExit := procCalculaMerma;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;

                  //Costo Unitario MN..
      with TLabel.Create(Self) do
      begin
        Left := 20;
        Top := 180;
        Width := 120;
        Height := 35;
        Parent := MyForm;
        Name := 'lbl5';
        Caption := 'Costo Total ';
        Anchors := [akRight, akBottom];
      end;

      with TEdit.Create(Self) do
      begin
        Left := 130;
        Top := 180;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtCosto';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dPrecioMN'];
        OnEnter := procSuma;
      end;

            //BOTONES DOLARES
                 // Costo Base DLL...
      with TEdit.Create(Self) do
      begin
        Left := 300;
        Top := 60;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtCostoBaseDLL';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dCostoBaseDLL'];
        OnExit := procCalculaCostoDLL;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;
                  //Flete DLL
      with TEdit.Create(Self) do
      begin
        Left := 300;
        Top := 90;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtFleteDLL';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dFleteDLL'];
        OnExit := procCalculaFleteDLL;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;
                  //Derechos DLL
      with TEdit.Create(Self) do
      begin
        Left := 300;
        Top := 120;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtDerechoDLL';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dDerechosDLL'];
        OnExit := procCalculaDerechoDLL;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;
                  //Mermas DLL
      with TEdit.Create(Self) do
      begin
        Left := 300;
        Top := 150;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtMermasDLL';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dMermasDLL'];
        OnExit := procCalculaMermaDLL;
        OnKeyUp := procObtiene;
        OnEnter := procObtieneTexto;
      end;
                  //Costo total DLL
      with TEdit.Create(Self) do
      begin
        Left := 300;
        Top := 180;
        Width := 130;
        Height := 35;
        Parent := MyForm;
        Name := 'txtCostoDLL';
        Anchors := [akRight, akBottom];
        Text := zMonto.FieldValues['dPrecioDLL'];
        OnEnter := procSumaDLL;
      end;


//             with TButton.Create(Self) do
//             begin
//                 Left := 130;
//                 Top := 210 ;
//                 Width := 120 ;
//                 Height := 35 ;
//                 Default := True ;
//                 Parent := MyForm;
//                 Caption := 'Actualizar Datos' ;
//                 //OnClick := ActualizaCosto ;
//                 Anchors :=  [akLeft,akBottom] ;
//             end;

      with TButton.Create(Self) do
      begin
        Left := 300;
        Top := 210;
        Width := 120;
        Height := 35;
        ModalResult := mrCancel;
        Cancel := True;
        Parent := MyForm;
        Caption := '&Guardar y Salir ';
        Anchors := [akLeft, akBottom];
        OnClick := procSumaSalir;
      end;

      myForm.ShowModal;
    finally
      zMonto.Destroy;
      zDSMonto.Destroy;
      myForm.Free;
    end;
  end;
end;

procedure TfrmConsumibles.dFechaCaducidadEnter(Sender: TObject);
begin
  dFechaCaducidad.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.dFechaCaducidadExit(Sender: TObject);
begin
  dFechaCaducidad.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.dFechaCaducidadKeyPress(Sender: TObject;
  var Key: Char);
begin


  if key = #13 then
    mubicacion.SetFocus;
end;

procedure TfrmConsumibles.DistribuciondeMaterialCalcFields(DataSet: TDataSet);
begin
  case StrToInt(copy(DateToStr(DistribuciondeMaterial.FieldValues['dIdFecha']), 4, 2)) of
    1: DistribuciondeMaterialsMes.Value := 'ENERO';
    2: DistribuciondeMaterialsMes.Value := 'FEBRERO';
    3: DistribuciondeMaterialsMes.Value := 'MARZO';
    4: DistribuciondeMaterialsMes.Value := 'ABRIL';
    5: DistribuciondeMaterialsMes.Value := 'MAYO';
    6: DistribuciondeMaterialsMes.Value := 'JUNIO';
    7: DistribuciondeMaterialsMes.Value := 'JULIO';
    8: DistribuciondeMaterialsMes.Value := 'AGOSTO';
    9: DistribuciondeMaterialsMes.Value := 'SEPTIEMBRE';
    10: DistribuciondeMaterialsMes.Value := 'OCTUBRE';
    11: DistribuciondeMaterialsMes.Value := 'NOVIEMBRE';
    12: DistribuciondeMaterialsMes.Value := 'DICIEMBRE';
  end;
  DistribuciondeMaterialiAnno.Value := StrToInt(copy(DateToStr(DistribuciondeMaterial.FieldValues['dIdFecha']), 7, 4));
end;

procedure TfrmConsumibles.dStockMinChange(Sender: TObject);
begin
///  tdbeditchangef(dStockMin, 'Stock Min.');
end;

procedure TfrmConsumibles.dStockMinEnter(Sender: TObject);
begin
  dStockMin.Color := Global_Color_entradaERP;
end;

procedure TfrmConsumibles.dStockMinExit(Sender: TObject);
begin
  if dStockMin.Text = '' then
    dStockMin.Text := '0';
  dStockMin.Color := Global_Color_SalidaERP;
end;

procedure TfrmConsumibles.dStockMinKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsnumeroactividad.SetFocus;
end;

procedure TfrmConsumibles.dStokMaxChange(Sender: TObject);
begin
//  tdbeditchangef(dStokMax, 'Stock Max.');
end;

procedure TfrmConsumibles.dStokMaxEnter(Sender: TObject);
begin
  dStokMax.Color := Global_Color_entradaERP;
end;

procedure TfrmConsumibles.dStokMaxExit(Sender: TObject);
begin
  if dStokMax.Text = '' then
    dStokMax.Text := '0';
  dStokMax.Color := Global_Color_SalidaERP;
end;

procedure TfrmConsumibles.dStokMaxKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(dStokMax, key) then
 //   key := #0;
  if key = #13 then
    dStockMin.SetFocus;
end;

procedure TfrmConsumibles.Editar1Click(Sender: TObject);
begin
  frmBarra1.btnEdit.Click
end;

procedure TfrmConsumibles.Registrar1Click(Sender: TObject);
begin
  frmBarra1.btnPost.Click
end;

procedure TfrmConsumibles.rRestarExistenciaClick(Sender: TObject);
begin
    zkardex.Active := False;
    zkardex.SQL.Clear;
    zkardex.SQL.text := 'select sIdUsuario, sPasswordAjustaMaterial, lAjusteMaterial  from usuarios ' +
                        'where sIdUsuario = :Usuario';
    zkardex.Params.ParamByName('Usuario').DataType := ftString;
    zkardex.Params.ParamByName('Usuario').Value := ''+global_Usuario+'';
    zkardex.Open;
    if zkardex.RecordCount > 0 then
    begin
      if zkardex.FieldValues ['lAjusteMaterial']= 'SI' then begin
        if insumos.State IN [dsInsert,dsEdit] then begin
          Panel.Visible := true;
          contra.Text := '';
          contra.SetFocus;
        end;
      end
      else
      begin
        showmessage('No es un Usuario Permitido Para realizar esta operacion');
        exit;
      end;
    end;
end;

procedure TfrmConsumibles.rSumarExistenciaClick(Sender: TObject);
begin
    zkardex.Active := False;
    zkardex.SQL.Clear;
    zkardex.SQL.text := 'select sIdUsuario, sPasswordAjustaMaterial, lAjusteMaterial  from usuarios ' +
                        'where sIdUsuario = :Usuario';
    zkardex.Params.ParamByName('Usuario').DataType := ftString;
    zkardex.Params.ParamByName('Usuario').Value := ''+global_Usuario+'';
    zkardex.Open;
    if zkardex.RecordCount > 0 then
    begin
      if zkardex.FieldValues ['lAjusteMaterial']= 'SI' then begin
        if insumos.State IN [dsInsert,dsEdit] then begin
          Panel.Visible := true;
          contra.Text := '';
          contra.SetFocus;
        end;
      end
      else
      begin
        showmessage('No es un Usuario Permitido Para realizar esta operacion');
        exit;
      end;
    end;
end;

procedure TfrmConsumibles.btnProveedoresClick(Sender: TObject);
begin
  global_frmActivo := 'frmConsumibles';
  Application.CreateForm(TfrmProveedores, frmProveedores);
  frmProveedores.Show;
end;

procedure TfrmConsumibles.btnSubFamiliaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSubFamProductos, frmSubFamProductos);
  frmSubFamProductos.ShowModal;
end;

procedure TfrmConsumibles.btnGrupoFamiliaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGrupoFamilias, frmGrupoFamilias);
  frmGrupoFamilias.showModal;
  grupos.active := false;
  grupos.open;
  grupos.Last;
  dbGrupos.KeyValue := global_familia;
end;

procedure TfrmConsumibles.btnMarcasClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMarcasxSubFam, frmMarcasxSubFam);
  frmMarcasxSubFam.showmodal;
  qryMarcas.active := false;
  qryMarcas.Open;
  qryMarcas.Last;
end;

procedure TfrmConsumibles.btnMedidasClick(Sender: TObject);
begin
  global_frmActivo := 'frmMedidas';
  Application.CreateForm(TfrmMedidas, frmMedidas);
  frmMedidas.Show;
end;

procedure TfrmConsumibles.AjustarCantidadEnter(Sender: TObject);
begin
    AjustarCantidad.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.AjustarCantidadExit(Sender: TObject);
begin
    AjustarCantidad.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.BitBtn1Click(Sender: TObject);
begin
  sArchivo := '';
  Connection.QryBusca.Active := False;
  Connection.QryBusca.SQL.Clear;
  Connection.QryBusca.SQL.Add('UPDATE insumos SET bImagen = NULL Where sContrato = :Contrato And sIdInsumo = :Insumo and sIdAlmacen = :almacen');
  Connection.QryBusca.Params.ParamByName('Contrato').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('Contrato').Value := global_contrato;
  Connection.QryBusca.Params.ParamByName('Insumo').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('Insumo').Value := insumos.FieldValues['sIdInsumo'];
  Connection.QryBusca.Params.ParamByName('almacen').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('almacen').Value := insumos.FieldValues['sIdAlmacen'];
  Connection.QryBusca.ExecSQL;

  if Insumos.State in [dsEdit, dsInsert] then
  begin
  //  Insumos.FieldByName('bImagen').Value := Null;
  end
  else
  begin
    Insumos.Edit;
    ////subfamilia
     if dbSubfamilia.Text = '' then
     begin
        //showMessage('nada sub Familia');
        Insumos.FieldByName('iIdSubfamilia').AsString := '0';
     end
     else
     begin
        //showMessage('algo sub Familia');
        Insumos.FieldByName('iIdSubfamilia').AsString := qrySubfamilia.FieldByName('iIdSubfamilia').AsString;
     end;

      //////////marca
     if dbMarca.Text <> '' then
     begin
        Insumos.FieldByName('sIdMarca').AsString := qryMarcas.FieldByName('sIdMarca').AsString;
     end
     else
     begin
        Insumos.FieldByName('sIdMarca').AsString := '';
     end;

     ////////tipo subfamilia
     if dbTipo.Text <> '' then
     begin
        //showMessage('algo tipo');
        Insumos.FieldByName('iIdTipoSubFamilia').AsString := qryTipoSubFamilia.FieldByName('iIdTipoSubFamilia').AsString;
     end
     else
     begin
        //showMessage('nada tipo');
        Insumos.FieldByName('iIdTipoSubFamilia').AsString := '0';
     end;
    Insumos.FieldByName('bImagen').Value := Null;
    Insumos.Post;
  end;


  bImagen.Picture.LoadFromFile('');

  bImagen.Picture.Graphic := Nil;

  bImagenDefault := True;
end;

procedure TfrmConsumibles.BitBtn2Click(Sender: TObject);
begin
    if zkardex.FieldValues ['sPasswordAjustaMaterial']= contra.Text then
    begin
      AjustarCantidad.Enabled := true;
      panel.Visible := false;
    end
    else begin
      MessageDlg('Contraseña Incorecta.!' + #10 + #10 + 'Introduzca la Contraseña Correcta' ,mtInformation, [mbOK],0);
      contra.Text := '';
      contra.SetFocus;
      AjustarCantidad.Value := 0;
      AjustarCantidad.Enabled := False;
    end;
end;

procedure TfrmConsumibles.BitBtn3Click(Sender: TObject);
begin
panel.Visible := False;
AjustarCantidad.Enabled := False;
AjustarCantidad.Value := 0;
rRestarExistencia.Checked := False;
rSumarExistencia.Checked := False;
end;

procedure TfrmConsumibles.BitBtn4Click(Sender: TObject);
begin
  Llenargrupos;
end;

procedure TfrmConsumibles.BitBtn5Click(Sender: TObject);
begin
  global_frmActivo := 'frmConsumibles';
  Application.CreateForm(TfrmTipoInsumo, frmTipoInsumo);
  frmTipoInsumo.Show;
end;

procedure TfrmConsumibles.BitBtn6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmdetallesubfamilias, frmdetallesubfamilias);
  frmdetallesubfamilias.show;
  qryTipoSubFamilia.Refresh;
  qryTipoSubFamilia.Last;
end;

procedure TfrmConsumibles.btnDistribuirClick(Sender: TObject);
var
  sFecha: string;
  iMes: Integer;
begin
  if tsMes.Text = 'ENERO' then iMes := 1
  else if tsMes.Text = 'FEBRERO' then iMes := 2
  else if tsMes.Text = 'MARZO' then iMes := 3
  else if tsMes.Text = 'ABRIL' then iMes := 4
  else if tsMes.Text = 'MAYO' then iMes := 5
  else if tsMes.Text = 'JUNIO' then iMes := 6
  else if tsMes.Text = 'JULIO' then iMes := 7
  else if tsMes.Text = 'AGOSTO' then iMes := 8
  else if tsMes.Text = 'SEPTIEMBRE' then iMes := 9
  else if tsMes.Text = 'OCTUBRE' then iMes := 10
  else if tsMes.Text = 'NOVIEMBRE' then iMes := 11
  else if tsMes.Text = 'DICIEMBRE' then iMes := 12;
  if iMes < 9 then
    sFecha := '01/0' + Trim(IntToStr(iMes + 1)) + '/' + tiAnno.Text
  else
    if iMes < 12 then
      sFecha := '01/' + Trim(IntTostr(iMes + 1)) + '/' + tiAnno.Text
    else
    begin
      tiAnno.Value := tiAnno.Value + 1;
      sFecha := '01/01/' + tiAnno.Text
    end;
  connection.qryBusca.Active := False;
  connection.qryBusca.SQL.Clear;
  connection.qryBusca.SQL.Add('Select sContrato From distribuciondematerial Where ' +
    'sContrato = :Contrato and sIdMaterial = :Material and dIdFecha = :Fecha');
  connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
  connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
  connection.qryBusca.Params.ParamByName('Material').DataType := ftString;
  connection.qryBusca.Params.ParamByName('Material').Value := insumos.FieldValues['sIdInsumo'];
  Connection.QryBusca.Params.ParamByName('Fecha').DataType := ftDate;
  Connection.QryBusca.Params.ParamByName('Fecha').Value := StrToDate(sFecha) - 1;
  connection.qryBusca.Open;
  if connection.qryBusca.RecordCount > 0 then
  begin
    try
      Connection.zCommand.Active := False;
      Connection.zCommand.SQL.Clear;
      Connection.zCommand.SQL.Add('Select sum(dCantidad) as suma From distribuciondematerial ' +
        'Where sContrato = :Contrato and sIdMaterial = :Material and dIdFecha <> :Fecha group by sIdMaterial');
      Connection.zCommand.ParamByName('Contrato').Value := global_contrato;
      Connection.zCommand.ParamByName('Material').Value := insumos.FieldByName('sIdInsumo').AsString;
      Connection.zCommand.ParamByName('Fecha').Value := StrToDate(sFecha) - 1;
      Connection.zCommand.Open;
      if Connection.zCommand.RecordCount > 0 then
      begin
        if (Connection.zCommand.FieldByName('suma').AsFloat + tdCantidadMensual.Value) > (insumos.FieldByName('dCantidad').AsFloat) then
        begin
                //no es posible distribuir mas de la cantidad asignada a la categoria de personal
          showmessage('No se puede distribuir más de lo asignado al Material Seleccionado.');
          exit;
        end;
      end;

      connection.zCommand.Active := False;
      connection.zCommand.SQL.Clear;
      connection.zCommand.SQL.Add('update distribuciondematerial SET dCantidad = :Cantidad ' +
        'Where sContrato = :Contrato And sIdMaterial = :Material And dIdFecha = :Fecha');
      connection.zCommand.Params.ParamByName('Contrato').DataType := ftString;
      connection.zCommand.Params.ParamByName('Contrato').Value := Global_Contrato;
      connection.zCommand.Params.ParamByName('Material').DataType := ftString;
      connection.zCommand.Params.ParamByName('Material').Value := insumos.FieldValues['sIdInsumo'];
      connection.zCommand.Params.ParamByName('Fecha').DataType := ftDate;
      connection.zCommand.Params.ParamByName('Fecha').Value := StrToDate(sFecha) - 1;
      connection.zCommand.Params.ParamByName('Cantidad').DataType := ftString;
      connection.zCommand.Params.ParamByName('Cantidad').Value := tdCantidadMensual.Value;
      connection.zCommand.ExecSQL();
    except
      on e: exception do begin
        UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al modificar registro', 0);
      end;
    end
  end
  else
  begin
    try
      Connection.zCommand.Active := False;
      Connection.zCommand.SQL.Clear;
      Connection.zCommand.SQL.Add('Select sum(dCantidad) as suma From distribuciondematerial ' +
        'Where sContrato = :Contrato and sIdMaterial = :Material and dIdFecha <> :Fecha group by sIdMaterial');
      Connection.zCommand.ParamByName('Contrato').Value := global_contrato;
      Connection.zCommand.ParamByName('Material').Value := insumos.FieldByName('sIdInsumo').AsString;
      Connection.zCommand.ParamByName('Fecha').Value := StrToDate(sFecha) - 1;
      Connection.zCommand.Open;
      if Connection.zCommand.RecordCount > 0 then
      begin
        if (Connection.zCommand.FieldByName('suma').AsFloat + tdCantidadMensual.Value) > (insumos.FieldByName('dCantidad').AsFloat) then
        begin
                //no es posible distribuir mas de la cantidad asignada a la categoria de personal
          showmessage('No se puede distribuir más de lo asignado al Material Seleccionado.');
          exit;
        end;
      end;

      connection.zCommand.Active := False;
      connection.zCommand.SQL.Clear;
      connection.zCommand.SQL.Add('INSERT INTO distribuciondematerial (sContrato, sIdMaterial, dIdFecha, dCantidad) ' +
        'VALUES (:Contrato, :Material, :Fecha, :Cantidad)');
      connection.zCommand.Params.ParamByName('Contrato').DataType := ftString;
      connection.zCommand.Params.ParamByName('Contrato').Value := Global_Contrato;
      connection.zCommand.Params.ParamByName('Material').DataType := ftString;
      connection.zCommand.Params.ParamByName('Material').Value := insumos.FieldValues['sIdInsumo'];
      connection.zCommand.Params.ParamByName('Fecha').DataType := ftDate;
      connection.zCommand.Params.ParamByName('Fecha').Value := StrToDate(sFecha) - 1;
      connection.zCommand.Params.ParamByName('Cantidad').DataType := ftString;
      connection.zCommand.Params.ParamByName('Cantidad').Value := tdCantidadMensual.Value;
      connection.zCommand.ExecSQL();
    except
      on e: exception do begin
        UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'CATALOGO DE MATERIALES', 'Al insertar registro', 0);
      end;
    end
  end;
  DistribuciondeMaterial.refresh;
  DistribuciondeMaterial.Last;
  if tsMes.Text <> 'DICIEMBRE' then
    tsMes.ItemIndex := tsMes.ItemIndex + 1
  else
  begin
        //tiAnno.Value := tiAnno.Value + 1 ;
    tsMes.ItemIndex := 0;
  end;
  tdCantidadMensual.SetFocus

end;

procedure TfrmConsumibles.Can1Click(Sender: TObject);
begin
  frmBarra1.btnCancel.Click
end;

procedure TfrmConsumibles.Cantidades1Click(Sender: TObject);
begin
    ImprimeDistribucion('Cantidad');
end;

procedure TfrmConsumibles.Eliminar1Click(Sender: TObject);
begin
  frmBarra1.btnDelete.Click
end;

procedure TfrmConsumibles.ExportaaPlantillaExcel1Click(Sender: TObject);
var
  CadError, OrdenVigencia: string;
//////////////////////////////////// PLANTILAS DE IMPORTACION //////////////////
  function GenerarPlantilla: Boolean;
  var
    Resultado: Boolean;

    procedure DatosPlantilla;
    var
      CadFecha, tmpNombre, cadena: string;
      fs: tStream;
      Alto: Extended;
      Ren, nivel: integer;
    begin
      Ren := 2;
  // Realizar los ajustes visuales y de formato de hoja
      Excel.ActiveWindow.Zoom := 100;
//  if rAnexoC.Checked then
//  begin
      Excel.Columns['A:A'].ColumnWidth := 10;
      Excel.Columns['B:B'].ColumnWidth := 15;
      Excel.Columns['C:C'].ColumnWidth := 40;
      Excel.Columns['D:L'].ColumnWidth := 12;

      // Colocar los encabezados de la plantilla...
      Hoja.Range['A1:A1'].Select;
      Excel.Selection.Value := 'Id_Insumo';
      FormatoEncabezado;
      Hoja.Range['B1:B1'].Select;
      Excel.Selection.Value := 'Tipo';
      FormatoEncabezado;
      Hoja.Range['C1:C1'].Select;
      Excel.Selection.Value := 'Descripcion';
      FormatoEncabezado;
      Hoja.Range['D1:D1'].Select;
      Excel.Selection.Value := 'Medida';
      FormatoEncabezado;
      Hoja.Range['E1:E1'].Select;
      Excel.Selection.Value := 'Cantidad';
      FormatoEncabezado;
      Hoja.Range['F1:F1'].Select;
      Excel.Selection.Value := 'Cantidad a Inst.';
      FormatoEncabezado;
      Hoja.Range['G1:G1'].Select;
      Excel.Selection.Value := 'Fecha';
      FormatoEncabezado;
      Hoja.Range['H1:H1'].Select;
      Excel.Selection.Value := 'Costo MN';
      FormatoEncabezado;
      Hoja.Range['I1:I1'].Select;
      Excel.Selection.Value := 'Costo DLL';
      FormatoEncabezado;
      Hoja.Range['J1:J1'].Select;
      Excel.Selection.Value := 'Venta MN';
      FormatoEncabezado;
      Hoja.Range['K1:K1'].Select;
      Excel.Selection.Value := 'Venta DLL';
      FormatoEncabezado;
      Hoja.Range['L1:L1'].Select;
      Excel.Selection.Value := 'Familia';
      FormatoEncabezado;

      connection.QryBusca.Active := False;
      Connection.QryBusca.Filtered := False;
      connection.QryBusca.SQL.Clear;
      connection.QryBusca.SQL.Add('select sIdInsumo, sTipoActividad, mDescripcion, sMedida, dCantidad, dInstalado, dFecha, ' +
        'dCostoMN, dCostoDLL, dVentaMN, dVentaDLL, sIdGrupo, dexistencia from insumos where sContrato =:Contrato '  +
        'and sidalmacen=:Almacen order by sIdInsumo');
      connection.QryBusca.Params.ParamByName('Contrato').DataType := ftString;
      connection.QryBusca.Params.ParamByName('Contrato').Value := global_contrato;
      connection.QryBusca.Params.ParamByName('Almacen').asstring :=dbAlmacen.keyvalue;
      connection.QryBusca.Open;

      if connection.QryBusca.RecordCount > 0 then
      begin
        while not connection.QryBusca.Eof do
        begin
          Hoja.Cells[Ren, 1].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['sIdInsumo'];
          Excel.Selection.HorizontalAlignment := xlCenter;
          Excel.Selection.VerticalAlignment := xlCenter;

          Hoja.Cells[Ren, 2].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['sTipoActividad'];

          Hoja.Cells[Ren, 3].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['mDescripcion'];
          Alto := Excel.Rows[IntToStr(Ren) + ':' + IntToStr(Ren)].RowHeight;
          Hoja.Cells[Ren, 3].Value := '';

          if Alto > 15 then
            Excel.Rows[IntToStr(Ren) + ':' + IntToStr(Ren)].RowHeight := Alto
          else
            Excel.Rows[IntToStr(Ren) + ':' + IntToStr(Ren)].RowHeight := 15;

          Excel.Selection.Value := connection.QryBusca.FieldValues['mDescripcion'];

          Hoja.Cells[Ren, 4].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['sMedida'];
          Excel.Selection.HorizontalAlignment := xlCenter;
          Excel.Selection.VerticalAlignment := xlCenter;

          Hoja.Cells[Ren, 5].Select;
          Excel.Selection.NumberFormat := '@';
          Excel.Selection.Value := connection.QryBusca.FieldValues['dexistencia'];
          Excel.Selection.HorizontalAlignment := xlRight;
          Excel.Selection.VerticalAlignment := xlCenter;

          Hoja.Cells[Ren, 6].Select;
          Excel.Selection.NumberFormat := '@';
          Excel.Selection.Value := connection.QryBusca.FieldValues['dInstalado'];
          Excel.Selection.HorizontalAlignment := xlRight;
          Excel.Selection.VerticalAlignment := xlCenter;

          Hoja.Cells[Ren, 7].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['dFecha'];

          Hoja.Cells[Ren, 8].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['dCostoMN'];

          Hoja.Cells[Ren, 9].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['dCostoDLL'];

          Hoja.Cells[Ren, 10].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['dVentaMN'];

          Hoja.Cells[Ren, 11].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['dVentaDLL'];

          Hoja.Cells[Ren, 12].Select;
          Excel.Selection.Value := connection.QryBusca.FieldValues['sIdGrupo'];

          connection.QryBusca.Next;
          Inc(Ren);
        end;
      end;
      Hoja.Cells[2, 2].Select;


      Hoja.Range['A1:L1'].Select;
  // Formato general de encabezado de datos..
      Excel.Selection.HorizontalAlignment := xlCenter;
      Excel.Selection.VerticalAlignment := xlCenter;
      Excel.Selection.Interior.ColorIndex := 5;
      Excel.Selection.Font.color := clWhite;
      Excel.Selection.Interior.Pattern := xlSolid;

      Hoja.Range['A1:A1'].Select;
    end;

  begin
    Resultado := True;
    try
      Hoja := Libro.Sheets[1];
      Hoja.Select;
      try
        Hoja.Name := 'MATERIALES ' + global_contrato;
      except
        Hoja.Name := 'MATERIALES ' + global_contrato;
      end;
      DatosPlantilla;
    except
      on e: exception do
      begin
        Resultado := False;
        CadError := 'Se ha producido el siguiente error al generar la Plantilla de Materiales' + #10 + #10 + e.Message;
      end;
    end;

    Result := Resultado;
  end;

begin
  // Solicitarle al usuario la ruta del archivo en donde desea grabar el reporte
  if not SaveDialog1.Execute then
    Exit;

  // Generar el ambiente de excel
  try
    Excel := CreateOleObject('Excel.Application');
  except
    FreeAndNil(Excel);
    showmessage('No es posible generar el ambiente de EXCEL, informe de esto al administrador del sistema.');
    Exit;
  end;

  Excel.Visible := True;
  Excel.DisplayAlerts := False;
  Excel.ScreenUpdating := True;

  Libro := Excel.Workbooks.Add; // Crear el libro sobre el que se ha de trabajar

  // Verificar si cuenta con las hojas necesarias
  while Libro.Sheets.Count < 2 do
    Libro.Sheets.Add;

  // Verificar si se pasa de hojas necesarias
  Libro.Sheets[1].Select;
  while Libro.Sheets.Count > 1 do
    Excel.ActiveWindow.SelectedSheets.Delete;

  // Proceder a generar la hoja REPORTE
  CadError := '';

  if GenerarPlantilla then
    // Grabar el archivo de excel con el nombre dado
    messageDlg('La Plantilla se Genero Correctamente!', mtConfirmation, [mbOk], 0);

  Excel := '';

  if CadError <> '' then
    showmessage(CadError);

end;

procedure TfrmConsumibles.ExportaraExcel1Click(Sender: TObject);
begin
  ExportExcelPersonalizado(zq_contratos,grid_embarcacionesDBTableView1,'Insumos en el Almacen','Catalogo de Materiales');
end;

procedure TfrmConsumibles.Refresh1Click(Sender: TObject);
begin
  frmBarra1.btnRefresh.Click
end;

procedure TfrmConsumibles.Salir1Click(Sender: TObject);
begin
  frmBarra1.btnExit.Click
end;

////////

procedure TfrmConsumibles.InsertaActividad(Sender: TObject);
var
  SavePlace: TBookmark;
  iGrid: Integer;
  duplico: boolean;
begin
  SavePlace := GridCatalogo.DataSource.DataSet.GetBookmark;
  with GridCatalogo.DataSource.DataSet do
  begin
    for iGrid := 0 to GridCatalogo.SelectedRows.Count - 1 do
    begin
      GotoBookmark(pointer(GridCatalogo.SelectedRows.Items[iGrid]));
      try
        duplico := False;
                     //Se insertan los datos basicos....
        connection.zCommand.Active := False;
        connection.zCommand.SQL.Clear;
        connection.zCommand.SQL.Add('INSERT INTO insumos ( sContrato, sIdInsumo, sIdProveedor, sIdAlmacen, sTipoActividad, mDescripcion,dFecha,dFechaInicio,dFechaFinal, dCostoMN, dCostoDLL, dVentaMN, dVentaDLL, sMedida, dCantidad, dInstalado, sIdGrupo, sIdFase, dNuevoPrecio) ' +
          ' VALUES (:contrato, :insumo, :prov, :almacen, :tipoactividad, :Descripcion,:fecha,:fechaI,:fechaF, :costoMN, :costoDLL, :ventaMN, :ventaDLL, :medida, :cantidad, :instalado, :fase,:fase, 0)');
        connection.zCommand.Params.ParamByName('contrato').DataType := ftString;
        connection.zCommand.Params.ParamByName('contrato').value := global_contrato;
        connection.zCommand.Params.ParamByName('insumo').DataType := ftString;
        connection.zCommand.Params.ParamByName('insumo').value := FieldValues['sIdInsumo'];
        connection.zCommand.Params.ParamByName('almacen').DataType := ftString;
        connection.zCommand.Params.ParamByName('almacen').value := dbAlmacen.KeyValue;
        connection.zCommand.Params.ParamByName('prov').DataType := ftString;
        connection.zCommand.Params.ParamByName('prov').value := FieldValues['sIdProveedor'];
        connection.zCommand.Params.ParamByName('tipoactividad').DataType := ftString;
        connection.zCommand.Params.ParamByName('tipoactividad').value := FieldValues['sTipoActividad'];
        connection.zCommand.Params.ParamByName('Descripcion').DataType := ftString;
        connection.zCommand.Params.ParamByName('Descripcion').value := FieldValues['mDescripcion']; ;
        connection.zCommand.Params.ParamByName('fecha').DataType := ftDate;
        if FieldValues['dFecha'] <> null then
          connection.zCommand.Params.ParamByName('fecha').value := FieldValues['dFecha']
        else
          connection.zCommand.Params.ParamByName('fecha').value := FieldValues['dFechaInicio'];
        connection.zCommand.Params.ParamByName('fechaI').DataType := ftDate;
        connection.zCommand.Params.ParamByName('fechaI').value := FieldValues['dFechaInicio'];
        connection.zCommand.Params.ParamByName('fechaF').DataType := ftDate;
        if FieldValues['dFechaFinal'] <> null then
          connection.zCommand.Params.ParamByName('fechaF').value := FieldValues['dFechaFinal']
        else
          connection.zCommand.Params.ParamByName('fechaF').value := FieldValues['dFechaInicio'];
        connection.zCommand.Params.ParamByName('costoMN').DataType := ftFloat;
        connection.zCommand.Params.ParamByName('costoMN').value := FieldValues['dCostoMN'];
        connection.zCommand.Params.ParamByName('costoDLL').DataType := ftFloat;
        connection.zCommand.Params.ParamByName('costoDLL').value := FieldValues['dCostoDLL'];
        connection.zCommand.Params.ParamByName('ventaMN').DataType := ftFloat;
        connection.zCommand.Params.ParamByName('ventaMN').value := FieldValues['dVentaMN'];
        connection.zCommand.Params.ParamByName('ventaDLL').DataType := ftFloat;
        connection.zCommand.Params.ParamByName('ventaDLL').value := FieldValues['dVentaDLL'];
        connection.zCommand.Params.ParamByName('medida').DataType := ftString;
        connection.zCommand.Params.ParamByName('medida').value := FieldValues['sMedida'];
        connection.zCommand.Params.ParamByName('cantidad').DataType := ftInteger;
        connection.zCommand.Params.ParamByName('cantidad').value := FieldValues['dCantidad'];
        connection.zCommand.Params.ParamByName('instalado').DataType := ftFloat;
        connection.zCommand.Params.ParamByName('instalado').value := FieldValues['dInstalado'];
        connection.zCommand.Params.ParamByName('fase').DataType := ftString;
        connection.zCommand.Params.ParamByName('fase').value := FieldValues['sIdGrupo'];
        connection.zCommand.ExecSQL;
      except
        if not messageDLG('El Id de Material ' + FieldValues['sIdInsumo'] + ' ya Existe, Desea Continuar ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          exit;
        duplico := True;
      end;
      if duplico = False then
      begin
                      //Se actualizan los restantes..
        connection.zCommand.Active := False;
        connection.zCommand.SQL.Clear;
        connection.zCommand.SQL.Add('Update insumos set dPorcentaje =:porciento, dNuevoPrecio =:Precio, dExistencia =:Existencia, sUbicacion =:Ubicacion, dStockMin =:Minino, dStockMax =:Maximo, lAplicaFecha =:Aplica ' +
          'Where sContrato =:Contrato and sIdAlmacen =:Almacen and sIdInsumo =:Insumo ');
        connection.zCommand.Params.ParamByName('contrato').DataType := ftString;
        connection.zCommand.Params.ParamByName('contrato').value := global_contrato;
        connection.zCommand.Params.ParamByName('insumo').DataType := ftString;
        connection.zCommand.Params.ParamByName('insumo').value := FieldValues['sIdInsumo'];
        connection.zCommand.Params.ParamByName('almacen').DataType := ftString;
        connection.zCommand.Params.ParamByName('almacen').value := dbAlmacen.KeyValue;
        connection.zCommand.Params.ParamByName('porciento').DataType := ftFloat;
        if FieldValues['dPorcentaje'] <> null then
          connection.zCommand.Params.ParamByName('porciento').value := FieldValues['dPorcentaje']
        else
          connection.zCommand.Params.ParamByName('porciento').value := 0;
        connection.zCommand.Params.ParamByName('Precio').DataType := ftFloat;
        if FieldValues['dNuevoPrecio'] <> null then
          connection.zCommand.Params.ParamByName('Precio').value := FieldValues['dNuevoPrecio']
        else
          connection.zCommand.Params.ParamByName('Precio').value := 0;
        connection.zCommand.Params.ParamByName('Existencia').DataType := ftFloat;
        if FieldValues['dExistencia'] <> null then
          connection.zCommand.Params.ParamByName('Existencia').value := FieldValues['dExistencia']
        else
          connection.zCommand.Params.ParamByName('Existencia').value := 0;
        connection.zCommand.Params.ParamByName('Ubicacion').DataType := ftString;
        if FieldValues['sUbicacion'] <> null then
          connection.zCommand.Params.ParamByName('Ubicacion').value := FieldValues['sUbicacion']
        else
          connection.zCommand.Params.ParamByName('Ubicacion').value := 0;
        connection.zCommand.Params.ParamByName('Minino').DataType := ftFloat;
        if FieldValues['dStockMin'] <> null then
          connection.zCommand.Params.ParamByName('Minino').value := FieldValues['dStockMin']
        else
          connection.zCommand.Params.ParamByName('Minino').value := 0;
        connection.zCommand.Params.ParamByName('Maximo').DataType := ftFloat;
        if FieldValues['dStockMax'] <> null then
          connection.zCommand.Params.ParamByName('Maximo').value := FieldValues['dStockMax']
        else
          connection.zCommand.Params.ParamByName('Maximo').value := 0;
        connection.zCommand.Params.ParamByName('Aplica').DataType := ftString;
        if FieldValues['lAplicaFecha'] <> null then
          connection.zCommand.Params.ParamByName('Aplica').value := FieldValues['lAplicaFecha']
        else
          connection.zCommand.Params.ParamByName('Aplica').value := 'No';
        connection.zCommand.ExecSQL;

        if dbAlmacen.KeyValue <> null then
          Actual_almacen := dbAlmacen.KeyValue
        else
          Actual_almacen := '';
        Insumos.Active := False;
        Insumos.Params.ParamByName('Contrato').DataType := ftString;
        If Connection.configuracion.fieldValues['sAlmcon'] = 'CONTRATOS' Then
          Insumos.Params.ParamByName('Contrato').Value := global_contrato
        else
          Insumos.Params.ParamByName('Contrato').Value :=-1;
        Insumos.Params.ParamByName('Almacen').Value := Actual_almacen;
        Insumos.Open;
      end;
      filtra;
    end
  end;
end;

procedure TfrmConsumibles.procBuscaPartida(Sender: TObject);
var
  sNumeroPartida: string;
begin
  if zCatalogo.RecordCount > 0 then
  begin
    sNumeroPartida := trim((Sender as tEdit).Text);
    zCatalogo.Locate('sIdInsumo', sNumeroPartida, [loCaseInsensitive])
  end;
end;

procedure TfrmConsumibles.procObtiene(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Sender as tEdit).Text <> '' then
  begin
    try
      Numero := StrToFloat((Sender as tEdit).Text);
    except
      Numero := 0;
    end;
  end;
end;

procedure TfrmConsumibles.procObtieneTexto(Sender: TObject);
begin
  if (Sender as tEdit).Text <> '' then
  begin
    try
      Numero := StrToFloat((Sender as tEdit).Text);
    except
      Numero := 0;
    end;
  end;
end;
//////CALCULOS EN M.N.....

procedure TfrmConsumibles.procCalculaCosto(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dCostoBaseMN'] := Numero;
  zMonto.FieldValues['dPrecioMN'] := Numero + zMonto.FieldValues['dFleteMN'] + zMonto.FieldValues['dDerechosMN'] + zMonto.FieldValues['dMermasMN'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaFlete(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dFleteMN'] := Numero;
  zMonto.FieldValues['dPrecioMN'] := Numero + zMonto.FieldValues['dCostoBaseMN'] + zMonto.FieldValues['dDerechosMN'] + zMonto.FieldValues['dMermasMN'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaDerecho(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dDerechosMN'] := Numero;
  zMonto.FieldValues['dPrecioMN'] := Numero + zMonto.FieldValues['dCostoBaseMN'] + zMonto.FieldValues['dFleteMN'] + zMonto.FieldValues['dMermasMN'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaMerma(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dMermasMN'] := Numero;
  zMonto.FieldValues['dPrecioMN'] := Numero + zMonto.FieldValues['dCostoBaseMN'] + zMonto.FieldValues['dFleteMN'] + zMonto.FieldValues['dDerechosMN'];
  zMonto.Post;
end;

//////CALCULOS EN DLL.....

procedure TfrmConsumibles.procCalculaCostoDLL(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dCostoBaseDLL'] := Numero;
  zMonto.FieldValues['dPrecioDLL'] := Numero + zMonto.FieldValues['dFleteDLL'] + zMonto.FieldValues['dDerechosDLL'] + zMonto.FieldValues['dMermasDLL'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaFleteDLL(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dFleteDLL'] := Numero;
  zMonto.FieldValues['dPrecioDLL'] := Numero + zMonto.FieldValues['dCostoBaseDLL'] + zMonto.FieldValues['dDerechosDLL'] + zMonto.FieldValues['dMermasDLL'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaDerechoDLL(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dDerechosDLL'] := Numero;
  zMonto.FieldValues['dPrecioDLL'] := Numero + zMonto.FieldValues['dCostoBaseDLL'] + zMonto.FieldValues['dFleteDLL'] + zMonto.FieldValues['dMermasDLL'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procCalculaMermaDLL(Sender: TObject);
begin
  zMonto.Edit;
  zMonto.FieldValues['dMermasDLL'] := Numero;
  zMonto.FieldValues['dPrecioDLL'] := Numero + zMonto.FieldValues['dCostoBaseDLL'] + zMonto.FieldValues['dFleteDLL'] + zMonto.FieldValues['dDerechosDLL'];
  zMonto.Post;
end;

procedure TfrmConsumibles.procSuma(Sender: TObject);
begin
  if (Sender as tEdit).Text <> '' then
  begin
    with sender as tEdit do
    begin
      text := zMonto.FieldValues['dPrecioMN'];
    end;
  end;
end;

procedure TfrmConsumibles.procSumaDLL(Sender: TObject);
begin
  if (Sender as tEdit).Text <> '' then
  begin
    with sender as tEdit do
    begin
      text := zMonto.FieldValues['dPrecioDLL'];
    end;
  end;
end;

procedure TfrmConsumibles.procSumaSalir(Sender: TObject);
begin
  connection.zCommand.Active := False;
  connection.zCommand.SQL.Clear;
  connection.zCommand.SQL.Add('Update insumos set dVentaMN =:CostoMN, dVentaDLL =:CostoDLL, dNuevoPrecio =:CostoMN where sContrato =:Contrato and sIdInsumo =:Insumo ');
  connection.zCommand.ParamByName('Contrato').AsString := global_contrato;
  connection.zCommand.ParamByName('Insumo').AsString := zMonto.FieldValues['sIdMaterial'];
  connection.zCommand.ParamByName('CostoMN').AsFloat := zMonto.FieldValues['dPrecioMN'];
  connection.zCommand.ParamByName('CostoDLL').AsFloat := zMonto.FieldValues['dPrecioDLL'];
  connection.zCommand.ExecSQL;

  insumos.Refresh;
end;
///////

procedure TfrmConsumibles.SeguimientodeMAteriales1Click(Sender: TObject);
//var
//  QryCompras,
//    QryRequisiciones: TZReadOnlyQuery;
//  dsCompras,
//    dsRequisiciones: TfrxDBDataSet;
//  tOrigen: TComponent;
begin
  try

    if not frmInteligent.MostrarFormChild('frmMovimientosInsumos') then
    begin
        Application.CreateForm(TfrmMovimientosInsumos, frmMovimientosInsumos);
        frmMovimientosInsumos.show
    end;

  except
    on e: exception do begin
      UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Ventana Principal', 'Al abrir ventana Historico de Movimientos de Partidas Anexo', 0);
    end;
  end;

//  if not FileExists(global_files + global_miReporte + '_seguimiento_material.fr3') then
//  begin
//     showmessage('El archivo de reporte '+global_Mireporte+'_seguimiento_material.fr3 no existe, notifique al administrador del sistema');
//     exit;
//  end;
//
//  QryCompras := TZReadOnlyQuery.Create(tOrigen);
//  QryCompras.Connection := connection.zConnection;
//
//  QryRequisiciones := TZReadOnlyQuery.Create(tOrigen);
//  QryRequisiciones.Connection := connection.zConnection;
//
//  dsCompras := TfrxDBDataSet.Create(tOrigen);
//  dsCompras.DataSet := QryCompras;
//  dsCompras.FieldAliases.Clear;
//  dsCompras.UserName := 'dsCompras';
//
//  dsRequisiciones := TfrxDBDataSet.Create(tOrigen);
//  dsRequisiciones.DataSet := QryRequisiciones;
//  dsRequisiciones.FieldAliases.Clear;
//  dsRequisiciones.UserName := 'dsRequisiciones';
//
//  Imp_Insumos.Active := False;
//  Imp_Insumos.SQL.Clear;
//  Imp_Insumos.SQL.Add('select sIdInsumo, sTipoActividad, mDescripcion, sMedida, dExistencia from insumos where sContrato =:Contrato and sIdInsumo =:Insumo ');
//  Imp_Insumos.Params.ParamByName('Contrato').AsString := global_contrato;
//  Imp_Insumos.Params.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
//  Imp_Insumos.Open;
//
//  QryCompras.Active := False;
//  QryCompras.SQL.Clear;
//  QryCompras.SQL.Add('select pp.mDescripcion, pp.sMedida, pp.dCantidad, pp.sNumeroOrden, p.sOrdenCompra ' +
//    'from anexo_ppedido pp ' +
//    'inner join anexo_pedidos p on (pp.sContrato = p.sContrato and pp.iFolioPedido = p.iFolioPedido) ' +
//    'where pp.sContrato =:Contrato and pp.sIdInsumo =:Insumo');
//  QryCompras.Params.ParamByName('Contrato').AsString := global_contrato;
//  QryCompras.Params.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
//  QryCompras.Open;
//
//  QryRequisiciones.Active := False;
//  QryRequisiciones.SQL.Clear;
//  QryRequisiciones.SQL.Add('select pp.mDescripcion, pp.sMedida, pp.dCantidad, pp.sNumeroOrden, p.iFolioRequisicion, p.sLugarEntrega ' +
//    'from anexo_prequisicion pp ' +
//    'inner join anexo_requisicion p on (pp.sContrato = p.sContrato and pp.iFolioRequisicion = p.iFolioRequisicion) ' +
//    'where pp.sContrato =:Contrato ' +
//    'and pp.sIdInsumo =:Insumo ');
//  QryRequisiciones.Params.ParamByName('Contrato').AsString := global_contrato;
//  QryRequisiciones.Params.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
//  QryRequisiciones.Open;
//
//  frxInsumos.DataSets.Add(dsCompras);
//  frxInsumos.DataSets.Add(dsRequisiciones);
//
//  frxinsumos.PreviewOptions.MDIChild := False;
//  frxinsumos.PreviewOptions.Modal := True;
//  frxinsumos.PreviewOptions.ShowCaptions := False;
//  frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
//  frxinsumos.LoadFromFile(global_files + global_miReporte + '_seguimiento_material.fr3');
//  frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
//
//  QryCompras.Destroy;
//  dsCompras.Destroy;

end;

procedure TfrmConsumibles.SelccionarMateriales1Click(Sender: TObject);
var
  myForm: TForm;
  zDSCatalogo: tDataSource;
  sPaquete: string;
begin
  if dbAlmacen.Text <> '' then
  begin
    if (insumos.State <> dsInsert) or (insumos.State <> dsEdit) then
    begin
      myForm := TForm.Create(Self);
      try
        myForm.Position := poDesktopCenter;
        myForm.Caption := 'C A T A L O G O   M A E S T R O   D E   M A T E R I A L E S';
        MyForm.BorderIcons := [];
        MyForm.Width := 900;
        MyForm.Height := 350;
        MyForm.BorderStyle := bsSizeable;
        MyForm.Color := $00FEC6BA;

        zCatalogo := TZReadOnlyQuery.Create(nil);
        zCatalogo.Connection := connection.zConnection;
        zCatalogo.Active := False;
        zCatalogo.Sql.Clear;
        zCatalogo.Sql.Add('Select sContrato, sIdInsumo, sIdProveedor, sIdAlmacen, sTipoActividad, mDescripcion, dFecha, dFechaInicio,dFechaFinal, ' +
          'dCostoMN, dCostoDLL, dVentaMN, dVentaDLL, sMedida, dCantidad, dInstalado, sIdFase, dPorcentaje, ' +
          'sIdGrupo, dNuevoPrecio, dExistencia, sUbicacion, dStockMax, dStockMin, lAplicaFecha, dFechaCaducidad, ' +
          'SubStr(mDescripcion, 1, 255) as sDescripcion From insumos ' +
          'where sContrato = :contrato and sIdAlmacen = :Almacen Order By sIdInsumo');
        zCatalogo.Params.ParamByName('Contrato').DataType := ftString;
        zCatalogo.Params.ParamByName('Contrato').Value := global_contrato;
        zCatalogo.Params.ParamByName('Almacen').AsString := '';
        zCatalogo.Open;
        zDSCatalogo := tDataSource.Create(nil);
        zDSCatalogo.DataSet := zCatalogo;

        GridCatalogo := TRxDBGrid.Create(MyForm);
        with GridCatalogo do
        begin
          Parent := myForm;
          Visible := True;
          Align := alCustom;
          Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect];
          TitleButtons := True;
          DataSource := zDSCatalogo;
          Width := 900;
          Height := 305;
          Anchors := [akLeft, akTop, akRight, akBottom];
          ParentColor := True;
          Ctl3D := False;

          Columns.Clear;
          Columns.Add;
          Columns[0].FieldName := 'sIdInsumo';
          Columns[0].Width := 100;
          Columns[0].Title.Caption := 'Material';
          Columns[0].ReadOnly := True;
          Columns[0].Font.Style := [fsBold];
          Columns[0].Font.Color := clBlue;
          Columns.Add;
          Columns[1].FieldName := 'sDescripcion';
          Columns[1].Width := 400;
          Columns[1].Title.Caption := 'Descripcion';
          Columns[1].ReadOnly := True;
          Columns[1].Font.Style := [];
          Columns.Add;
          Columns[2].FieldName := 'dFechaInicio';
          Columns[2].Width := 60;
          Columns[2].Title.Caption := 'F. Inicio';
          Columns[2].Font.Style := [];
          Columns.Add;
          Columns[3].FieldName := 'dFechaFinal';
          Columns[3].Width := 60;
          Columns[3].Title.Caption := 'F. Final';
          Columns[3].Font.Style := [];
          Columns.Add;
          Columns[4].FieldName := 'dCantidad';
          Columns[4].Width := 70;
          Columns[4].Title.Caption := 'Cant. a Inst.';
          Columns[4].Title.Alignment := taRightJustify;
          Columns[4].Font.Style := [];
          Columns.Add;
          Columns[5].FieldName := 'sMedida';
          Columns[5].Width := 60;
          Columns[5].Title.Caption := 'U. Medida';
          Columns[5].Title.Alignment := taRightJustify;
          Columns[5].Font.Style := [];
          Columns.Add;
          Columns[6].FieldName := 'dCostoMN';
          Columns[6].Width := 70;
          Columns[6].Title.Caption := '$ Precio MN';
          Columns[6].Title.Alignment := taRightJustify;
          Columns[6].Font.Style := [];
          Columns.Add;
          Columns[7].FieldName := 'dCostoMN';
          Columns[7].Width := 70;
          Columns[7].Title.Caption := '$ Precio DLL';
          Columns[7].Title.Alignment := taRightJustify;
          Columns[7].Font.Style := [];
        end;

        with TButton.Create(Self) do
        begin
          Left := 10;
          Top := 310;
          Width := 120;
          Height := 35;
          Default := True;
          Parent := MyForm;
          Caption := 'Insertar Material';
          OnClick := InsertaActividad;
          Anchors := [akLeft, akBottom];
        end;

        with TButton.Create(Self) do
        begin
          Left := 140;
          Top := 310;
          Width := 120;
          Height := 35;
          ModalResult := mrCancel;
          Cancel := True;
          Parent := MyForm;
          Caption := 'Cancelar Inserccion';
          Anchors := [akLeft, akBottom];
        end;

        with TLabel.Create(Self) do
        begin
          Left := 700;
          Top := 325;
          Width := 120;
          Height := 35;
          Parent := MyForm;
          Caption := 'Buscar ...:';
          Anchors := [akRight, akBottom];
        end;

        with TEdit.Create(Self) do
        begin
          Left := 750;
          Top := 320;
          Width := 130;
          Height := 35;
          Parent := MyForm;
          Anchors := [akRight, akBottom];
          OnChange := procBuscaPartida;
        end;
        myForm.ShowModal;
      finally
        zCatalogo.Destroy;
        zDSCatalogo.Destroy;
        GridCatalogo.Destroy;
        myForm.Free;
      end;
    end
  end
  else
    MessageDLG('Debe seleccionar un Almacen para Continuar!', mtInformation, [mbOk], 0);

end;

procedure TfrmConsumibles.tsNumeroActividaddEnter(Sender: TObject);
begin
  tsNumeroActividad.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsNumeroActividadActividadExit(Sender: TObject);
begin
  tsNumeroActividad.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.tsDescripcionEnter(Sender: TObject);
begin
  tsDescripcion.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsDescripcionExit(Sender: TObject);
begin
  tsDescripcion.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.tsDescripcionInglesEnter(Sender: TObject);
begin
   tsDescripcionIngles.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsDescripcionInglesExit(Sender: TObject);
begin
    tsDescripcionIngles.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.tsdVentaChange(Sender: TObject);
begin
//  tdbeditchangef(tsdVenta, 'Precio MN');
end;

procedure TfrmConsumibles.tsdVentaEnter(Sender: TObject);
begin
  tsdVenta.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsdVentaExit(Sender: TObject);
begin
  if tsdVenta.Text = '' then
    tsdVenta.Text := '0';

  if insumos.State = dsInsert then
    dbNuevoPrecio.Text := tsdVenta.Text;

  tsdVenta.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.frmBarra1btnPrinterClick(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADinsumos.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADinsumos.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add(cadena + ' and i.sIdGrupo =:grupo ' + ' order by i.sIdGrupo, a.sDescripcion, i.sIdinsumo');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Almacen').AsString := Actual_almacen;
    Imp_Insumos.Params.ParamByName('grupo').AsString := grupos.FieldByName('sIdFamilia').AsString;    
    Imp_Insumos.Open;

    filtra2;
    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files +global_Mireporte+ '_CADinsumos.fr3');

    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.tsMedidaEnter(Sender: TObject);
begin
  tsMedida.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsMedidaExit(Sender: TObject);
begin
  tsMedida.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.tsMedidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsdCantidad.SetFocus
end;

procedure TfrmConsumibles.tsMesEnter(Sender: TObject);
begin
  tsmes.color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsMesExit(Sender: TObject);
begin
  tsmes.color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tsMesKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tdcantidadmensual.SetFocus;
end;

procedure TfrmConsumibles.sTipoActividadEnter(Sender: TObject);
begin
  sTipoActividad.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.sTipoActividadExit(Sender: TObject);
var
   lEncuentra : boolean;
begin
  sTipoActividad.Color := global_color_salidaERP;

  lEncuentra := False;
  zqTipoInsumo.First;
  while not zqTipoInsumo.Eof do
  begin
     if sTipoActividad.Text = zqTipoInsumo.FieldByName('sDescripcion').AsString then
     begin
        lEncuentra := True;
        zqTipoInsumo.Last;
     end;
     zqTipoInsumo.Next;
  end;

  if lEncuentra = False  then
  begin
      sTipoActividad.ItemIndex := 0;
  end;

end;

procedure TfrmConsumibles.sTipoActividadKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    tsMedida.SetFocus
end;

procedure TfrmConsumibles.lblFiltrarClick(Sender: TObject);
begin
  if lblFiltrar.Caption = 'Filtrar por Familia/Grupo:' then
  begin
    lblFiltrar.Caption := 'Filtrar por Proveedor:';
    cmbProveedor.Visible := True;
    dbFamilias.Visible := False;
  end
  else
  begin
    lblFiltrar.Caption := 'Filtrar por Familia/Grupo:';
    cmbProveedor.Visible := False;
    dbFamilias.Visible := True;
  end;
end;

procedure TfrmConsumibles.lblFiltrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if lblFiltrar.Caption = 'Filtrar por Familia/Grupo:' then
    lblFiltrar.Hint := 'Haga Clic para Cambiar el Filtro por Proveedor '
  else
    lblFiltrar.Hint := 'Haga Clic para Cambiar el Filtro por Grupo o Familia ';
end;

procedure TfrmConsumibles.MenuItem1Click(Sender: TObject);
begin
  if not FileExists(global_files + global_miReporte + '_CADmaterial_foto.fr3') then
  begin
     showmessage('El archivo de reporte '+global_Mireporte+'_CADmaterial_foto.fr3 no existe, notifique al administrador del sistema');
     exit;
  end;

  if Insumos.RecordCount > 0 then
  begin
    Imp_Insumos.Active := False;
    Imp_Insumos.SQL.Clear;
    Imp_Insumos.SQL.Add('select sIdInsumo, mDescripcion, bImagen, sMedida, dExistencia, dCantidad from insumos ' +
      'where sContrato =:Contrato and sIdInsumo =:Insumo and sIdAlmacen =:Almacen ');
    Imp_Insumos.Params.ParamByName('Contrato').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Contrato').Value := global_contrato;
    Imp_Insumos.Params.ParamByName('Insumo').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Insumo').AsString := insumos.FieldValues['sIdInsumo'];
    Imp_Insumos.Params.ParamByName('Almacen').DataType := ftString;
    Imp_Insumos.Params.ParamByName('Almacen').Value := dbAlmacen.KeyValue;
    Imp_Insumos.Open;

    frxinsumos.PreviewOptions.MDIChild := False;
    frxinsumos.PreviewOptions.Modal := True;
    frxinsumos.PreviewOptions.ShowCaptions := False;
    frxinsumos.Previewoptions.ZoomMode := zmPageWidth;
    frxinsumos.LoadFromFile(global_files + global_MiReporte + '_CADmaterial_foto.fr3');

    frxinsumos.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP));
  end
  else
    messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
end;

procedure TfrmConsumibles.Montos1Click(Sender: TObject);
begin
    ImprimeDistribucion('Monto');
end;

procedure TfrmConsumibles.tsdVentaKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(tsdVenta, key) then
 //   key := #0;
  if key = #13 then
    tsdCosto.SetFocus
end;

procedure TfrmConsumibles.tsdCostoEnter(Sender: TObject);
begin
  tsdCosto.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tsdCostoExit(Sender: TObject);
begin
  if tsdCosto.Text = '' then
    tsdCosto.Text := '0';
  tsdCosto.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.tsdCostoKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(tsdCosto, key) then
 //   key := #0;
  if key = #13 then
    tsdPrecioDLL.SetFocus;
end;

procedure TfrmConsumibles.tsdCantidadEnter(Sender: TObject);
begin
  tsdCantidad.Color := Global_color_entradaERP;
end;

procedure TfrmConsumibles.tsdCantidadExit(Sender: TObject);
begin

  tsdCantidad.Color := Global_color_salidaERP;
end;

procedure TfrmConsumibles.tsdCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not keyFiltroTdbedit(tsdCantidad, key) then
//    key := #0;
  if key = #13 then
    tsdModelo.SetFocus;
end;

function TfrmConsumibles.tablasDependientes(idOrig: string): boolean;
var
  ParamNamesSET, ParamValuesSET, ParamNamesWHERE, ParamValuesWHERE: TStringList;
begin
  result := true;
  ParamNamesSET := TStringList.Create; ParamValuesSET := TStringList.Create; ParamNamesWHERE := TStringList.Create; ParamValuesWHERE := TStringList.Create;
  ParamNamesSET.Add('sIdInsumo'); ParamValuesSET.Add(Insumos.FieldByName('sIdInsumo').AsString);
  ParamNamesWHERE.Add('sContrato'); ParamValuesWHERE.Add(global_contrato);
  ParamNamesWHERE.Add('sIdInsumo'); ParamValuesWHERE.Add(idOrig);
  if not UnitTablasImpactadas.impactar('insumos', ParamNamesSET, ParamValuesSET, ParamNamesWHERE, ParamValuesWHERE) then
  begin
    result := false;
    showmessage('Ocurrio un error al actualizar las tablas dependientes: ' + UnitTablasImpactadas.xError);
  end
  else begin
    ParamNamesSET.Clear; ParamValuesSET.Clear; ParamNamesWHERE.Clear; ParamValuesWHERE.Clear;
    ParamNamesSET.Add('sIdMaterial'); ParamValuesSET.Add(Insumos.FieldByName('sIdInsumo').AsString);
    ParamNamesWHERE.Add('sContrato'); ParamValuesWHERE.Add(global_contrato);
    ParamNamesWHERE.Add('sIdMaterial'); ParamValuesWHERE.Add(idOrig);
    if not UnitTablasImpactadas.impactar('insumos1', ParamNamesSET, ParamValuesSET, ParamNamesWHERE, ParamValuesWHERE) then
    begin
      result := false;
      showmessage('Ocurrio un error al actualizar las tablas dependientes: ' + UnitTablasImpactadas.xError);
    end;
  end;
end;

function TfrmConsumibles.posibleBorrar(idOrig: string): boolean;
var
  ParamNamesWHERE, ParamValuesWHERE: TStringList;
begin
  result := true;
  ParamNamesWHERE := TStringList.Create; ParamValuesWHERE := TStringList.Create;
  ParamNamesWHERE.Add('sContrato'); ParamValuesWHERE.Add(global_contrato);
  ParamNamesWHERE.Add('sIdInsumo'); ParamValuesWHERE.Add(idOrig);
  result := not UnitTablasImpactadas.hayDependientes('insumos', ParamNamesWHERE, ParamValuesWHERE);
  if result then
  begin
    ParamNamesWHERE.Clear; ParamValuesWHERE.Clear;
    ParamNamesWHERE.Add('sContrato'); ParamValuesWHERE.Add(global_contrato);
    ParamNamesWHERE.Add('sIdMaterial'); ParamValuesWHERE.Add(idOrig);
    result := not UnitTablasImpactadas.hayDependientes('insumos1', ParamNamesWHERE, ParamValuesWHERE);
  end;
end;

procedure TfrmConsumibles.tdCantidadMensualChange(Sender: TObject);
begin
  TCurrenciEditChangef(tdCantidadMensual, 'Cantidad Mensual');
end;

procedure TfrmConsumibles.tdCantidadMensualEnter(Sender: TObject);
begin
  tdcantidadmensual.color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tdCantidadMensualExit(Sender: TObject);
begin
  tdcantidadmensual.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tdCantidadMensualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    btndistribuir.SetFocus;
end;

procedure TfrmConsumibles.tdFechaEnter(Sender: TObject);
begin
  tdFecha.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tdFechaExit(Sender: TObject);
begin
  tdFecha.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tdFechaFinalChange(Sender: TObject);
begin
//  tdFechaFinal.MinDate:=tdFechainicio.Date;
end;

procedure TfrmConsumibles.tdFechaFinalEnter(Sender: TObject);
begin
  tdFechaFinal.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tdFechaFinalExit(Sender: TObject);
begin
  tdFechaFinal.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tdFechaFinalKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dbGrupos.SetFocus;
end;

procedure TfrmConsumibles.tdFechaInicioChange(Sender: TObject);
begin
  if tdFechaFinal.Date < tdFechaInicio.Date then
    tdFechaFinal.Date := tdFechainicio.Date;
end;

procedure TfrmConsumibles.tdFechaInicioEnter(Sender: TObject);
begin
  tdFechaInicio.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tdFechaInicioExit(Sender: TObject);
begin
  tdFechaInicio.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tdFechaInicioKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    tdFechaFinal.SetFocus;
end;

procedure TfrmConsumibles.tdFechaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 then
    tdFechaInicio.SetFocus;
end;

procedure TfrmConsumibles.tiAnnoBottomClick(Sender: TObject);
begin
  if TRxSpinEdit(Sender).Text = '-' then
    TRxSpinEdit(Sender).Text := '';
end;

procedure TfrmConsumibles.tiAnnoEnter(Sender: TObject);
begin
  tianno.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.tiAnnoExit(Sender: TObject);
begin
  tianno.color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tiAnnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsmes.SetFocus;
end;

procedure TfrmConsumibles.tsdPrecioDLLKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not keyFiltroTdbedit(tsdPrecioDLL, key) then
 //   key := #0;
  if key = #13 then
    tsdPrecioMN.SetFocus;
end;

procedure TfrmConsumibles.tsdPrecioMNChange(Sender: TObject);
begin
//  tdbeditchangef(tsdPrecioMN, 'CostoDLL');
end;

procedure TfrmConsumibles.tsdPrecioMNEnter(Sender: TObject);
begin
  tsdPrecioMN.Color := Global_Color_entradaERP;
end;

procedure TfrmConsumibles.tsdPrecioMNExit(Sender: TObject);
begin
  if tsdPrecioMN.Text = '' then
    tsdPrecioMN.Text := '0';
  tsdPrecioMN.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tsdPrecioMNKeyPress(Sender: TObject; var Key: Char);
begin
//  if not keyFiltroTdbedit(tsdPrecioMN, key) then
 //   key := #0;
  if key = #13 then
    tdFecha.SetFocus;
end;

procedure TfrmConsumibles.tsdTallaEnter(Sender: TObject);
begin
  tsdTalla.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tsdTallaExit(Sender: TObject);
begin
    tsdTalla.Color := global_color_salidaERP;
end;

procedure TfrmConsumibles.tsdTallaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsdVenta.SetFocus;
end;

procedure TfrmConsumibles.tsdModeloEnter(Sender: TObject);
begin
    tsdModelo.Color := global_color_entradaERP;
end;

procedure TfrmConsumibles.tsdModeloExit(Sender: TObject);
begin
    tsdModelo.Color := global_color_salidaERP; 
end;

procedure TfrmConsumibles.tsdModeloKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    tsdTalla.SetFocus;
end;

procedure TfrmConsumibles.tsdPrecioDLLChange(Sender: TObject);
begin
//  tdbeditchangef(tsdPrecioDLL, 'Precio DLL');
end;

procedure TfrmConsumibles.tsdPrecioDLLEnter(Sender: TObject);
begin
  tsdPrecioDLL.Color := Global_Color_entradaERP;
end;

procedure TfrmConsumibles.tsdPrecioDLLExit(Sender: TObject);
begin
  if tsdPrecioDLL.Text = '' then
    tsdPrecioDLL.Text := '0';
  tsdPrecioDLL.Color := Global_Color_SalidaERP;
end;



procedure TfrmConsumibles.insumosBeforePost(DataSet: TDataSet);
begin
  if (insumos.FieldValues['sIdInsumo'] = Null) then
    abort

end;

procedure TfrmConsumibles.insumosCalcFields(DataSet: TDataSet);
begin
  insumos.Fieldbyname('sEstado').AsString := 'Normal';
  if insumos.FieldValues['dExistencia'] <= insumos.FieldValues['dStockMin'] then
    insumos.Fieldbyname('sEstado').AsString := 'Minimo';

  if (insumos.FieldValues['dExistencia'] >= insumos.FieldValues['dStockMax']) and (insumos.FieldValues['dStockMax'] > 0) then
    insumos.fieldbyname('sEstado').ASString := 'Maximo';
end;

procedure TfrmConsumibles.insumosdCantidadSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdCostoDllSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdCostoMNSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdExistenciaSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdInstaladoSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdNuevoPrecioSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdPorcentajeSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdStockMaxSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdStockMinSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdVentaDLLSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.insumosdVentaMNSetText(Sender: TField;
  const Text: string);
begin
  sender.Value := abs(StrToFloatDef(text, 0));
end;

procedure TfrmConsumibles.mUbicacionEnter(Sender: TObject);
begin
  mUbicacion.Color := global_color_entradaERP
end;

procedure TfrmConsumibles.mUbicacionExit(Sender: TObject);
begin
  mUbicacion.Color := global_color_salidaERP
end;

procedure TfrmConsumibles.mUbicacionKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    dstokmax.SetFocus;
end;

procedure TfrmConsumibles.PreciosAfterInsert(DataSet: TDataSet);
begin
  if insumos.RecordCount > 0 then
  begin
    precios.FieldValues['sContrato'] := global_contrato;
    precios.FieldValues['sNumeroActividad'] := insumos.FieldValues['sIdInsumo'];
    precios.FieldValues['sIdGrupo'] := insumos.FieldValues['sIdGrupo'];
  end
  else
    insumos.Cancel
end;


procedure TfrmConsumibles.FormKeyPress(Sender: TObject; var Key: Char);
begin
 {Manejador del evento OnKeyPress del Form }
{ También hay que establecer la propiedad KeyPreview del Form a True }
  begin
    if Key = #13 then { si es la tecla <enter> }
      if not (ActiveControl is TDBGrid) then { si no es un TDBGrid }
      begin
        Key := #0; { nos comemos la tecla }
        Perform(WM_NEXTDLGCTL, 0, 0); { vamos al siguiente control }
      end
      else
        if (ActiveControl is TrxDBGrid) then { si es un TrxDBGrid }
          Key := #0 { nos comemos la tecla }
        else
          if (ActiveControl is TDBGrid) then { si es un TDBGrid }
            with TDBGrid(ActiveControl) do
              if selectedindex < (fieldcount - 1) then
                selectedindex := selectedindex + 1
              else
                selectedindex := 0;
  end;


end;

procedure TfrmConsumibles.PreciosCalcFields(DataSet: TDataSet);
begin
  if not insumos.FieldByName('sIdInsumo').IsNull then
  begin
    connection.qryBusca2.Active := False;
    connection.qryBusca2.SQL.Clear;
    connection.qryBusca2.SQL.Add('select mDescripcion from insumos where sIdInsumo = :inventario');
    connection.qryBusca2.Params.ParamByName('inventario').DataType := ftString;
    connection.qryBusca2.Params.ParamByName('inventario').Value := insumos.FieldValues['sIdInsumo'];
    connection.qryBusca2.Open;
    if connection.qryBusca2.RecordCount > 0 then
      preciossDescripcion.Text := connection.qryBusca2.FieldValues['mDescripcion'];
  end
end;

//soad -> Funcion para actualizar los registros con Id de Material especificado..
//*************************************************************************

procedure TfrmConsumibles.btnExaminarClick(Sender: TObject);
var
  size: Real;
begin
  sOpcion := 'New';
  bImagen.Picture.Bitmap := nil;
  btnPreview.Enabled := False;
  btnExaminar.Enabled := False;
  OpenPicture.Title := 'Inserta Imagen';
  sArchivo := '';
  if OpenPicture.Execute then
  begin
    try
      sArchivo := RedimensionarJPG(OpenPicture.FileName);
      
      size := Tamanyo(sArchivo);
      if size <= 350 then
        bImagen.Picture.LoadFromFile(OpenPicture.FileName)
      else
        MessageDlg('La imagen a adjuntar no debe ser mayor a 350 kb.', mtInformation, [mbOk], 0);
    except
      bImagen.Picture.LoadFromFile('');
    end
  end  ;
  btnExaminar.Enabled := True;
end;

procedure TfrmConsumibles.btnPreviewClick(Sender: TObject);
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
  bMostrar: boolean;
begin
  bMostrar := False;
  Connection.QryBusca.Active := False;
  Connection.QryBusca.SQL.Clear;
  Connection.QryBusca.SQL.Add('Select bImagen from insumos Where sContrato = :Contrato And sIdInsumo = :Insumo and sIdAlmacen = :almacen');
  Connection.QryBusca.Params.ParamByName('Contrato').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('Contrato').Value := global_contrato;
  Connection.QryBusca.Params.ParamByName('Insumo').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('Insumo').Value := insumos.FieldValues['sIdInsumo'];
  Connection.QryBusca.Params.ParamByName('almacen').DataType := ftString;
  Connection.QryBusca.Params.ParamByName('almacen').Value := insumos.FieldValues['sIdAlmacen'];
  Connection.QryBusca.Open;

  if Connection.QryBusca.RecordCount > 0 then
  begin
    bImagen.Picture.Bitmap := nil;
    BlobField := Connection.QryBusca.FieldByName('bImagen');
    BS := Connection.QryBusca.CreateBlobStream(BlobField, bmRead);
    if bs.Size > 15 then
    begin
      try
        Pic := TJpegImage.Create;
        try
          Pic.LoadFromStream(bS);
          bImagen.Picture.Graphic := Pic;
        finally
          Pic.Free;
        end;
      finally
        bS.Free
      end;
      bImagenDefault := True;
    end
    else
      bMostrar := True;
  end
  else
    bMostrar := True;

  if bMostrar = True then
  begin
    muestraImagen;
    bImagenDefault := False;
  end;

  bImagenDefault := True;
end;

procedure TfrmConsumibles.BuscaMaterial(Id: string; accion: string);
var
  base, tabla, campo, cad: string;
  datos: array[1..50] of string;
  i, x: Integer;
begin
  connection.qryBusca.Active := False;
  connection.qryBusca.SQL.Clear;
  connection.qryBusca.SQL.Add('Show tables');
  connection.qryBusca.Open;
  base := 'Tables_in_' + global_db;
  i := 1;
  while not connection.QryBusca.Eof do
  begin
    tabla := connection.QryBusca.FieldValues[base];
    connection.qryBusca2.Active := False;
    connection.qryBusca2.SQL.Clear;
    connection.qryBusca2.SQL.Add('describe ' + tabla + ' ');
    connection.qryBusca2.Open;

    if connection.QryBusca2.RecordCount > 0 then
    begin
      while not connection.QryBusca2.Eof do
      begin
        if connection.QryBusca2.FieldValues['Field'] = 'sIdMaterial' then
        begin
          datos[i] := tabla;
          i := i + 1;
        end;
        connection.QryBusca2.Next;
      end;
    end;
    connection.QryBusca.Next;
  end;

     // Actualiza todos los registros..
  if accion = 'actualizar' then
  begin
    for x := 1 to i - 1 do
    begin
        tabla := datos[x];
        if (tabla = 'bitacorademateriales') then
        begin
            connection.qryBusca.Active := False;
            connection.qryBusca.SQL.Clear;
            connection.qryBusca.SQL.Add('update ' + tabla + ' set sIdMaterial = :Nuevo, sMedida =:Medida, sDescripcion =:Descripcion where sContrato = :Contrato and sIdMaterial =:IdMaterial ');
            connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
            connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Nuevo').Value := insumo_agregado;
            connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
            connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
            connection.qryBusca.Params.ParamByName('Medida').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Medida').Value    := tsMedida.Text;
            connection.qryBusca.Params.ParamByName('Descripcion').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Descripcion').Value    := tsDescripcion.Text;
            connection.qryBusca.ExecSQL;
        end
        else
        begin
            connection.qryBusca.Active := False;
            connection.qryBusca.SQL.Clear;
            connection.qryBusca.SQL.Add('update ' + tabla + ' set sIdMaterial = :Nuevo where sContrato = :Contrato and sIdMaterial =:IdMaterial ');
            connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
            connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
            connection.qryBusca.Params.ParamByName('Nuevo').Value := insumo_agregado;
            connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
            connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
            connection.qryBusca.ExecSQL;
        end;

    end;
  end;
 // messageDLG('Proceso Terminado con Exito', mtInformation, [mbOk], 0);
end;


procedure TfrmConsumibles.BuscaInsumo(Id: string; accion: string);
var
  base, tabla, campo, cad: string;
  datos: array[1..50] of string;
  i, x: Integer;
begin
  connection.qryBusca.Active := False;
  connection.qryBusca.SQL.Clear;
  connection.qryBusca.SQL.Add('Show tables');
  connection.qryBusca.Open;
  base := 'Tables_in_' + global_db;
  i := 1;
  while not connection.QryBusca.Eof do
  begin
    tabla := connection.QryBusca.FieldValues[base];
    connection.qryBusca2.Active := False;
    connection.qryBusca2.SQL.Clear;
    connection.qryBusca2.SQL.Add('describe ' + tabla + ' ');
    connection.qryBusca2.Open;

    if connection.QryBusca2.RecordCount > 0 then
    begin
      while not connection.QryBusca2.Eof do
      begin
        if uppercase(connection.QryBusca2.FieldValues['Field']) = 'SIDINSUMO' then
        begin
          datos[i] := tabla;
          i := i + 1;
        end;
        connection.QryBusca2.Next;
      end;
    end;
    connection.QryBusca.Next;
  end;

  // Actualiza todos los registros..
  if accion = 'actualizar' then
  begin
    for x := 1 to i - 1 do
    begin
      tabla := datos[x];
      if (tabla = 'calidad_material') or (tabla = 'alm_recepciondemateriales_detalle')
         or (tabla = 'devolucioninsumos') or (tabla = 'empleado_insumo') or (tabla = 'alm_cotizacion_detalle') then
      begin
        connection.qryBusca.Active := False;
        connection.qryBusca.SQL.Clear;
        connection.qryBusca.SQL.Add('update ' + tabla + ' set sIdInsumo = :Nuevo where sIdInsumo =:IdMaterial ');
        connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
        connection.qryBusca.Params.ParamByName('Nuevo').Value := insumo_agregado;
        connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
        connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
        connection.qryBusca.ExecSQL;
      end
      else
      begin
           if (tabla = 'anexo_ppedido') or (tabla = 'anexo_prequisicion') then
           begin
               connection.qryBusca.Active := False;
               connection.qryBusca.SQL.Clear;
               connection.qryBusca.SQL.Add('update ' + tabla + ' set sIdInsumo = :Nuevo, sMedida =:Medida, mDescripcion =:descripcion where sContrato = :Contrato and sIdInsumo =:IdMaterial ');
               connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
               connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
               connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
               connection.qryBusca.Params.ParamByName('Nuevo').Value :=insumo_agregado;
               connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
               connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
               connection.qryBusca.Params.ParamByName('Medida').DataType := ftString;
               connection.qryBusca.Params.ParamByName('Medida').Value := tsMedida.Text;
               connection.qryBusca.Params.ParamByName('Descripcion').DataType := ftMemo;
               connection.qryBusca.Params.ParamByName('Descripcion').Value := tsDescripcion.Text;
               connection.qryBusca.ExecSQL;
           end
           else
           begin
               connection.qryBusca.Active := False;
               connection.qryBusca.SQL.Clear;
               connection.qryBusca.SQL.Add('update ' + tabla + ' set sIdInsumo = :Nuevo where sContrato = :Contrato and sIdInsumo =:IdMaterial ');
               connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
               connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
               connection.qryBusca.Params.ParamByName('Nuevo').DataType := ftString;
               connection.qryBusca.Params.ParamByName('Nuevo').Value := insumo_agregado;
               connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
               connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
               connection.qryBusca.ExecSQL;
           end;
      end;
    end;
  end;
  messageDLG('Proceso Terminado con Exito', mtInformation, [mbOk], 0);
end;

//soad -> Funcion para buscar materiales existentes en otras tablas antes de eliminarlos..
//*************************************************************************

procedure TfrmConsumibles.BuscaMateriales(Id: string);
var
  base, tabla, campo, cad: string;
  datos: array[1..50] of string;
  i, x: Integer;
begin
  connection.qryBusca.Active := False;
  connection.qryBusca.SQL.Clear;
  connection.qryBusca.SQL.Add('Show tables');
  connection.qryBusca.Open;
  base := 'Tables_in_' + global_db;
  i := 1;
  while not connection.QryBusca.Eof do
  begin
    tabla := connection.QryBusca.FieldValues[base];
    connection.qryBusca2.Active := False;
    connection.qryBusca2.SQL.Clear;
    connection.qryBusca2.SQL.Add('describe ' + tabla + ' ');
    connection.qryBusca2.Open;

    if connection.QryBusca2.RecordCount > 0 then
    begin
      while not connection.QryBusca2.Eof do
      begin
        if connection.QryBusca2.FieldValues['Field'] = 'sIdMaterial' then
        begin
          datos[i] := tabla;
          i := i + 1;
        end;
        connection.QryBusca2.Next;
      end;
    end;
    connection.QryBusca.Next;
  end;
  Encuentra := False;

     // Busca todos los registros..
  for x := 1 to i - 1 do
  begin
    tabla := datos[x];
    if tabla = 'calidad_material' then
    begin
      connection.qryBusca.Active := False;
      connection.qryBusca.SQL.Clear;
      connection.qryBusca.SQL.Add('select sIdMaterial from ' + tabla + ' where sIdMaterial =:IdMaterial ');
      connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
      connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
      connection.qryBusca.Open;
      if connection.QryBusca.RecordCount > 0 then
        Encuentra := True;
    end
    else
    begin
      connection.qryBusca.Active := False;
      connection.qryBusca.SQL.Clear;
      connection.qryBusca.SQL.Add('select sIdMaterial from ' + tabla + ' where sContrato = :Contrato and sIdMaterial =:IdMaterial ');
      connection.qryBusca.Params.ParamByName('Contrato').DataType := ftString;
      connection.qryBusca.Params.ParamByName('Contrato').Value := global_contrato;
      connection.qryBusca.Params.ParamByName('IdMaterial').DataType := ftString;
      connection.qryBusca.Params.ParamByName('IdMaterial').Value := Id;
      connection.qryBusca.Open;
      if connection.QryBusca.RecordCount > 0 then
        Encuentra := True;
    end;
  end;
end;

procedure TfrmConsumibles.formatoEncabezado;
begin
  Excel.Selection.MergeCells := False;
  Excel.Selection.HorizontalAlignment := xlCenter;
  Excel.Selection.VerticalAlignment := xlCenter;
  Excel.Selection.Font.Size := 12;
  Excel.Selection.Font.Bold := False;
  Excel.Selection.Font.Name := 'Calibri';
end;

procedure TfrmConsumibles.cargaImagen;
begin
  if sArchivo <> '' then
  begin
    connection.zCommand.Active := False;
    connection.zCommand.SQL.Clear;
    connection.zcommand.SQL.Add('Update insumos SET bImagen = :Imagen ' +
      'Where sContrato = :Contrato and sIdInsumo =:Insumo And sIdAlmacen =:almacen ');
    connection.zcommand.Params.ParamByName('Contrato').DataType := ftString;
    connection.zcommand.Params.ParamByName('Contrato').Value := Global_Contrato;
    connection.zcommand.Params.ParamByName('Insumo').DataType := ftString;
    connection.zcommand.Params.ParamByName('Insumo').Value := insumo_agregado;
    connection.zcommand.Params.ParamByName('Imagen').LoadFromFile(sArchivo, ftGraphic);
    connection.zcommand.Params.ParamByName('almacen').DataType := ftString;
    connection.zcommand.Params.ParamByName('almacen').Value := dbAlmacen.keyvalue;
    connection.zCommand.ExecSQL();
  end;

end;

procedure TfrmConsumibles.muestraImagen;
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
begin
  bImagen.Picture.Bitmap := nil;
  BlobField := connection.configuracion.FieldByName('bImagen');
  BS := connection.Configuracion.CreateBlobStream(BlobField, bmRead);
  if bs.Size > 15 then
  begin
    try
      Pic := TJpegImage.Create;
      try
        Pic.LoadFromStream(bS);
        bImagen.Picture.Graphic := Pic;
      finally
        Pic.Free;
      end;
    finally
      bS.Free
    end
  end;
end;

procedure TfrmConsumibles.Paste1Click(Sender: TObject);
begin
Modificarportapapeles(self.activecontrol , ftpegar)
end;

procedure TfrmConsumibles.cargar_tipo;
begin
  sTipoActividad.Items.Clear;
  zqTipoInsumo.Active:=False;
  zqTipoInsumo.Open;

  while not zqTipoInsumo.Eof do
  begin
    sTipoActividad.Items.Add(zqTipoInsumo.FieldByName('sDescripcion').AsString);
    zqTipoInsumo.Next;
  end;
end;

procedure TfrmConsumibles.ImprimeDistribucion(sParamTipo: string);
begin
   If insumos.RecordCount > 0 Then
   begin
        AnexoDMA.Active := False;
        AnexoDMA.Params.ParamByName('Contrato').DataType := ftString;
        AnexoDMA.Params.ParamByName('Contrato').Value := global_Contrato;
        AnexoDMA.Params.ParamByName('almacen').DataType := ftString;
        AnexoDMA.Params.ParamByName('almacen').Value := almacen.FieldValues['sIdAlmacen'];
        AnexoDMA.Open;

        if AnexoDMA.RecordCount > 0 then
        begin
          frxAnexoDMA.PreviewOptions.MDIChild := False ;
          frxAnexoDMA.PreviewOptions.Modal := True ;
          frxAnexoDMA.PreviewOptions.ShowCaptions := False ;
          frxAnexoDMA.Previewoptions.ZoomMode := zmPageWidth ;

          if sParamTipo = 'Cantidad' then
          begin
              frxAnexoDMA.LoadFromFile(Global_Files+ global_miReporte + '_DmoMateriales.fr3') ;
              if not FileExists(global_files + global_miReporte + '_DmoMateriales.fr3') Then
                 showmessage('El archivo de reporte ' + global_files + global_Mireporte+'_DmoMateriales.fr3 no existe, notifique al administrador del sistema')
              else
                 frxAnexoDMA.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP)) ;
          end;

          if sParamTipo = 'Monto' then
          begin
              frxAnexoDMA.LoadFromFile(Global_Files+ global_miReporte + '_DmoMaterialesMonto.fr3') ;
              if not FileExists(global_files + global_miReporte + '_DmoMaterialesMonto.fr3') Then
                 showmessage('El archivo de reporte ' + global_files + global_Mireporte+'_DmoMaterialesMonto.fr3 no existe, notifique al administrador del sistema')
              else
                 frxAnexoDMA.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP)) ;
          end;
       end
       else
          messageDLG('No se encontro informacion a Imprimir', mtInformation, [mbOk], 0);
   end
   else
       ShowMessage('No existen registros para Generar la Distribucion Mensual de Material');
end;



procedure TfrmConsumibles.llenarCampos();
  Var
     n, val1, val2: Currency;
     bS: TStream;
     Pic: TJpegImage;
     BlobField: tField;
begin

    val1 := insumos.FieldByName('dCostoMN').AsCurrency;
    if insumos.FieldByName('dNuevoPrecio').IsNull then
      val2 := 0
    else
      val2 := insumos.FieldByName('dNuevoPrecio').AsCurrency;
    n := val2 - val1;

    if frmBarra1.btnCancel.Enabled = False then
    begin
      sTipoActividad.Text:=Insumos.FieldByName('sTipoActividad').AsString;

      DistribuciondeMaterial.Active := False;
      DistribuciondeMaterial.Params.ParamByName('Contrato').DataType := ftString;
      DistribuciondeMaterial.Params.ParamByName('Contrato').Value := global_contrato;
      DistribuciondeMaterial.Params.ParamByName('Material').DataType := ftString;
      DistribuciondeMaterial.Params.ParamByName('Material').Value := Insumos.FieldValues['sIdInsumo'];
      DistribuciondeMaterial.Open;
    end;

end;
end.


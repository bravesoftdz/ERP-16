unit frm_ImprimeContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, frm_ConfiguracionRH,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  AdvGlowButton, frxClass, Global, DateUtils, Utilerias, masUtilerias, frxDBSet,
  StdCtrls, frm_connection, UDbGrid, frm_barra, Mask, rxToolEdit, RXDBCtrl,
  DBCtrls, ExtCtrls, ExtDlgs, RxMemDS, DBClient, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles,  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FormAutoScaler, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, frm_estimaciones, Math, Func_Genericas,
  frxExportPDF;

type
  TfrmImprimeContratos = class(TForm)
    dszQEmpleados: TDataSource;
    frxContratos: TfrxReport;
    frx_ReporteEmpleados: TfrxDBDataset;
    zqEmpresa: TZQuery;
    zqEmpresasNombre: TStringField;
    zqEmpresasNombreCorto: TStringField;
    zqEmpresasRfc: TStringField;
    zqEmpresasDireccion1: TStringField;
    zqEmpresasDireccion2: TStringField;
    zqEmpresasDireccion3: TStringField;
    zqEmpresasSlogan: TStringField;
    zqEmpresasPiePagina: TStringField;
    zqEmpresabImagen: TBlobField;
    zqEmpresasTelefono: TStringField;
    zqEmpresasFax: TStringField;
    zqEmpresasEmail: TStringField;
    zqEmpresasWeb: TStringField;
    zqEmpresasRepresentante: TStringField;
    zqEmpresasFirmante2: TStringField;
    zqEmpresasFirmante3: TStringField;
    frxDBDEmpresa: TfrxDBDataset;
    zqEmpresasCiudad: TStringField;
    zqHistorial: TZQuery;
    ds_historialcontrato: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    frmBarra4: TfrmBarra;
    Panel5: TPanel;
    btnImprimeContratoTierra: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    PanelFiltro: TGroupBox;
    Splitter1: TSplitter;
    frxReglamentosPlataforma: TfrxReport;
    AdvGlowButton2: TAdvGlowButton;
    qryFlEstatus: TZReadOnlyQuery;
    StringField1: TStringField;
    qryFlEstatusiIdEstatus: TLargeintField;
    ds_flEstatus: TDataSource;
    frxDBHistorialContrato: TfrxDBDataset;
    OpenPictureDialog1: TOpenPictureDialog;
    zQEmpleados: TZQuery;
    zQEmpleadosIdPersonal: TIntegerField;
    zQEmpleadossIdEmpleado: TStringField;
    d: TIntegerField;
    zQEmpleadossNombreCompleto: TStringField;
    zQEmpleadossRfc: TStringField;
    zQEmpleadossCiudad: TStringField;
    zQEmpleadossTelefono: TStringField;
    zQEmpleadosseMail: TStringField;
    zQEmpleadosdSueldo: TFloatField;
    zQEmpleadossCuenta: TStringField;
    zQEmpleadossCuentaInterbancaria: TStringField;
    zQEmpleadossCurp: TStringField;
    zQEmpleadossImss: TStringField;
    zQEmpleadossEstadoCivil: TStringField;
    zQEmpleadosdFechaNacimiento: TDateField;
    zQEmpleadosiId_Puesto: TIntegerField;
    zQEmpleadossLibretaMar: TStringField;
    zQEmpleadossCartilla: TStringField;
    zQEmpleadossCedulaProfesional: TStringField;
    zQEmpleadossLugarNacimiento: TStringField;
    zQEmpleadossTipoSangre: TStringField;
    zQEmpleadoslImprimeNomina: TStringField;
    zQEmpleadoslSexo: TStringField;
    zQEmpleadosiIdhorario: TIntegerField;
    zQEmpleadosidorganizacion: TIntegerField;
    zQEmpleadossCP: TStringField;
    zQEmpleadossApellidoPaterno: TStringField;
    zQEmpleadossApellidoMaterno: TStringField;
    zQEmpleadossNoCreditoInfonavit: TStringField;
    zQEmpleadosiIdProfesiones: TIntegerField;
    zQEmpleadosid_entidadeseducativas: TIntegerField;
    zQEmpleadossTelefonoCelular: TStringField;
    zQEmpleadossNombre_Emergencia: TStringField;
    zQEmpleadossParentesco_Emergencia: TStringField;
    zQEmpleadossNumero_Emergencia: TStringField;
    zQEmpleadosiIdRegistroPatronal: TIntegerField;
    zQEmpleadosiIdPeriodo: TIntegerField;
    zQEmpleadosiIdDiasdescanso: TIntegerField;
    zQEmpleadosprofesion: TStringField;
    qryEmpleados: TZReadOnlyQuery;
    qryEmpleadosIdPersonal: TIntegerField;
    qryEmpleadossIdEmpleado: TStringField;
    qryEmpleadosiIdEstatus: TIntegerField;
    qryEmpleadossNombreCompleto: TStringField;
    qryEmpleadossRfc: TStringField;
    qryEmpleadossCiudad: TStringField;
    qryEmpleadossTelefono: TStringField;
    qryEmpleadosseMail: TStringField;
    qryEmpleadosdSueldo: TFloatField;
    qryEmpleadossCuenta: TStringField;
    qryEmpleadossCuentaInterbancaria: TStringField;
    qryEmpleadossCurp: TStringField;
    qryEmpleadossImss: TStringField;
    qryEmpleadossEstadoCivil: TStringField;
    qryEmpleadosdFechaNacimiento: TDateField;
    qryEmpleadosiId_Puesto: TIntegerField;
    qryEmpleadossLibretaMar: TStringField;
    qryEmpleadossCartilla: TStringField;
    qryEmpleadossCedulaProfesional: TStringField;
    qryEmpleadossLugarNacimiento: TStringField;
    qryEmpleadossTipoSangre: TStringField;
    qryEmpleadoslImprimeNomina: TStringField;
    qryEmpleadoslSexo: TStringField;
    qryEmpleadosiIdhorario: TIntegerField;
    qryEmpleadossStatus: TStringField;
    qryEmpleadosidorganizacion: TIntegerField;
    qryEmpleadosiIdEstatusDiario: TIntegerField;
    qryEmpleadossCP: TStringField;
    qryEmpleadossApellidoPaterno: TStringField;
    qryEmpleadossApellidoMaterno: TStringField;
    qryEmpleadossNoCreditoInfonavit: TStringField;
    qryEmpleadosiIdProfesiones: TIntegerField;
    qryEmpleadosid_entidadeseducativas: TIntegerField;
    qryEmpleadossTelefonoCelular: TStringField;
    qryEmpleadossNombre_Emergencia: TStringField;
    qryEmpleadossParentesco_Emergencia: TStringField;
    frx_zqEmpleados: TfrxDBDataset;
    rxNomina: TRxMemoryData;
    frxNomina: TfrxDBDataset;
    rxNominaSueldo: TFloatField;
    rxNominaPrimaDom: TFloatField;
    rxNominaDiaFestivo: TFloatField;
    rxNominaVacaciones: TFloatField;
    rxNominaPrimaVac: TFloatField;
    rxNominaAguinaldo: TFloatField;
    rxNominaDeducciones: TFloatField;
    rxNominaNeto: TFloatField;
    ds_Guardias: TDataSource;
    zq_Guardias: TZQuery;
    zq_GuardiasiIdGuardia: TIntegerField;
    zq_GuardiassIdFolio: TStringField;
    zq_GuardiassObservaciones: TStringField;
    zq_GuardiasdFechaInicial: TDateField;
    zq_GuardiasdFechaFinal: TDateField;
    AdvImpF: TAdvGlowButton;
    zQEmpleadossStatusTipoPersonal: TStringField;
    zQEmpleadossStatusPersonal: TStringField;
    frxdbdsEmpleado: TfrxDBDataset;
    zqryEmpleados: TZQuery;
    zqryEmpleadosiIdGuardiaMovtos: TIntegerField;
    zqryEmpleadosiIdGuardia: TIntegerField;
    zqryEmpleadossIdEmpleado: TStringField;
    zqryEmpleadosdFechaSubida: TDateField;
    zqryEmpleadosdFechaBajada: TDateField;
    zqryEmpleadossObservaciones: TStringField;
    zqryEmpleadossIdPlataforma: TStringField;
    zqryEmpleadossNumeroOrden: TStringField;
    zqryEmpleadossIdPernocta: TStringField;
    zqryEmpleadossContrato: TStringField;
    zqryEmpleadossStatus: TStringField;
    zqryEmpleadossComentario: TStringField;
    zqryEmpleadosID_GuardiaPeriodo: TIntegerField;
    zqryEmpleadosNombreCompleto: TStringField;
    zqryEmpleadossIdFolio: TStringField;
    zqryEmpleadosDescripcion_Pernocta: TStringField;
    zqryEmpleadosDescripcion_Plataforma: TStringField;
    zqryEmpleadosdias_trabajados: TIntegerField;
    zqryEmpleadosiId_Puesto: TIntegerField;
    zqryEmpleadossTranferido: TStringField;
    zqryEmpleadosReprogramacion: TDateField;
    zqryEmpleadossConfirmado: TStringField;
    zqryEmpleadossStatusPersonal: TStringField;
    zqryEmpleadossPuesto: TStringField;
    zqryEmpleadoscontratado: TStringField;
    zqryEmpleadosPagado: TStringField;
    zqryEmpleadossProgramado: TStringField;
    zqryEmpleadossStatusTipoPersonal: TStringField;
    zqryEmpleadosPagado_Todo: TStringField;
    AdvRecibo: TAdvGlowButton;
    cdBuscar: TZQuery;
    cdDetalleSave: TZQuery;
    cdPersonalDetalleNomina: TZQuery;
    cdConcepto: TZQuery;
    FDSBuscar: TfrxDBDataset;
    FDSPersonalDetalleNomina: TfrxDBDataset;
    FDSGenerales: TfrxDBDataset;
    FDSPercepciones: TfrxDBDataset;
    FDSDeducciones: TfrxDBDataset;
    memPercepciones: TClientDataSet;
    memDeducciones: TClientDataSet;
    cdDetalleNom: TZQuery;
    cdDetalleNomImporte: TFloatField;
    G_Empleados: TcxGridDBTableView;
    Glv_EmpleadosGrid1Level1: TcxGridLevel;
    cxgrdEmpleados: TcxGrid;
    fsc_1: TFormAutoScaler;
    cxgrdbclmnG_EmpleadossIdEmpleado1: TcxGridDBColumn;
    cxgrdbclmnG_EmpleadossNombreCompleto1: TcxGridDBColumn;
    cxgrdbclmnG_EmpleadossApellidoPaterno1: TcxGridDBColumn;
    cxgrdbclmnG_EmpleadossApellidoMaterno1: TcxGridDBColumn;
    cxgrdbclmnG_EmpleadossStatusTipoPersonal1: TcxGridDBColumn;
    zqHistorialiIdContrato: TIntegerField;
    zqHistorialsIdEmpleado: TStringField;
    zqHistorialdFechaInicio: TDateField;
    zqHistorialdFechaTermino: TDateField;
    zqHistorialsTipoContrato: TStringField;
    zqHistorialsPeriodoLaboral: TStringField;
    zqHistorialsIdGuardia: TStringField;
    zqHistorialID_PeriodoGuardia: TIntegerField;
    rxNominaHorasExtra: TFloatField;
    zQEmpleadossCalle: TStringField;
    zQEmpleadossNumero: TStringField;
    zQEmpleadossColonia: TStringField;
    zQEmpleadossEstado: TStringField;
    qryEmpleadosiddepartamento: TIntegerField;
    lbl1: TLabel;
    cmbOrganizacion: TDBLookupComboBox;
    QryOrganizacion: TZReadOnlyQuery;
    ds_organizacion: TDataSource;
    strngfldFolioQEmpleadossDescripcion: TStringField;
    sDescripcion: TcxGridDBColumn;
    zqryContratosPagados: TZQuery;
    IdEmpleadoContratosPagadosiIdContrato: TIntegerField;
    strngfldFolioContratosPagadossIdEmpleado: TStringField;
    IdEmpleadoContratosPagadosIdFormaPago: TIntegerField;
    zQEmpleadosiIdNacionalidad: TIntegerField;
    zQEmpleadossBanco: TStringField;
    cbbReporte: TComboBox;
    lblContrato: TLabel;
    strngfldQEmpleadossSucursal: TStringField;
    strngfldQEmpleadostitulocargo: TStringField;
    fltfldQEmpleadosimporte: TFloatField;
    zQEmpleadosdSueldoIntegrado: TFloatField;
    qryEmpleadosdSueldoIntegrado: TFloatField;
    mResponsabildiad: TDBMemo;
    zqHistorialmResponsabilidad: TMemoField;
    btnEdit: TAdvGlowButton;
    btnPost: TAdvGlowButton;
    btnCancel: TAdvGlowButton;
    Label1: TLabel;
    tsPuesto: TDBLookupComboBox;
    zq_Puestos: TZQuery;
    ds_Puestos: TDataSource;
    frx_R_puesto: TfrxDBDataset;
    zq_Puestosidcargo: TIntegerField;
    zq_PuestosIdTipoNomina: TIntegerField;
    zq_PuestosIdOrganizacion: TIntegerField;
    zq_Puestoscodigocargo: TStringField;
    zq_Puestostitulocargo: TStringField;
    zq_Puestosnivel: TIntegerField;
    zq_PuestosIdSalario: TIntegerField;
    zq_PuestosJornada: TIntegerField;
    zq_PuestosCobraFestivos: TStringField;
    zq_Puestosiddocumentos: TStringField;
    zq_PuestosGrupo: TStringField;
    zq_PuestosIdRangoSalarios: TIntegerField;
    zq_PuestosActivo: TStringField;
    zq_PuestosmResponsabilidad: TMemoField;
    zq_PuestosDescripcion: TStringField;
    RxDBGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    fltfldQEmpleadosdSueldoDiario: TFloatField;
    frxPDFExport1: TfrxPDFExport;
    procedure FormShow(Sender: TObject);
    procedure btnImprimeContratoTierraClick(Sender: TObject);
    procedure frxContratosGetValue(const VarName: string; var Value: Variant);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure tsFiltraEmpleadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tsFiltraEmpleadosEnter(Sender: TObject);
    procedure tsFiltraEmpleadosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure frmBarra4btnDeleteClick(Sender: TObject);
    procedure frmBarra4btnRefreshClick(Sender: TObject);
    procedure zQEmpleadosAfterScroll(DataSet: TDataSet);
    procedure frmBarra4btnExitClick(Sender: TObject);
    procedure cbMostrarTodosClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
   // procedure flEstatusEnter(Sender: TObject);
    procedure bImagenClick(Sender: TObject);
   // procedure flEstatusClick(Sender: TObject);
    procedure AdvImpFClick(Sender: TObject);
    //procedure cbTipoPersonalChange(Sender: TObject);
    procedure AdvReciboClick(Sender: TObject);
    procedure cdPersonalDetalleNominaAfterScroll(DataSet: TDataSet);
    procedure obtenerneto(trb: Variant);
    procedure cmbOrganizacionCloseUp(Sender: TObject);
    procedure G_EmpleadosCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure imprimirFiniquito;
    procedure ds_organizacionDataChange(Sender: TObject; Field: TField);
    procedure btnEditClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ActualizaResponsabilidad;
  private
    NetoPagar: Real;
    cdGenerales: TClientDataSet;
    YaCreado: Boolean;
    IsOpen:Boolean;
    { Private declarations }
  public
    { Public declarations }
    FechaSubida : string;
  end;

var
  frmImprimeContratos: TfrmImprimeContratos;
  periodocontrato : integer;
  utgrid:ticdbgrid;
  fechaBaja : Tdate;
  NumRec: Integer;
  Cadena: String;
  sueldot: Extended;
  sd,sueldocalculado: Double;
  function Parte(Indice: Integer; Cadena: String): String;
  

implementation

{$R *.dfm}

procedure TfrmImprimeContratos.AdvGlowButton1Click(Sender: TObject);
var
iGr,count:Integer;
svPlace:TBookmark;
empl: string;
begin
  obtenerneto(zQEmpleados.FieldByName('sIdEmpleado').AsString);
  frx_ReporteEmpleados.DataSet := zQEmpleados;

  if connection.contrato.FieldByName('sContrato').AsString = 'UTIDEL' then
  begin
     if not FileExists(global_files + global_miReporte + '_Contratos_ABordo.fr3') then
    begin
       showmessage('El archivo de reporte '+global_Mireporte+'_Contratos_ABordo.fr3 no existe, notifique al administrador del sistema');
       exit;
    end;

    frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Contratos_ABordo.fr3') ;
    frxContratos.ShowReport();

  end                                   
  else
  begin

    if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'Tierra' then
    begin

      if cbbReporte.ItemIndex = 1 then
      begin
           if not FileExists(global_files + global_miReporte + '_Contratos_ABordoB.fr3') then
       begin
         showmessage('El archivo de reporte '+global_Mireporte+'_Contratos_ABordoB.fr3 no existe, notifique al administrador del sistema');
         exit;
        end;

        frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Contratos_ABordoB.fr3') ;
        frxContratos.ShowReport();
      end else if cbbReporte.ItemIndex = 0 then
      begin
           if not FileExists(global_files + global_miReporte + '_Contratos_ABordoB2.fr3') then
         begin
           showmessage('El archivo de reporte '+global_Mireporte+'_Contratos_ABordoB2.fr3 no existe, notifique al administrador del sistema');
           exit;
          end;

        frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Contratos_ABordoB2.fr3') ;
        frxContratos.ShowReport();
      end;

    end else if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'A bordo' then
    begin
         if not FileExists(global_files + global_miReporte + '_Contratos_ABordoB3.fr3') then
        begin
          showmessage('El archivo de reporte '+global_Mireporte+'_Contratos_ABordoB3.fr3 no existe, notifique al administrador del sistema');
           exit;
         end;

      FechaSubida := DateToStr( zqHistorial.fieldByName('dFechaInicio').AsDateTime);
      frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Contratos_ABordoB3.fr3') ;
      frxContratos.ShowReport();
    end;
  end;
end;

procedure TfrmImprimeContratos.AdvGlowButton2Click(Sender: TObject);
begin
      if not FileExists(global_files + global_miReporte + '_reglamento_interno_Plataforma.fr3') then
 begin
  showmessage('El archivo de reporte '+global_Mireporte+'_reglamento_interno_Plataforma.fr3 no existe, notifique al administrador del sistema');
  exit;
 end;
  frx_ReporteEmpleados.DataSet := zqEmpleados;
  frxReglamentosplataforma.LoadFromFile(Global_Files +global_miReporte +'_reglamento_interno_Plataforma.fr3') ;
  frxReglamentosplataforma.ShowReport();
end;

procedure TfrmImprimeContratos.AdvImpFClick(Sender: TObject);
(*var
  QrDatos:TzReadOnlyQuery;
  Concept: string;
  Monto: string;
  i: Integer; *)
begin

//Si el contrato ya ha sido pagado al empleado entonces que imprima el finiquito
//Esta consulta trae al contrato y consigo trae a los empleados a los cuales
//se les pago, entonces buscar si este contrato fue pagado al empleado que este
//seleccionado
  zqryContratosPagados.Active := False;
  zqryContratosPagados.ParamByName('IdContrato').AsString := zqHistorial.FieldByName('iIdContrato').AsString;
  zqryContratosPagados.Open;
  zqryContratosPagados.Next;
  
  if zqryContratosPagados.FieldByName('IdFormaPago').AsInteger <> 0 then
  begin
  imprimirFiniquito;
    (*QrDatos:=TzReadOnlyQuery.Create(nil);
    try
      QrDatos.connection:=Connection.zConnection;
      QrDatos.SQL.Text:='select e.*,gm.*,nr.importe,rn.sDescripcion as nacionalidad' +
                        ',nc.titulocargo from empleados e' + #10 +
                        'inner join guardiasmovtos gm' + #10 +
                        'on(e.sIdEmpleado=gm.sIdEmpleado)' + #10 + 
                        'inner join nuc_cargo nc' + #10 +
                        'on(gm.iId_puesto=nc.idCargo)' + #10 +
                        'inner join nom_rangosalarios nr' + #10 +
                        'on(nr.IdRangoSalarios=nc.IdRangoSalarios)' + #10 +
                        'left join rh_nacionalidades rn ' +
                        'on(rn.iIdNacionalidad=e.iIdNacionalidad) ' +
                        'where e.sIdEmpleado=:Empleado and gm.ID_GuardiaPeriodo=:Guardia';

      //dtBaja:=False;
      QrDatos.ParamByName('Empleado').asString:=zQEmpleados.FieldByName('sIdEmpleado').asString;
      QrDatos.ParamByName('Guardia').AsInteger:=zqHistorial.FieldByName('Id_periodoGuardia').AsInteger;
      QrDatos.Open;
      if QrDatos.RecordCount>0 then
      begin
        if QrDatos.FieldByName('sStatusTipoPersonal').AsString='Tierra' then

          MSG_ER('No se puede imprimir el finiquito por que es un personal de Base y no se genera contrato')
        else

          if zqHistorial.recordcount>0 then
          begin

            {$REGION 'DESCOMPOSICION DE CAMPOS MULTIVALUADOS'}
            connection.QryBusca.Active := False ;
            connection.QryBusca.SQL.Clear ;
            //connection.QryBusca.SQL.Add('select Conceptos, Valores from precontrato Where sIdEmpleado = :sIdEmpleado and status_contra = "Contratado" and IdGuardia=:sIdGuardia') ;
            //connection.QryBusca.Params.ParamByName('sIdEmpleado').Value := zQEmpleados.Fieldbyname('sIdEmpleado').AsString ;
            //connection.QryBusca.Params.ParamByName('sIdGuardia').Value  := zqHistorial.Fieldbyname('sIdGuardia').AsString ;
            connection.QryBusca.SQL.text:=
            'SELECT' + #10 +
             'npi.IdPersonal,' + #10 +
             'p.codigopersonal,' + #10 +
             'npi.IdPeriodosGuardia,' + #10 +
             'dn.Clave as conceptos,' + #10 +
             'dn.Valor as valores' + #10 +
            'FROM' + #10 +
             'nuc_personalimss as npi' + #10 +
            'INNER JOIN' + #10 +
             'nuc_personal as p' + #10 +
            'ON' + #10 +
             'npi.IdPersonal = p.idpersonal' + #10 +

            'INNER JOIN' + #10 +
             'nom_nominapersonal as np' + #10 +
            'ON' + #10 +
             'npi.IdPersonal = np.IdPersonal' + #10 +
            'inner join nom_nomina nn' + #10 +
              'on(nn.Idnomina=np.Idnomina and nn.idPeriodosguardia=npi.IdPeriodosGuardia) '  +
            'INNER JOIN' + #10 +
             'nom_detallenomina as dn' + #10 +
            'ON' + #10 +
             '(npi.IdPersonal = dn.IdPersonal and dn.Idnomina=nn.Idnomina)' + #10 +
            'WHERE' + #10 +
             'NOT np.IdFormaPago IS NULL AND TipoMovimiento = "Baja" and p.codigopersonal =:Personal '+
             'and npi.IdPeriodosGuardia=:Periodo';
             //ID_PeriodoGuardia
             connection.QryBusca.ParamByName('Personal').AsString:= QrDatos.FieldByName('sIdEmpleado').AsString;
             connection.QryBusca.ParamByName('Periodo').asinteger:=QrDatos.FieldByName('ID_GuardiaPeriodo').AsInteger;

            connection.QryBusca.Open ;
            rxNomina.Active :=false;
             rxNomina.Active := True;

             rxNomina.EmptyTable;

            if  connection.QryBusca.RecordCount>0 then
            begin


              // Identificar cuantos registros componen su nómina
              NumRec := 0;
              Cadena := connection.QryBusca.FieldByName('Conceptos').AsString;
              while Pos('|', Cadena) > 0 do
              begin
                Inc(NumRec);
                Cadena := Copy(Cadena, Pos('|', Cadena) +1, Length(Cadena));
              end;

              // Obtener el universo de conceptos de entre todos los empleados
              //connection.QryBusca.First;
              while not connection.QryBusca.Eof do
              begin
                rxNomina.Insert;
                rxNomina.Edit;
                for i := 0 to NumRec -1 do
                begin
                  Concept := Parte(i, connection.QryBusca.FieldByName('Conceptos').AsString);
                  Monto := Parte(i, connection.QryBusca.FieldByName('Valores').AsString);
                  if Concept='SUELDO' then
                  rxNomina.FieldValues['Sueldo'] := StrToFloat(Monto);
                  if Concept='PrimaDominical' then
                  rxNomina.FieldValues['PrimaDom'] := StrToFloat(Monto);
                  if Concept='DiasFestivos' then
                  rxNomina.FieldValues['DiaFestivo'] := StrToFloat(Monto);
                  if Concept='Vacaciones' then
                  rxNomina.FieldValues['Vacaciones'] := StrToFloat(Monto);
                  if Concept='PrimaVacacional' then
                  rxNomina.FieldValues['PrimaVac'] := StrToFloat(Monto);
                  if Concept='Aguinaldo' then
                  rxNomina.FieldValues['Aguinaldo'] := StrToFloat(Monto);
                  if Concept='TOTDED' then
                  rxNomina.FieldValues['Deducciones'] := StrToFloat(Monto);
                  if Concept='HorasExtraImporte' then
                  rxNomina.FieldValues['HorasExtra'] := StrToFloat(Monto);
                  if Concept='NETO' then
                  begin
                    rxNomina.FieldValues['Neto'] := StrToFloat(Monto);
                    sueldot:=StrToFloat(Monto);
                  end;
                end;
                rxNomina.Post;
                connection.QryBusca.Next;
              end;
            end;

            {$ENDREGION}
            //origen_contrato:='finiquito';
            frx_ReporteEmpleados.DataSet := QrDatos;
            frx_ReporteEmpleados.FieldAliases.Clear;


            frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Finiquito.fr3') ;
            // if frxContratos.Variables.IndexOf('SueldoMensualC_Letras')<>-1 then

            {SueldoMensual_Letras
            frxContratos.Variables.variables['SueldoMensualC'] :=quotedstr(xNumerosToLletres(QrDatos.FieldByName('importe').AsCurrency));
           }

            frxContratos.Variables.variables['SueldoMensual_Letras'] :=quotedstr(xNumerosToLletres(rxNomina.FieldByName('Neto').ascurrency));
            frxContratos.Variables.variables['Contratacion_Dia'] :=quotedstr(FormatDateTime('dd',QrDatos.FieldByName('dFechaSubida').AsDateTime));
            frxContratos.Variables.variables['Contratacion_Mes'] :=quotedstr(Uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('dFechaSubida').AsDateTime)));
            frxContratos.Variables.variables['Contratacion_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('dFechaSubida').AsDateTime));
            //zqryEmpleados.FieldByName('Reprogramacion').AsDateTime = 0
            if (QrDatos.fieldbyname('Reprogramacion').AsDateTime =0)  then
            begin
              frxContratos.Variables.variables['Vencimiento_Dia'] :=quotedstr(FormatDateTime('dd', QrDatos.FieldByName('dFechaBajada').AsDateTime));
              frxContratos.Variables.variables['Vencimiento_Mes'] :=quotedstr(uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('dFechaBajada').AsDateTime)));
              frxContratos.Variables.variables['Vencimiento_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('dFechaBajada').AsDateTime));
            end
            else
            begin
              frxContratos.Variables.variables['Vencimiento_Dia'] :=quotedstr(FormatDateTime('dd', QrDatos.FieldByName('Reprogramacion').AsDateTime));
              frxContratos.Variables.variables['Vencimiento_Mes'] :=quotedstr(uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('Reprogramacion').AsDateTime)));
              frxContratos.Variables.variables['Vencimiento_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('Reprogramacion').AsDateTime));

            end;
            frxContratos.ShowReport() ;
          end
          else MSG_ER('El contrato no fue localizado');

      end;
    finally
      QrDatos.destroy;
    end;*)
  end else
  begin
     if MessageDlg('El Contrato no se ha pagado en Nominas, ¿Desea Imprimir el finiquito?', mtInformation, [mbYes, mbNo], 0, mbYes) = mrYes then
     begin
       imprimirFiniquito;
     end;
  end;


end;
(*var
Cpto: string;
Monto: string;
i: Integer;
begin
  {$REGION 'DESCOMPOSICION DE CAMPOS MULTIVALUADOS'}
      {connection.QryBusca.Active := False ;
      connection.QryBusca.SQL.Clear ;
      connection.QryBusca.SQL.Add('select Conceptos, Valores from precontrato Where sIdEmpleado = :sIdEmpleado and status_contra = "Contratado" and IdGuardia=:sIdGuardia') ;
      connection.QryBusca.Params.ParamByName('sIdEmpleado').Asstring := zQEmpleados.FieldByName('sIdEmpleado').asstring ;
      connection.QryBusca.Params.ParamByName('sIdGuardia').Asstring := zqHistorial.FieldByName('sIdGuardia').asstring ;
      connection.QryBusca.Open ;}

      connection.QryBusca.Active := False ;
      connection.QryBusca.SQL.Clear ;
      //connection.QryBusca.SQL.Add('select Conceptos, Valores from precontrato Where sIdEmpleado = :sIdEmpleado and status_contra = "Contratado" and IdGuardia=:sIdGuardia') ;
      //connection.QryBusca.Params.ParamByName('sIdEmpleado').Value := zQEmpleados.Fieldbyname('sIdEmpleado').AsString ;
      //connection.QryBusca.Params.ParamByName('sIdGuardia').Value  := zqHistorial.Fieldbyname('sIdGuardia').AsString ;
      connection.QryBusca.SQL.text:=
      'SELECT' + #10 +
           'npi.IdPersonal,' + #10 +
           'p.codigopersonal,' + #10 +
           'npi.IdPeriodosGuardia,' + #10 +
           'dn.Clave as conceptos,' + #10 +
           'dn.Valor as valores' + #10 +
          'FROM' + #10 +
           'nuc_personalimss as npi' + #10 +
          'INNER JOIN' + #10 +
           'nuc_personal as p' + #10 +
          'ON' + #10 +
           'npi.IdPersonal = p.idpersonal' + #10 +

          'INNER JOIN' + #10 +
           'nom_nominapersonal as np' + #10 +
          'ON' + #10 +
           'npi.IdPersonal = np.IdPersonal' + #10 +
          'inner join nom_nomina nn' + #10 + 
            'on(nn.Idnomina=np.Idnomina and nn.idPeriodosguardia=npi.IdPeriodosGuardia) '  +
          'INNER JOIN' + #10 +
           'nom_detallenomina as dn' + #10 +
          'ON' + #10 +
           '(npi.IdPersonal = dn.IdPersonal and dn.Idnomina=nn.Idnomina)' + #10 +
          'WHERE' + #10 +
           'NOT np.IdFormaPago IS NULL AND TipoMovimiento = "Baja" and p.codigopersonal =:Personal '+
           'and npi.IdPeriodosGuardia=:Periodo';
       //ID_PeriodoGuardia
       connection.QryBusca.ParamByName('Personal').AsString:= zQEmpleados.FieldByName('sIdEmpleado').asstring ;
       connection.QryBusca.ParamByName('Periodo').asinteger:=zqHistorial.FieldByName('ID_PeriodoGuardia').asInteger ;//zqryGuardiasMovtos.FieldByName('ID_PeriodoGuardia').AsInteger;

      connection.QryBusca.Open ;









      if  connection.QryBusca.RecordCount>0 then
      begin
          rxNomina.Active := True;
          rxNomina.EmptyTable;

          // Identificar cuantos registros componen su nómina
          NumRec := 0;
          Cadena := connection.QryBusca.FieldByName('Conceptos').AsString;
          while Pos('|', Cadena) > 0 do
          begin
            Inc(NumRec);
            Cadena := Copy(Cadena, Pos('|', Cadena) +1, Length(Cadena));
          end;

          // Obtener el universo de conceptos de entre todos los empleados
          //connection.QryBusca.First;
          while not connection.QryBusca.Eof do
          begin
            rxNomina.Insert;
            rxNomina.Edit;
            for i := 0 to NumRec -1 do
            begin
              Cpto := Parte(i, connection.QryBusca.FieldByName('Conceptos').AsString);
              Monto := Parte(i, connection.QryBusca.FieldByName('Valores').AsString);
              if Cpto='SUELDO' then
                rxNomina.FieldBYName('Sueldo').asfloat := StrToFloat(Monto);
              if Cpto='PrimaDominical' then
                rxNomina.FieldBYName('PrimaDom').asfloat := StrToFloat(Monto);
              if Cpto='CobraFestivos' then
                rxNomina.FieldBYName('DiaFestivo').asfloat := StrToFloat(Monto);
              if Cpto='Vacaciones' then
                rxNomina.FieldBYName('Vacaciones').asfloat := StrToFloat(Monto);
              if Cpto='PrimaVacacional' then
                rxNomina.FieldBYName('PrimaVac').asfloat := StrToFloat(Monto);
              if Cpto='Aguinaldo' then
                rxNomina.FieldBYName('Aguinaldo').asfloat := StrToFloat(Monto);
              if Cpto='TOTDED' then
                rxNomina.FieldBYName('Deducciones').asfloat := StrToFloat(Monto);
              if Cpto='NETO' then
              begin
                rxNomina.FieldBYName('Neto').asfloat := StrToFloat(Monto);
                sueldot:=StrToFloat(Monto);
              end;
            end;
            rxNomina.Post;
            connection.QryBusca.Next;
          end;
      end;
      {$ENDREGION}

  frx_ReporteEmpleados.DataSet := zqEmpleados;
  zqryEmpleados.locate('sIdEmpleado',zqEmpleados.fieldbyname('sIdEmpleado').AsString,[]);
  frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Finiquito.fr3') ;
  frxContratos.ShowReport();
end; *)

procedure TfrmImprimeContratos.AdvReciboClick(Sender: TObject);
var
  Cursor: TCursor;
  NumRec, i, op: Integer;
  Cadena, Modo, Modo2, Codigo, Titulo, Nombre, Grupo, Cargo, Valor, Imprime,
  Orden: String;

function RellenaOrden(Cad:string):string;
begin
  while Length(Trim(Cad)) < 14 do
  begin
    Cad:='0'+Cad;
  end;
  Result := Cad;
end;
begin
    if not FileExists(global_files + global_miReporte + '_Recibo2.fr3') then
    begin
       showmessage('El archivo de reporte '+global_Mireporte+'_Recibo2.fr3 no existe, notifique al administrador del sistema');
       exit;
    end;
  Try
    Cursor := Screen.Cursor;

    Try
      Screen.Cursor := crAppStart;
      // Abrir la nómina que se va a imprimir
      if Not YaCreado then
      begin
        cdDetalleSave.Open;

        memPercepciones.FieldDefs.Add('IdPersonal', ftInteger, 0, False);
        memPercepciones.FieldDefs.Add('CodigoConcepto', ftString, 6, False);
        memPercepciones.FieldDefs.Add('Titulo', ftString, 25, False);
        memPercepciones.FieldDefs.Add('Nombre', ftString, 80, False);
        memPercepciones.FieldDefs.Add('Modo', ftString, 50, False);
        memPercepciones.FieldDefs.Add('Importe', ftFloat, 0, False);
        memPercepciones.FieldDefs.Add('Orden', ftString, 10, False);
        memPercepciones.CreateDataSet;
        memPercepciones.Open;

        memDeducciones.FieldDefs.Add('IdPersonal', ftInteger, 0, False);
        memDeducciones.FieldDefs.Add('CodigoConcepto', ftString, 6, False);
        memDeducciones.FieldDefs.Add('Titulo', ftString, 25, False);
        memDeducciones.FieldDefs.Add('Nombre', ftString, 80, False);
        memDeducciones.FieldDefs.Add('Modo', ftString, 50, False);
        memDeducciones.FieldDefs.Add('Importe', ftFloat, 0, False);
        memDeducciones.FieldDefs.Add('Orden', ftString, 10, False);
        memDeducciones.CreateDataSet;
        memDeducciones.Open;

        YaCreado := True;
      end;

      {if Not CargarDatosFiltrados(cdBuscar, 'IdNomina', [IdNomina]) then
        raise InteligentException.CreateByCode(6, ['Nominas', IdNomina, 'Id. Nómina']);}
      connection.QryBusca.Active := False ;
      connection.QryBusca.SQL.Clear ;
      connection.QryBusca.SQL.Add('SELECT nnp.IdNomina, nnp.IdFormaPago, np.idpersonal FROM nuc_personal np ');
      connection.QryBusca.SQL.Add('INNER JOIN nom_nominapersonal nnp ON (np.idpersonal=nnp.IdPersonal) '+
                                  'INNER JOIN nom_nomina a ON (nnp.IdNomina=a.IdNomina)'+
                                  'WHERE (np.codigopersonal=:id) and (:FechaInicio = a.FechaNomina and :FechaTermino= a.FechaTerminoNomina)');
      connection.QryBusca.ParamByName('id').Asstring := zQEmpleados.FieldByName('sIdEmpleado').Asstring;
      connection.QryBusca.ParamByName('FechaInicio').AsDateTime:=zqHistorial.FieldByName('dFechaInicio').AsDateTime;
      connection.QryBusca.ParamByName('FechaTermino').AsDateTime:=zqHistorial.FieldByName('dFechaTermino').AsDateTime;
      connection.QryBusca.Open ;
      if  connection.QryBusca.RecordCount>0 then
      begin
        cdBuscar.ParamByName('IdNomina').AsInteger:=connection.QryBusca.FieldByName('IdNomina').AsInteger;
      end
      else
        raise Exception.Create('No se le Calculado la nomina a este empleado.');
      if connection.QryBusca.FieldByName('IdFormaPago').AsInteger = 0 then
      begin
        if not MSG_YN('El pago aun no se a realizado los datos pueden ser incorrectos, desea imprimir el recibo?') then
          exit;
      end;
      //cdBuscar.ParamByName('IdNomina').AsInteger:=cdNomina.FieldByName('IdNomina').AsInteger;
      if cdBuscar.Active then
        cdBuscar.Refresh
      else
        cdBuscar.Open;

      // Crear el conjunto de los datos generales del empleado
      if Not Assigned(cdGenerales) then
        cdGenerales := TClientDataSet.Create(Self)
      else
      begin
        cdGenerales.Close;
        cdGenerales.FieldDefs.Clear;
      end;

      // Crear el conjunto de personal
      cdPersonalDetalleNomina.close;
      cdPersonalDetalleNomina.ParamByName('IdNomina').AsInteger:=cdBuscar.FieldByName('IdNomina').AsInteger;
      cdPersonalDetalleNomina.ParamByName('IdPersonal').AsInteger:=connection.QryBusca.FieldByName('idpersonal').AsInteger;
      cdPersonalDetalleNomina.Open;

      if cdPersonalDetalleNomina.RecordCount = 0 then
        raise Exception.Create('El catálogo está vacío, Se ha solicitado la información del catálogo de Personal por Detalle de Nómina el cual se encuentra vacío, no es posible continuar con el proceso si dicho catálogo no contiene datos.');

      cdDetalleSave.ParamByName('IdNomina').AsInteger:=cdBuscar.FieldByName('IdNomina').AsInteger;
      cdDetalleSave.ParamByName('Personal').AsInteger:=connection.QryBusca.FieldByName('idpersonal').AsInteger;
      if cdDetalleSave.Active then
        cdDetalleSave.Refresh
      else
        cdDetalleSave.Open;

      if cdDetalleSave.RecordCount = 0 then
        raise Exception.Create('El catálogo está vacío, Se ha solicitado la información del catálogo de la Nómina el cual se encuentra vacío, no es posible continuar con el proceso si dicho catálogo no contiene datos.');

      // Limpiar los datos de nómina de empleado que pudieran existir
      memPercepciones.EmptyDataSet;
      memDeducciones.EmptyDataSet;

      cdDetalleSave.First;

      // Identificar cuantos registros componen su nómina
      NumRec := 0;
      Cadena := cdDetalleSave.FieldByName('Clave').AsString;
      while Pos('|', Cadena) > 0 do
      begin
        Inc(NumRec);
        Cadena := Copy(Cadena, Pos('|', Cadena) + 1, Length(Cadena));
      end;

      // Obtener el universo de conceptos de entre todos los empleados
      cdDetalleSave.First;
      while not cdDetalleSave.Eof do
      begin
        for i := 0 to NumRec - 1 do
        begin
          Modo := Parte(i, cdDetalleSave.FieldByName('Modo').AsString);
          Codigo := Parte(i, cdDetalleSave.FieldByName('CodigoConcepto').AsString);

          if (CompareText(Modo, 'EMPLEADO') = 0) and (cdGenerales.FieldDefs.IndexOf(Codigo) < 0) then
            cdGenerales.FieldDefs.Add(Codigo, ftString, 200, False);
        end;

        cdDetalleSave.Next;
      end;
      cdGenerales.CreateDataSet;
      cdGenerales.Open;

      cdDetalleSave.First;
      while not cdDetalleSave.Eof do
      begin
        // Identificar cuantos registros componen su nómina
        NumRec := 0;
        Cadena := cdDetalleSave.FieldByName('Clave').AsString;
        while Pos('|', Cadena) > 0 do
        begin
          Inc(NumRec);
          Cadena := Copy(Cadena, Pos('|', Cadena) + 1, Length(Cadena));
        end;

        cdGenerales.Append;
        cdGenerales.FieldByName('IdPersonal').AsInteger := cdDetalleSave.FieldByName('IdPersonal').AsInteger;

        for i := 0 to NumRec - 1 do
        begin
          Modo := Parte(i, cdDetalleSave.FieldByName('Modo').AsString);
          Codigo := Parte(i, cdDetalleSave.FieldByName('CodigoConcepto').AsString);
          Titulo := Parte(i, cdDetalleSave.FieldByName('Titulo').AsString);
          Nombre := Parte(i, cdDetalleSave.FieldByName('Descripcion').AsString);
          Grupo := Parte(i, cdDetalleSave.FieldByName('IdGrupoConcepto').AsString);
          Cargo := Parte(i, cdDetalleSave.FieldByName('Cargo').AsString);
          Imprime := Parte(i, cdDetalleSave.FieldByName('Imprime').AsString);
          Valor := Parte(i, cdDetalleSave.FieldByName('Valor').AsString);

          if CompareText(Modo, 'EMPLEADO') = 0 then
            cdGenerales.FieldByName(Codigo).AsString := Valor;
          //por cuestiones del destino en mi pc el cdconcepto aparece como inactivo, es por eso q se abre aqui
          if cdConcepto.State = dsInactive then
          begin
            //CargarDatosFiltrados(cdConcepto, 'IdTipoNomina', [cdNomina.FieldByName('IdTipoNomina').AsInteger]);
            cdConcepto.ParamByName('IdTipoNomina').AsInteger:=cdBuscar.FieldByName('IdTipoNomina').AsInteger;
            cdConcepto.Open;
          end;

          //if (CompareText(Modo, 'PERCEPCION') = 0) and ((Imprime = 'Si') or ((Imprime = 'Da') and (StrToFloat(Valor) <> 0))) then
          if (CompareText(Modo, 'PERCEPCION') = 0) and (cdConcepto.Locate('CodigoConcepto', Codigo, []) and ((cdConcepto.FieldByName('Imprime').AsString = 'Si') or ((cdConcepto.FieldByName('Imprime').AsString = 'Datos') and (StrToFloat(Valor) <> 0)))) then
          begin
            Orden := '';
            cdConcepto.Locate('codigoconcepto',Codigo,[]);
            Orden := cdConcepto.FieldByName('orden').AsString;
            Orden := RellenaOrden(Orden);
            memPercepciones.Append;
            memPercepciones.FieldByName('IdPersonal').AsInteger := cdDetalleSave.FieldByName('IdPersonal').AsInteger;
            memPercepciones.FieldByName('CodigoConcepto').AsString := Codigo;
            memPercepciones.FieldByName('Titulo').AsString := Titulo;
            memPercepciones.FieldByName('Nombre').AsString := Nombre;
            //memPercepciones.FieldByName('Imprime').AsString := Imprime;
            memPercepciones.FieldByName('Importe').AsString := Valor;
            memPercepciones.FieldByName('Orden').AsString := Orden;
            memPercepciones.Post;
          end;

          // aqui se  ordena
          //memDeptoPercepciones.IndexFieldNames := 'Orden';

          if CompareText(Modo, 'DEDUCCION') = 0 then
          begin
            Orden := '';
            cdConcepto.Locate('codigoconcepto',Codigo,[]);
            Orden := cdConcepto.FieldByName('orden').AsString;
            Orden := RellenaOrden(Orden);
            memDeducciones.Append;
            memDeducciones.FieldByName('IdPersonal').AsInteger := cdDetalleSave.FieldByName('IdPersonal').AsInteger;
            memDeducciones.FieldByName('CodigoConcepto').AsString := Codigo;
            memDeducciones.FieldByName('Titulo').AsString := Titulo;
            memDeducciones.FieldByName('Nombre').AsString := Nombre;
            memDeducciones.FieldByName('Importe').AsString := Valor;
            memDeducciones.FieldByName('Orden').AsString := Orden;
            memDeducciones.Post;
          end;
        end;
        cdGenerales.Post;
        cdDetalleSave.Next;
      end;

      memPercepciones.IndexFieldNames:='Orden';
      memDeducciones.IndexFieldNames:='Orden';
      cdConcepto.Close;

      FDSGenerales.DataSet := cdGenerales;

      frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Recibo2.fr3') ;
      frxContratos.ShowReport();
    Finally
      Screen.Cursor := Cursor;

      memPercepciones.Filtered := False;
      memDeducciones.Filtered := False;
    End;
  Except
    on e:Exception do
      MessageDlg('Ha ocurrido un error inespeado, Informe de lo siguiente al administador del sistema:' + #10 + #10 + e.Message, mtError, [mbOk], 0);
  End;
end;

procedure TfrmImprimeContratos.bImagenClick(Sender: TObject);
begin
 {if zQEmpleados.State in [dsInsert, dsEdit] then begin
    bImagen.Picture.Bitmap := nil;
    OpenPicture.Title := 'Inserta Imagen';
    sIArchivo := '';
    if OpenPicture.Execute then begin
      Try
        sIArchivo.Filter := RedimensionarJPG(OpenPicture.FileName);
        Size := Tamanyo(sIArchivo);
        if Size <= 350 then
          bImagen_.Picture.LoadFromFile(OpenPicture.FileName)
        else
          MessageDlg('La imagen a adjuntar no debe ser mayor a 350 kb.', mtInformation, [mbOk], 0);
      Except
        bImagen_.Picture.LoadFromFile('');
      End
    end;
  end; }
end;


procedure TfrmImprimeContratos.btnCancelClick(Sender: TObject);
begin
     zqHistorial.Cancel;
     btnEdit.Enabled := True;
     btnPost.Enabled := False;
     btnCancel.Enabled := False;
end;

procedure TfrmImprimeContratos.btnEditClick(Sender: TObject);
begin
    if zQhistorial.RecordCount > 0 then
    begin
        zqHistorial.Edit;        
        btnEdit.Enabled := False;
        btnPost.Enabled := True;
        btnCancel.Enabled := True;
    end;
    
end;

procedure TfrmImprimeContratos.btnImprimeContratoTierraClick(Sender: TObject);
begin
    obtenerneto(qryEmpleados.FieldValues['sIdEmpleado']);
    frx_ReporteEmpleados.DataSet := zqEmpleados;
    frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Contratos_Tierrav2.fr3') ;
    frxContratos.ShowReport() ;
end;

procedure TfrmImprimeContratos.btnPostClick(Sender: TObject);
begin
    zqHistorial.Post;
    btnEdit.Enabled := True;
    btnPost.Enabled := False;
    btnCancel.Enabled := False;
end;

procedure TfrmImprimeContratos.cbMostrarTodosClick(Sender: TObject);
begin
 {if cbMostrarTodos.Checked then
 begin
      zQEmpleados.Active := False;
      zQEmpleados.SQL.Clear;
      zQEmpleados.SQL.Add('select * from empleados order by sNombreCompleto ');
      zQEmpleados.Open;
 end
 else
 begin
      zQEmpleados.Active := False;
      zQEmpleados.SQL.Clear;
      zQEmpleados.SQL.Add('select * from empleados where sStatus = "ACTIVO" and lLabora = "Si" ' +
                          'order by sNombreCompleto ');
      zQEmpleados.Open;
 end; }

end;

(*procedure TfrmImprimeContratos.cbTipoPersonalChange(Sender: TObject);
begin
  cbTipoPersonal.Color := $00E6FEFF;
  IsOpen:=false;
  if cbTipoPersonal.itemindex = 0 then
  begin
    zqEmpleados.Filtered := false;
  end
  else
  begin
    if cbTipoPersonal.itemindex = 1 then
    begin
      zqEmpleados.Filtered := false;
      zqEmpleados.Filter := 'sStatusTipoPersonal= '+ QuotedStr('A bordo');
      zqEmpleados.Filtered := true;
    end
    else
    begin
        zqEmpleados.Filtered := false;
        zqEmpleados.Filter := 'sStatusTipoPersonal= '+ QuotedStr('Tierra');
        zqEmpleados.Filtered := true;
    end;
  end;
   IsOpen:=true;
  zQEmpleadosAfterScroll(zQEmpleados);
end;*)

procedure TfrmImprimeContratos.cdPersonalDetalleNominaAfterScroll(
  DataSet: TDataSet);
begin
  if Assigned(cdGenerales) and (cdGenerales.Active) then
    cdGenerales.Locate('IdPersonal', cdPersonalDetalleNomina.FieldByName('IdPersonal').AsInteger, []);

  memPercepciones.Filtered := False;
  memPercepciones.Filter := 'IdPersonal = ' + cdPersonalDetalleNomina.FieldByName('IdPersonal').AsString;
  memPercepciones.Filtered := True;

  memDeducciones.Filtered := False;
  memDeducciones.Filter := 'IdPersonal = ' + cdPersonalDetalleNomina.FieldByName
    ('IdPersonal').AsString;
  memDeducciones.Filtered := True;

  // Obtener el neto a pagar por empleado
  NetoPagar := 0;
  while not memPercepciones.Eof do
  begin
    NetoPagar := NetoPagar + StrToFloat(memPercepciones.FieldByName('Importe').AsString);
    memPercepciones.Next;
  end;
  memPercepciones.First;

  while not memDeducciones.Eof do
  begin
    NetoPagar := NetoPagar - StrToFloat(memDeducciones.FieldByName('Importe').AsString);
    memDeducciones.Next;
  end;
  memDeducciones.First;

end;

procedure TfrmImprimeContratos.cmbOrganizacionCloseUp(Sender: TObject);
begin
  IsOpen:= False;
    if QryOrganizacion.FieldByName('nombreorganizacion').AsString = '<<TODAS LAS EMPRESAS>>' then
       zQEmpleados.Filtered := false
    else
    begin
      zQEmpleados.Filtered := false;
      zQEmpleados.Filter :=' idorganizacion= '+QuotedStr(IntToStr(QryOrganizacion.FieldByName('idorganizacion').AsInteger));
      zQEmpleados.Filtered := True;
    end;
  IsOpen:= True;
end;

procedure TfrmImprimeContratos.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
UtGrid.dbGridMouseMoveCoord(x,y);
end;

procedure TfrmImprimeContratos.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
UtGrid.DbGridMouseUp(Sender,Button,Shift,X, Y);
end;

procedure TfrmImprimeContratos.DBGrid1TitleClick(Column: TColumn);
begin
UtGrid.DbGridTitleClick(Column);
end;

procedure TfrmImprimeContratos.ds_organizacionDataChange(Sender: TObject;
  Field: TField);
begin

end;

(*procedure TfrmImprimeContratos.flEstatusClick(Sender: TObject);
begin
  flEstatus.Color := $00E6FEFF;
  isOpen:=false;
  if qryflEstatus.FieldValues['iIdEstatus'] = 0 then
    zqEmpleados.Filtered := false
  else
  begin
    zqEmpleados.Filtered := false;
    zqEmpleados.Filter := 'iIdEstatus= '+ QuotedStr(qryflEstatus.FieldValues['iIdEstatus']);
    zqEmpleados.Filtered := true;
  end;
  IsOpen:=true;
  zQEmpleadosAfterScroll(zQEmpleados);
end;    *)

(*procedure TfrmImprimeContratos.flEstatusEnter(Sender: TObject);
begin
  flEstatus.Color := global_color_entradaERP;
end;    *)

procedure TfrmImprimeContratos.tsFiltraEmpleadosEnter(Sender: TObject);
begin
 //tsFiltraEmpleados.Color := global_color_entradaERP;
end;

procedure TfrmImprimeContratos.tsFiltraEmpleadosExit(Sender: TObject);
begin
  //tsFiltraEmpleados.Color := global_color_salidaERP;
end;

procedure TfrmImprimeContratos.tsFiltraEmpleadosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   { if length(trim(tsFiltraEmpleados.Text)) > 0 then
        begin
        zQEmpleados.Filtered := False;
        zQEmpleados.Filter := ' sNombreCompleto LIKE ' + QuotedStr('*' + tsFiltraEmpleados.Text + '* ');
        zQEmpleados.Filtered := True;
        zQEmpleados.Refresh;
        end
     else
        begin
        zQEmpleados.Filtered := False;
        end;    }
   // PanelFiltro.Caption := 'No. Registros ' + intToStr(zqEmpleados.RecordCount);
end;

procedure TfrmImprimeContratos.zQEmpleadosAfterScroll(DataSet: TDataSet);
var
iG, counter : Integer;
SvK: TBookmark;
em: string;
begin
  if IsOpen then
  begin
    zqHistorial.Filtered := false;
    zqHistorial.Filter :=' sIdEmpleado = '+ QuotedStr(zQEmpleados.FieldByName('sIdEmpleado').AsString);
    zqHistorial.Filtered := True;

    if zqHistorial.RecordCount > 0 then
    begin
      AdvGlowButton1.enabled := True;
      btnImprimeContratoTierra.enabled := True;
    end
    else
    begin
      AdvGlowButton1.enabled := False;
      btnImprimeContratoTierra.enabled := False;
    end;

    tsPuesto.KeyValue := zqEmpleados.fieldByName('iId_puesto').AsInteger;

  end;
end;
procedure TfrmImprimeContratos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //utgrid.Destroy;
  //utgrid2.Destroy;
  Action := CaFree;
end;

procedure TfrmImprimeContratos.FormShow(Sender: TObject);
begin

  //Refrescar los datos de la configuracion de RH para que el usuario no este llendo a la configuracion a refrescar
  Connection.configuracionRecHum.Active := False;
  Connection.configuracionRecHum.ParamByName('contrato').AsString := global_contrato;
  Connection.configuracionRecHum.Open  ;

  //UtGrid:=TicdbGrid.create(DBGrid1);
  IsOpen:=false;

  zqHistorial.Active := False;
  zqHistorial.Open;

  zQEmpleados.Close;
  zQEmpleados.Open;

  qryEmpleados.Close;
  qryEmpleados.Open;

  zqryEmpleados.Active := False;
  zqryEmpleados.Open;

  qryFlEstatus.Active := False ;
  qryFlEstatus.Open;

  (*if qryFlEstatus.RecordCount = 1 then
    flEstatus.KeyValue := 0; *)

    //Opciones del comboBox CmbOrganizacion
  QryOrganizacion.Active := False;
  QryOrganizacion.ParamByName('padre').AsInteger := -5;
  QryOrganizacion.Open;

  if QryOrganizacion.RecordCount > 0 then
     cmbOrganizacion.KeyValue := 0;

  IsOpen:=true;
  zQEmpleadosAfterScroll(zQEmpleados);

  YaCreado := False;

  cbbReporte.ItemIndex := 0;

  connection.QryBusca.Active := False ;
  connection.QryBusca.SQL.Clear ;
  connection.QryBusca.SQL.Add('select eNomina from rh_configuracion where eNomina="No"') ;
  connection.QryBusca.Open ;
  if  connection.QryBusca.RecordCount>0 then
    AdvImpF.Visible:=False;

  zq_puestos.Active := False;
  zq_puestos.ParamByName('id').AsInteger := connection.contrato.FieldByName('idorganizacion').AsInteger;
  zq_puestos.Open;

  ActualizaResponsabilidad;

  //Checar si el contrato es UTIDEL, si lo es, entonces ocultar el combo de eleccion de los tipos de contratos.
  if connection.contrato.FieldByName('sContrato').AsString <> 'UTIDEL' then
  begin
    lblContrato.Visible := True;
    cbbReporte.Visible := True;

    AdvGlowButton1.Caption := 'Imprimir Contrato';
    btnImprimeContratoTierra.Visible := False;
  end
  else
  begin
    lblContrato.Visible := False;
    cbbReporte.Visible := False;
  end;
end;

procedure TfrmImprimeContratos.frmBarra4btnDeleteClick(Sender: TObject);
begin
  if zqHistorial.RecordCount > 0 then
    begin
      if Application.MessageBox('¿Estas Seguro de Querer Eliminar el Contrato al Empleado?','ELIMINAR GUARDIA',MB_YESNO + Mb_IconQuestion) = IdYes then
      begin
          zqHistorial.Delete;
          zqHistorial.Refresh;
      end;
    end else
    begin
      ShowMessage('No existes Guardias para el Empleado.');
    end;
end;

procedure TfrmImprimeContratos.frmBarra4btnExitClick(Sender: TObject);
begin
  frmBarra4.btnExitClick(Sender);
  close;
end;

procedure TfrmImprimeContratos.frmBarra4btnRefreshClick(Sender: TObject);
begin
  if zqHistorial.RecordCount > 0 then
     zqHistorial.Refresh;
end;
//DESCOMPOSICION DE MULTIVALUADOS

function Parte(Indice: Integer; Cadena: String): String;
var
  ii: Integer;
begin
  ii := 0;
  while (ii < Indice) and (Pos('|', Cadena) > 0) do
  begin
    Inc(ii);
    Cadena := Copy(Cadena, Pos('|', Cadena) +1, Length(Cadena));
  end;
  Result := Copy(Cadena, 1, Pos('|', Cadena) -1);
end;

procedure TfrmImprimeContratos.frxContratosGetValue(const VarName: string;var Value: Variant);
Var
  SueldoEmpleado : TZQuery;
  edad : integer;
  Sueldo : Longint;
  iValorNumerico : Longint;
  sCadena        : String ;
  Resultado      : Real;
  mes : string;

begin
  If CompareText(VarName, 'CalculoSueldo') = 0 then
  begin
    connection.QryBusca.Active := False ;
    connection.QryBusca.SQL.Clear ;
    connection.QryBusca.SQL.Add('SELECT npi.SalarioDiario FROM nuc_personalimss npi INNER JOIN nuc_personal np on (np.idpersonal=npi.IdPersonal AND np.codigopersonal=:Per) '+
                                'WHERE npi.TipoMovimiento="Reingreso" AND npi.IdPeriodosGuardia=:PdoG') ;
    connection.QryBusca.ParamByName('Per').Value := zQEmpleados.FieldValues['sIdEmpleado'] ;
    connection.QryBusca.ParamByName('PdoG').Value := zqHistorial.FieldValues['ID_PeriodoGuardia'] ;
    connection.QryBusca.Open ;

    sd:=connection.QryBusca.FieldByName('SalarioDiario').AsFloat;

    if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'Tierra' then
      sueldocalculado:=sd*15
    else
      sueldocalculado:=sd*DaysBetween(zqHistorial.FieldByName('dFechaInicio').AsDateTime,zqHistorial.FieldByName('dFechaTermino').AsDateTime);

    Value:=sueldocalculado;
  end;

  If CompareText(VarName, 'IMPORTE') = 0 then
  begin
    iValorNumerico := Trunc(sueldocalculado) ;
    sCadena := xIntToLletres (iValorNumerico) +' PESOS CON ';

    Resultado := roundto((sueldocalculado) - iValorNumerico, -2) ;
    Resultado := Resultado * 100;
    iValorNumerico := Trunc(Resultado);
    sCadena := sCadena + xIntToLletres(iValorNumerico) + ' CENTAVOS /100 M.N.';
    Value := sCadena ;
  end;
  

  if CompareText(VarName, 'Nacionalidad') = 0 then
  begin
    connection.QryBusca.Active := False ;
    connection.QryBusca.SQL.Clear ;
    connection.QryBusca.SQL.Add('select sNacionalidad from rh_nacionalidades Where iIdNacionalidad = :iIdNacionalidad') ;
    connection.QryBusca.Params.ParamByName('iIdNacionalidad').Value := zQEmpleados.FieldValues['iIdNacionalidad'] ;
    connection.QryBusca.Open ;
    if  connection.QryBusca.RecordCount>0 then
      Value := connection.QryBusca.FieldByName('sNacionalidad').AsString
    else
      Value := '*';
  end;

  if VarName = 'FechaSubida' then
  begin
    //Obtener el mes en letras por ejemplo(01 = Enero, 02 = Febrero, etc)
    case MonthOf(StrToDate(FechaSubida)) of
       1 : mes := 'Enero';
       2 : mes := 'Febrero';
       3 : mes := 'Marzo';
       4 : mes := 'Abril';
       5 : mes := 'Mayo';
       6 : mes := 'Junio';
       7 : mes := 'Julio';
       8 : mes := 'Agosto';
       9 : mes := 'Septiembre';
      10 : mes := 'Octubre';
      11 : mes := 'Noviembre';
      12 : mes := 'Diciembre';
    end;
    
    Value := FormatDateTime('dd', StrToDate(FechaSubida)) + ' de '  +
           mes + ' del ' +
           FormatDateTime('yyyy', StrToDate(FechaSubida)) ;
  end;

 if VarName = 'HorarioLaboral' then
  begin
  connection.QryBusca.Active := False ;
  connection.QryBusca.SQL.Clear ;
  connection.QryBusca.SQL.Add('select sDescripcion from rh_horariolaboral Where iIdhorario = :iIdhorario') ;
  connection.QryBusca.Params.ParamByName('iIdhorario').Value := zQEmpleados.FieldByName('iIdhorario').AsInteger ;
  connection.QryBusca.Open ;
  if  connection.QryBusca.RecordCount>0 then
    Value := connection.QryBusca.FieldByName('sDescripcion').AsString
  else Value := '*';
  end
  else if VarName = 'PeriododePago' then
  begin
    connection.QryBusca.Active := False ;
    connection.QryBusca.SQL.Clear ;
    connection.QryBusca.SQL.Add('select sDescripcion from rh_periodopagos Where iIdPeriodo = :iIdPeriodo') ;
    connection.QryBusca.Params.ParamByName('iIdPeriodo').AsInteger := zQEmpleados.FieldByName('iIdPeriodo').AsInteger ;
    connection.QryBusca.Open ;
    if  connection.QryBusca.RecordCount>0 then
      Value := connection.QryBusca.FieldByName('sDescripcion').AsString
    else Value := '*';
  end
  else if VarName = 'Sueldo' then
  begin
    obtenerneto(zqEmpleados.FieldByName('sIdEmpleado').asstring);
    Value := cdDetalleNom.FieldByName('Importe').AsFloat;
  end
  else if VarName = 'Edad' then
  begin
      edad:= yearof(date) - yearof(zqEmpleados.FieldByName('dFechaNacimiento').AsDateTime);
      Value := edad;
  end
  else if VarName = 'Contratacion_Dia' then
  begin
    Value := FormatDateTime('dd', zqhistorial.FieldByName('dfechainicio').AsDateTime); {zqHistorial.FieldByName('dFechaInicio').AsDateTime}
  end
  else if VarName = 'Contratacion_Mes' then
  begin
    Value := esMes(StrToInt(FormatDateTime('mm', zqhistorial.FieldByName('dfechainicio').AsDateTime)));{zqHistorial.FieldByName('dFechaInicio').AsDateTime}
  end
  else if VarName = 'Contratacion_Anyo' then
  begin
    Value := FormatDateTime('yyyy', zqhistorial.FieldByName('dfechainicio').AsDateTime); {zqHistorial.FieldByName('dFechaInicio').AsDateTime}
  end
  else if VarName = 'Vencimiento_Dia' then
  begin
    Value := FormatDateTime('dd', zqhistorial.FieldByName('dfechatermino').AsDateTime); {zqHistorial.FieldByName('dFechaTermino').AsDateTime}
  end
  else if VarName = 'Vencimiento_Mes' then
  begin
    Value := esMes(StrToInt(FormatDateTime('mm', zqhistorial.FieldByName('dfechatermino').AsDateTime)));{zqHistorial.FieldByName('dFechaTermino').AsDateTime}
  end
  else if VarName = 'Vencimiento_Anyo' then
  begin
    Value := FormatDateTime('yyyy', zqhistorial.FieldByName('dfechatermino').AsDateTime); {zqHistorial.FieldByName('dFechaTermino').AsDateTime}
  end
  else if VarName = 'SueldoMensual_Letras' then
  begin
    Value := xNumerosToLletres(sueldot{zqEmpleados.FieldByName('dSueldo').AsCurrency});
  end
  else if VarName = 'SueldoMensualC_Letras' then
  begin
    Value := xNumerosToLletres(cdDetalleNom.FieldByName('Importe').AsCurrency);
  end
  else if VarName = 'DiasT' then
  begin
    //Value := (DaysBetween(zqhistorial.FieldByName('dFechaInicio').AsDateTime, zqhistorial.FieldByName('dFechaTermino').AsDateTime));{zqHistorial}
    Value := 14;
  end
  else if VarName = 'NominaNeto' then
  begin
    Value := NetoPagar;
  end
  else if VarName = 'Plataforma' then
  begin
    connection.QryBusca.Active := False ;
    connection.QryBusca.SQL.Clear ;
    connection.QryBusca.SQL.Add('SELECT p.sDescripcion from guardiasmovtos gm INNER JOIN plataformas p on (gm.sIdPlataforma=p.sIdPlataforma) WHERE gm.sIdEmpleado=:empleado') ;
    connection.QryBusca.Params.ParamByName('empleado').AsString := zQEmpleados.FieldByNAme('sIdEmpleado').asstring ; {sIdEmpleado}
    connection.QryBusca.Open ;
    if  connection.QryBusca.RecordCount>0 then
      Value := connection.QryBusca.FieldByName('sDescripcion').AsString
    else  Value := '*';
  end
  else if VarName = 'Puesto' then
  begin
    connection.QryBusca.Active := False ;
    connection.QryBusca.SQL.Clear ;
    connection.QryBusca.SQL.Add('select e.iId_Puesto,ccp.titulocargo as sPuesto from empleados e ') ;
    connection.QryBusca.SQL.Add('inner join nuc_cargo ccp on(ccp.idcargo = e.iId_Puesto) ');
    connection.QryBusca.SQL.Add('where sIdEmpleado = :iId');  {select sDescripcion as sPuesto from con_catalogodepuestos Where iId_Puesto = :iId_Puesto}
    connection.QryBusca.Params.ParamByName('iId').Asstring := zQEmpleados.FieldByName('sIdEmpleado').asstring;{iId_Puesto}
    connection.QryBusca.Open ;
    if  connection.QryBusca.RecordCount>0 then
      Value := connection.QryBusca.FieldByName('sPuesto').AsString
    else Value := '*';
  end;
end;

procedure TfrmImprimeContratos.G_EmpleadosCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  //Si el empleado seleccionado es de Tierra, entonces deshabilitar el boton Imprimir Contrato A BOrdo

  if connection.contrato.FieldByName('sContrato').AsString <> 'UTIDEL' then
  begin
    if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'Tierra' then
    begin

      cbbReporte.Clear;

      cbbReporte.Items.Add('Por tiempo determinado');
      cbbReporte.Items.Add('Por tiempo indeterminado');
      cbbReporte.ItemIndex := 0;         
    end else if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'A bordo' then
    begin
      cbbReporte.Clear;
      cbbReporte.Items.Add('Abordo');
      cbbReporte.ItemIndex := 0;
      btnImprimeContratoTierra.Enabled := False;
    end;
  end
  else
  begin
    if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'Tierra' then
    begin
      AdvGlowButton1.Enabled := False;
    end else if zQEmpleados.FieldByName('sStatusTipoPersonal').AsString = 'A bordo' then
    begin
      btnImprimeContratoTierra.Enabled := False;
    end;
  end;
  
end;

//Imprime el finiquito
procedure TfrmImprimeContratos.imprimirFiniquito;
var
  QrDatos:TzReadOnlyQuery;
  Concept: string;
  Monto: string;
  i: Integer;
begin
  //Imprime el finiquito del contrato seleccionado
  QrDatos:=TzReadOnlyQuery.Create(nil);
    try
      QrDatos.connection:=Connection.zConnection;
      QrDatos.SQL.Text:='select e.*,gm.*,nr.importe, ' +
                        'nc.titulocargo from empleados e' + #10 +
                        'inner join guardiasmovtos gm' + #10 +
                        'on(e.sIdEmpleado=gm.sIdEmpleado)' + #10 +
                        'inner join nuc_cargo nc' + #10 +
                        'on(gm.iId_puesto=nc.idCargo)' + #10 +
                        'inner join nom_rangosalarios nr' + #10 +
                        'on(nr.IdRangoSalarios=nc.IdRangoSalarios)' + #10 +
                        'where e.sIdEmpleado=:Empleado and gm.ID_GuardiaPeriodo=:Guardia';

      //dtBaja:=False;
      QrDatos.ParamByName('Empleado').asString:=zQEmpleados.FieldByName('sIdEmpleado').asString;
      QrDatos.ParamByName('Guardia').AsInteger:=zqHistorial.FieldByName('Id_periodoGuardia').AsInteger;
      QrDatos.Open;
      if QrDatos.RecordCount>0 then
      begin
        if QrDatos.FieldByName('sStatusTipoPersonal').AsString='Tierra' then

          MSG_ER('No se puede imprimir el finiquito por que es un personal de Base y no se genera contrato')
        else

          if zqHistorial.recordcount>0 then
          begin

            {$REGION 'DESCOMPOSICION DE CAMPOS MULTIVALUADOS'}
            connection.QryBusca.Active := False ;
            connection.QryBusca.SQL.Clear ;
            //connection.QryBusca.SQL.Add('select Conceptos, Valores from precontrato Where sIdEmpleado = :sIdEmpleado and status_contra = "Contratado" and IdGuardia=:sIdGuardia') ;
            //connection.QryBusca.Params.ParamByName('sIdEmpleado').Value := zQEmpleados.Fieldbyname('sIdEmpleado').AsString ;
            //connection.QryBusca.Params.ParamByName('sIdGuardia').Value  := zqHistorial.Fieldbyname('sIdGuardia').AsString ;
            connection.QryBusca.SQL.text:=
            'SELECT' + #10 +
             'npi.IdPersonal,' + #10 +
             'p.codigopersonal,' + #10 +
             'npi.IdPeriodosGuardia,' + #10 +
             'dn.Clave as conceptos,' + #10 +
             'dn.Valor as valores' + #10 +
            'FROM' + #10 +
             'nuc_personalimss as npi' + #10 +
            'INNER JOIN' + #10 +
             'nuc_personal as p' + #10 +
            'ON' + #10 +
             'npi.IdPersonal = p.idpersonal' + #10 +

            'INNER JOIN' + #10 +
             'nom_nominapersonal as np' + #10 +
            'ON' + #10 +
             'npi.IdPersonal = np.IdPersonal' + #10 +
            'inner join nom_nomina nn' + #10 +
              'on(nn.Idnomina=np.Idnomina and nn.idPeriodosguardia=npi.IdPeriodosGuardia) '  +
            'INNER JOIN' + #10 +
             'nom_detallenomina as dn' + #10 +
            'ON' + #10 +
             '(npi.IdPersonal = dn.IdPersonal and dn.Idnomina=nn.Idnomina)' + #10 +
            'WHERE' + #10 +
             'NOT np.IdFormaPago IS NULL AND TipoMovimiento = "Baja" and p.codigopersonal =:Personal '+
             'and npi.IdPeriodosGuardia=:Periodo';
             //ID_PeriodoGuardia
             connection.QryBusca.ParamByName('Personal').AsString:= QrDatos.FieldByName('sIdEmpleado').AsString;
             connection.QryBusca.ParamByName('Periodo').asinteger:=QrDatos.FieldByName('ID_GuardiaPeriodo').AsInteger;

            connection.QryBusca.Open ;
            rxNomina.Active :=false;
             rxNomina.Active := True;

             rxNomina.EmptyTable;

            if  connection.QryBusca.RecordCount>0 then
            begin


              // Identificar cuantos registros componen su nómina
              NumRec := 0;
              Cadena := connection.QryBusca.FieldByName('Conceptos').AsString;
              while Pos('|', Cadena) > 0 do
              begin
                Inc(NumRec);
                Cadena := Copy(Cadena, Pos('|', Cadena) +1, Length(Cadena));
              end;

              // Obtener el universo de conceptos de entre todos los empleados
              //connection.QryBusca.First;
              while not connection.QryBusca.Eof do
              begin
                rxNomina.Insert;
                rxNomina.Edit;
                for i := 0 to NumRec -1 do
                begin
                  Concept := Parte(i, connection.QryBusca.FieldByName('Conceptos').AsString);
                  Monto := Parte(i, connection.QryBusca.FieldByName('Valores').AsString);
                  if Concept='SUELDO' then
                  rxNomina.FieldValues['Sueldo'] := StrToFloat(Monto);
                  if Concept='PrimaDominical' then
                  rxNomina.FieldValues['PrimaDom'] := StrToFloat(Monto);
                  if Concept='DiasFestivos' then
                  rxNomina.FieldValues['DiaFestivo'] := StrToFloat(Monto);
                  if Concept='Vacaciones' then
                  rxNomina.FieldValues['Vacaciones'] := StrToFloat(Monto);
                  if Concept='PrimaVacacional' then
                  rxNomina.FieldValues['PrimaVac'] := StrToFloat(Monto);
                  if Concept='Aguinaldo' then
                  rxNomina.FieldValues['Aguinaldo'] := StrToFloat(Monto);
                  if Concept='TOTDED' then
                  rxNomina.FieldValues['Deducciones'] := StrToFloat(Monto);
                  if Concept='HorasExtraImporte' then
                  rxNomina.FieldValues['HorasExtra'] := StrToFloat(Monto);
                  if Concept='NETO' then
                  begin
                    rxNomina.FieldValues['Neto'] := StrToFloat(Monto);
                    sueldot:=StrToFloat(Monto);
                  end;
                end;
                rxNomina.Post;
                connection.QryBusca.Next;
              end;
            end;

            {$ENDREGION}
            //origen_contrato:='finiquito';
            frx_ReporteEmpleados.DataSet := QrDatos;
            frx_ReporteEmpleados.FieldAliases.Clear;


            frxContratos.LoadFromFile(Global_Files +global_miReporte +'_Finiquito.fr3') ;
            // if frxContratos.Variables.IndexOf('SueldoMensualC_Letras')<>-1 then

            {SueldoMensual_Letras
            frxContratos.Variables.variables['SueldoMensualC'] :=quotedstr(xNumerosToLletres(QrDatos.FieldByName('importe').AsCurrency));
           }

            frxContratos.Variables.variables['SueldoMensual_Letras'] :=quotedstr(xNumerosToLletres(rxNomina.FieldByName('Neto').ascurrency));
            frxContratos.Variables.variables['Contratacion_Dia'] :=quotedstr(FormatDateTime('dd',QrDatos.FieldByName('dFechaSubida').AsDateTime));
            frxContratos.Variables.variables['Contratacion_Mes'] :=quotedstr(Uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('dFechaSubida').AsDateTime)));
            frxContratos.Variables.variables['Contratacion_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('dFechaSubida').AsDateTime));
            //zqryEmpleados.FieldByName('Reprogramacion').AsDateTime = 0
            if (QrDatos.fieldbyname('Reprogramacion').AsDateTime =0)  then
            begin
              frxContratos.Variables.variables['Vencimiento_Dia'] :=quotedstr(FormatDateTime('dd', QrDatos.FieldByName('dFechaBajada').AsDateTime));
              frxContratos.Variables.variables['Vencimiento_Mes'] :=quotedstr(uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('dFechaBajada').AsDateTime)));
              frxContratos.Variables.variables['Vencimiento_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('dFechaBajada').AsDateTime));
            end
            else
            begin
              frxContratos.Variables.variables['Vencimiento_Dia'] :=quotedstr(FormatDateTime('dd', QrDatos.FieldByName('Reprogramacion').AsDateTime));
              frxContratos.Variables.variables['Vencimiento_Mes'] :=quotedstr(uppercase(FormatDateTime('mmmm', QrDatos.FieldByName('Reprogramacion').AsDateTime)));
              frxContratos.Variables.variables['Vencimiento_Anyo'] :=quotedstr(FormatDateTime('yy', QrDatos.FieldByName('Reprogramacion').AsDateTime));

            end;
            frxContratos.ShowReport() ;
          end
          else MSG_ER('El contrato no fue localizado');

      end;
    finally
      QrDatos.destroy;
    end;
end;

procedure TfrmImprimeContratos.obtenerneto (trb: variant);
var
icount : Integer;
emp, empl : string;
begin
  cdDetalleNom.Active := False;
  connection.QryBusca.Active := False ;
  connection.QryBusca.SQL.Clear;
  connection.QryBusca.SQL.Add('SELECT nnp.IdNomina, np.idpersonal FROM nuc_personal np ');
  connection.QryBusca.SQL.Add('INNER JOIN nom_nominapersonal nnp ON (np.idpersonal=nnp.IdPersonal) '); {np.codigopersonal=:id}
  connection.QryBusca.SQL.Add('Where np.codigopersonal=:id');
  connection.QryBusca.ParamByName('id').Value := trb;//zQEmpleados.FieldValues['sIdEmpleado'];
  connection.QryBusca.Open ;

  if  connection.QryBusca.RecordCount>0 then
  begin

    cdDetalleNom.ParamByName('Clave').AsString:='NETO';
    cdDetalleNom.ParamByName('IdPersonal').AsInteger:=connection.QryBusca.FieldByName('idpersonal').AsInteger;
    cdDetalleNom.ParamByName('IdNomina').AsInteger:=connection.QryBusca.FieldByName('IdNomina').AsInteger;
    cdDetalleNom.ParamByName('FechaInicio').AsDateTime:=zqHistorial.FieldByName('dFechaInicio').AsDateTime;
    cdDetalleNom.ParamByName('FechaTermino').AsDateTime:=zqHistorial.FieldByName('dFechaTermino').AsDateTime;
    //cdDetalleNom.ParamByName('FechaInicio').AsDateTime:=zqHistorial.FieldByName('dFechaInicio').AsDateTime;
    cdDetalleNom.Open;
  end;
end;

procedure TfrmImprimeContratos.ActualizaResponsabilidad;
begin
    connection.zCommand.Active := False;
    connection.zCommand.SQL.Clear;
    connection.zCommand.SQL.Add('select h.iIdContrato, h.sIdEmpleado, h.mResponsabilidad as ResponsablidadH, c.titulocargo, c.mResponsabilidad '+
                                'from historialcontrato h '+
                                'inner join empleados e on (e.idorganizacion = :id and e.sIdEmpleado = h.sIdEmpleado) '+
                                'inner join nuc_cargo c on (c.IdOrganizacion = e.idorganizacion and e.iId_Puesto = c.idcargo) '+
                                'where (h.mResponsabilidad is Null or h.mResponsabilidad = "")');
    connection.zCommand.ParamByName('Id').AsInteger := connection.contrato.FieldByName('idorganizacion').AsInteger;
    connection.zCommand.Open;

    while not connection.zCommand.Eof do
    begin
        connection.QryBusca.Active := False;
        connection.QryBusca.SQL.Clear;
        connection.QryBusca.SQL.Add('Update historialcontrato set mResponsabilidad =:Responsabilidad where iIdContrato =:Id');
        connection.QryBusca.ParamByName('Responsabilidad').AsMemo := connection.zCommand.FieldByName('mResponsabilidad').AsVariant;
        connection.QryBusca.ParamByName('Id').AsInteger           := connection.zCommand.FieldByName('iIdContrato').AsInteger;
        connection.QryBusca.ExecSQL;

        connection.zCommand.Next;
    end;
end;

end.

unit frm_catalogoestatusequipo;

interface
             
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, frm_connection, global, ComCtrls, ToolWin,
  StdCtrls, ExtCtrls, DBCtrls, Mask, frm_barra, adodb, db, Menus, OleCtrls,
  frxClass, frxDBSet, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  udbgrid, unitexcepciones, unittbotonespermisos, UnitValidaTexto,
  unitactivapop, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, dxBar,
  dxRibbonRadialMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray;

type
  TfrmCatalogoEstatusEquipo = class(TForm)
  Panel1: TPanel;
  Panel2: TPanel;
  Label2: TLabel;
  Label1: TLabel;
  Label3: TLabel;
  tsDescripcion: TDBEdit;
  tiColores: TColorBox;
  dbequipos: TDBComboBox;
  qryCatEstatus: TZQuery;
  dsCatEstatus: TDataSource;
  qryCatEstatusiId_Estatus: TIntegerField;
  qryCatEstatussDescripcion: TStringField;
  qryCatEstatusiColor: TIntegerField;
  qryCatEstatusiAplicaEquiposActivos: TStringField;
  dxBarManager1: TdxBarManager;
  dxBarManager1Bar1: TdxBar;
  dxInsertar: TdxBarLargeButton;
  dxEditar: TdxBarLargeButton;
  dxGuardar: TdxBarLargeButton;
  dxCancelar: TdxBarLargeButton;
  dxEliminar: TdxBarLargeButton;
  dxRefrescar: TdxBarLargeButton;
  dxSalir: TdxBarLargeButton;
  dxImprimir: TdxBarLargeButton;
  PopupMenu: TdxRibbonRadialMenu;
    BView_EstatusEquipos: TcxGridDBTableView;
    Grid_EstatusLevel1: TcxGridLevel;
    Grid_Estatus: TcxGrid;
    BView_EstatusEquiposColumn1: TcxGridDBColumn;
    BView_EstatusEquiposColumn2: TcxGridDBColumn;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure FormShow(Sender: TObject);
  procedure tsIdPersonalKeyPress(Sender: TObject; var Key: Char);
  procedure frmBarra1btnAddClick(Sender: TObject);
  procedure frmBarra1btnEditClick(Sender: TObject);
  procedure frmBarra1btnPostClick(Sender: TObject);
  procedure frmBarra1btnCancelClick(Sender: TObject);
  procedure frmBarra1btnDeleteClick(Sender: TObject);
  procedure frmBarra1btnRefreshClick(Sender: TObject);
  procedure frmBarra1btnExitClick(Sender: TObject);
  procedure tsIdGrupoKeyPress(Sender: TObject; var Key: Char);
  procedure tsDescripcionEnter(Sender: TObject);
  procedure tsDescripcionExit(Sender: TObject);
  procedure tiColoresEnter(Sender: TObject);
  procedure tiColoresExit(Sender: TObject);
  procedure qryCatEstatusAfterScroll(DataSet: TDataSet);
  procedure dbequiposEnter(Sender: TObject);
  procedure dbequiposExit(Sender: TObject);
  procedure dbequiposKeyPress(Sender: TObject; var Key: Char);
  procedure qryCatEstatusAfterInsert(DataSet: TDataSet);
  procedure cambio_estado;
private
  { Private declarations }
public
  { Public declarations }
end;

var
  frmCatalogoEstatusEquipo : TfrmCatalogoEstatusEquipo;
  utgrid           : ticdbgrid;
  sOldId           : string;
  botonpermiso     : tbotonespermisos;
  sOpcion          : string;

implementation
uses
  frm_consumibles, frm_repositorio, Func_Genericas;
{$R *.dfm}

procedure TfrmCatalogoEstatusEquipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure TfrmCatalogoEstatusEquipo.FormShow(Sender: TObject);
begin
   OpcButton := '' ;
   qryCatEstatus.Active := False ;
   qryCatEstatus.Open ;
   grid_estatus.SetFocus;
end;
procedure TfrmCatalogoEstatusEquipo.tsIdPersonalKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tsDescripcion.SetFocus ;
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnAddClick(Sender: TObject);
begin
  dbequipos.SetFocus;
  qryCatEstatus.Append ;
  qryCatEstatus.FieldValues['sDescripcion'] := '';
  tsDescripcion.SetFocus;
  cambio_estado;
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnEditClick(Sender: TObject);
begin
  If qryCatEstatus.RecordCount > 0 Then
  Begin
    sOpcion := 'Edit';
    tsDescripcion.SetFocus;
    qryCatEstatus.Edit;
    grid_estatus.Enabled := False;
    cambio_estado;
  End;
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnPostClick(Sender: TObject);
var
  lEdicion : boolean;
begin
//77  try
    if trim(tsDescripcion.Text) = '' then
    begin
       MessageDlg('La descripcion debe tener un valor!', mtInformation, [mbOk], 0);
       exit;
    end;

    connection.QryBusca.Active := False;
    connection.QryBusca.SQL.Clear;
    connection.QryBusca.SQL.Add('SELECT MAX(iId_Estatus) AS id FROM rh_estatuscatalogodeequipos;');
    connection.QryBusca.Open;
    if connection.QryBusca.FieldByName('id').IsNull Then
    begin
       qryCatEstatus.FieldValues['iId_Estatus'] := 0 ;
    end
    else
     begin
       if connection.QryBusca.FieldValues['id'] = 0 then
        qryCatEstatus.FieldValues['iId_Estatus'] := 1
       else
        qryCatEstatus.FieldValues['iId_Estatus'] := connection.QryBusca.FieldValues['id'] + 1;
     end;

    qryCatEstatus.FieldValues['iColor'] := tiColores.ItemIndex;
    qryCatEstatus.Post ;
    cambio_estado;
 // except
 //   on E:Exception do
 //   begin
 //       ShowMessage('Ocurrio un error al Insertar, intentelo nuevamente mas tarde.' + E.Message);
 //   end;
  //end;

end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnCancelClick(Sender: TObject);
begin
  qryCatEstatus.Cancel;
  cambio_estado;
  sOpcion := '';
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnDeleteClick(Sender: TObject);
begin
  If qryCatEstatus.RecordCount > 0 then
  begin
    if msg_yn('Desea eliminar el Registro Activo?') then
    begin
      try
        qryCatEstatus.Delete;
      except
        on e : exception do
        begin
          UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Catalogo de Estatus de Empleados', 'Al eliminar registro', 0);
        end;
      end
    end
  end;
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnRefreshClick(Sender: TObject);
begin
  qryCatEstatus.refresh ;
end;

procedure TfrmCatalogoEstatusEquipo.frmBarra1btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCatalogoEstatusEquipo.qryCatEstatusAfterInsert(DataSet: TDataSet);
begin
  qryCatEstatus.FieldValues['sDescripcion'] := '*' ;
  qryCatEstatus.FieldValues['iAplicaEquiposActivos'] := 'N/A' ;
end;

procedure TfrmCatalogoEstatusEquipo.qryCatEstatusAfterScroll(DataSet: TDataSet);
begin
  if qryCatEstatus.RecordCount > 0 then
  begin
    if (qryCatEstatus.State <> dsInsert) then
      tiColores.ItemIndex := qryCatEstatus.FieldValues['iColor'];
  end;
end;

procedure TfrmCatalogoEstatusEquipo.dbequiposEnter(Sender: TObject);
begin
  dbequipos.Color := global_color_entradaERP;
end;

procedure TfrmCatalogoEstatusEquipo.dbequiposExit(Sender: TObject);
begin
  dbequipos.Color := global_color_salidaERP;
end;

procedure TfrmCatalogoEstatusEquipo.dbequiposKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then tsdescripcion.SetFocus;
end;

procedure TfrmCatalogoEstatusEquipo.tsIdGrupoKeyPress(Sender: TObject;var Key: Char);
begin
  If Key = #13 Then tsDescripcion.SetFocus
end;

procedure TfrmCatalogoEstatusEquipo.tiColoresEnter(Sender: TObject);
begin
  tiColores.Color := $00E6FEFF;
end;

procedure TfrmCatalogoEstatusEquipo.tiColoresExit(Sender: TObject);
begin
  tiColores.Color := global_color_salidaERP;
end;

procedure TfrmCatalogoEstatusEquipo.tsDescripcionEnter(Sender: TObject);
begin
  tsDescripcion.Color := global_color_entradaERP
end;

procedure TfrmCatalogoEstatusEquipo.tsDescripcionExit(Sender: TObject);
begin
  tsDescripcion.Color := global_color_salidaERP;
end;

procedure TfrmCatalogoEstatusEquipo.cambio_estado;
begin
  if qryCatEstatus.State in [dsInsert,dsEdit] then
  begin
    dxInsertar.Enabled      :=False;
    dxEditar.Enabled        :=False;
    dxGuardar.Enabled       :=True;
    dxCancelar.Enabled      :=True;
    dxEliminar.Enabled      :=False;
    dxImprimir.Enabled      :=False;
    dxRefrescar.Enabled     :=False;
    dxSalir.Enabled         :=False;
    grid_estatus.Enabled    :=False;
  end else
  if qryCatEstatus.State in [dsBrowse] then
  begin
    dxInsertar.Enabled      :=True;
    dxEditar.Enabled        :=True;
    dxGuardar.Enabled       :=False;
    dxCancelar.Enabled      :=False;
    dxEliminar.Enabled      :=True;
    dxImprimir.Enabled      :=True;
    dxRefrescar.Enabled     :=True;
    dxSalir.Enabled         :=True;
    grid_estatus.Enabled    :=True;
  end;
end;
end.

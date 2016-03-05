unit frmDoctosXcategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,global,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Mask,
  DBCtrls, AdvGlowButton, Grids, DBGrids, frm_barra, UnitValidacion, UnitValidaTexto,
  frm_connection, unitexcepciones, FormAutoScaler, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls;
                                                                          
type
  TFrm_DoctosxCategoria = class(TForm)
  zq_documentos: TZQuery;
  ds_documentos: TDataSource;
  strngfld_documentossDescripcion: TStringField;
  frmBarra1: TfrmBarra;
  zq_documentossa: TIntegerField;
  ZQTipoPersonal: TZQuery;
  ZQTipoPersonaliIdTipo: TIntegerField;
  ZQTipoPersonalsDescripcion: TStringField;
  dsZQTipoPersonal: TDataSource;
  zq_documentosDescripcionTipoPersonal: TStringField;
    zq_documentossTipoPersonal: TIntegerField;
    fsc_DoctosXCategoria: TFormAutoScaler;
    grid_Documentos: TcxGrid;
    grid_DocumentosDBTableView1: TcxGridDBTableView;
    grid_DocumentosDBTableView1Column1: TcxGridDBColumn;
    grid_DocumentosDBTableView1Column2: TcxGridDBColumn;
    grid_DocumentosLevel1: TcxGridLevel;
    grid_DocumentosDBTableView1Column3: TcxGridDBColumn;
    pnl1: TPanel;
    tslbldocumento: TLabel;
    tsDescripcion: TDBEdit;
    pnl2: TPanel;
    cbbCategorias: TDBLookupComboBox;
  procedure frmBarra1btnAddClick(Sender: TObject);
  procedure frmBarra1btnPostClick(Sender: TObject);
  procedure frmBarra1btnCancelClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure frmBarra1btnEditClick(Sender: TObject);
  procedure frmBarra1btnRefreshClick(Sender: TObject);
  procedure frmBarra1btnDeleteClick(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure tscategoriaKeyPress(Sender: TObject; var Key: Char);
  procedure cbbCategoriasCloseUp(Sender: TObject);
  procedure actualizar;
    procedure zq_documentosCalcFields(DataSet: TDataSet);
    procedure frmBarra1btnExitClick(Sender: TObject);
    procedure tsDescripcionEnter(Sender: TObject);
    procedure tsDescripcionExit(Sender: TObject);
private
  { Private declarations }

public
  { Public declarations }
end;
var
  Frm_DoctosxCategoria: TFrm_DoctosxCategoria;
  sIdOrig, sOpcion : string;
  ztQuery : TZQuery;

implementation
uses Utilerias, Func_Genericas;

{$R *.dfm}

procedure TFrm_DoctosxCategoria.cbbCategoriasCloseUp(Sender: TObject);
begin
  zq_documentos.Filtered := false;
  zq_documentos.Filter := 'sTipoPersonal= '+ QuotedStr(IntToStr(cbbCategorias.KeyValue));
  zq_documentos.Filtered := true;
end;

procedure TFrm_DoctosxCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrm_DoctosxCategoria.FormShow(Sender: TObject);
begin;
   actualizar;
end;

procedure TFrm_DoctosxCategoria.actualizar;
begin

  ZQTipoPersonal.Active:=False;
  ZQTipoPersonal.Open;

  zqTipoPersonal.First;
  cbbCategorias.KeyValue := zqTipoPersonal.FieldByName('iIdTipo').AsInteger;

  zq_documentos.Active := True;
  zq_documentos.open;

  zq_documentos.Filtered := false;
  zq_documentos.Filter := 'sTipoPersonal= '+ IntToStr(cbbCategorias.KeyValue);
  zq_documentos.Filtered := true;
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnAddClick(Sender: TObject);
begin
  grid_Documentos.Enabled := False;
  frmBarra1.btnAddClick(Sender);
  tsdescripcion.Enabled := True;
  cbbCategorias.Enabled:= False;

  connection.QryBusca.Active := False;
  connection.QryBusca.SQL.Clear;
  connection.QryBusca.SQL.Add('SELECT MAX(id_catalogoitemschecklist_doctos) AS id FROM rh_catalogoitemschecklist_doctos;');
  connection.QryBusca.Open;
  zq_documentos.Append;
  if connection.QryBusca.FieldValues['id'] = 0 then
    zq_documentos.FieldValues['id_catalogoitemschecklist_doctos'] := 1
  else
    zq_documentos.FieldValues['id_catalogoitemschecklist_doctos'] := connection.QryBusca.FieldByName('Id').AsInteger + 1;
  zq_documentos.FieldValues['sTipoPersonal'] := cbbCategorias.KeyValue;
  zq_documentos.FieldValues['sDescripcion']:= '';
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnCancelClick(Sender: TObject);
begin
  frmBarra1.btnCancelClick(Sender);
  tsdescripcion.Enabled := False;
  cbbCategorias.Enabled := True;
  zq_documentos.Cancel;
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnDeleteClick(Sender: TObject);
begin
  If zq_documentos.RecordCount > 0 then
  begin
    if MSG_YN('¿Desea eliminar el Registro?') then
      zq_documentos.Delete ;
  end else MSG_ER('No hay registros que eliminar');
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnEditClick(Sender: TObject);
begin
  If zq_documentos.RecordCount > 0 Then
  Begin
    zq_documentos.Edit ;
    frmBarra1.btneditClick(Sender);
    tsdescripcion.Enabled := True;
    grid_Documentos.Enabled:= False;
    cbbCategorias.Enabled := False;
  End else MSG_ER('No hay registros que editar');
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnPostClick(Sender: TObject);

begin
  try
    if length(trim(tsdescripcion.Text)) = 0 then
    begin
      MSG_ER('El campo "Descripción" no puede estar vacío');
      Exit;
    end;
    zq_documentos.Post ;
    frmBarra1.btnPostClick(sender);
    grid_Documentos.Enabled := True;
    tsdescripcion.Enabled := False;
    cbbCategorias.Enabled := True;
    except
      on e : exception do
      begin
        UnitExcepciones.manejarExcep(E.Message, E.ClassName, 'Documentos por Categoria', 'Al guardar registro', 0);
        frmBarra1.btnCancel.Click ;
        zq_documentos.Cancel;
      end;
  end;
end;

procedure TFrm_DoctosxCategoria.frmBarra1btnRefreshClick(Sender: TObject);
begin
  actualizar;
end;

procedure TFrm_DoctosxCategoria.tscategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then tsdescripcion.SetFocus;
end;

procedure TFrm_DoctosxCategoria.tsDescripcionEnter(Sender: TObject);
begin
tsdescripcion.color := global_color_entradaERP;
end;

procedure TFrm_DoctosxCategoria.tsDescripcionExit(Sender: TObject);
begin
tsdescripcion.color := global_color_salidaERP;
end;

procedure TFrm_DoctosxCategoria.zq_documentosCalcFields(DataSet: TDataSet);
begin
  if ZQTipoPersonal.Locate('iIdTipo', zq_documentos.FieldByName('sTipoPersonal').asinteger, []) then
  begin
    zq_documentos.FieldByName('DescripcionTipoPersonal').AsString := ZQTipoPersonal.FieldByName('sDescripcion').AsString;
  end;
end;

end.



unit frmCatalogodeCuentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DateUtils, frm_bancos,
  Grids, DBGrids, ExtCtrls, DBCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxDBGrid, NxDBColumns, NxColumns, StdCtrls, Mask, frm_barra, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxTextEdit, cxClasses,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGridLevel, cxGrid, dxBar, dxRibbonRadialMenu, global, frxClass, UFunctionsGHH, frxDBSet,
  cxContainer, cxCheckBox, cxDBEdit, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxRibbon, cxGroupBox;


type
  Tfrm_CatalogoCuentas = class(TForm)
    dszQCuentasBancarias: TDataSource;
    zQCuentasBancarias: TZQuery;
    frmBarra1: TfrmBarra;                                                                                     
    zQCuentasBancariassIdNumeroCuenta: TStringField;
    zQCuentasBancariassNombreCuenta: TStringField;
    zQCuentasBancariassFirmanCuenta: TStringField;
    zQCuentasBancariassInterbancaria: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    pnlComunidades: TPanel;
    grid_Comunidades: TcxGrid;
    Bview_grid_Comunidades: TcxGridDBTableView;
    Bview_grid_ComunidadessIdNumeroCuenta1: TcxGridDBColumn;
    Bview_grid_ComunidadessNombreCuenta1: TcxGridDBColumn;
    Bview_grid_ComunidadessFirmanCuenta1: TcxGridDBColumn;
    Bview_grid_ComunidadessInterbancaria1: TcxGridDBColumn;
    Bview_grid_ComunidadesiFolioCheque1: TcxGridDBColumn;
    Bview_grid_ComunidadesiFolioSinCheque1: TcxGridDBColumn;
    grid_ComunidadesLevel1: TcxGridLevel;
    strngfldQCuentasBancariassidCompaniaConf: TStringField;
    frxCuentas: TfrxReport;
    dbCatctasBan: TfrxDBDataset;
    qryBancos: TZQuery;
    dsBancos: TDataSource;
    strngfldQCuentasBancariassIdBanco: TStringField;
    zQCuentasBancariaseAplicaFiscal: TStringField;
    strngfldQCuentasBancariassFolioCheque: TStringField;
    strngfldQCuentasBancariassFolioSinCheque: TStringField;
    cxGroupBox1: TcxGroupBox;
    dbBanco: TDBLookupComboBox;
    lbl1: TLabel;
    chkAplicaFiscal: TcxCheckBox;
    btnCatalogoBanco: TButton;
    tfFolioSinCheque: TDBEdit;
    lbl2: TLabel;
    tiFolioCheque: TDBEdit;
    lbl3: TLabel;
    tsInterbancaria: TDBEdit;
    lbl4: TLabel;
    tsFirmanCuenta: TDBEdit;
    lbl5: TLabel;
    tsNombreCuenta: TDBEdit;
    lbl6: TLabel;
    tsIdNumeroCuenta: TDBEdit;
    lbl7: TLabel;
    dxbrmngr1: TdxBarManager;
    Editar1: TdxBarButton;
    Registrar1: TdxBarButton;
    Can1: TdxBarButton;
    Eliminar1: TdxBarButton;
    Salir1: TdxBarButton;
    Refresh1: TdxBarButton;
    Imprimir1: TdxBarButton;
    Insertar1: TdxBarButton;
    PopupPrincipal: TdxRibbonRadialMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tsIdNumeroCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure tsNombreCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure zQCuentasBancariasAfterInsert(DataSet: TDataSet);
    procedure tiFolioChequeKeyPress(Sender: TObject; var Key: Char);
    procedure frmBarra1btnEditClick(Sender: TObject);
    procedure frmBarra1btnPostClick(Sender: TObject);
    procedure frmBarra1btnCancelClick(Sender: TObject);
    procedure frmBarra1btnDeleteClick(Sender: TObject);
    procedure frmBarra1btnRefreshClick(Sender: TObject);
    procedure frmBarra1btnExitClick(Sender: TObject);
    procedure frmBarra1btnAddClick(Sender: TObject);
    procedure tsIdNumeroCuentaEnter(Sender: TObject);
    procedure tsIdNumeroCuentaExit(Sender: TObject);
    procedure tsNombreCuentaEnter(Sender: TObject);
    procedure tsNombreCuentaExit(Sender: TObject);
    procedure tsFirmanCuentaEnter(Sender: TObject);
    procedure tsFirmanCuentaExit(Sender: TObject);
    procedure tsInterbancariaKeyPress(Sender: TObject; var Key: Char);
    procedure tfFolioSinChequeKeyPress(Sender: TObject; var Key: Char);
    procedure tsFirmanCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure tsInterbancariaEnter(Sender: TObject);
    procedure tsInterbancariaExit(Sender: TObject);
    procedure tiFolioChequeExit(Sender: TObject);
    procedure tiFolioChequeEnter(Sender: TObject);
    procedure tfFolioSinChequeEnter(Sender: TObject);
    procedure tfFolioSinChequeExit(Sender: TObject);
    procedure btnPrinterClick(Sender: TObject);
    procedure zQCuentasBancariasAfterScroll(DataSet: TDataSet);
    procedure btnCatalogoBancoClick(Sender: TObject);
    procedure dbBancoEnter(Sender: TObject);
    procedure dbBancoExit(Sender: TObject);
    procedure dbBancoKeyPress(Sender: TObject; var Key: Char);
  private
  sMenuP: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CatalogoCuentas: Tfrm_CatalogoCuentas;

implementation

uses frm_connection, frm_ordenes, frmEgresos, frmGastos;

{$R *.dfm}

procedure Tfrm_CatalogoCuentas.btnCatalogoBancoClick(Sender: TObject);
begin
  //Mostrar el catalogo de bancos
  Application.CreateForm(TfrmBancos, frmBancos);

  frmBancos.FormStyle := fsMDIForm;
  frmBancos.Width := 800;
  frmBancos.Height := 600;
  frmBancos.Position := poDesktopCenter;
  frmBancos.Visible := False;

  frmBancos.ShowModal;
end;

procedure Tfrm_CatalogoCuentas.btnPrinterClick(Sender: TObject);
begin

    if not FileExists(global_files + global_miReporte + '_CADFrProyectos.fr3') then
  begin
   showmessage('El archivo de reporte '+global_Mireporte+'_CADFrProyectos.fr3 no existe, notifique al administrador del sistema');
   exit;
  end;
  if zQCuentasbancarias.RecordCount > 0 Then
    begin
        frxCuentas.PreviewOptions.MDIChild := False ;
        frxCuentas.PreviewOptions.Modal := True ;
        frxCuentas.PreviewOptions.ShowCaptions := False ;
        frxCuentas.Previewoptions.ZoomMode := zmPageWidth ;
        frxCuentas.LoadFromFile(global_files + global_miReporte + '_CADFrProyectos.fr3') ;
        frxCuentas.ShowReport(connection.configuracion.FieldByName('sFormatos').AsString, PermisosExportar(connection.zConnection, global_grupo, sMenuP))
    end ;
end;

procedure Tfrm_CatalogoCuentas.dbBancoEnter(Sender: TObject);
begin
  dbBanco.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.dbBancoExit(Sender: TObject);
begin
  dbBanco.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.dbBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
        tsIdNumeroCuenta.SetFocus ;
end;

procedure Tfrm_CatalogoCuentas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree ;
  if global_frmActivo = 'frm_ordenes' then
  begin
    //frmordenes.OrdenesdeTrabajo.Refresh;
    frmordenes.tsNumeroCuenta.KeyValue:=zQCuentasBancarias.FieldValues['sIdNumeroCuenta'];
  end;
end;

procedure Tfrm_CatalogoCuentas.FormShow(Sender: TObject);
begin
   zQCuentasBancarias.Active := False ;
   zQCuentasBancarias.SQL.Clear ;
   zQCuentasBancarias.SQL.Add('select * from con_cuentasbancarias Where sIdCompaniaconf=:CompConf ' +
                             'order by sIdNumeroCuenta') ;
   zQCuentasBancarias.Params.ParamByName('CompConf').DataType := ftString ;
   zQCuentasBancarias.Params.ParamByName('CompConf').Value    := global_contrato ;
   zQCuentasBancarias.Open ;

   try
      qryBancos.Active := False ;
      qryBancos.Open ;
   except
    on e:exception do
    begin
       ShowMessage(e.Message);
    end;

   end;

end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnAddClick(Sender: TObject);
begin
  zQCuentasBancarias.Append ;
  frmBarra1.btnEditClick(Sender);
  tsIdNumeroCuenta.SetFocus
  //popmenuAgregar.
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnCancelClick(Sender: TObject);
begin
  zQCuentasBancarias.Cancel ;
  frmBarra1.btnCancelClick(Sender);
  Insertar1.Enabled := True ;
  Editar1.Enabled := True ;
  Registrar1.Enabled := false ;
  Can1.Enabled := false ;
  Eliminar1.Enabled := True ;
  Imprimir1.Enabled := True ;
  Refresh1.Enabled := True ;
  Salir1.Enabled := True ;
  grid_Comunidades.Enabled:=True;
  tsIdNumeroCuenta.Enabled := True;
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnDeleteClick(Sender: TObject);
begin
  If zQCuentasBancarias.RecordCount  > 0 then
    if MessageDlg('Desea eliminar el Registro Activo?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Connection.QryBusca.Active := False ;
        Connection.qryBusca.SQL.Clear ;
        Connection.QryBusca.SQL.Add('Select sIdNumeroCuenta from con_tesoreriaegresos Where sIdNumeroCuenta =:Cuenta');
        Connection.QryBusca.Params.ParamByName('Cuenta').DataType := ftString ;
        Connection.QryBusca.Params.ParamByName('Cuenta').Value    := zQCuentasBancarias.FieldValues['sIdNumeroCuenta'] ;
        Connection.QryBusca.Open ;
        If Connection.QryBusca.RecordCount > 0 Then
          MessageDlg('NO SE PUEDE BORRAR, EXISTE EN EGRESOS.', mtInformation, [mbOk], 0)
        Else
          zQCuentasBancarias.Delete ;
      except
        MessageDlg('Ocurrio un error al eliminar el registro.', mtInformation, [mbOk], 0);
      end
    end
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnEditClick(Sender: TObject);
begin
  If zQCuentasBancarias.RecordCount > 0 Then
  begin

    frmBarra1.btnEditClick(Sender);
    zQCuentasBancarias.Edit ;
    Insertar1.Enabled := False ;
    Editar1.Enabled := False ;
    Registrar1.Enabled := True ;
    Can1.Enabled := True ;
    Eliminar1.Enabled := False ;
    Imprimir1.Enabled := False ;
    Refresh1.Enabled := False ;
    Salir1.Enabled := False ;
    grid_Comunidades.Enabled:=False;
    zQCuentasBancarias.Edit ;
    tsIdNumeroCuenta.Enabled := False;
  end ;
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnExitClick(Sender: TObject);
begin
  frmBarra1.btnExitClick(Sender);
  close;
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnPostClick(Sender: TObject);
var
  existe : integer;
begin
  if tsIdNumeroCuenta.text='' then
  begin
    tsIdNumeroCuenta.setfocus;
    abort;
  end;
  if tsNombreCuenta.text=''   then
  begin
    tsNombreCuenta.setfocus;
    abort;
  end;
  if tsFirmanCuenta.text=''   then
  begin
    tsFirmanCuenta.setfocus;
    abort;
  end;
  if tfFolioSinCheque.text=''          then
  begin
    tfFolioSinCheque.setfocus;
    abort;
  end;
  if tiFolioCheque.text=''    then
  begin
    tiFolioCheque.setfocus;
    abort;
  end;
  if tsInterbancaria.text=''          then
  begin
    tsInterbancaria.setfocus;
    abort;
  end;
  Connection.QryBusca.Active := False ;
  Connection.qryBusca.SQL.Clear ;
  Connection.QryBusca.SQL.Add('Select sIdNumeroCuenta from con_cuentasbancarias Where sIdNumeroCuenta = '+ QuotedStr(trim(tsIdNumeroCuenta.text)));
  Connection.QryBusca.Open ;

  existe := connection.QryBusca.RecordCount;

  if zQCuentasBancarias.State in [dsEdit] then
    existe := 0;

  //if (zQCuentasBancarias.Locate('sIdNumeroCuenta', trim(tsIdNumeroCuenta.text), [])) then //Se posiciona sobre el registro
  if existe = 0 then
  begin
     zQCuentasBancarias.FieldValues['sIdCompaniaConf'] := global_contrato ;

     if chkAplicaFiscal.Checked then
      zQCuentasBancarias.FieldByName('eAplicaFiscal').AsString := 'Si'
     else
      zQCuentasBancarias.FieldByName('eAplicaFiscal').AsString := 'No';
      
      zQCuentasBancarias.FieldByName('sIdBanco').AsString := dbBanco.KeyValue;

     zQCuentasBancarias.Post ;
     MessageDlg('Los datos se guardaron correctamente!', mtInformation, [mbOk], 0);
     frmBarra1.btnPostClick(Sender);
     Insertar1.Enabled := True ;
     Editar1.Enabled := True ;
     Registrar1.Enabled := false ;
     Can1.Enabled := false ;
     Eliminar1.Enabled := True ;
     Imprimir1.Enabled := True ;
     Refresh1.Enabled := True ;
     Salir1.Enabled := True ;
     grid_Comunidades.Enabled:=True;

     tsIdNumeroCuenta.Enabled := True;
  end
  else
  begin
     MessageDlg('El id ya se encuentra registrado.', mtInformation, [mbOk], 0);
     abort;
  end;

  //Si impresion de cheques esta abiertoa, entonces que la cuenta de banco k se cree que se coloque en el combo
  if (Assigned(frm_Egresos)) and (frm_Egresos.Visible = True) then
   begin
       frm_Egresos.zQCuentasBancarias.Refresh;
       frm_Egresos.tsIdCuentaBancaria.KeyValue := zQCuentasBancarias.FieldValues['sIdNumeroCuenta'];
       frm_Egresos.tsIdCuentaBancaria.SetFocus;
       Close;
   end;

   if (Assigned(frm_Gastos)) and (frm_Gastos.Visible = True) then
   begin
       frm_Gastos.zQCuentasBancarias.Refresh;
       frm_Gastos.tsIdCuentaBancaria.KeyValue := zQCuentasBancarias.FieldValues['sIdNumeroCuenta'];
       frm_Gastos.tsIdCuentaBancaria.SetFocus;
       Close;
   end;

   if Assigned(frmOrdenes) then
  begin
    frmOrdenes.zQCuentasBancarias.Active:=False;
    frmOrdenes.zQCuentasBancarias.Open;
    frmOrdenes.tsNumeroCuenta.KeyValue := zQCuentasBancarias.FieldValues['sIdNumeroCuenta'];
    frmOrdenes.tsNumeroCuenta.SetFocus;
    Close;
  end;
end;

procedure Tfrm_CatalogoCuentas.frmBarra1btnRefreshClick(Sender: TObject);
begin
  zQCuentasBancarias.Active:=False;
  zQCuentasBancarias.Open;
end;

procedure Tfrm_CatalogoCuentas.tfFolioSinChequeEnter(Sender: TObject);
begin
   tfFolioSinCheque.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.tfFolioSinChequeExit(Sender: TObject);
begin
   tfFolioSinCheque.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.tfFolioSinChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 Then
        dbBanco.SetFocus ;

    if not(Key in ['0'..'9',#8]) then
    begin
      Key:=#0;
    end;
end;

procedure Tfrm_CatalogoCuentas.tiFolioChequeEnter(Sender: TObject);
begin
  tiFolioCheque.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.tiFolioChequeExit(Sender: TObject);
begin
  tiFolioCheque.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.tiFolioChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
      tfFolioSinCheque.SetFocus;

    if not(Key in ['0'..'9',#8]) then
    begin
      Key:=#0;
    end;
end;

procedure Tfrm_CatalogoCuentas.tsFirmanCuentaEnter(Sender: TObject);
begin
   tsFirmanCuenta.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.tsFirmanCuentaExit(Sender: TObject);
begin
    tsFirmanCuenta.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.tsFirmanCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key=#13 then
      tsInterbancaria.SetFocus ;
  
end;

procedure Tfrm_CatalogoCuentas.tsIdNumeroCuentaEnter(Sender: TObject);
begin
  tsIdNumeroCuenta.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.tsIdNumeroCuentaExit(Sender: TObject);
begin
   tsIdNumeroCuenta.Color := clWhite; ;
end;

procedure Tfrm_CatalogoCuentas.tsIdNumeroCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
        tsNombreCuenta.SetFocus
end;

procedure Tfrm_CatalogoCuentas.tsInterbancariaEnter(Sender: TObject);
begin
  tsInterbancaria.Color := global_color_entradaERP ;
end;

procedure Tfrm_CatalogoCuentas.tsInterbancariaExit(Sender: TObject);
begin
  tsInterbancaria.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.tsInterbancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13  Then
       tiFolioCheque.SetFocus ;

   if not(Key in ['0'..'9',#8]) then
  begin
    Key:=#0;
  end;
end;

procedure Tfrm_CatalogoCuentas.tsNombreCuentaEnter(Sender: TObject);
begin
  tsNombreCuenta.Color := global_color_EntradaErp ;
end;

procedure Tfrm_CatalogoCuentas.tsNombreCuentaExit(Sender: TObject);
begin
    tsNombreCuenta.Color := clWhite;
end;

procedure Tfrm_CatalogoCuentas.tsNombreCuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
        tsFirmanCuenta.SetFocus 
end;

procedure Tfrm_CatalogoCuentas.zQCuentasBancariasAfterInsert(DataSet: TDataSet);
begin
    zqCuentasBancarias.FieldValues['sIdNumeroCuenta'] := '*' ;
    zqCuentasBancarias.FieldValues['sNombreCuenta'] := '*' ;
    zqCuentasBancarias.FieldValues['sFirmanCuenta'] := '*' ;
end;

procedure Tfrm_CatalogoCuentas.zQCuentasBancariasAfterScroll(DataSet: TDataSet);
begin
  if zQCuentasBancarias.FieldByName('eAplicaFiscal').AsString = 'Si' then
    chkAplicaFiscal.Checked := True
  else
    chkAplicaFiscal.Checked := False;
end;

end.

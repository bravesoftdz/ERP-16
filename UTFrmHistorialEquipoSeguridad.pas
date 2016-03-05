unit UTFrmHistorialEquipoSeguridad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, global,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxNavigator, DB, cxDBData, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ExtCtrls, frm_barra, Menus, cxButtons;

type
  TFrmHistorialEquipoSeguridad = class(TForm)
    frmBarra1: TfrmBarra;
    pnlGrid: TPanel;
    CxGridEquipoSeguridad: TcxGrid;
    CxGridEquipo: TcxGridDBTableView;
    CxColumnCxGridEquiposStatusPersonal: TcxGridDBColumn;
    CxColumnCxGridEquiposCuenta: TcxGridDBColumn;
    CxColumnCxGridEquiposCuentaInterbancaria: TcxGridDBColumn;
    CxColumnCxGridEquipoiId_Puesto: TcxGridDBColumn;
    CxLevelCxGridEquipoSeguridadLevel1: TcxGridLevel;
    pnlDatos: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dbedtdtalla: TDBEdit;
    DbDateEdtFecha: TDBDateEdit;
    zEquipoSeguridad: TZQuery;
    dsEquipoSeguridad: TDataSource;
    dbMemoNotas: TDBMemo;
    CxColumnEquipo: TcxGridDBColumn;
    CxColumnTalla: TcxGridDBColumn;
    CxColumnNota: TcxGridDBColumn;
    CxDBCboxEquipo: TDBComboBox;
    CxColumnFecha: TcxGridDBColumn;
    btnEfecVendedorActualRemoverTipo: TcxButton;
    btnEfecVendedorActualEnum: TcxButton;
    pnlTiposDocumentos: TPanel;
    lbl5: TLabel;
    edtCampo: TEdit;
    btnAgregarCampo: TButton;
    btnCancelar: TButton;
    procedure zEquipoSeguridadAfterOpen(DataSet: TDataSet);
    procedure zEquipoSeguridadAfterRefresh(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure frmBarra1btnPostClick(Sender: TObject);
    procedure frmBarra1btnCancelClick(Sender: TObject);
    procedure frmBarra1btnDeleteClick(Sender: TObject);
    procedure frmBarra1btnEditClick(Sender: TObject);
    procedure frmBarra1btnRefreshClick(Sender: TObject);
    procedure frmBarra1btnExitClick(Sender: TObject);
    procedure frmBarra1btnAddClick(Sender: TObject);
    procedure CxDBCboxEquipoEnter(Sender: TObject);
    procedure CxDBCboxEquipoExit(Sender: TObject);
    procedure CxDBCboxEquipoKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtdtallaEnter(Sender: TObject);
    procedure dbedtdtallaExit(Sender: TObject);
    procedure dbedtdtallaKeyPress(Sender: TObject; var Key: Char);
    procedure DbDateEdtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure DbDateEdtFechaEnter(Sender: TObject);
    procedure DbDateEdtFechaExit(Sender: TObject);
    procedure dbMemoNotasEnter(Sender: TObject);
    procedure dbMemoNotasExit(Sender: TObject);
    procedure btnEfecVendedorActualEnumClick(Sender: TObject);

    function ObtenerListaEnum(campo : string ) : string;
    function ObtenerCampos( Lista : string ): TStringList;
    procedure btnEfecVendedorActualRemoverTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    procedure EstadoBotones;
    { Private declarations }
  public
    idPersonal: Integer;
    { Public declarations }
  end;

var
  FrmHistorialEquipoSeguridad: TFrmHistorialEquipoSeguridad;

implementation

{$R *.dfm}
uses
  frm_connection, frmEmpleados;

{ TFrmHistorialEquipoSeguridad }

procedure TFrmHistorialEquipoSeguridad.btnEfecVendedorActualEnumClick(
  Sender: TObject);
  var
  Form : TForm;
  X : integer;
  Campos : string;

  enum : TStringList;
  error : boolean;
begin
  //Agregar un nuevo item al combo
  try
    try
    error := false;
      Form := TForm.Create(nil);
      form.Width := 210;
      Form.Height := 135;
      form.BorderStyle := bsDialog;
      form.BorderIcons := [biSystemMenu];
      form.Caption := '';
      form.Position := poScreenCenter;
      edtcampo.Text := '';
      pnlTiposDocumentos.Parent := form;
      pnlTiposDocumentos.Align := alclient;
      pnlTiposDocumentos.Visible := true;

      if ( form.ShowModal = mrOk ) and ( Length( Trim( edtCampo.Text ) ) > 0 ) then
      begin
        with connection.zCommand do
        begin
          with CxDBCboxEquipo do
          begin
            for x := 0 to Length(edtCampo.Text) - 1 do
            begin
              if edtCampo.text[x] = char(44) then
                raise exception.Create('El nuevo campo no puede contener comas(",")');
            end;

            for x := 0 to Items.Count do
            begin
              if lowercase( Items[x] ) = lowercase( Trim( edtCampo.Text ) ) then
                raise exception.Create('El campo ya existe');
            end;

            campos := '';
            for x := 0 to Items.Count - 1 do
              campos := campos + QuotedStr( Items[x] ) + ',';

            campos := campos + QuotedStr( Trim( edtCampo.Text ) );
          end;

          active := false;
          sql.Text := 'alter table rh_historialequiposeguridad modify column eEquipoSeguridad enum('+campos+') default ' + QuotedStr( CxDBCboxEquipo.Items[0] );
          execsql;
          CxDBCboxEquipo.Text := Trim( edtCampo.Text );
        end;
      end;
    except
      on e:Exception do
      begin
         MessageDlg('No se puede continuar'+#10 + e.Message, mtinformation,  [mbok], 0);
         error := True;
      end;

    end;
  finally
    pnlTiposDocumentos.Parent := FrmHistorialEquipoSeguridad;
    pnlTiposDocumentos.Align := alnone;
    pnlTiposDocumentos.Visible := false;
    pnlTiposDocumentos.Left := 0;
    pnlTiposDocumentos.top := 0;
    pnlTiposDocumentos.width := 0;
    pnlTiposDocumentos.height := 0;

    enum := ObtenerCampos( ObtenerListaEnum( CxDBCboxEquipo.DataField ) );

    CxDBCboxEquipo.Items.Clear;
    for x := 0 to enum.Count - 1 do
      CxDBCboxEquipo.Items.Add( enum[x] );

    if error = true then
    begin
       CxDBCboxEquipo.ItemIndex := 0;
    end
    else
    begin
       CxDBCboxEquipo.ItemIndex := x - 1;
    end;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.btnEfecVendedorActualRemoverTipoClick(
  Sender: TObject);
var
  x : integer;
  campos : string;

  enum : TStringList;
begin
  //Eliminar item
  with connection.qrybusca do
  begin
    active := false;
    sql.text := 'Select * From rh_historialequiposeguridad where eEquipoSeguridad = :equipo limit 1';
    parambyname('equipo').asstring := CxDBCboxEquipo.Text;
    open;
  end;

  if connection.qrybusca.RecordCount = 0 then
  begin
    campos := '';
    for x := 0 to CxDBCboxEquipo.Items.Count - 1 do
    begin
      if lowercase( CxDBCboxEquipo.items[x] ) <> lowercase( CxDBCboxEquipo.text) then
        campos := campos + QuotedStr( CxDBCboxEquipo.Items[x] ) + ',';
    end;

    campos[ Length( campos ) ] := char(41);

    if messagedlg('Desea eliminar el tipo de documento: '+ CxDBCboxEquipo.Text, mtconfirmation, [mbyes, mbcancel], 0 ) = mryes then
    begin
      with connection.zcommand do
      begin
        active := false;
        sql.Text := 'alter table rh_historialequiposeguridad modify column eEquipoSeguridad enum('+campos+' default NULL';
        execsql;
      end;
    end;

    application.ProcessMessages;

    enum := ObtenerCampos( ObtenerListaEnum( CxDBCboxEquipo.DataField ) );

    CxDBCboxEquipo.Items.Clear;
    for x := 0 to enum.Count - 1 do
      CxDBCboxEquipo.Items.Add( enum[x] );

    //CxDBCboxEquipo.text := CxDBCboxEquipo.items[0];
    CxDBCboxEquipo.ItemIndex := 0;
  end
  else
    MessageDlg('No se puede eliminar ya hay registros asignados al equipo: '+ CxDBCboxEquipo.Text, mtinformation, [mbok], 0);
end;

procedure TFrmHistorialEquipoSeguridad.CxDBCboxEquipoEnter(Sender: TObject);
begin
   CxDBCboxEquipo.Color := global_color_entradaERP;
end;

procedure TFrmHistorialEquipoSeguridad.CxDBCboxEquipoExit(Sender: TObject);
begin
   CxDBCboxEquipo.Color := global_color_salidaERP;
end;

procedure TFrmHistorialEquipoSeguridad.CxDBCboxEquipoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
       dbedtdtalla.SetFocus;
end;

procedure TFrmHistorialEquipoSeguridad.DbDateEdtFechaEnter(Sender: TObject);
begin
    DbDateEdtFecha.Color := global_color_entradaERP;
end;

procedure TFrmHistorialEquipoSeguridad.DbDateEdtFechaExit(Sender: TObject);
begin
    DbDateEdtFecha.Color := global_color_salidaERP;
end;

procedure TFrmHistorialEquipoSeguridad.DbDateEdtFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
       dbmemonotas.SetFocus;
end;

procedure TFrmHistorialEquipoSeguridad.dbedtdtallaEnter(Sender: TObject);
begin
    dbedtdtalla.Color := global_color_entradaERP;
end;

procedure TFrmHistorialEquipoSeguridad.dbedtdtallaExit(Sender: TObject);
begin
    dbedtdtalla.Color := global_color_salidaERP;
end;

procedure TFrmHistorialEquipoSeguridad.dbedtdtallaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
       DbDateEdtFecha.SetFocus;
end;

procedure TFrmHistorialEquipoSeguridad.dbMemoNotasEnter(Sender: TObject);
begin
    dbMemoNotas.Color := global_color_entradaERP;
end;

procedure TFrmHistorialEquipoSeguridad.dbMemoNotasExit(Sender: TObject);
begin
    dbMemoNotas.Color := global_color_salidaERP;
end;

procedure TFrmHistorialEquipoSeguridad.EstadoBotones;
var
  Estado: Boolean;
begin
  estado := Not (zEquipoSeguridad.State in [dsInsert, dsEdit]);
  frmBarra1.btnAdd.Enabled := Estado;
  frmBarra1.btnEdit.Enabled := Estado;
  frmBarra1.btnDelete.Enabled := Estado;
  frmBarra1.btnPrinter.Enabled := Estado;
  frmBarra1.btnRefresh.Enabled := Estado;
  frmBarra1.btnCancel.Enabled := Not Estado;
  frmBarra1.btnPost.Enabled := Not Estado;
  CxDBCboxEquipo.Enabled := Not Estado;
  dbedtdtalla.Enabled := not Estado;
  DbDateEdtFecha.Enabled := Not Estado;
  dbMemoNotas.Enabled := Not Estado;

  Estado := False;
  Estado := (zEquipoSeguridad.Active) and (zEquipoSeguridad.RecordCount > 0) and Not (zEquipoSeguridad.State in [dsInsert, dsEdit]);
  frmBarra1.btnDelete.Enabled := Estado;
  frmBarra1.btnEdit.Enabled := Estado;
end;

procedure TFrmHistorialEquipoSeguridad.FormCreate(Sender: TObject);
var
  Cursor: TCursor;
  campos : TStringList;
  x : integer;
begin
  //Colocar los items de equipos de seguridad
  campos := ObtenerCampos( ObtenerListaEnum( CxDBCboxEquipo.DataField ) );

  CxDBCboxEquipo.Items.Clear;
  for x := 0 to campos.Count - 1 do
    CxDBCboxEquipo.Items.Add( campos[x] );
end;

procedure TFrmHistorialEquipoSeguridad.FormShow(Sender: TObject);
var
  Cursor: TCursor;
begin
  try
    Cursor := Screen.Cursor;
    Screen.Cursor := crAppStart;
    try
      zEquipoSeguridad.Active := False;
      zEquipoSeguridad.Connection := Connection.zConnection;
      zEquipoSeguridad.SQL.Clear;
      zEquipoSeguridad.SQL.Text := 'Select * from rh_historialEquipoSeguridad where iIdPersonal=:IdPersonal';
      zEquipoSeguridad.Params.ParamByName('IdPersonal').DataType := ftString;
      zEquipoSeguridad.Params.ParamByName('IdPersonal').Value := frm_Empleados.zQEmpleados.FieldByName('idPersonal').AsInteger;
      zEquipoSeguridad.Open;

      EstadoBotones;
    finally
      Screen.Cursor := Cursor;
    end;
  except
    on e: Exception do
      MessageDlg('Ha ocurrido un error inesperado, informar al administrador del sistema del siguiente error: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnAddClick(Sender: TObject);
begin
  try
    if zEquipoSeguridad.Active then
       zEquipoSeguridad.Append;
       CxDBCboxEquipo.ItemIndex := 0;
       zEquipoSeguridad.FieldValues['eEquipoSeguridad'] := CxDBCboxEquipo.Text;
  finally
    EstadoBotones;
  end;

end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnCancelClick(Sender: TObject);
begin
  try
    if zEquipoSeguridad.State in [dsInsert, dsEdit] then
      zEquipoSeguridad.Cancel;
  finally
    EstadoBotones;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnDeleteClick(Sender: TObject);
var
  Str: string;
begin
  try
    Str := zEquipoSeguridad.FieldByName('eEquipoSeguridad').AsString + ' Talla: ' + IntToStr(zEquipoSeguridad.FieldByName('dTalla').AsInteger);
    if zEquipoSeguridad.RecordCount > 0 then
       if MessageDlg('¿Estás seguro que deseas eliminar [' + Str + ']?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          zEquipoSeguridad.Delete;
          zEquipoSeguridad.Refresh;
          MessageDlg('Registro eliminado con éxito', mtInformation, [mbOK], 0);
       end;
  finally
     EstadoBotones;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnEditClick(Sender: TObject);
begin
  try
    if (zEquipoSeguridad.Active) and (zEquipoSeguridad.RecordCount > 0)  then
      zEquipoSeguridad.Edit;
  finally
    EstadoBotones;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnPostClick(Sender: TObject);
begin
  if CxDBCboxEquipo.ItemIndex = -1 then
  begin
    messageDlg('Seleccione un equipo de seguridad a registrar.', mtInformation, [mbOK], 0);
    if CxDBCboxEquipo.CanFocus then
      CxDBCboxEquipo.SetFocus;
    Exit;
  end;
  if Length(trim(DbDateEdtFecha.Text)) = 0 then
  begin
    messageDlg('Determine una fecha de entrega de equipo de seguridad', mtInformation, [mbOK], 0);
    if DbDateEdtFecha.CanFocus then
      DbDateEdtFecha.SetFocus;
    Exit;
  end;

  if zEquipoSeguridad.State in [dsInsert, dsEdit] then
  begin
    try
      zEquipoSeguridad.FieldByName('iIdPersonal').AsInteger := frm_Empleados.zQEmpleados.FieldByName('idPersonal').AsInteger;
      zEquipoSeguridad.Post;
      MessageDlg('Registro guardado con éxito', mtInformation, [mbOK], 0);
    finally
      EstadoBotones;
    end;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.frmBarra1btnRefreshClick(
  Sender: TObject);
begin
  try
    if zEquipoSeguridad.Active then
      zEquipoSeguridad.Refresh;
  finally
    EstadoBotones;
  end;
end;

function TFrmHistorialEquipoSeguridad.ObtenerCampos(Lista: string): TStringList;
var
  items : TStringList;
  x, y,
  inicio,
  fin : integer;
  tmp : string;
begin
  //Obtener campos
  items := TStringList.Create();
  if Length( Trim( lista ) ) > 0 then
  begin
    x := 1 ;
    inicio := x;
    fin := -1;
    while x <= Length( Lista ) + 1 do
    begin
      if ( lista[x] = '*' ) or ( lista[x] = #0 ) then
      begin
        tmp := '';
        for y := inicio to x - 1 do
          tmp := tmp + lista[y];

        items.Add( tmp );
        inicio := x + 1;
      end;
      inc(x);
    end;
  end;

  result := items;
end;

function TFrmHistorialEquipoSeguridad.ObtenerListaEnum(campo: string): string;
var
  zqConsulta : TZReadOnlyQuery;
  x,
  inicio,
  fin : integer;

  cadena,
  res : string;
begin
  //Obtener lista enum
  inicio := -1;
  fin := -1;

  try
    zqConsulta := TZReadOnlyQuery.Create(nil);
    zqConsulta.Connection := connection.zConnection;
    with zqConsulta do
    begin
      active := false;
      sql.text := 'select replace( replace( replace(  '+
                      'replace( '+
                        'replace( '+
                          'information_schema.COLUMNS.COLUMN_TYPE , "enum", "") '+
                      ', "(" , "") '+
                     ', ")", "" ) '+
                    ', char(39), ""), ",", "*" ) as COLUMN_TYPE '+#13+#10+
                  'from information_schema.COLUMNS '+
                  'where information_schema.COLUMNS.TABLE_SCHEMA = :basededatos '+
                  '&& information_schema.COLUMNS.TABLE_NAME = "rh_historialequiposeguridad" '+
                  '&& information_schema.COLUMNS.DATA_TYPE = "enum" '+
                  '&& information_schema.COLUMNS.COLUMN_NAME = :campo ';
      parambyname('basededatos').AsString := connection.Database;
      parambyname('campo').AsString := campo;
      open;
    end;
    res := '';
    if zqConsulta.RecordCount > 0 then
      res := zqConsulta.FieldByName('COLUMN_TYPE').AsString;

    Result := res;
  finally
    zqConsulta.Free;
  end;
end;

procedure TFrmHistorialEquipoSeguridad.zEquipoSeguridadAfterOpen(
  DataSet: TDataSet);
var
  Estado: Boolean;
begin
  Estado := (zEquipoSeguridad.Active) and (zEquipoSeguridad.RecordCount > 0);
  frmBarra1.btnDelete.Enabled := Estado;
  frmBarra1.btnEdit.Enabled := Estado;
end;

procedure TFrmHistorialEquipoSeguridad.zEquipoSeguridadAfterRefresh(
  DataSet: TDataSet);
var
  Estado: Boolean;
begin
  Estado := (zEquipoSeguridad.Active) and (zEquipoSeguridad.RecordCount > 0);
  frmBarra1.btnDelete.Enabled := Estado;
  frmBarra1.btnEdit.Enabled := Estado;
end;

end.

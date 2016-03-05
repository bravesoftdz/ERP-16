unit UFrmRequisicionesGlobales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, NxPageControl, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, exportaExcel, UinteliDialog, comObj, frm_connection,
  DateUtils;

type
  TFrmRequisicionesGlobales = class(TForm)
    NxPageControl1: TNxPageControl;
    NxTabSheet1: TNxTabSheet;
    FiltroDos: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    FechaInicio: TDateTimePicker;
    FechaFinal: TDateTimePicker;
    chkFechas: TCheckBox;
    FiltroUno: TGroupBox;
    cboProveedores: TDBLookupComboBox;
    chkTodosProveedores: TCheckBox;
    GroupBox1: TGroupBox;
    cboReferencias: TDBLookupComboBox;
    ChkTodasReferencias: TCheckBox;
    GroupBox3: TGroupBox;
    cboMateriales: TDBLookupComboBox;
    chkTodosMateriales: TCheckBox;
    btnImprimir: TButton;
    zConceptos: TZQuery;
    zRequisiciones: TZQuery;
    zCantidades: TZQuery;
    qryProveedores: TZReadOnlyQuery;
    dsProveedores: TDataSource;
    qryReferencias: TZReadOnlyQuery;
    dsReferencias: TDataSource;
    qryMateriales: TZReadOnlyQuery;
    dsMateriales: TDataSource;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkTodosProveedoresClick(Sender: TObject);
    procedure ChkTodasReferenciasClick(Sender: TObject);
    procedure chkTodosMaterialesClick(Sender: TObject);
    procedure chkFechasClick(Sender: TObject);
    procedure FechaFinalClick(Sender: TObject);
    procedure cboProveedoresCloseUp(Sender: TObject);
    procedure cboReferenciasCloseUp(Sender: TObject);
    procedure cboMaterialesCloseUp(Sender: TObject);
    procedure FechaInicioChange(Sender: TObject);
    procedure FechaFinalChange(Sender: TObject);
  private
    { Private declarations }
    function fechaSQL(Fecha: TDate): string;
    procedure CargarDatosFiltrados();
  public
    { Public declarations }
    desde,hasta: String;
    Proveedor, Referencia, Material: String;
  end;

var
  FrmRequisicionesGlobales: TFrmRequisicionesGlobales;

implementation

{$R *.dfm}

procedure TFrmRequisicionesGlobales.btnImprimirClick(Sender: TObject);
var
  ExApp, Rango: Variant;
  Continuar: Boolean;
  FilaInicio, ColInicio, recFila, recColumna: Integer ;
  Contrato: String;
  TempPath: String;
  LogoFile: String;
begin
  try
    Try
      Continuar     := True;
      ExApp := CreateOleObject('Excel.Application');
      ExApp.Visible := True;
      ExApp.DisplayAlerts := False;
      ExApp.Workbooks.Add;
    Except
      on e:Exception do
      begin
        Continuar := False;
        InteliDialog.ShowModal('Ha ocurrido un error.','Al parecer no el equipo no tiene instalado Microsoft Excel, Contacte a su administrador de sistema para poder utilizar esta característica', mtError, [mbOK], 0);
      end;
    End;

    if Continuar then
    begin
      CargarDatosFiltrados();
      //datos de la empresa
      FormatoTexto(ExApp.Range['C1:Q5'], 'Arial', 10, False, True);
      ExApp.Range['C1:E1'] := 'EMPRESA:';
      ExApp.Range['C1:E1'].mergeCells := True;
      ExApp.Range['F1:Q1'] := connection.configuracion.FieldByName('sNombre').asString;
      ExApp.Range['F1:Q1'].MergeCells := True;
      ExApp.Range['F1:Q1'].HorizontalAlignment := -4131;

      ExApp.Range['C2:E2'] := 'RFC:';
      ExApp.Range['C2:E2'].mergeCells := True;
      ExApp.Range['F2:Q2'] := connection.configuracion.FieldByName('sRFC').asString;
      ExApp.Range['F2:Q2'].MergeCells := True;
      ExApp.Range['F2:Q2'].HorizontalAlignment := -4131;

      ExApp.Range['C3:E3'] := 'CONTRATO:';
      ExApp.Range['C3:E3'].MergeCells := True;
      ExApp.Range['F3:Q3'] := connection.configuracion.FieldByName('sContrato').asString;

      ExApp.Range['F3:Q3'].MergeCells := True;
      ExApp.Range['F3:Q3'].HorizontalAlignment := -4131;

      ExApp.Range['A6:A7'] := 'PRODUCTOS';
      ExApp.Range['B6:B7'] := 'UNIDAD';
      ExApp.Range['A6:A7'].MergeCells := true;
      ExApp.Range['B6:B7'].MergeCells := true;
      ExApp.Range['B6:B7'].Orientation := 90;
      FormatoTexto(ExApp.Range['A6:B7'], 'Arial',11,True,True);
      ExApp.Columns['A:A'].ColumnWidth := 47;
      ExApp.Columns['A:A'].WrapText := True;
      ExApp.Columns['B:B'].ColumnWidth := 10;
      ExApp.Columns['B:B'].HorizontalAlignment := xlCenter;

      //Primero los encabezados de las requisiciones para usar de pivote
      recFila := 0;
      recColumna := 0;
      FilaInicio := 7;
      ColInicio := 1;

      //Colocando encabezado de requisiciones
      zRequisiciones.First;
      while not zRequisiciones.Eof do
      begin
        inc(RecColumna);
        ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio)] := 'REQ. ' + zRequisiciones.FieldByName('sNumFolio').AsString;
        zRequisiciones.Next;
      end;

      Rango := ExApp.Range[ColumnaNombre(ColInicio+1)+IntToStr(FilaInicio) + ':' +ColumnaNombre(ColInicio+RecColumna+1)+IntToStr(FilaInicio)];
      Rango.Orientation := 90;
      ExApp.Columns[ColumnaNombre(ColInicio+1)+':'+ColumnaNombre(ColInicio+RecColumna+1)].ColumnWidth := 5;
      FormatoTexto(Rango, 'Arial',8,False,False);
      Rango := ExApp.Range[ColumnaNombre(ColInicio+2)+IntToStr(6) + ':' +ColumnaNombre(ColInicio+RecColumna+1)+IntToStr(6)];
      Rango.Value := 'REQUISICIONES';
      Rango.MergeCells := True;
      FormatoTexto(Rango, 'Arial',11,True,True);

      inc(RecColumna);
      Rango := ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio)+':'+ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio-1)];
      Rango.Value := 'TOTAL REQ.';
      Rango.MergeCells := True;
      Rango.WrapText := True;
      Rango.Orientation := 90;
      FormatoTexto(Rango, 'Arial',11,True,True);

      inc(RecColumna);
      Rango := ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio)+':'+ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio-1)];
      Rango.Value := 'O.C. COMPRADO';
      Rango.MergeCells := True;
      ExApp.Columns[ColumnaNombre(ColInicio+recColumna+1)+':'+ColumnaNombre(ColInicio+recColumna+1)].ColumnWidth := 40;
      FormatoTexto(Rango, 'Arial',11,True,True);

      inc(RecColumna);
      Rango := ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio)+':'+ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio-1)];
      Rango.Value := 'TOTAL COMPRADO';
      Rango.MergeCells := True;
      Rango.WrapText := True;
      Rango.Orientation := 90;
      FormatoTexto(Rango, 'Arial',11,False,True);

      //Colocando Productos y cantidades en cada requisicion
      zConceptos.First;
      while not zConceptos.Eof do
      begin
        recColumna := 0;
        inc(recColumna);
        inc(RecFila);
        ExApp.Range[ColumnaNombre(ColInicio)+IntToStr(FilaInicio+RecFila)] := zConceptos.FieldByName('mDescripcion').asString;
        ExApp.Range[ColumnaNombre(ColInicio+1)+IntToStr(FilaInicio+RecFila)] := zConceptos.FieldByName('sMedida').asString;
        FormatoTexto(ExApp.Range[ColumnaNombre(ColInicio)+IntToStr(FilaInicio+RecFila)+':'+ColumnaNombre(ColInicio+1)+IntToStr(FilaInicio+RecFila)],'Arial',6,False);

        zRequisiciones.First;
        while not zRequisiciones.Eof do
        begin
          inc(recColumna);
          if zCantidades.Locate('sNumFolio;sIdInsumo', varArrayOf([zRequisiciones.FieldByName('sNumFolio').AsString,zConceptos.FieldByName('sIdInsumo').AsString]),[]) then
          try
            begin
              ExApp.Range[ColumnaNombre(ColInicio+recColumna)+IntToStr(FilaInicio+RecFila)] := ExApp.Range[ColumnaNombre(ColInicio+recColumna)+IntToStr(FilaInicio+RecFila)].value + zCantidades.FieldByName('dCantidad').asString;
              FormatoTexto(ExApp.Range[ColumnaNombre(ColInicio+recColumna)+IntToStr(FilaInicio+RecFila)],'Arial',6,True);
              zCantidades.Next;
            end;
          finally
            //nada
          end;

          zRequisiciones.Next;
        end;
        //Cuando termina de checar requisiciones
        //se anexa los datos de las ordenes de compra
        ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio+RecFila)].FormulaR1C1 := '=SUM(RC[-'+intTostr(recColumna-1)+']:RC[-1])';

        //Añadir las ordenes de compra que se realizaron de este producto
        ExApp.Range[ColumnaNombre(ColInicio+recColumna+2)+IntToStr(FilaInicio+RecFila)].Value := zConceptos.fieldByName('OC').AsString;
        ExApp.Range[ColumnaNombre(ColInicio+recColumna+3)+IntToStr(FilaInicio+RecFila)].Value := zConceptos.fieldByName('CantOC').AsString;
        FormatoTexto(ExApp.Range[ColumnaNombre(ColInicio+recColumna+1)+IntToStr(FilaInicio+RecFila)+':'+ColumnaNombre(ColInicio+recColumna+3)+IntToStr(FilaInicio+RecFila)],'Arial',7,True);
        zConceptos.Next;
      end;

      //borders
      Rango := ExApp.Range['A6:'+ColumnaNombre(ColInicio+recColumna+3)+IntToStr(FilaInicio+RecFila)];
      ExApp.ActiveWindow.DisplayGridlines := False;
      ExApp.Range['C8'].Select;
      ExApp.ActiveWindow.FreezePanes := True;
      SetBorders(Rango, xlThin, xlContinuous);

      //Color Interior
      Rango := ExApp.Range['A6:'+ColumnaNombre(ColInicio+recColumna+3)+IntToStr(FilaInicio)];
      Rango.Interior.Color := RGB(140,192,254);

            //Logotipo de la empresa
      LogoFile :=  ExtractFilePath(Application.ExeName) + 'Temp.bmp';
      TBlobField(connection.configuracion.FieldByName('bImagen')).SaveToFile(LogoFile);
      ExApp.ActiveSheet.Pictures.Insert(LogoFile).Select;
      ExApp.Selection.ShapeRange.LockAspectRatio := False;
      ExApp.Selection.ShapeRange.Width := 180;
      ExApp.Selection.ShapeRange.Height := 70;
      ExApp.Selection.ShapeRange.Left := 0;
      ExApp.Selection.ShapeRange.top := 0;

      //Logotipo del contrato
      LogoFile :=  ExtractFilePath(Application.ExeName) + 'Temp2.bmp';
      TBlobField(connection.Contrato.FieldByName('bImagen')).SaveToFile(LogoFile);
      ExApp.ActiveSheet.Pictures.Insert(LogoFile).select;
      ExApp.Selection.ShapeRange.LockAspectRatio := False;
      ExApp.Selection.ShapeRange.Width := 180;
      ExApp.Selection.ShapeRange.Height := 70;
      ExApp.Selection.ShapeRange.Left := 780;
      ExApp.Selection.ShapeRange.top := 0;

    end;
  except
    on e: exception do
      InteliDialog.ShowModal('Error', 'Informe del siguiente error a su administrador del sistema: ' + e.message, mtError, [mbOK], 0);
  end;
end;

procedure TFrmRequisicionesGlobales.CargarDatosFiltrados();
var
  Contrato: String;
begin
    zConceptos.Close;
    zRequisiciones.Close;
    zCantidades.Close;

    Contrato := connection.contrato.FieldByName('sContrato').asString;
    zconceptos.paramByName('Folio').asInteger := -1;
    zConceptos.ParamByName('Proveedor').asString := Proveedor;
    zConceptos.ParamByName('Inicio').asString := Desde;
    zConceptos.ParamByName('Termino').asString := Hasta;
    zConceptos.ParamByName('Referencia').asString := Referencia;
    zConceptos.ParamByName('IdInsumo').asString := Material; //qrymateriales.FieldByName('sIdInsumo').asString;
    zConceptos.paramByName('Contrato').asString := Contrato;

    zRequisiciones.paramByName('Folio').asInteger := -1;
    zRequisiciones.ParamByName('Proveedor').asString := Proveedor;
    zRequisiciones.ParamByName('Inicio').asString := Desde;
    zRequisiciones.ParamByName('Termino').asString := Hasta;
    zRequisiciones.ParamByName('Referencia').asString := Referencia;
    zRequisiciones.ParamByName('IdInsumo').asString := Material;//qrymateriales.FieldByName('sIdInsumo').asString;
    zRequisiciones.paramByName('Contrato').asString := Contrato;

    zCantidades.paramByName('Folio').asInteger := -1;
    zCantidades.ParamByName('Proveedor').asString := Proveedor;
    zCantidades.ParamByName('Inicio').asString := Desde;
    zCantidades.ParamByName('Termino').asString := Hasta;
    zCantidades.ParamByName('Referencia').asString := Referencia;
    zCantidades.ParamByName('IdInsumo').asString := Material;//qrymateriales.FieldByName('sIdInsumo').asString;
    zCantidades.paramByName('Contrato').asString := Contrato;

    zConceptos.Open;
    zRequisiciones.Open;
    zCantidades.Open;
end;

procedure TFrmRequisicionesGlobales.cboMaterialesCloseUp(Sender: TObject);
begin
  Material := VarToStr(cboMateriales.KeyValue);
end;

procedure TFrmRequisicionesGlobales.cboProveedoresCloseUp(Sender: TObject);
begin
  Proveedor := VarToStr(cboProveedores.KeyValue);
end;

procedure TFrmRequisicionesGlobales.cboReferenciasCloseUp(Sender: TObject);
begin
  Referencia := VarToStr(cboReferencias.KeyValue);
end;

procedure TFrmRequisicionesGlobales.chkFechasClick(Sender: TObject);
begin


  if Not chkFechas.Checked then
  begin
    desde := '-1';
    Hasta := '-1';
    FechaInicio.Enabled := chkFechas.Checked;
    FechaFinal.Enabled := chkFechas.Checked;
  end
  else
  begin
    desde := FechaSQL(FechaInicio.Date);
    Hasta := FechaSQL(FechaFinal.Date);
    FechaInicio.Enabled := chkFechas.Checked;
    FechaFinal.Enabled := chkFechas.Checked;
  end;
end;

procedure TFrmRequisicionesGlobales.ChkTodasReferenciasClick(Sender: TObject);
begin
  cboReferencias.Enabled := Not ChkTodasReferencias.Checked;
  if ChkTodasReferencias.Checked then
    Referencia := '-1'
  else
    Referencia := VarToStr(cboReferencias.KeyValue);
end;

procedure TFrmRequisicionesGlobales.chkTodosMaterialesClick(Sender: TObject);
begin
  cboMateriales.Enabled := Not chkTodosMateriales.Checked;
  if chkTodosMateriales.Checked then
    Material := '-1'
  else
    Material := VarToStr(cboMateriales.KeyValue);
end;

procedure TFrmRequisicionesGlobales.chkTodosProveedoresClick(Sender: TObject);
begin
  cboProveedores.Enabled := Not chkTodosProveedores.Checked;
  if chkTodosProveedores.Checked then
    Proveedor := '-1'
  else
    Proveedor := VarToStr(cboProveedores.KeyValue);
end;

procedure TFrmRequisicionesGlobales.FechaFinalChange(Sender: TObject);
begin
  desde := FechaSQL(FechaInicio.Date);
  Hasta := FechaSQL(FechaFinal.Date);
end;

procedure TFrmRequisicionesGlobales.FechaFinalClick(Sender: TObject);
begin
  desde := FechaSQL(FechaInicio.Date);
  Hasta := FechaSQL(FechaFinal.Date);
end;

procedure TFrmRequisicionesGlobales.FechaInicioChange(Sender: TObject);
begin
   desde := FechaSQL(FechaInicio.Date);
   Hasta := FechaSQL(FechaFinal.Date);
end;

procedure TFrmRequisicionesGlobales.FormShow(Sender: TObject);
var
  Contrato: String;
begin
  Desde := '-1';
  Hasta := '-1';
  Proveedor := '-1';
  Referencia := '-1';
  Material := '-1';

  FechaInicio.Date := Now;
  FechaFinal.Date := Now;

  Contrato := connection.contrato.FieldByName('sContrato').asString;
  qryProveedores.Active := false;
  qryProveedores.Open;

  qryReferencias.Active := false;
  qryReferencias.ParamByName('contrato').AsString := Contrato;
  qryReferencias.Open;

  qryMateriales.Active := false;
  qryMateriales.ParamByName('Contrato').AsString := Contrato;
  qryMateriales.Open;
end;

function TFrmRequisicionesGlobales.fechaSQL(Fecha: TDate): string;
var
  mes, dia: String;
begin
  if (MonthOf(Fecha)) < 10 then
    mes := '0' + IntToStr(MonthOf(Fecha))
  else
    mes := IntToStr(MonthOf(Fecha));

  if DayOf(Fecha) < 10 then
    dia := '0' +  IntToStr(DayOf(Fecha))
  else
    dia := IntToStr(DayOf(Fecha));

  Result := IntToStr(YearOf(Fecha)) + '-' + mes + '-' + Dia;
end;

end.

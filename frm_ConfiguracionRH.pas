unit frm_ConfiguracionRH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, DB, global,Grids, DBGrids,
  Buttons, ImgList, ExtCtrls, ExtDlgs, Jpeg, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, frxDBSet, AdvSpin, DBAdvSp, AdvGroupBox,
  FormAutoScaler, AdvGlowButton;

type
  TfrmConfiguracionRH = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Puestos: TTabSheet;
    tsNombre: TDBEdit;
    tsPiePagina: TDBEdit;
    tsEmail: TDBEdit;
    tsWeb: TDBEdit;
    tsFax: TDBEdit;
    tsTelefono: TDBEdit;
    tsSlogan: TDBEdit;
    tsDireccion3: TDBEdit;
    tsDireccion2: TDBEdit;
    tsDireccion1: TDBEdit;
    tsRfc: TDBEdit;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label86: TLabel;
    GroupBox4: TGroupBox;
    bImagen: TImage;
    Label10: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    REpre: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    tsRepresentante: TDBEdit;
    tsTestigo1: TDBEdit;
    tsTestigo2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    blogofondo: TImage;
    Label5: TLabel;
    LabelPhoto: TLabel;
    OpenPicture: TOpenPictureDialog;
    dsConfiguracion: TDataSource;
    OpenPicture_1: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    bImagenCliente: TImage;
    OpenPicture_2: TOpenPictureDialog;
    Label6: TLabel;
    TSNOTARIO: TDBEdit;
    TSDIR3: TDBEdit;
    Label7: TLabel;
    TSDIR1: TDBEdit;
    TSDIR2: TDBEdit;
    Label8: TLabel;
    Label13: TLabel;
    DBCheckNom: TDBCheckBox;
    TabSheet3: TTabSheet;
    AdvGroupBox1: TAdvGroupBox;
    Label18: TLabel;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBAdvSpinEdit1: TDBAdvSpinEdit;
    AdvGroupBox2: TAdvGroupBox;
    Label19: TLabel;
    Label21: TLabel;
    DBEdit3: TDBEdit;
    DBAdvSpinEdit2: TDBAdvSpinEdit;
    fsc_CnRH: TFormAutoScaler;
    DBCheckBox1: TDBCheckBox;
    chkGuardiaNormal: TDBCheckBox;
    AdvGroupBox3: TAdvGroupBox;
    Label23: TLabel;
    DBAdvSpinEdit3: TDBAdvSpinEdit;
    panelBotones: TPanel;
    btnGuardar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    tsNombreCorto: TDBEdit;
    Label22: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bImagenClick(Sender: TObject);
    procedure tsNombreEnter(Sender: TObject);
    procedure tsNombreExit(Sender: TObject);
    procedure tsRfcEnter(Sender: TObject);
    procedure tsRfcExit(Sender: TObject);
    procedure tsDireccion1Enter(Sender: TObject);
    procedure tsDireccion1Exit(Sender: TObject);
    procedure tsDireccion2Enter(Sender: TObject);
    procedure tsDireccion2Exit(Sender: TObject);
    procedure tsDireccion3Enter(Sender: TObject);
    procedure tsDireccion3Exit(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure tsSloganEnter(Sender: TObject);
    procedure tsSloganExit(Sender: TObject);
    procedure tsPiePaginaEnter(Sender: TObject);
    procedure tsPiePaginaExit(Sender: TObject);
    procedure tsTelefonoEnter(Sender: TObject);
    procedure tsTelefonoExit(Sender: TObject);
    procedure tsFaxEnter(Sender: TObject);
    procedure tsFaxExit(Sender: TObject);
    procedure tsWebEnter(Sender: TObject);
    procedure tsWebExit(Sender: TObject);
    procedure tsEmailEnter(Sender: TObject);
    procedure tsEmailExit(Sender: TObject);
    procedure tsRepresentanteEnter(Sender: TObject);
    procedure tsRepresentanteExit(Sender: TObject);
    procedure tsTestigo1Enter(Sender: TObject);
    procedure tsTestigo1Exit(Sender: TObject);
    procedure tsTestigo2Enter(Sender: TObject);
    procedure tsTestigo2Exit(Sender: TObject);
    procedure blogofondoClick(Sender: TObject);
    procedure bImagenClienteClick(Sender: TObject);
    procedure TSDIR1Enter(Sender: TObject);
    procedure TSDIR1Exit(Sender: TObject);
    procedure TSDIR2Enter(Sender: TObject);
    procedure TSDIR2Exit(Sender: TObject);
    procedure TSNOTARIOEnter(Sender: TObject);
    procedure TSNOTARIOExit(Sender: TObject);
    procedure TSDIR3Enter(Sender: TObject);
    procedure TSDIR3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracionRH: TfrmConfiguracionRH;

implementation

uses frm_connection, frmEmpleados;


{$R *.dfm}



procedure TfrmConfiguracionRH.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmConfiguracionRH.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then                        { si es la tecla <enter> }
    if not (ActiveControl is TDBGrid) then { si no es un TDBGrid }
    begin
      Key := #0;                           { nos comemos la tecla }
      Perform(WM_NEXTDLGCTL, 0, 0);        { vamos al siguiente control }
    end
    else
         if (ActiveControl is TDBGrid) then   { si es un TDBGrid }
            with TDBGrid(ActiveControl) do
               if selectedindex < (fieldcount -1) then
                   selectedindex := selectedindex +1
               else
                   selectedindex := 0;
end;

procedure TfrmConfiguracionRH.FormShow(Sender: TObject);
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;
  fileSkin: TextFile;
  sSkin: string;

  bS_logo1 : TStream;
  Pic_logo1 : TJpegImage;
  BlobField_logo1 : tField;

  bS_ImagenCliente : TStream;
  Pic_ImagenCliente : TJpegImage;
  BlobField_ImagenCliente : tField;

begin
    Connection.configuracionRecHum.Active := False;
    Connection.configuracionRecHum.ParamByName('contrato').AsString := global_contrato;
    Connection.configuracionRecHum.Open  ;

    if Connection.configuracionRecHum.RecordCount > 0 then
    begin
      Connection.configuracionRecHum.Edit;

      Connection.configuracionRecHum.FieldByName('sNombreCorto').AsString := global_contrato;

      BlobField := Connection.configuracionRecHum.FieldByName('bImagen');
      BS := Connection.configuracionRecHum.CreateBlobStream(BlobField, bmRead);

      BlobField_logo1 := Connection.configuracionRecHum.FieldByName('bLogoFondo');
      bS_logo1 := Connection.configuracionRecHum.CreateBlobStream(BlobField_logo1, bmRead);

      BlobField_ImagenCliente := Connection.configuracionRecHum.FieldByName('bImagenCliente');
      bS_ImagenCliente := Connection.configuracionRecHum.CreateBlobStream(BlobField_ImagenCliente, bmRead);

      if bs.Size > 1 then
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
        end
      else
          bImagen.Picture.LoadFromFile('');

      if bS_logo1.Size > 1 then
      begin
        try
          Pic_logo1 := TJpegImage.Create;
          try
            Pic_logo1.LoadFromStream(bS_logo1);
            bLogoFondo.Picture.Graphic := Pic_logo1;
          finally
            Pic_logo1.Free;
          end;
        finally
          bS_logo1.Free
        end
      end;

      if bS_ImagenCliente.Size > 1 then
      begin
        try
          Pic_ImagenCliente := TJpegImage.Create;
          try
            Pic_ImagenCliente.LoadFromStream(bS_ImagenCliente);
            bImagenCliente.Picture.Graphic := Pic_ImagenCliente;
          finally
            Pic_ImagenCliente.Free;
          end;
        finally
          bS_ImagenCliente.Free
        end
      end
      else;

    end
    else
    begin

        connection.zcommand.Active := False;
        connection.zcommand.sql.clear;
        connection.zcommand.sql.add('INSERT INTO rh_configuracion (sNombreCorto) values (:contrato) ');
        connection.zcommand.parambyname('contrato').AsString := global_Contrato;
        connection.zcommand.ExecSQL;
        Connection.configuracionRecHum.refresh;
    end;
end;

procedure TfrmConfiguracionRH.TSDIR1Enter(Sender: TObject);
begin
      TSDIR1.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.TSDIR1Exit(Sender: TObject);
begin
    TSDIR1.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.TSDIR2Enter(Sender: TObject);
begin
  TSDIR2.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.TSDIR2Exit(Sender: TObject);
begin
  TSDIR2.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.TSDIR3Enter(Sender: TObject);
begin
    TSDIR3.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.TSDIR3Exit(Sender: TObject);
begin
      TSDIR3.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsDireccion1Enter(Sender: TObject);
begin
  tsDireccion1.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsDireccion1Exit(Sender: TObject);
begin
  tsDireccion1.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsDireccion2Enter(Sender: TObject);
begin
  tsDireccion2.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsDireccion2Exit(Sender: TObject);
begin
  tsDireccion2.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsDireccion3Enter(Sender: TObject);
begin
  tsDireccion3.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsDireccion3Exit(Sender: TObject);
begin
  tsDireccion3.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsEmailEnter(Sender: TObject);
begin
  tsEmail.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsEmailExit(Sender: TObject);
begin
tsEmail.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsFaxEnter(Sender: TObject);
begin
  tsFax.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsFaxExit(Sender: TObject);
begin
  tsFax.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsNombreEnter(Sender: TObject);
begin
  tsNombre.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsNombreExit(Sender: TObject);
begin
  tsNombre.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.TSNOTARIOEnter(Sender: TObject);
begin
  TSNOTARIO.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.TSNOTARIOExit(Sender: TObject);
begin
  TSDIR1.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsPiePaginaEnter(Sender: TObject);
begin
  tsPiePagina.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsPiePaginaExit(Sender: TObject);
begin
  tsPiePagina.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsRepresentanteEnter(Sender: TObject);
begin
  tsRepresentante.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsRepresentanteExit(Sender: TObject);
begin
  tsRepresentante.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsRfcEnter(Sender: TObject);
begin
 tsRfc.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsRfcExit(Sender: TObject);
begin
  tsRfc.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsSloganEnter(Sender: TObject);
begin
  tsSlogan.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsSloganExit(Sender: TObject);
begin
  tsSlogan.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsTelefonoEnter(Sender: TObject);
begin
  tsTelefono.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsTelefonoExit(Sender: TObject);
begin
  tsTelefono.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsTestigo1Enter(Sender: TObject);
begin
  tsTestigo1.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsTestigo1Exit(Sender: TObject);
begin
  tsTestigo1.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsTestigo2Enter(Sender: TObject);
begin
  tsTestigo2.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsTestigo2Exit(Sender: TObject);
begin
  tsTestigo2.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.tsWebEnter(Sender: TObject);
begin
  tsWeb.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.tsWebExit(Sender: TObject);
begin
  tsWeb.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.btnOkClick(Sender: TObject);
var
  bS: TStream;
  Pic: TJpegImage;
  BlobField: tField;

  bS_logo1 : TStream;
  Pic_logo1 : TJpegImage;
  BlobField_logo1 : tField;

  bS_ImagenCliente : TStream;
  Pic_ImagenCliente : TJpegImage;
  BlobField_ImagenCliente : tField;

  x, z, vacios : Integer;

begin
  if (Connection.configuracionRecHum.State = dsEdit)Or (Connection.configuracionRecHum.State = dsInsert) then
  begin
    vacios := 0;
    for x := 0 to PageControl1.PageCount - 1 do
    begin
      for z := 0 to PageControl1.Pages[x].ControlCount - 1 do
      begin
        if (PageControl1.Pages[x].Controls[z] is TDBEdit) then
        begin
          if Trim((PageControl1.Pages[x].Controls[z] as TDBEdit).Text) = '' then
          begin
            Inc(vacios);
            (PageControl1.Pages[x].Controls[z] as TDBEdit).Color := global_color_entradaERP;
          end
          else
            (PageControl1.Pages[x].Controls[z] as TDBEdit).Color := $00F0F0F0;
        end;
      end;
    end;

    if vacios = 0 then
    begin
      if OpenPicture.FileName <> '' then
      begin
        try
          BlobField := Connection.configuracionRecHum.FieldByName('bImagen');
          BS := Connection.configuracionRecHum.CreateBlobStream(BlobField, bmWrite);
          try
            Pic := TJpegImage.Create;
            try
              Pic.LoadFromFile(OpenPicture.FileName);
              Pic.SaveToStream(Bs);
            finally
              Pic.Free;
            end;
          finally
            bS.Free
          end;
        except
        end;
      end;

      if OpenPicture_1.FileName <> '' then
      begin
        try
          BlobField_logo1 := Connection.configuracionRecHum.FieldByName('bLogoFondo');
          BS_logo1 := Connection.configuracionRecHum.CreateBlobStream(BlobField_logo1, bmWrite);
          try
            Pic_logo1 := TJpegImage.Create;
            try
              Pic_logo1.LoadFromFile(OpenPicture_1.FileName);
              Pic_logo1.SaveToStream(Bs_logo1);
            finally
              Pic_logo1.Free;
            end;
          finally
            bS_logo1.Free
          end;
        except
        end;
      end;

      if OpenPicture_2.FileName <> '' then
      begin
        try
          BlobField_ImagenCliente := Connection.configuracionRecHum.FieldByName('bImagenCliente');
          BS_ImagenCliente := Connection.configuracionRecHum.CreateBlobStream(BlobField_ImagenCliente, bmWrite);
          try
            Pic_ImagenCliente := TJpegImage.Create;
            try
              Pic_ImagenCliente.LoadFromFile(OpenPicture_2.FileName);
              Pic_ImagenCliente.SaveToStream(Bs_ImagenCliente);
            finally
              Pic_ImagenCliente.Free;
            end;
          finally
            bS_ImagenCliente.Free
          end;
        except
        end;
      end
      else;

      Connection.configuracionRecHum.Post;

      Connection.configuracionRecHum.Active := False;
      Connection.configuracionRecHum.ParamByName('contrato').AsString := global_contrato;
      Connection.configuracionRecHum.Open  ;

      Try
         if Assigned(frm_Empleados) then
            frm_Empleados.frxDBConfiguracion.DataSet.Refresh;
       Except

       End;

     // close;
    end
    else
      begin
        MessageDlg('Existen campos vacios', mtWarning, [mbOk], 0);

        if tsNombre.Text = '' then
        begin
          TabSheet1.Show;
          tsNombre.SetFocus;
        end else if tsRfc.Text = '' then
        begin
          TabSheet1.Show;
          tsRfc.SetFocus;
        end else if tsDireccion1.Text = '' then
        begin
          TabSheet1.Show;
          tsDireccion1.SetFocus;
        end else if tsDireccion2.Text = '' then
        begin
          TabSheet1.Show;
          tsDireccion2.SetFocus;
          
        end else if tsDireccion3.Text = '' then
        begin
          TabSheet1.Show;
          tsDireccion3.SetFocus;
          
        end  else if DBEdit1.Text = '' then
        begin
          TabSheet1.Show;
          DBEdit1.SetFocus;
        end else if tsSlogan.Text = '' then
        begin
          TabSheet1.Show;
          tsSlogan.SetFocus;
        end else if tsPiePagina.Text = '' then
        begin
          TabSheet1.Show;
          tsPiePagina.SetFocus;
        end else if tsDireccion1.Text = '' then
        begin
          TabSheet1.Show;
          tsDireccion1.SetFocus;
        end else if tsTelefono.Text = '' then
        begin
          TabSheet1.Show;
          tsTelefono.SetFocus;
        end else if tsFax.Text = '' then
        begin
          TabSheet1.Show;
          tsFax.SetFocus;
        end else if tsWeb.Text = '' then
        begin
          TabSheet1.Show;
          tsWeb.SetFocus;
        end else if tsEmail.Text = '' then
        begin
          TabSheet1.Show;Visible := True;
          tsEmail.SetFocus;
        end else if tsRepresentante.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          tsRepresentante.SetFocus;
        end else if tsTestigo1.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          tsTestigo1.SetFocus;
        end else if TSDIR1.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          TSDIR1.SetFocus;
        end else if tsTestigo2.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          tsTestigo2.SetFocus;
        end else if TSDIR2.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          TSDIR2.SetFocus;
        end else if TSNOTARIO.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          TSNOTARIO.SetFocus;
        end else if TSDIR3.Text = '' then  //Empieza la segunda pestana
        begin
          Puestos.Show;
          TSDIR3.SetFocus;
        end
      end; 
      Close ;         
  end;
end;

procedure TfrmConfiguracionRH.DBEdit1Enter(Sender: TObject);
begin
  DBEdit1.Color := global_color_entradaERP
end;

procedure TfrmConfiguracionRH.DBEdit1Exit(Sender: TObject);
begin
  DBEdit1.Color := global_color_salidaERP
end;

procedure TfrmConfiguracionRH.bImagenClick(Sender: TObject);
begin
   if (Connection.configuracionRecHum.State = dsEdit)  Then
  begin
    OpenPicture.Title := 'Inserta Imagen';
    if OpenPicture.Execute then
    begin
      try
          bImagen.Picture.LoadFromFile(OpenPicture.FileName);
        except
        bImagen.Picture.LoadFromFile('');
      end
    end
  end
end;

procedure TfrmConfiguracionRH.bImagenClienteClick(Sender: TObject);
begin
   if (Connection.configuracionRecHum.State = dsEdit)  Then
  begin
    OpenPicture_2.Title := 'Inserta Imagen';
    if OpenPicture_2.Execute then
    begin
      try
          bImagenCliente.Picture.LoadFromFile(OpenPicture_2.FileName);
        except
        bImagenCliente.Picture.LoadFromFile('');
      end
    end
  end

end;

procedure TfrmConfiguracionRH.blogofondoClick(Sender: TObject);
begin
   if (Connection.configuracionRecHum.State = dsEdit)  Then
  begin
    OpenPicture_1.Title := 'Inserta Imagen';
    if OpenPicture_1.Execute then
    begin
      try
        blogofondo.Picture.LoadFromFile(OpenPicture_1.FileName);
      except
        blogofondo.Picture.LoadFromFile('');
      end
    end
  end

end;

procedure TfrmConfiguracionRH.BtnCancelClick(Sender: TObject);
begin
  if Connection.configuracionRecHum.State = dsEdit then
    Connection.configuracionRecHum.Cancel;
  close
end;


end.


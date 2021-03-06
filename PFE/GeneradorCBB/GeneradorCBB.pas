(******************************************************************************
 PROYECTO FACTURACION ELECTRONICA
 Copyright (C) 2010-2014 - Bamb� Code SA de CV - Ing. Eduardo Padilla

 Esta clase se encarga de generar un C�digo de barras bidimensional QR, con
 base al est�ndar ISO/IEC 18004:2000, conteniendo los siguientes datos en el
 siguiente formato:

 1. RFC del emisor
 2. RFC del receptor
 3. Total (a 6 decimales fijos)
 4. Identificador �nico del timbre (UUID) asignado

 Generamos la imagen QR ayudandonos de la liberia Quaricol Open Source para
 generaci�n de QR Codes.

 Este archivo pertenece al proyecto de codigo abierto de Bambu Code:
 http://bambucode.com/codigoabierto

 La licencia de este codigo fuente se encuentra en:
 http://github.com/bambucode/tfacturaelectronica/blob/master/LICENCIA
 ******************************************************************************)
unit GeneradorCBB;

interface

uses
  PFacturaElectronica,
  Windows, SysUtils, Classes, ExtCtrls, StdCtrls;

type

  {$REGION 'Documentation'}
  ///	<summary>
  ///	  <para>
  ///	    Esta clase se encarga de generar un C�digo de barras bidimensional
  ///	    QR, con base al est�ndar ISO/IEC 18004:2000, conteniendo los
  ///	    siguientes datos en el siguiente formato:
  ///	  </para>
  ///	  <para>
  ///	    1. RFC del emisor
  ///	  </para>
  ///	  <para>
  ///	    2. RFC del receptor
  ///	  </para>
  ///	  <para>
  ///	    3. Total (a 6 decimales fijos)
  ///	  </para>
  ///	  <para>
  ///	    4. Identificador �nico del timbre (UUID) asignado
  ///	  </para>
  ///	</summary>
  ///	<remarks>
  ///	  <note type="note">
  ///	    Generamos la imagen QR ayudandonos de la liberia Quaricol Open Source
  ///	    para generaci�n de QR Codes.
  ///	  </note>
  ///	</remarks>
  {$ENDREGION}
  TGeneradorCBB = class
  private
  public
    {$REGION 'Documentation'}
    ///	<summary>
    ///	  Se encarga de generar la imagen del CBB para CFDI segun los
    ///	  requerimientos del SAT
    ///	</summary>
    {$ENDREGION}
    procedure AfterConstruction; override;
    function GenerarImagen(const aEmisor, aReceptor: TPFContribuyente; const
        aTotal: Currency; const aUUID, aRutaAGuardar: string): Boolean;
  end;

implementation

uses QuricolCode, QuricolAPI, {pngimage, Jpeg,} 
  jpeg,
  {$IF Compilerversion >= 20}
   Graphics;
  {$ELSE}
   Graphics;
  {$IFEND}

Function FillSpaces(cVar:String; nLen:Integer):String;
begin
  Result:=StringOfChar('0',nLen - Length(cVar))+cVar;
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter     := Delimiter;
   ListOfStrings.DelimitedText := Str;
end;

procedure TGeneradorCBB.AfterConstruction;
begin
  inherited;
end;

function TGeneradorCBB.GenerarImagen(const aEmisor, aReceptor:
    TPFContribuyente; const aTotal: Currency; const aUUID, aRutaAGuardar:
    string): Boolean;
var
  cadenaParaCBB: String;
  jpgResultado: TJpegImage;
  bmpCBB: TBitmap;
  CadenaTotal: String;
  CadenaDelimitada: TStringList;
const
  _TAMANO_DE_UUID = 36;
  _IMAGEN_MARGEN = 0;
  _TAMANO_PIXELES = 24;
  _ANCHO_ESTANDARD = 1200;
  _ALTO_ESTANDARD = 1200;
begin
//  {$IFNDEF RELEASE}
//    {$IFDEF WIN32}
//    Assert(FileExists('../GeneradorCBB/quricol32.dll'),
//          'Debe existir el archivo quricol32.dll para la generaci�n de CBB de los CFDI');
//    {$ENDIF}
//
//    {$IFDEF WIN64}
//    Assert(FileExists('../GeneradorCBB/quricol64.dll'),
//          'Debe existir el archivo quricol64.dll para la generaci�n de CBB de los CFDI');
//    {$ENDIF}
//  {$ENDIF}

  Result := False;
  // Checamos que los par�metros esten correctos
  Assert(Length(aUUID) = _TAMANO_DE_UUID,
         'El UUID no tuvo la longitud correcta de ' + IntToStr(_TAMANO_DE_UUID));
  Assert(aRutaAGuardar <> '', 'La ruta fue vacia');

  // 1. Definimos la cadena con la que vamos a generar el CBB segun la especificacion del SAT
  // segun el rubro II.E del Anexo 20
  CadenaTotal := FloatToStrF(aTotal, ffFixed, 17, 6);
  CadenaDelimitada := TStringList.Create;
  Try
    Split('.', CadenaTotal, CadenaDelimitada);
    CadenaTotal := FillSpaces(CadenaDelimitada[0], 10);
    CadenaTotal := CadenaTotal + '.' + CadenaDelimitada[1];
  Finally
    CadenaDelimitada.Free;
  End;
  cadenaParaCBB := Format('?re=%s&rr=%s&tt=%s&id=%s',
                          [aEmisor.RFC,
                           aReceptor.RFC,
                           CadenaTotal,
//                           FloatToStrF(aTotal, ffFixed, 17, 6),
                           aUUID]);

  // 2. Generamos la imagen auxiliandonos de la liberia Quaricol
  jpgResultado := TJPEGImage.Create;
  try
    bmpCBB := TQRCode.GetBitmapImage(cadenaParaCBB,
                                    _ANCHO_ESTANDARD, _ANCHO_ESTANDARD, _IMAGEN_MARGEN, _TAMANO_PIXELES, QualityHigh);
    try
      // La asignamos el JPG y la guardamos
      jpgResultado.Assign(bmpCBB);
      jpgResultado.SaveToFile(aRutaAGuardar);
      Result := True;
    finally
      bmpCBB.Free;
    end;
  finally
    jpgResultado.Free;
  end;
end;

end.

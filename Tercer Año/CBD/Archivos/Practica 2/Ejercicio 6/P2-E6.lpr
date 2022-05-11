program P2_E6;
const
  VALOR_ALTO=9999;

type
  str=string[30];
  servicio = record
    codMozo:integer;
    fecha:int;
    montoServicio:integer;
  end;
  mozoR = record
    codMozo:integer;
    total:integer;
  end;

  arch=file of servicio;
  mae=file of mozoR;

  procedure leer(var arch:detalle;var mozo:servicio);
  begin
    if eof(arch) then mozo.codMozo:=VALOR_ALTO;
    else read(arch,mozo);
  end;

  procedure compactar(var detalle:arch);
  var
    mozo:servicio;
    maestro:mae;
    compacto:mozoR;  //detalle que voy a pegar en el maestro
  begin
    //Creo archivo maestro
    assign(maestro,'compacto.dat');
    rewrite(maestro);
    //Abro el detalle
    reset(detalle);
    leer(detalle,mozo);
    //Corte de control principal
    while (mozo.codMozo <> VALOR_ALTO) do begin
      //Entra un mozo nuevo
      compacto.codMozo:=mozo.codMozo;
      compacto.total:=0;
      while (mozo.codMozo = compacto.codMozo) do begin
        compacto.total:=compacto.total + mozo.montoServicio;
        leer(detalle,mozo);
      end;
      write(maestro,compacto);
    end;
    close(detalle);
    close(maestro);
  end;

//----PROGRAMA PRINCIPAL
var
  archivo:arch;
  mae:maestro;
begin
  assign(archivo,'detalle.dat');
  reset(archivo);
  compactar(archivo);
end.    

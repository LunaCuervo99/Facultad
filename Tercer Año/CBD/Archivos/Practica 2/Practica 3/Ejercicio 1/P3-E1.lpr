program project1-E1;
const
  FIN=100000;
  ELIMINAR='trepadoras';

type
  str=string[30];

  especie=record
    cod:integer;
    nombreVulgar:str;
    nombreCientifico:str;
    alturaProm:integer;
    descripcion:str;
    zonaGeografica:str;
  end;

  archivo=file of especie;

  procedure recuperar(var arch:archivo);
  var
    planta:especie;
    borrar:word;
  begin
    //Abro el archivo
    reset(arch);
    //Mientras no termine el archivo
    while not eof(arch) do begin
      //busco los que esten marcados para borrar
      if (planta.cod = -1) then begin
        //Me posiciono uno para atras ya que al leer adelanto
        borrar:=filePos(arch)-1;
        seek(arch,fileSize(arch)-1);
        read(arch,planta);
        seek(arch,borrar);
        write(arch,planta);
        seek(arch,fileSize(arch)-1);
        truncate(arch);
        //Me posiciono de nuevo donde lei por ultima vez
        seek(arch,borrar);
      end;
    end;
    //Si salgo, termine de leer en el archivo
    close(arch);
  end;

  procedure compactar(var arch:archivo);
  var
    compacto:archivo;
    planta:especie;
  begin
    //Asigno el archivo compacto
    assign(compacto,'compacto.dat');
    //Abro los archivos
    reset(compacto);
    reset(arch);
    //Recorro el archivo principal para crear el  zip
    while not eof (arch) do begin
      read(arch,planta);
      //Si no esta marcado, lo guardo en el nuevo archivp
      if (planta.cod <> -1) then write(compacto,planta);
    end;
    //Si salgo, termine. Cierro los archivos
    close(arch);
    close(compacto);
  end;

  procedure marcar(var arch:archivo);
  var
    cod:integer;
    planta:especie;
    encontre:boolean
  begin
    writeln('Ingrese el cofigo de especie a eliminar o ',FIN,' para terminar');
    readln(cod);
    while (cod <> FIN) do begin
      //Abro el archivo
      reset(a);
      encontre:=false
      //Empiezo a buscar hasta que encuentre o termine el archivo
      while (not encontre) and (not eof(a)) do begin
        read(a,planta);
        encontre:= (planta.cod = cod);
      end;
      //Si salgo: encontre el registro a borrar o termino el archivo
      if (encontre) then begin
        //Si lo encontre, tengo que marcar y borrar y compactar
        planta.cod:=-1;
        seek(a,filepos(arch)-1);
        write(a,planta);
      end
      else writeln('No se encontro el codigo en el archivo');
      //vuelvo a leer otra especie
      readln(cod);
    end;
    //Si salgo del while principal, entro el codigo de corte
    //Cierro el archivo
    close(arch);
  end;


//---PROGRAMA PRINCIPAL---
var
  arch:archivo;
  opcion:integer;

begin
  //Asigno el archivo principal
   assign(arch,'plantas.dat');
  //Estructura del programa
  writeln('Ingrese una opcion o 0 para cerrar el programa');
  writeln('1: marcar especies para borrar');
  writeln('2: crear compactado de las especies sin marcar');
  writeln('3: inciso b');
  readln(opcion);
  while (opcion <> 0) do begin
    case opcion of
      '1': marcar(arch);
      '2': compactar(arch);
      '3': recuperar(arch);
    end;
    writeln('Ingrese una opcion o 0 para cerrar el programa');
    writeln('1: marcar especies para borrar');
    writeln('2: crear compactado de las especies sin marcar');
    writeln('3: Inciso b xD');
    readln(opcion);
  end;
end.

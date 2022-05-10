program P2E2;
uses sysutils;
type
    str = string[30];
    VALOR_ALTO=9999;

    cd = record
      codAutor: integer;
      nombreAutor: str;
      nombreDisco: str;
      genero: str;
      cantVendida: integer;
    end;

    //Archivo origen, ordenado por codigo de autor, genero y nombre de disco
    //Vendria a ser como un archivo maestro parece
    origen = file of cd;

    procedure leerCd(var arch:origen; var cdActual:cd);
    begin
         if eof(archivo) then cdActual.codAutor:=VALOR_ALTO;
         else read(arch, cdActual);
    end;

    procedure listar(var archivo: origen; var txt: text);
    var
      //Para corte de control
      autorActual:integer;
      generoActual:str;
      cdActual:cd;
      //Para contabilizar
      cantGenero: integer;
      cantAutor:integer;
      cantTotal:integer;
    begin
      cantTotal:=0;
      //Leo el primer cd
      leerCd(archivo, cdActual);
      //Corte de control, mientras haya cds para leer
      while (cdActual.codAutor <> VALOR_ALTO) do begin
         //guardo el autor actual
         autorActual:=cdActual.codAutor;
         writeln('Autor: ',autorActual);
         writeln(txt, 'Autor: ', autorActual);
         cantAutor:=0;
         //mientras no cambie de autor
         while (cdActual.codAutor = autorActual) do begin
            //guardo el genero actual
            generoActual:= cdActual.genero;
            writeln('Genero: ',generoActual);
            writeln(txt, 'Genero: ', generoActual);
            cantGenero:=0;
            //mientras sea el mismo genero y autor
            while (cdActual.codAutor = autorActual) and (cdActual.genero = generoActual) do begin
               with (cdActual) do begin
                  writeln('Nombre del disco: ',nombreDisco, 'cantidad vendida: ', cantVendida);
                  writeln(txt, 'Nombre del disco: ',nombreDisco, 'cant vendida: ',cantVendida);
               end:
               cantAutor:=cantAutor + cdActual.cantVendida;
               cantGenero:=cantGenero + cdActual.cantVendida;
               cantTotal: cantTotal + cdActual.cantVendida;
               //leo el siguiente cd
               leerCd(archivo, cdActual);
            end;
            //Totalizo genero
            writeln('Total genero: ', cantGenero);
            writeln(txt, 'Total genero: ', cantGenero);
         end;
         //totalizo autor
         writeln('Total autor: ', cantAutor);
         writeln(txt, 'Total autor: ',cantAutor);
      end;
      //Totalizo discografia
      writeln('Total discografia: ', cantTotal);
    end;

//----Programa principal -----
var
  archivo:origen;
  texto: text;

begin
  assign(archivo, 'cds.dat');
  assign(texto, 'cds.txt');

  //Abro archivo origen/maestro
  reset(archivo);
  //Abro para escritura el archivo de texto para listado
  rewrite(texto);
  //Procedimiento principal para listar
  listar(archivo, texto);
  //Cerramos los archivos y finaliza el programa
  close(archivo);
  close(texto);
  writeln('Fin del programa ');
  readln;
  readln;
end.


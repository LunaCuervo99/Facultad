program P2E4;
uses sysutils;
const
  VALOR_ALTO=9999;
  N=20;

type
  str:string[30];

  pelicula = record
    codigo:integer;
    nombre:str;
    genero:str;
    director:str;
    duracion:str;
    fecha:int;
    asistentes:integer;
  end;

  detalle=file of pelicula;
  arrayDet=array[1..N] if detalle;
  arrayPel=arrayarray[1..N] of pelicula;

  //En este caso se hace un merge, por lo tanto
  //coinciden registro y archivo maestro

   procedure leer(var archivo:detalle; var pel:pelicula);
   begin
     if not eof(archivo) then read(archivo,pel);
     else pel.codigo:=VALOR_ALTO;
   end;

   procedure determinarMin(var pelis:arrayPel; var indiceMin:integer);
   var
   begin
     indiceMin:=1;
     for i:=2 to N do begin
       if (pelis[i].codigo < pelis[indiceMin].codigo) then begin
         indiceMin:=i;
     end;
   end;

   procedure minimo(var arch:arrayDet;var min:pelicula; var pelis:arrayPel);
   var
     indiceMin:integer;
   begin
     determinarMin(pelis,indiceMin);
     min:=arch[indiceMin];
     //Avanzo en el archivo del minimo
     leer(arch[indiceMin],pelis[indiceMin]);
   end;

  procedure merge(var archivos:arrayDet; var dirMaestro:str);
  var
    maestro:detalle;
    peliculas:arrayPel;
    min:pelicula;
    codaActual,asisActual:integer;
    anterior:pelicula;
  begin
    //Creo, asigno y abro para escritura el maestro
    assign(maestro, dirMaestro);
    rewrite(maestro);
    //Abro los archivos detalle
    for i:=1 to N do reset(archivosarray[i]);
    //Leo una pelicula de cada detalle
    for i:=1 to N do leer(archivosarray[i],peliculas[i]);
    //Busco el primer minimo
    minimo(archivos,min,peliculas);
    //Corte de control principal
    while (min.codigo <> VALOR_ALTO) do begin
      //Pelicula nueva
      codActual:=min.codigo;
      asisActual:=0;
      anterior:=min;
      //Mientras sea la misma pelicula, cuento los asistentes
      while (min.codigo = codActual) do begin
        asisActual:=asisActual + min.asistentes;
        minimo(archivos,min,peliculas);
      end;
      //Si salgo es porque cambio de pelicula, pego en el maestro
      anterior.asistentes:=asisActual;
      write(maestro,anterior);
    end;
    //Cierro los archivos
    for i:=1 to N do close(archivos[i]);
  end;


begin
end.


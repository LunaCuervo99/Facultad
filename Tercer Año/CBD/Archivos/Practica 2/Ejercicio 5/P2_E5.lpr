program p2_e5;
uses sysutils;

const
  str=string[30];
  CORTE='XXXXX'

type
   datos = record
     partido:str;
     localidad:str;
     barrio:str;
     cantNinos:integer;
     cantAdultos:integer
   end;

   archivo=file of datos;

   procedure imprimir(var arch:archivo);
   var
     registro:datos;
     partidoActual,localidadActual:str;
     ninosPartido,adultosPartido,ninosLocalidad,adultosLocalidad:integer
     indiceLocalidad:integer;
   begin
     //Leo el primer registro
     leer(arch,registro);
     //Corte de control principal
     while (registro.partido <> CORTE) do begin
       //Proceso el partido
       partidoActual:=registro.partido;
       writeln('Partido: ',partidoActual.partido);
       ninosPartido:=0;
       adultosPartido:=0;
       indiceLocalidad:=0;
       //Mientras sea el mismo partido
       while (registro.partido = partidoActual) do begin
         ninosLocalidad:=0;
         adultosLocalidad:=0;
         localidadActual:=registro.localidad;
         indiceLocalidad:=indiceLocalidad+1;
         writeln('Localidad ',indiceLocalidad,': ',localidadActual);
         //Mientras sea partido y localidad
         while (registro.partido=partidoActual) and (registro.localidad=localidadActual) do begin
           ninosLocalidad:=ninosLocalidad+registro.cantNinos;
           adultosLocalidad:=adultosLocalidad+registro.cantAdultos;

           ninosPartido:=ninosPartido+ninosLocalidad;
           adultrosPartido:=adultosPartido+adultosLocalidad;
           leer(arch,registro);
         end;
         writeln('Total niños localidad ',indiceLocalidad,': ',ninosLocalidad);
         write('Total adultos localidad ',indiceLocalidad,': ',adultosLocalidad);

       end;
       writeln('TOTAL NIÑOS PARTIDO: ',ninosPartido,' TOTAL ADULTOS PARTIDO: ',adultosPartido);
     end;
     //Ciero el archivo
     close(archivo);
   end;

//----PROGRAMA PRINCIPAL----
var
   arch:archivo;
begin
  assign(arch,'archivo.dat');
  reset(arch);
  imprimir(arch);
  writeln('Fin');
end.  

program P2E3;
uses sysutils;

const
  VALOR_ALTO = 9999;
  N=20;
type
  str= string[30];

  calzado = record
    cod: integer;
    numero:integer;
    descripcion:str;
    precio:integer;
    color:str;
    stock:integer;
    stockMin:integer;
  end;

  venta = record
    cod:integer;
    num:integer;
    cantVendida:integer;
  end;

  archMaestro= file of calzado;
  detalle=file of venta;
  arrayDet=array[1..N] of detalle ;
  arrayVen= array[1..N] of ventas;

  procedure leerVenta(var archivo:detalle; var ven:venta);
  begin
    if eof(archivo) then ven.cod:=VALOR_ALTO
    else
      read(arhchivo,ven);
  end;

  procedure determinarMin(var ventas:arrayVen; var indice:integer);
  var
    min:venta;
  begin
    min:=ventas[1];
    indice:=1;
    for i:=2 to N do begin
      if (ventas[i].cod < min.cod) then begin
        min:=ventas[i];
        indice:=i;
      end
      else if (ventas[i].cod = min.cod) and (ventas[i].numero < min.num) then begin
        min:=ventas[i];
        indice:=i;
      end;
    end;
  end;

  procedure minimo(var ventas: arrayVen; var min:venta;var detalles:arrayDet);
  var
    indiceMin:integer;
  begin
    determinarMin(ventas, indiceMin);
    min:=detalles[indiceMin];
    //Avanzo en el archivo donde estaba el registro minimo
    leerVenta();
  end;

  procedure actualizar(var mae:maestro; var det:arrayDet; var ven:arrayVentas ;var txt:text);
  var
    ventaActual:venta;
    codActual:integer;
    ventaMin:venta;
    cal:calzado;
  begin
    //Determino el codigo minimo
    minimo(ven,ventaMin,det);
    //leo el primer calzado del maestro, ya que puede haber calzados sin ventas
    read(mae, cal);
    //Corte de control, mientras haya ventas para procesar
    while (ventaMin.cod <> VALOR_ALTO) do begin
      codActual:=ventaMin.cod;
      //Mientras sea el mismo calzado
      while (regMin.cod = codActual) do begin
        ventaActual:= 0;
        //busco calzado y talle en el maestro
        while (cal.cod <> ventaMin.cod) or (cal.numero <> ventaMin.num) do begin
          //Si entro es porque no tuvo ventas,imprimo por pantalla codigo y numero
          writeln(cal.cod, cal.numero);
          read(mae,cal);
        end;
        //Si no entro al while de arriba, encontre numero y codigo, pero igual me aseguro
        //Mientras sea mismo talle y calzado
        while (cal.cod = ventaMin.cod) and (cal.numero = ventaMin.numero) do begin
           //sumo cantidad de ventas
           ventaActual := ventaActual + ventaMin.cantVendida;
           //avanzo en el detalle
           minimo(mae, det, ven);
        end;
        //Lo unico que queda para el calzado que estoy procesando es
        //controlar el stock minimo para el txt y cambiar el maestro
        cal.stock:= cal.stock - ventaActual;
        if (cal.stock < cal.stockMin) then with(cal) do writeln(txt, cod, num, stock, stockMin);
        //recordar retroceder ya que cuando lei avance
        seek(mae, filePos(mae)-1);
        write(mae, cal);
        //avanzo en el maestro
        if not eof(mae) then read(mae, cal);
      end;
    end;
    //Si salgo del while, termine todos los detalles
    //por lo tanto los que quedan en el maestro no tuvieron ventas
    writeln(cal.cod, cal.numero);
    while (not eof(mae)) do begin
       read(mae, cal);
       writeln(cal.cod, cal.numero);
    end;
  end;

  //-----PROGRAMA PRINCIPAL-----
  var
    maestro:archMaestro;
    detalles:arrayDet;
    txt: text;
    ven:arrayVen;
begin
  //Asigno los archivos
  assign(maestro, 'maestro.dat');
  assign(txt, 'calzadosinstock.txt');
  for i:=1 to N do assign(detalles[i], concat('detalle ',IntToStr(i),'.dat'));
  //Abro los archivos
  reset(maestro);
  rewrite(txt);
  for i:=1 to N do reset(detalles[i]);
  //Leo los primeros N detalles
  for i:=1 to N do read(detalles[i], ven[i]);
  //Llamo al metodo actualizar
  actualizar(maestro, detalles, ven, txt);
  //Cierro los archivos
  close(mae);
  for i:=1 to N do close(detalles[i]);
  close(txt);
  //Finalizo el programa
  writeln('Programa terminado ');
  readln;
  readln;
end.


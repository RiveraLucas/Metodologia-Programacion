program TP05;
uses
  crt;
const
  MAX=100;
type
  TString = string[40];
  TResol = record
    Ancho,Alto:Integer;
  end;

  TCelular = record
    NroSerie: TString;//tipo recomendado por profesor
    Marca: TString;
    Modelo: TString;
    Precio: Real;
    Procesador: TString;
    ResCamaraPrin: Real;
    ResCamaraFron: Real;
    TamanioDisplay: Real;
    ResDisplay: TResol;//Tipo de dato recomendado por el profesor
    MemoriaInt: Integer;//El profesor quiere que sea potencia de 2 y lo validemos
    MemoriaExtMax: Integer;//Lo mismo con este
    SistOp: TString;
    CapacidadBat: Integer;
    Estado: Boolean; //Tipo de dato recomendado por el profesor
  end;
  ACelular = array[1..MAX] of TCelular;

function BuscarEquipoPorNroSerie(Equipos:ACelular;N:integer;Buscado:TString):integer;
var
  Inicio,Fin,Medio:Integer;
  Encontrado:Boolean;
begin
  Inicio := 1;
  Fin := N;
  Encontrado:= False;
  while (Inicio <= Fin) and not(Encontrado) do
  begin
    Medio := (Inicio+Fin) div 2;
    if (Equipos[Medio].NroSerie = Buscado) then
    begin
       Encontrado := True;
    end
    else if (Equipos[Medio].NroSerie < Buscado) then
    begin
      Inicio := Medio + 1
    end
    else
    begin
      Fin := Medio - 1;
    end;
  end;
  if (Encontrado) then
  begin
    BuscarEquipoPorNroSerie := Medio;
  end
  else
  begin
     BuscarEquipoPorNroSerie := -1;
  end;
end;

function BuscarEquipoPorPrecio(Equipos:ACelular;N:integer;Buscado:Real):integer;
var
  Inicio,Fin,Medio:Integer;
  Encontrado:Boolean;
begin
  Inicio := 1;
  Fin := N;
  Encontrado:= False;
  while (Inicio <= Fin) and not(Encontrado) do
  begin
    Medio := (Inicio+Fin) div 2;
    if (Equipos[Medio].Precio = Buscado) then
    begin
       Encontrado := True;
    end
    else if (Equipos[Medio].Precio < Buscado) then
    begin
      Inicio := Medio + 1
    end
    else
    begin
      Fin := Medio - 1;
    end;
  end;
  if (Encontrado) then
  begin
    BuscarEquipoPorPrecio := Medio;
  end
  else
  begin
     BuscarEquipoPorPrecio := -1;
  end;
end;

procedure Intercambiar(var X:TCelular;var Y:TCelular);
var
  Temp:TCelular;
begin
  Temp:=X;
  X:=Y;
  Y:=Temp;
end;

//seleccion
procedure OrdenarPorNroSerie(var Equipos:ACelular; var N:integer);
var
 i, j,Minimo: Integer;
begin
   for i := 1 to N - 1 do
   begin
     Minimo:=i;
     for J := (I + 1) to N Do
       if (Equipos[j].NroSerie < Equipos[Minimo].NroSerie) then
           Minimo:=j;
       Intercambiar(Equipos[i],Equipos[Minimo]);
   end
end;

//seleccion
procedure OrdenarPorModelo(var Equipos:ACelular; var N:integer);
var
 i, j,Minimo: Integer;
begin
   for i := 1 to N - 1 do
   begin
     Minimo:=i;
     for J := (I + 1) to N Do
       if (Equipos[j].Modelo < Equipos[Minimo].Modelo) then
           Minimo:=j;
       Intercambiar(Equipos[i],Equipos[Minimo]);
   end
end;

//seleccion
procedure OrdenarPorPrecio(var Equipos:ACelular; var N:integer);
var
 i, j,Minimo: Integer;
begin
   for i := 1 to N - 1 do
   begin
     Minimo:=i;
     for J := (I + 1) to N Do
       if (Equipos[j].Precio < Equipos[Minimo].Precio) then
           Minimo:=j;
       Intercambiar(Equipos[i],Equipos[Minimo]);
   end
end;

function validarGB(valor1: integer):Boolean;
begin
if((valor1 AND (valor1 - 1)) = 0) then
begin
 validarGB := true;
end
else
begin
validarGB := false;
end
end;

procedure CargarEquipos (var Equipos:ACelular; var N: integer);
var
  i,
  OpcionEstado:Integer;
  Cod:TString;
  Opcion:char;
begin
  i:=N+1;
  repeat
    Write('Ingrese el Numero de Serie ->');
    ReadLn(Cod);
    while(BuscarEquipoPorNroSerie(Equipos,N,Cod)<>-1) do
    begin
      Write('El nro de serie ya existe, ingrese otro ->');
      ReadLn(Cod);
    end;
    with Equipos[i] do
    begin
      NroSerie:=Cod;
      Write('Ingrese la marca ->');
      ReadLn(Marca);
      Write('Ingrese el modelo ->');
      ReadLn(Modelo);
      Write('Ingrese el precio->');
      ReadLn(Precio);
      Write('Ingrese la resolucion de la camara principal (En Mpx)->');
      ReadLn(ResCamaraPrin);
      Write('Ingrese la resolucion de la camara frontal (En Mpx)->');
      ReadLn(ResCamaraFron);
      Write('Ingrese el tamanio del display (en pulgadas)->');
      ReadLn(TamanioDisplay);
      Write('Ingrese la resolucion del display (ancho y alto)->');
      ReadLn(ResDisplay.Ancho);
      ReadLN(ResDisplay.Alto);
       Write('Ingrese la memoria interna maxima (En GB) ->');
       ReadLn(MemoriaInt);
      while(NOT validarGB(MemoriaInt)) do
      begin
        Write('Ingrese la memoria interna (En GB) ->');
        ReadLn(MemoriaInt);
      end;
      Write('Ingrese la memoria externa maxima (En GB) ->');
      ReadLn(MemoriaExtMax);
      Write('Ingrese el sistema operativo ->');
      ReadLn(SistOp);
      Write('Ingrese la capacidad de bateria (mAh) ->');
      ReadLn(CapacidadBat);
      Write('Ingrese el estado (1- EN STOCK,2- VENDIDO) ->');
      ReadLn(OpcionEstado);
      repeat
        if (OpcionEstado=1) then
        begin
           Estado := True
        end
        else if (OpcionEstado=2) then
        begin
           Estado := False
        end
        else
        begin
           Write('Estado incorrecto, ingrese nuevamente ->');
           ReadLn(OpcionEstado);
        end;
      until (OpcionEstado=1) or (OpcionEstado=2);
      inc(N);
      inc(i);
      WriteLn();
      WriteLn('Desea ingresar otro equipo? S/N ->');
      ReadLn(Opcion);
      Opcion := upCase(Opcion);
    end;
  until (Opcion='N');
end;

procedure MostrarCabecera();
begin
  Write('Nro Serie');GotoXY(10,1);
  Write('Marca');GotoXY(30,1);
  Write('Modelo');GotoXY(50,1);
  Write('Precio');GotoXY(60,1);
  Write('Resol');GotoXY(70,1);
  Writeln('Estado');
end;

procedure MostrarEquipoTabla(Equipo:TCelular;y:integer);
begin
    //TODO
  with Equipo do
  begin
    Write(NroSerie);GotoXY(10,y);
    Write(Marca);GotoXY(30,y);
    Write(Modelo);GotoXY(50,y);
    Write(Precio:4:2);GotoXY(60,y);
    Write(ResCamaraFron:4:2,'Mpx');GotoXY(70,y);
    if (Estado) then
       Writeln('EN STOCK')
    else
      Writeln('VENDIDO');

  end;
end;

//muestra los equipos de una marca dada ordenada por modelo
procedure MostrarMarcaPorModelo (var Equipos:ACelular;var N:integer;Marca:TString);
var
  i,pos:integer;
begin
   OrdenarPorModelo(Equipos,N);
   ClrScr;
   MostrarCabecera();
   pos:=1;
   for i:=1 to n do
   begin
     if (Equipos[i].Marca = Marca) then
     begin
        MostrarEquipoTabla(Equipos[i],pos+1);
        inc(pos);
     end;
   end;
end;

//muestra los equipos de una marca dada ordenada por precio
procedure MostrarMarcaPorPrecio (var Equipos:ACelular;var N:integer;Marca:TString);
var
  i,pos:integer;
begin
   OrdenarPorPrecio(Equipos,N);
   ClrScr;
   MostrarCabecera();
   pos:=1;
   for i:=1 to n do
   begin
     if (Equipos[i].Marca = Marca) then
     begin
        MostrarEquipoTabla(Equipos[i],pos+1);
        inc(pos);
     end;
   end;
end;

procedure MostrarEquiposPorResCamara(Equipos:ACelular;var N:integer;ResCamara:Real);
var
  i,pos:integer;
begin
   OrdenarPorNroSerie(Equipos,N);
   ClrScr;
   MostrarCabecera();
   pos:=1;
   for i:=1 to n do
   begin
     if (Equipos[i].ResCamaraFron >= ResCamara) then
     begin
        MostrarEquipoTabla(Equipos[i],pos+1);
        inc(pos);
     end;
   end;
end;

function MostrarMenu ():integer;
begin
  WriteLn('MENU');
  WriteLN('1- Cargar equipos');
  WriteLn('2- Mostrar equipos de una marca por modelo');
  WriteLn('3- Mostrar equipos de una marca por precio');
  WriteLn('4- Buscar equipo por numero de serie');
  WriteLn('5- Buscar equipo por precio');
  WriteLn('6- Mostrar equipos por resolucion de camara principal');
  WriteLn('7- Mostrar equipos por intervalo de precios');
  WriteLn('8- Modificar datos de equipo');
  WriteLn('9- Vender un equipo');
  WriteLn('0- Salir');
  Write('->');
  Readln(MostrarMenu);
end;

var
  Celulares:ACelular;
  N,Opcion,IndiceBuscado:integer;
  NroSerie,Marca:TString;
  Precio,ResCamara:Real;
begin
  N:=0;
  repeat
     ClrScr;
     Opcion:=MostrarMenu();
     case Opcion of
       1:
       begin
          CargarEquipos(Celulares,N);
       end;
       2:
       begin
         Writeln('Ingrese la marca ->');
         ReadLn(Marca);
         MostrarMarcaPorModelo(Celulares,N,Marca);
       end;
       3:
       begin
         Writeln('Ingrese la marca ->');
         ReadLn(Marca);
         MostrarMarcaPorPrecio(Celulares,N,Marca);
       end;
       4:
       begin
           Writeln('Ingrese el nro de serie a buscar ->');
           ReadLn(NroSerie);
           OrdenarPorNroSerie(Celulares,N);
           IndiceBuscado := BuscarEquipoPorNroSerie(Celulares,N,NroSerie);
           if (IndiceBuscado <> -1) then
           begin
              ClrScr;
              MostrarCabecera();
              MostrarEquipoTabla(Celulares[IndiceBuscado],2);
              Writeln('Equipo encontrado');
           end
           else
           begin
             Writeln('No se encontro el equipo');
           end;
       end;
       5:
       begin
           Writeln('Ingrese el precio a buscar ->');
           ReadLn(Precio);
           OrdenarPorPrecio(Celulares,N);
           IndiceBuscado := BuscarEquipoPorPrecio(Celulares,N,Precio);
           if (IndiceBuscado <> -1) then
           begin
              ClrScr;
              MostrarCabecera();
              MostrarEquipoTabla(Celulares[IndiceBuscado],2);
              Writeln('Equipo encontrado');
           end
           else
           begin
             Writeln('No se encontro el equipo con ese precio');
           end;
       end;
       6:
       begin
         Writeln('Ingrese la resolucion de la camara principal ->');
         ReadLn(ResCamara);
         MostrarEquiposPorResCamara(Celulares,N,ResCamara);
       end;
       7:
       begin

       end;
       8:
       begin

       end;
       9:
       begin

       end;
       0:writeln('Fin del programa');
       else
         writeln('Opcion incorrecta');
     end;
     WriteLn;
     write('Presione una tecla para continuar...');
     ReadKey;
  until Opcion=0;
end.


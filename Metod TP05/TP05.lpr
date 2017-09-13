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
    NroSerie: TString;
    Marca: TString;
    Modelo: TString;
    Precio: Real;
    Procesador: TString;
    ResCamaraPrin: Real;
    ResCamaraFron: Real;
    TamanioDisplay: Real;
    ResDisplay: TResol;
    MemoriaInt: Integer;
    MemoriaExtMax: Integer;
    SistOp: TString;
    CapacidadBat: Integer;
    Estado: Boolean;//En stock=VERDADERO; Vendido=FALSO;
  end;
  ACelular = array[1..MAX] of TCelular;

(*-------------------------------BUSQUEDAS---------------------------------*)

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
       Encontrado := True
    else if (Equipos[Medio].NroSerie < Buscado) then
      Inicio := Medio + 1
    else
      Fin := Medio - 1
  end;
  if (Encontrado) then
    BuscarEquipoPorNroSerie := Medio
  else
    BuscarEquipoPorNroSerie := -1;
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
       Encontrado := True
    else if (Equipos[Medio].Precio < Buscado) then
      Inicio := Medio + 1
    else
      Fin := Medio - 1;
  end;
  if (Encontrado) then
    BuscarEquipoPorPrecio := Medio
  else
     BuscarEquipoPorPrecio := -1;
end;

(*-------------------------------ORDENACIONES---------------------------------*)

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

(*-----------CARGA, MODIFICACION, VENTA Y VALIDACIONES---------------------*)

//ValidarGB := ((valor1 and (valor1 - 1)) = 0);
function ValidarGB(Valor1: integer):Boolean;
begin
  if((Valor1 and (Valor1 - 1)) = 0) then
  begin
    ValidarGB := true;
  end
  else
  begin
    ValidarGB := false;
  end
end;

function ValidarNroSerie(var Equipos:ACelular;N:Integer):TString;
begin
    Write('Ingrese el Numero de Serie ->');
    ReadLn(ValidarNroSerie);
    while(BuscarEquipoPorNroSerie(Equipos,N,ValidarNroSerie)<>-1) do
    begin
      Write('El nro de serie ya existe, ingrese otro ->');
      ReadLn(ValidarNroSerie);
    end;
end;

function ValidarReal(Valor:Real):Boolean;
begin
    ValidarReal:=(Valor>0);
end;

function ValidarEntero(Valor:Integer):Boolean;
begin
  ValidarEntero:= (Valor>0);
end;

function ValidarResolucion(Ancho,Alto:integer):Boolean;
begin
  ValidarResolucion:=(Alto>=800) and (Ancho>=600);
end;

function ValidarEstado(Valor:integer):Boolean;
begin
  ValidarEstado:=(Valor=1)or(Valor=2);
end;

procedure CargarEquipos (var Equipos:ACelular; var N: integer);
var
  i,
  OpcionEstado:Integer;
  Opcion:char;
begin
  i:=N+1;
  repeat
    with Equipos[i] do
    begin
      NroSerie:=ValidarNroSerie(Equipos,N);

      Write('Ingrese la marca ->');
      ReadLn(Marca);

      Write('Ingrese el modelo ->');
      ReadLn(Modelo);

      Write('Ingrese el precio->');
      ReadLn(Precio);
      while(not ValidarReal(Precio)) do
        begin
          Write('Precio debe ser un numero positivo ->');
          ReadLn(Precio);
        end;

      Write('Ingrese la resolucion de la camara principal (En Mpx)->');
      ReadLn(ResCamaraPrin);
      while(not ValidarReal(ResCamaraPrin)) do
        begin
          Write('Resolucion debe ser un numero positivo ->');
          ReadLn(ResCamaraPrin);
        end;

      Write('Ingrese la resolucion de la camara frontal (En Mpx)->');
      ReadLn(ResCamaraFron);
      while(not ValidarReal(ResCamaraFron)) do
        begin
          Write('Resolucion debe ser un numero positivo ->');
          ReadLn(ResCamaraFron);
        end;

      Write('Ingrese el tamanio del display (en pulgadas)->');
      ReadLn(TamanioDisplay);
      while(not ValidarReal(TamanioDisplay)) do
        begin
          Write('Precio debe ser un numero positivo ->');
          ReadLn(TamanioDisplay);
        end;

      Writeln('Ingrese la resolucion del display');
      Write('(ancho)->');
      ReadLn(ResDisplay.Ancho);
      Write('(alto) ->');
      ReadLN(ResDisplay.Alto);
      while(not ValidarResolucion(ResDisplay.Ancho,ResDisplay.Alto)) do
        begin
          Writeln('Resolucion debe ser como minimo 800 alto y 600 ancho ->');
          Write('(ancho)->');
          ReadLn(ResDisplay.Ancho);
          Write('(alto) ->');
          ReadLN(ResDisplay.Alto);
        end;

      Write('Ingrese la memoria interna maxima (En GB) ->');
      ReadLn(MemoriaInt);
      while(not ValidarGB(MemoriaInt)) do
      begin
        Write('Ingrese la memoria interna (En GB) ->');
        ReadLn(MemoriaInt);
      end;

      Write('Ingrese la memoria externa maxima (En GB) ->');
      ReadLn(MemoriaExtMax);
      while(not ValidarGB(MemoriaExtMax)) do
      begin
        Write('Ingrese la memoria externa (En GB) ->');
        ReadLn(MemoriaExtMax);
      end;

      Write('Ingrese el sistema operativo ->');
      ReadLn(SistOp);

      Write('Ingrese la capacidad de bateria (mAh) ->');
      ReadLn(CapacidadBat);
      while(not ValidarEntero(CapacidadBat)) do
      begin
        Write('Capacidad incorrecta debe ser positiva ->');
        ReadLn(CapacidadBat);
      end;

      Write('Ingrese el estado (1- EN STOCK,2- VENDIDO) ->');
      ReadLn(OpcionEstado);
      while (not ValidarEstado(OpcionEstado)) do
      begin
        Write('Estado incorrecto, ingrese nuevamente ->');
        ReadLn(OpcionEstado);
      end;
      Estado:=(OpcionEstado=1);

      inc(N);
      inc(i);

      WriteLn();
      WriteLn('Desea ingresar otro equipo? S/N ->');
      ReadLn(Opcion);
      Opcion := upCase(Opcion);
    end;
  until (Opcion='N');
end;

(*------------------------MUESTRAS POR PANTALLA-----------------------------*)

//Mostramos solo lo mas importante, debido a las limitaciones de ancho de la consola
procedure MostrarCabecera();
begin
  Write('Nro');GotoXY(5,1);
  Write('Marca');GotoXY(20,1);
  Write('Modelo');GotoXY(35,1);
  Write('Precio');GotoXY(45,1);
  Write('Resol');GotoXY(53,1);
  Writeln('Estado');
end;

procedure MostrarEquipoTabla(Equipo:TCelular;y:integer);
begin
  with Equipo do
  begin
    Write(NroSerie);GotoXY(5,y);
    Write(Marca);GotoXY(20,y);
    Write(Modelo);GotoXY(35,y);
    Write(Precio:4:2);GotoXY(45,y);
    Write(ResCamaraFron:4:1,'Mpx');GotoXY(53,y);
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

(*-------------------------------PRINCIPAL---------------------------------*)

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


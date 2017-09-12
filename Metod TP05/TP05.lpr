program TP05;
uses
  crt;
const
  MAX=100;
type
  TString = string[40];
  TCelular = record
    NroSerie: Integer;
    Marca: TString;
    Modelo: TString;
    Precio: Real;
    Procesador: TString;
    ResCamaraPrin: Real;
    ResCamaraFron: Real;
    TamanioDisplay: Real;
    ResDisplay: TString;
    MemoriaInt: Real;
    MemoriaExtMax: Real;
    SistOp: TString;
    CapacidadBat: Integer;
    Estado: TString;
  end;
  ACelular = array[1..MAX] of TCelular;

function BuscarEquipoPorCodigo(Equipos:ACelular;N:integer;Buscado:integer):integer;
begin
  //TODO
  BuscarEquipoPorCodigo := -1;
end;
procedure CargarEquipos (var Equipos:ACelular; var N: integer);
var
  i,
  OpcionEstado,
  Cod:integer;
  Opcion:char;
begin
  i:=N+1;
  repeat
    Write('Ingrese el Numero de Serie ->');
    ReadLn(Cod);
    while(BuscarEquipoPorCodigo(Equipos,N,Cod)<>-1) do
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
      Write('Ingrese la resolucion del display ->');
      ReadLn(ResDisplay);
      Write('Ingrese la memoria interna (En GB) ->');
      ReadLn(MemoriaInt);
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
           Estado := 'EN STOCK'
        end
        else if (OpcionEstado=2) then
        begin
           Estado := 'VENDIDO'
        end
        else
        begin
           Write('Estado incorrecto, ingrese nuevamente ->');
           ReadLn(OpcionEstado);
        end;
      until (OpcionEstado=1) or (OpcionEstado=2);

      WriteLn();
      WriteLn('Desea ingresar otro equipo? S/N ->');
      ReadLn(Opcion);
      Opcion := upCase(Opcion);
    end;
  until (Opcion='N');
end;

procedure MostrarEquipoTabla(Equipo:TCelular;y:integer);
begin

end;

procedure MostrarEquipos (Equipos:ACelular;N:integer);
var
  i:integer;
begin
  for i:=1 to N do
    MostrarEquipoTabla(Equipos[i],i+1);
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
  N,Opcion:integer;
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

       end;
       3:
       begin

       end;
       4:
       begin

       end;
       5:
       begin

       end;
       6:
       begin

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


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
    ResCamaraPrin: Integer;
    ResCamaraFron: Integer;
    TamanioDisplay: Real;
    ResolDisplay: TString;
    MemoriaInt: TString;
    MemoriaExtMax: TString;
    SistOp: TString;
    CapacidadBat: Integer;
    Estado: TString;
  end;
  ACelular = array[1..MAX] of TCelular;

function MostrarMenu ():integer;
begin
  WriteLn('MENU');
  WriteLN('1- Cargar equipos');
  WriteLn('2- Mostrar equipos por modelo');
  WriteLn('3- Mostrar equipos por precio');
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


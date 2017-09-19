program TP06P1;
uses
    crt;
const
  MAX=100;
type
  TNombre = String[50];
  TProducto = record
    NroVenta : Integer;
    NombreLote : TNombre;
    CostoLote : Real;
  end;
  AProductos = Array[1..MAX] of TProducto;

procedure Intercambiar(var X:TProducto;var Y:TProducto);
var
  Temp:TProducto;
begin
  Temp:=X;
  X:=Y;
  Y:=Temp;
end;

//seleccion
procedure OrdenarPorPrecio(var Productos:AProductos; var N:integer);
var
 i, j,Minimo: Integer;
begin
   for i := 1 to N - 1 do
   begin
     Minimo:=i;
     for J := (I + 1) to N Do
       if (Productos[j].CostoLote < Productos[Minimo].CostoLote) then
           Minimo:=j;
       Intercambiar(Productos[i],Productos[Minimo]);
   end
end;

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

procedure MostrarProductos (var Productos:TProducto;var N:integer);
var
  i,pos:integer;
begin
   MostrarCabecera();
   pos:=1;
   for i:=1 to n do
   begin
    MostrarEquipoTabla(Productos[i],pos+1);
    inc(pos);
   end;
end;



function MostrarMenu ():integer;
begin
  WriteLn('MENU');
  WriteLN('1- Cargar productos');
  WriteLn('2- Mostrar productos');
  WriteLn('3- Fusionar listas en una sola');
  WriteLn('0- Salir');
  Write('->');
  Readln(MostrarMenu);
end;



var
  Lista1,Lista2:AProductos;
  N,M:integer;
  Opcion:integer;
begin
 N:=0;
 M:=0;
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
      0:writeln('Fin del programa');
      else
        writeln('Opcion incorrecta');
    end;
    WriteLn;
    write('Presione una tecla para continuar...');
    ReadKey;
 until Opcion=0;
end.

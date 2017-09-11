program Punto5Tp2;
{
5. Una empresa dedicada a la fabricación de licores necesita programa que le permita gestionar la producción
de sus productos. Sus necesidades están basadas en los siguientes requerimientos:
a. Cargar los diferentes tipos de licores que fabrica. Los mismos están caracterizados por código de licor,
nombre, forma de elaboración (A, B, C), cantidad en stock y stock mínimo.
b. Mostrar todos los licores guardados en el sistema
c. Mostrar los licores de una forma de elaboración dada
d. Mostrar los licores cuyo stock es menor al mínimo
e. Mostrar el stock cuyo stock es el menor de todos  }

uses crt;

const
  MAX=100;

type
  TLicor= record
        codigo:integer;
        nombre:string[30];
        formaElaboracion:char;
        stock:integer;
        stockMinimo:integer;
  end;
  TLicores= array[1..MAX] of TLicor;

procedure cargarLicor(var licor:TLicor);
begin
  with licor do
  begin
    writeln('Ingrese los datos del licor');
    write('Codigo ->');
    readln(codigo);
    write('Nombre ->');
    readln(nombre);
    write('Elaboracion A,B,C ->');
    readln(formaElaboracion);
    write('Stock Minimo ->');
    readln(stockMinimo);
    write('Stock ->');
    readln(stock);
  end;
end;

procedure cargarLicores(var licores:TLicores;var n:integer);
var
  opcion:char;
begin
  repeat
      cargarLicor(licores[n+1]);
      n:=n+1;
      write('Desea cargar otro licor? S/N-> ');
      readln(opcion);
  until (opcion='n') or (opcion='N');
end;

procedure mostrarLicorTabla(licor:TLicor;y:integer);
begin
  with licor do
  begin
    Write(codigo); gotoxy(10,y);
    Write(nombre); gotoxy(30,y);
    Write(formaElaboracion); gotoxy(40,y);
    Write(stock); gotoxy(50,y);
    Writeln(stockMinimo);
  end;

end;

procedure Cabecera();
begin
  ClrScr();
  Write('Codigo'); gotoxy(10,1);
  Write('Nombre'); gotoxy(30,1);
  Write('F. Elab.'); gotoxy(40,1);
  Write('Stock'); gotoxy(50,1);
  Writeln('Stock Min.');
end;

procedure mostrarLicores(Licores:TLicores;n:integer);
var
  i:integer;
begin
  cabecera();
  for i:=1 to n do
      mostrarLicorTabla(licores[i],i+1);
  end;

procedure mostrarLicoresPorFormaElaboracion (Licores:Tlicores;n:integer;elaboracion:char);
var cont,i:integer;
begin
  cabecera();
  cont:=0;
  for i:=1 to n do
      if (licores[i].formaElaboracion=elaboracion) then
         begin
              cont:=cont+1;
              mostrarLicorTabla(licores[i],cont+1);
         end;

end;

procedure  mostrarLicoresMenoresStockMinimo(Licores:Tlicores;n:integer);
var i,cont:integer;
begin
  cabecera();
  cont:=0;
  for i:=1 to n do
      with licores[i] do
      if (stock<stockMinimo) then
         begin
              cont:=cont+1;
              mostrarLicorTabla(licores[i],cont+1);
         end;

end;

procedure mostrarMenorStock (var licores:Tlicores;n:integer);
var menor:tlicor;i:integer;
begin
  menor:= licores[1];
  for i:=2 to n do
     if menor.stock>licores[i].stock then
        menor:=licores[i];
  Cabecera();
  mostrarLicorTabla(menor,2);
end;

function menu():integer;
begin
  writeln('Menu');
  writeln('1- Cargar Licores');
  writeln('2- Mostrar Licores');
  writeln('3- Mostrar licores por forma de elaboración');
  writeln('4- Mostrar Cuyo stock es menor al minimo');
  writeln('5 - Mostrar el producto con menor stock');
  writeln('0 - Salir');
  write('-> ');
  readln(menu);
end;

var
  option:integer;
  elab:char;
  licores:tLicores;
  n:integer;

begin
    n:=0;
    repeat
        clrscr();
        option:=menu();
        case option of
            1:cargarLicores(licores,n);
            2:mostrarLicores(licores,n);
            3:
            begin
              write('ingrese la forma de elaboracion ->');
              readln(elab);
              mostrarLicoresPorFormaElaboracion(licores,n,elab);
            end;
            4: mostrarLicoresMenoresStockMinimo(licores,n);
            5: mostrarMenorStock(licores,n);
            0: writeln('Fin del Programa');
            otherwise
        end;
        writeln();
        write('Presione una tecla para continuar');readkey();
    until (option=0);

end.


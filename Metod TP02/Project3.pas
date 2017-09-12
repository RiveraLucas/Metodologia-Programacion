program Project3;

uses
 crt;

type
  producto = record
    codigo: integer;
    descripcion: String[50];
    precio:real;
  end;

var
  opcion:integer;
  prod:producto;

procedure cargarProducto(var prod:producto);
begin
  with prod do
  begin
       write('Ingrese el codigo ->');
       readln(codigo);
       write('Ingrese la descripcion ->');
       readln(descripcion);
       write('Ingrese el precio ->');
       readln(precio);
  end;
end;

procedure mostrarProducto(prod:producto);
begin
  with prod do
  begin
       writeln('Codigo: ',codigo);
       writeln('Descripcion; ',descripcion);
       WriteLn('Precio: ',precio);
  end;
end;

begin
    repeat
      writeln('1- Cargar, 2- Mostrar, 3- Salir');
      readln(opcion);
      case opcion of
           1: cargarProducto( prod );
           2: mostrarProducto( prod);
           3: writeln('Fin del Programa');
           else writeln('Opcion Incorrecta');
      end;
    until (opcion=3);
    readKey();
end.


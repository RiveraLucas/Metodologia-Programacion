program TP04p1;

uses CRT;
const
  MAX=100;
type

TProducto = record
          codigo:integer;
          nombre:string[30];
          precio:real;
          tipo:char;
          end;
AProductos = Array[1..MAX] of TProducto;

function buscarProductoPorCodigo(productos:AProductos;n:integer;buscado:integer;var pos:integer):boolean;
var
  i:integer;
begin
  buscarProductoPorCodigo:=false;
  i:=1;
  pos:=0;
   while (not buscarProductoPorCodigo) and (i<=n) do
   begin
     if (productos[i].codigo = buscado) then
     begin
        pos:=i;
        buscarProductoPorCodigo:=true;
     end;
     i:=i+1;
   end;
end;

procedure cargarProductos(var Productos:AProductos;var n:integer);
var
  i:integer;
  cod:integer;
begin
     i:=1;
     repeat
          writeln('ingrese el codigo del producto') ;
          readln(cod);
          if (cod<>0) then
          begin
               with productos[i] do
               begin
                 codigo:=cod;
                 writeln('ingrese el nombre del producto');
                 readln(nombre);
                 writeln('ingrese el precio del producto');
                 readln(precio);
                 writeln('ingrese el tipo del producto');
                 readln(tipo);
                 writeln;
                 n:=n+1;
                 i:=i+1;
               end;
          end;
     until (cod=0);
end;

procedure mostrarProductoTabla(producto:Tproducto;y:integer);
begin
  with producto do
  begin
    Write(codigo); gotoxy(10,y);
    Write(nombre); gotoxy(30,y);
    Write(precio:5:2); gotoxy(40,y);
    Writeln(tipo);
  end;

end;

procedure Cabecera();
begin
  ClrScr();
  Write('Codigo'); gotoxy(10,1);
  Write('Nombre'); gotoxy(30,1);
  Write('Precio'); gotoxy(40,1);
  Writeln('Tipo');
end;

procedure mostrarProductosPorTipo(productos:AProductos;n:integer;tipobusc:char);
var
  i:integer;
begin
     cabecera();
     for i:=1 to n do
         with productos[i] do
              if (tipo=tipobusc) then
                    mostrarProductoTabla(productos[i],i+1);
end;

procedure intercambiar(var x:TProducto;var y:TProducto);
var
  temp:TProducto;
begin
  temp:=x;
  x:=y;
  y:=temp;
end;

procedure ordenarProductosPorNombre(var productos:AProductos;n:integer);
Var
 i, j,minimo: Integer;
 Begin
   For i := 1 To n - 1 Do
   Begin
     minimo:=i;
     For J := (I + 1) To N Do
       If (productos[j].nombre < productos[minimo].nombre) Then
           minimo:=j;
       intercambiar(productos[i],productos[minimo]);
   End
 End;

procedure mostrarProductosPorNombre (var productos:AProductos;n:integer);
var i:integer;
begin
  ordenarProductosPorNombre(productos,n);
  cabecera();
  for i:=1 to n do
       mostrarProductoTabla(productos[i],i+1);
end;

procedure ordenarProductosPorMayorPrecio(var productos:AProductos;n:integer);
var
  top,insercionPos:integer;
  cache:TProducto;
begin
    for top:=1 to n-1 do
    begin
        cache:=productos[top];
        InsercionPos:=top;
        while (productos[insercionPos-1].precio > cache.precio)
        and (insercionpos>0) do
        begin
             productos[insercionPos]:=productos[insercionpos-1];
             dec(insercionPos);
        end;
        productos[insercionPos]:=cache;
    end;
end;

procedure mostrarKProductosPorMayorPrecio (var productos:AProductos;n:integer;k:integer);
var
  i:integer;
begin
    ordenarProductosPorMayorPrecio(productos,n);
    Cabecera();
    for i:=1 to k do
        mostrarProductoTabla(productos[i],i+1);
end;

procedure eliminarProducto(var productos:AProductos;var n:integer;buscado:integer);
var
  encontrado:boolean;
  i,pos:integer;
begin
   encontrado:=buscarProductoPorCodigo(productos,n,buscado,pos);
   if (encontrado) then
   begin
       for i:=pos to n-1 do
           productos[i]:=productos[i+1];
       dec(n);
   end
   else
       writeln('El producto no existe');

end;

procedure modificarProducto(var productos:AProductos;var n:integer;buscado:integer);
var
 encontrado:boolean;
  i,pos:integer;
begin
     encontrado:=buscarProductoPorCodigo(productos,n,buscado,pos);
   if (encontrado) then
   begin
       {TODO codigo para modificar campos de un producto}
   end
   else
       writeln('El producto no existe');
end;

var
  listaProductos:AProductos;
  n:integer;
begin
  n:=0;
  cargarProductos(listaProductos,n);
  mostrarProductosPorNombre(listaProductos,n);
  readkey();
  mostrarKProductosPorMayorPrecio(listaProductos,n,1);
  readkey();
  mostrarProductosPorTipo(listaProductos,n,'a');
  readkey();

end.


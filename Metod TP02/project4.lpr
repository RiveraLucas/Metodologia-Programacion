program project4;

uses crt;

type
  cadena = string[50];
  producto = record
    codigo: integer;
    descripcion: cadena;
    precio:real;
  productos = array[1..MAX] of producto;
  end;

procedure ordenarPorCodigo (var prod:productos;n:integer);
var
  temp:real;
  i,j:integer;
begin
        for i := 1 to n-1 do
            for j := 1 to n-i do
                if prod[j].codigo>prod.codigo[j+1] then
                begin
                  temp:=prod[j+1];
                  numb[j+1]:=prod[j];
                  prod[j]:=temp;
                end
end;

 function buscarCodigo(prod:productos;buscado:integer,n:integer):bool;
 var
   i,tope:integer;
 begin
     ordenarPorCodigo(prod);
     buscarCodigo:=false;
     i:=(n+1)/2;
     tope:=n;
     while (not buscarCodigo) do
     begin
       if(buscado=prod[i].codigo)  then
           buscarCodigo:=true;
       else if (buscado>prod[i].codigo) then
            i:=i+(tope-i)/2;
       else
           tope:=i
           i:=i/2;

     end;
 end;



procedure cargarProductos(var prod:productos; var n:integer);
begin


begin
end.


program CasoEstudio;

uses
  crt;

type
   TFecha = record
     anio: 1990..2017;
     mes: 1..12;
     dia:1..31;
   end;
   REmpleado = record
     nombre: string[30];
     sueldo: real;
     fechaIngreso : TFecha
   end;
   Aempleados = array[1..100] of REmpleado;

var
  empleados: Aempleados;
  n,opcion:integer;

procedure cargarEmpleados(var empleados:Aempleados;var n:integer);
var
  i:integer;
begin
     write('cuantos empleados desea cargar?');
     readln(n);
      for i:=1 to n do
      begin
        with empleados[i],fechaIngreso do
        begin
          write('nombre: ');
          readln(nombre);
          write('sueldo: ');
          readln(sueldo);
          write('fecha de ingreso: ');
          read(dia);
          read(mes);
          readln(anio);
          writeln();
        end;
      end;
end;

procedure mostrarEmpleados (empleados:Aempleados; n:integer);
var
  i: integer;
begin
      for i:=1 to n do
        begin
          with empleados[i],fechaIngreso do
          begin
            writeln('nombre: ',nombre);
            writeln('sueldo: ',sueldo:7:2);
            writeln('fecha de Ingreso: ',dia,'/',mes,'/',anio);
            writeln();
          end;
        end;

end;

function sueldoMaximo(empleados Aempleados; n:integer):real;
var
  i:integer;
begin
  sueldoMaximo:=empleados[1].sueldo;
  for i:=2 to n do
    if (empleados[i].sueldo > sueldoMaximo) then
         sueldoMaximo:= empleados[i].sueldo;
end;

procedure empleadosConMayorSueldo(empleados Aempleados;n:integer);
var
  i:integer;
  sueldoMax:real;
begin
   sueldoMax:=sueldoMaximo(empleados,n);
   writeln('Los empleados que mas ganan (',sueldoMax:4:2,') son: ');
   for i:=1 to n do
     if (empleados[i].sueldo = sueldoMax) then
          writeln(i,' - ', empleados[i].nombre);


begin
   n:=0;
   repeat
     clrscr();
     writeln('1-Cargar empleados');
     writeln('2-Mostrar empleados');
     writeln('3-Salir');
     readln(opcion);
     case opcion of
          1: cargarempleados(empleados,n);
          2: mostrarempleados(empleados,n);
          3: writeln('Fin del programa');
          otherwise writeln ('Opcion incorrecta');
     end;
     readkey();
   until (opcion = 3);
end.


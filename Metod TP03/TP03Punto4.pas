program TP03Punto4;
uses crt;
const
  MAX=100;
type
  Tcadena14=string[14];
  Tcadena30=string[30];
  TFecha = Record
     anio : 1990..2017 ;
     mes : 1..12 ;
     dia : 1..31
      end;
  TCliente= record
     dni:integer;
     nombre:Tcadena30;
     fechaNac:TFecha;
  end;
  TCuentaBancaria=record

     nroCuenta:Tcadena14;
     cliente:TCliente;
     fechaCreacion:TFecha;
     saldo:real;
  end;
  ACuentas = array[1..MAX] of TCuentaBancaria;

procedure Cabecera();
begin
  ClrScr();
  Write('Cuenta'); gotoxy(8,1);
  Write('DNI'); gotoxy(18,1);
  Write('Nombre'); gotoxy(40,1);
  Write('F. Nacimiento'); gotoxy(55,1);
   Write('F. Creacion'); gotoxy(70,1);
  Writeln('Saldo');
end;

procedure MostrarCuentaTabla(cuenta:TCuentaBancaria;y:integer);
begin
  with cuenta,fechaCreacion do
  begin
      Write(nroCuenta); gotoxy(8,y);
      with cliente,fechaNac do
      begin
        Write(dni); gotoxy(18,y);
        Write(nombre); gotoxy(40,y);
        Write(dia,'/',mes,'/',anio); gotoxy(55,y);
      end;
      Write(dia,'/',mes,'/',anio); gotoxy(70,y);
      Writeln(saldo:4:2);
  end;
end;

procedure MostrarCuentasTabla(cuentas:ACuentas;n:integer);
var
    i:integer;
begin
  cabecera();
  for i:=1 to n do
      MostrarCuentaTabla(cuentas[i],i+1);
end;

function menu():integer;
begin
  writeln('Menu');
  writeln('1- Crear Cuentas');
  writeln('2- Mostrar Cuentas');
  writeln('3- Buscar cuenta por número de cuenta');
  writeln('4- Buscar cuenta por dni');
  writeln('5 - Mostrar clientes con mayor saldo');
  writeln('6 - Mostrar saldo total acumulado');
  writeln('0 - Salir');
  write('-> ');
  readln(menu);
end;

function buscarPorNroCuenta (cuentas:ACuentas;n:integer;buscado:Tcadena14):integer;
var
    i:integer;
begin
   i:=1;
   while (i<=n) and (buscado<>cuentas[i].nroCuenta) do
         i:=i+1;
   if (i=n+1) then
      buscarPorNroCuenta:=-1
   else
      buscarPorNroCuenta:=i;
end;

function buscarPorDni (cuentas:ACuentas;n:integer;buscado:integer):integer;
var
    i:integer;
begin
   i:=1;
   while (i<=n) and (buscado<>cuentas[i].cliente.dni) do
         i:=i+1;
   if (i=n+1) then
      buscarPorDNI:=-1
   else
      buscarPorDNI:=i;
end;

procedure mostrarClientesMayorSaldo(cuentas:ACuentas;n:integer);
var
    i:integer;
    Mayorcuenta:TCuentaBancaria;
begin
  Mayorcuenta:=cuentas[1];
  for i:=2 to n do
      begin
         if (cuentas[i].saldo>Mayorcuenta.saldo) then
            Mayorcuenta:=cuentas[i];
      end;
  ClrScr;
  Cabecera();
  for i:=1 to n do
      begin
         if(cuentas[i].saldo=Mayorcuenta.saldo) then
            MostrarCuentaTabla(cuentas[i],i+1);
      end;
end;

procedure mostrarSaldoAcumulado(cuentas:ACuentas;n:integer);
var
    i:integer;
    saldoTotal:real;
begin
    saldoTotal:=0;
    for i:=1 to n do
        saldoTotal:=saldoTotal+cuentas[i].saldo;
    writeln('Saldo total: ',saldoTotal:6:2);
end;

procedure CargarCuenta (var cuenta:TCuentaBancaria);
begin
  with cuenta do
  begin
     write('Ingrese el nro de cuenta->');
     readln(nroCuenta);
     with cliente do
     begin
         write('Ingrese el dni ->');
         readln(dni);
         write('Ingrese el nombre ->');
         readln(nombre);
         with fechaNac do
         begin
             write('Ingrese fecha de nacimiento D M A ->');
             readln(dia,mes,anio);
         end;
     end;
     with fechaCreacion do
     begin
         write('Ingrese la fecha de creacion ->');
         readln(dia,mes,anio);
     end;
     write('Ingrese el saldo->');
     readln(saldo);
  end;
end;

procedure cargarNCuentas(var cuentas:ACuentas;var n:integer);
var
    i:integer;
begin
  write ('Cuantas cuentas desea cargar? ->');
  readln(n);
  for i:=1 to n do
      CargarCuenta(cuentas[i]);

end;

var
    cuentas:ACuentas;
    n,option,index:integer;
    cadena:Tcadena14;
    dni:integer;
begin
    n:=1;
    repeat
        ClrScr;
        option:=Menu;

        case option of
             1:
               cargarNCuentas(cuentas,n);
             2:
               MostrarCuentasTabla(cuentas,n);
             3:
               begin
                   writeln('Ingrese el nro de cuenta a buscar:');
                   readln(cadena);
                   index:=buscarPorNroCuenta(cuentas,n,cadena);
                   if(index>=1) then
                   begin
                     Cabecera();
                     MostrarCuentaTabla(cuentas[index],2);
                   end
                   else
                       writeln('No se encontró la cuenta');
               end;
             4:
               begin
                   writeln('Ingrese el dni a buscar:');
                   readln(dni);
                   index:=buscarPorDni(cuentas,n,dni);
                   if(index>=1) then
                   begin
                     Cabecera();
                     MostrarCuentaTabla(cuentas[index],2);
                   end
                   else
                       writeln('No se encontró la cuenta');
               end;
             5:
               mostrarClientesMayorSaldo(cuentas,n);
             6:
               mostrarSaldoAcumulado(cuentas,n);
             0:
               ;
             otherwise
                      writeln('opcion incorrecta');
        end;
        ReadKey;
    until (option=0);
end.


program TP06p3;
uses
  crt,
    SysUtils, StrUtils;
type
  Cadena = String[100];
  Vector = Array[1..100] of char;
procedure MostrarLetraMasRepetida(var Cad:Cadena);
var
   Porcentaje:real;
   MasRepetida,i:char;
   j,Apariciones,Max:integer;
begin
   Max:=0;
   for i:=' ' to 'z' do
   begin
      apariciones:=0;
      for j:=1 to Length(cad) do
      begin
         if(cad[j]=i)then
            inc(Apariciones);
      end;
      if (apariciones>max) then
      begin
        max:=Apariciones;
        MasRepetida:= i;
      end;
   end;
   Porcentaje := Max/Length(cad)*100;
   WriteLn('El caracter mas repetido es: ',MasRepetida,' con ',Porcentaje:4:2,'% de apariciones');
end;

procedure Intercambiar(var X:char;var Y:char);
var
  Temp:char;
begin
  Temp:=X;
  X:=Y;
  Y:=Temp;
end;

procedure OrdenarPorCaracter(var v:Vector;var n:integer);
var
 i, j,Minimo: Integer;
begin
   for i := 1 to N - 1 do
   begin
     Minimo:=i;
     for J := (I + 1) to N Do
       if (v[j] < v[Minimo]) then
           Minimo:=j;
       Intercambiar(v[i],v[Minimo]);
   end
end;

procedure MostrarFraseOrdenadaPorLetra (cad:Cadena);
var
  v:Vector;
  i,n:integer;
begin
   n:=  Length(cad) ;
   for I:=1 to N do
       v[i]:=cad[i];

   OrdenarPorCaracter(v,N);
   for I:=1 to N do
       write(v[i]);
   writeln;
end;

procedure MostrarSumaAritmetica(cad:Cadena);
var
  i,suma,ascii:integer;
begin
   suma:=0;
   for i:=1 to length(cad) do
   begin
      ascii:=Ord(cad[i]);
      if (ascii>=48) and (ascii<=57) then
         suma:=suma + (ascii - 48);
   end;
   writeln('La suma artimetica de los valores enteros es: ',suma);
end;

var
   cad,subcad,sustituto:Cadena;
begin
  WriteLn('Ingrese una cadena:');
  Readln(cad);
  MostrarLetraMasRepetida(cad);
  writeln;
  MostrarFraseOrdenadaPorLetra(cad);
  writeln;
  MostrarSumaAritmetica(cad);
  ReadKey;
  WriteLn('Ingrese la porcion de la cadena que desea sustituir');
  readln(subcad);
  WriteLn('Ingrese el texto que se reemplazara en la cadena');
  readln(sustituto);
  cad:= StringReplace(cad,subcad,sustituto, [rfReplaceAll, rfIgnoreCase]);
  Writeln('La cadena reemplazada es: ',cad);
  readkey;

end.


program Project2;

uses
  crt;
const
  MAX=3;
type
  numbers = array [1..3] of real;
var
  numb:numbers;

procedure sort(var numb:numbers);
var
  temp:real;
  i,j:integer;
begin
        for i := 1 to MAX-1 do
            for j := 1 to MAX-i do
                if numb[j]>numb[j+1] then
                begin
                  temp:=numb[j+1];
                  numb[j+1]:=numb[j];
                  numb[j]:=temp;
                end
end;

begin
  writeln('por favor ingrese 3 numeros reales');
  readln(numb[1],numb[2],numb[3]);
  if(numb[1]<>numb[2]) and (numb[1]<>numb[3]) and (numb[3]<>numb[2]) then begin
       sort(numb);
       writeln('El valor del medio es: ',numb[2]:2:2);
  end
  else
      writeln('error, valores duplicados, no se pudo calcular el del medio');
  readkey();

end.


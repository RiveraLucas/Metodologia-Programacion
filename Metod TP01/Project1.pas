program Project1;
uses
  crt, unit2;
var
  number1, number2:integer;

function getMCD (number1 : integer;number2:integer):integer;
begin
  if (number2 = 0) then
     getMCD := number1
  else
    if (number1>number2) then
       getMCD := getMCD(number2, number1 mod number2)
    else
       getMCD := getMCD(number1, number2 mod number1);
end;

begin
    writeln('Ingrese dos numeros naturales');
    readln(number1,number2);
    writeln('El mcd es: ',getMCD(number1,number2));
    readKey();
end.

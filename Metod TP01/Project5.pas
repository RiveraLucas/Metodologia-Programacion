program Project5;
uses
crt;
var
   quant,i,primes,notPrimes,notInTheInterval,number:integer;

function isPrime (number:integer):boolean;
var
i:integer;
begin
     isPrime:=true;
     for i:=2 to number-1 do
         if (number mod i) = 0 then
            isPrime:= false;
end;
begin
      primes:=0;
      notPrimes:=0 ;
      notInTheInterval:=0;
      writeln('cuantos numeros desea ingresar?');
      readln(quant);
      for i:=1 to quant do
      begin
        writeln('ingrese un valor del 1 al 1000');
        readln(number);

        if (number>=1) and (number<=1000) then
          if (isPrime(number)) then
             primes:=primes+1
          else
             notPrimes:=notPrimes+1
        else
            notInTheInterval := notInTheInterval +1;
      end;

      writeln('cantidad de numeros primos: ',primes);
      writeln('cantidad de numeros compuestos: ', notPrimes);
      writeln('cantidad de numeros fuera del intervalo [1..1000] que no fueron considerados en la cuenta: ', notInTheInterval);


      readKey();

end.


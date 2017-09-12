program Project4;

uses
 crt;
var
  a,b,c,x1,x2,discriminant,realPart,imaginaryPart:real;
begin
     writeln('Ingrese los valores de los coeficientes A,B y C del polinomio de segundo grado');
     repeat
         readln(a);
         if (a=0) then
            writeln('el valor de a debe ser diferente de 0, ingrese nuevamente');
     until (a<>0);
     readln(b,c);
     discriminant:=sqr(b)-4*a*c;
     if(discriminant<0) then begin
           discriminant:=-discriminant;
           realPart:=-b/(2*a);
           imaginaryPart:=sqrt(discriminant)/(2*a);
           writeln('El polinomio tiene raices imaginarias');
           writeln('La raiz x1 es: ',realPart:4:2,' + ',imaginaryPart:4:2,'i');
           writeln('La raiz x2 es: ',realPart:4:2,' - ',imaginaryPart:4:2,'i');
     end
     else if (discriminant >0) then begin
           x1:=(-b+sqrt(discriminant))/(2*a);
           x2:=(-b-sqrt(discriminant))/(2*a);
           writeln('La raiz x1 es: ', x1:4:2);
           writeln('La raiz x2 es: ', x2:4:2);
     end
     else
         writeln('el polinomio tiene raiz doble =',(-b/(2*a)):4:2);

     readKey();
end.


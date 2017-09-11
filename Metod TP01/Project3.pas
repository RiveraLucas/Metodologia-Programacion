program Project3;
uses
  crt;

type
  student= record
    grade:real;
    id:integer;
  end;

var
   student1,beststudent: student;
   count:integer;
   sum,avg:real;
   answer:char;
begin
  count:=0;
  sum:=0;
  repeat
    writeln('ingrese el codigo del alumno, seguido de la nota');
    repeat
          readln(student1.id,student1.grade);
          if (student1.grade<0) or (student1.grade>10) then begin
             writeln('nota incorrecta, debe estar entre 0 y 10');
             writeln('por favor ingrese nuevamente codigo y nota');
          end;
    until (student1.grade>=0) And (student1.grade<=10);

    if (count=0) then begin
       beststudent.id:=student1.id;
       beststudent.grade:=student1.grade;
    end
    else begin
      if (beststudent.grade < student1.grade)  then begin
         beststudent.id:=student1.id;
         beststudent.grade:=student1.grade;
      end;
    end;

    sum := sum + student1.grade;
    count := count + 1;

    write('Desea ingresar otro valor s/n: ');
    readln(answer);
    writeln();
  until (answer='n') or (answer='N');

  avg:= sum / count;
  writeln('El promedio de notas es: ',avg:2:2);
  writeln('El codigo del alumno con la mejor nota (',beststudent.grade:2:2,') es: ',beststudent.id);
  readKey();
end.


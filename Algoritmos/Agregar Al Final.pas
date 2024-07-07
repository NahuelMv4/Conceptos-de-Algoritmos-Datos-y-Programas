Program Agregar_Al_Final;
Const
	Corte = 0;
Type
	Alumno = record
			DNI: Integer;
			Nom: String;
			Legajo: Integer;
		end;
	Lista = ^nodo;
	nodo = record
			dato: Alumno;
			sig: Lista;
		end;
		
Procedure LeerRegistro (var a: Alumno);
begin
	with a do begin
		writeln('Ingrese DNI del alumno:');
		readln(DNI);
		writeln('Ingrese Nombre y Apellido del alumno:');
		readln(Nom);
		writeln('Ingrese numero de Legajo del alumno:');
		readln(Legajo);
	end;
end;

Procedure AgregarAlFinal (var pri, ult: Lista; a: Alumno);
Var
	Nue: Lista;
begin
	New(Nue); {Pido memoria dinamica}
	Nue^.dato:= a; {Asigno el valor a nue}
	Nue^.sig:= nil; {El siguiente de nue lo pongo en nil}
	if (pri = nil) then {Pregunto si el puntero inicial es nil}
		pri:= nue {Si la lista es vacia le asigno el valor de nue a pri}
	else
		ult^.sig:= nue; {Sino quiere decir que la lista tiene elementos y le asigno al siguiente de ultimo el valor de nue}
	ult:= nue; {Ult toma la direcicon de nue asi queda apuntando siempre al ultimo elemento de la lista}
end;

Procedure CargarLista (var l: lista);
Var
	a: Alumno;
	ult: Lista;
begin
	LeerRegistro(a);
	While (a.DNI <> Corte) do begin
		AgregarAlFinal(l, ult, a);
		LeerRegistro(a);
	end;
end;

Procedure ImprimirRegistro (a:Alumno);
begin
	with a do begin
		writeln('El DNI del alumno es: ', DNI);
		writeln('El Nombre y Apellido del alumno es: ', Nom);
		writeln('El numero de Legajo del alumno es: ', Legajo);
		writeln('------------------------------------------------------------------');
	end;
end;

Procedure ImprimirLista(l: Lista);
begin
	While (l <> nil) do begin
		ImprimirRegistro(l^.dato);
		l:= l^.sig;
	end;
end;

// Programa Principal

Var
	l: Lista;
Begin
	l:=nil;
	CargarLista(l);
	ImprimirLista(l);
End.

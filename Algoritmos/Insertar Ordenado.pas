Program Insertard_Ordenado;
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

Procedure InsertarOrdenado (var pri: Lista; a: Alumno);
Var
	ant, act, nue: Lista;
begin
	New (nue); {Pido memoria dinamica}
	nue^.dato:= a; {A nue le asigno el valor}
	act:= pri; {Actual es pri}
	ant:= pri; {Anterior es pri}
	While (act <> nil) and (act^.dato.DNI < a.DNI) do begin {Recorro la lista hasta encontrar un valor mayor o hasta que termine la lista}
		ant:= act; {avanzo en la lista enganchando anterior con actual y actual con su siguiente}
		act:= act^.sig;
	end;
	If (ant = act) then {Me fijo si la lista es vacio}
		pri:= nue {Pri vale nue}
	else 
		ant^.sig:= nue; {Sino el siguiente del anterior vale nue}
	nue^.sig:= act; {el siguiente de nue es el actual}
end;

Procedure CargarLista (var l: lista);
Var
	a: Alumno;
begin
	LeerRegistro(a);
	While (a.DNI <> Corte) do begin
		InsertarOrdenado(l, a);
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
	l:= nil;
	CargarLista(l);
	ImprimirLista(l);
End.


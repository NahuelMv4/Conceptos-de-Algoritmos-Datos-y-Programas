Program Eliminar;
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

Procedure AgregarAdelante (var l: Lista; a: Alumno);
Var
	Nue: Lista;
begin
	New(Nue); {Pido memoria dinamica}
	Nue^.dato:= a; {Guardo el elemento en nue}
	Nue^.sig:= l; {Engancho el siguiente de nue con l}
	l:= Nue; {L pasa a tomar el valor de nue}
end;

Procedure CargarLista (var l: lista);
Var
	a: Alumno;
begin
	LeerRegistro(a);
	While (a.DNI <> Corte) do begin
		AgregarAdelante(l, a);
		LeerRegistro(a);
	end;
end;

Procedure Eliminar (var pri: Lista);
Var
	ant, act: Lista;
	elem: Integer;
begin
	writeln('Ingrese el valor que desea eliminar');
	readln(elem);
	act:= pri; {Actual toma el valor de pri}
	While (act <> nil) and (act^.dato.DNI <> elem) do begin {Avanzo en la lista hasta encontrar el elemento a eliminar o hasta que termine la lista}
		ant:= act; {Engancho anterior con actual}
		act:= act^.sig; {Engancho actual con su siguiente}
	end;
	if(act <> nil) then begin {Me fijo que la lista no este vacia}
		if(act = pri) then {Me fijo si avance en la lista}
			pri:= pri^.sig {Si es asi engancho a pri con su siguiente}
		else
			ant^.sig:= act^.sig; {Sino engancho el siguiente del anterior con el siguiente del actual}
		dispose(act) {Elimino el nodo a eliminar (el actual)}
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
	Eliminar(l);
	ImprimirLista(l);
End.


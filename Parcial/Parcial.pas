Program Parcial;
Const
	DimF = 19;
	Corte = 0;
Type
	Rango = 0..10;
	Index = 1..DimF;
	
	Vector = array [Index] of Rango;
	
	Fecha = record
				Anio: Integer;
				Mes: Integer;
				Dia: Integer;
			end;
			
	Jugador = record
				Cod: Integer;
				CodEquipo: Integer;
				Nom: String[30];
				Fecha: Fecha;
				Calificaion: Vector;
			end;
				
	Lista = ^Nodo;
	Nodo = record
			Dato: Jugador;
			Sig: Lista;
		end;
		
	Equipos = array[1..DimF + 1] of Lista;

Procedure LeerCalificacion(var v: Vector);
Var
	i: Index;
	Calificacion: Rango;
begin
	For i:= 1 to DimF do begin
		Writeln('Ingrese una calificacion para la fecha: ', i);
		Readln(Calificacion);
		v[i]:= Calificacion;
	end;
end;

Procedure LeerFecha (var f: Fecha);
begin
	With f do begin
		Writeln('Ingrese Año de nacimiento');
		Readln(Anio);
		Writeln('Ingrese Mes de nacimiento');
		Readln(Mes);
		Writeln('Ingrese Dia de nacimiento');
		Readln(Dia);
	end;
end;

Procedure LeerJugador (var j: Jugador);
begin
	With j do begin
		Writeln('Ingrese Codigo de jugador');
		Readln(Cod);
		Writeln('Ingrese Codigo de Equipo');
		Readln(CodEquipo);
		Writeln('Ingrese Nombre y Apellido');
		Readln(Nom);
		Writeln('Ingrese Fecha de nacimiento');
		LeerFecha(j.Fecha);
		Writeln('Ingrese las calificaciones de las 19 fechas');
		LeerCalificacion(j.Calificaion);
	end;
end;

Procedure AgregarAdelante (var l: Lista; j: Jugador);
Var
	Nue: Lista;
begin
	New(Nue); {Pido memoria dinamica}
	Nue^.dato:= j; {Guardo el elemento en nue}
	Nue^.sig:= l; {Engancho el siguiente de nue con l}
	l:= Nue; {L pasa a tomar el valor de nue}
end;

Procedure InsertarOrdenado (var pri: Lista; j: Jugador);
Var
	ant, act, nue: Lista;
begin
	New (nue); {Pido memoria dinamica}
	nue^.dato:= j; {A nue le asigno el valor}
	act:= pri; {Actual es pri}
	ant:= pri; {Anterior es pri}
	While (act <> nil) and (act^.dato.Cod < j.Cod) do begin {Recorro la lista hasta encontrar un valor mayor o hasta que termine la lista}
		ant:= act; {avanzo en la lista enganchando anterior con actual y actual con su siguiente}
		act:= act^.sig;
	end;
	If (ant = act) then {Me fijo si la lista es vacio}
		pri:= nue {Pri vale nue}
	else 
		ant^.sig:= nue; {Sino el siguiente del anterior vale nue}
	nue^.sig:= act; {el siguiente de nue es el actual}
end;

Procedure InicializarVector (var v: Equipos);
Var
	i: Integer;
begin
	For i:= 1 to DimF do 
		v[i]:= Nil;
end;

Procedure CargarLista (var l: lista; var v: Equipos);
Var
	j: Jugador;
begin
	LeerJugador(j);
	While (j.Cod <> Corte) do begin
		AgregarAdelante(v[j.CodEquipo], j);
		LeerJugador(j);
	end;
end;

// Inciso a

Function ConfirmarEdad (Anio: Integer): Boolean;
begin
	ConfirmarEdad:= (2023 - Anio) > 35;
end; 

Procedure InformarEdad (v: Equipos);
Var
	i: Integer;
	cant: Integer;
begin
	For i:= 1 to DimF + 1 do begin
		cant:= 0;
		While(v[i] <> Nil) do begin
			If (ConfirmarEdad(v[i]^.Dato.Fecha.Anio)) then
				cant:= cant + 1;
			v[i]:= v[i]^.Sig;
		end;
		If (cant > 0) then
			Writeln('Para el equipo ', i, ' la cantidad de jugadores que superan los 35 años son: ', cant);
	end;
end;

// Inciso b

Procedure Promedio (v: Vector; var Prom: Real; var Cumple: Boolean);
Var
	i: Index;
	cant, tot: Integer;
begin
	tot:= 0;
	cant:= 0;
	For i:= 1 to DimF do begin
		If (v[i] > 0) then
			cant:= cant + 1;
		tot:= tot + v[i];
	end;
	If (cant >= 10) then
		Cumple:= True;
	Prom:= tot / DimF;
end;

Procedure Maximo (var Max1, Max2: Integer; var 	PromMax1, PromMax2: Real; v: Equipos);
Var
	i: Integer;
	Cumple: Boolean;
	Prom: Real;
begin
	For i:= 1 to DimF + 1 do begin
		While(v[i] <> Nil) do begin
			Cumple:= False;
			Prom:= 0;
			Promedio(v[i]^.Dato.Calificaion, Prom, Cumple);
			If (Cumple) then begin
				If (Prom > PromMax1) then begin
					Max2:= Max1;
					Max1:= v[i]^.Dato.Cod;
					PromMax2:= PromMax1;
					PromMax1:= Prom;
				end
				Else
					If (Prom > PromMax2) then begin
						Max2:= v[i]^.Dato.Cod;
						PromMax2:= Prom;
					end;
			end;
			v[i]:= v[i]^.Sig;
		end;
	end;
end;

// Incisio c

Function Impar(cod: Integer): Boolean;
Var
	cant, dig: Integer;
begin
	cant:= 0;
	While (cod <> 0) do begin
		dig:= cod MOD 10;
		If (dig MOD 2 <> 0) then
			cant:= cant + 1;
		cod:= cod DIV 10;
	end;
	Impar:= cant = 3;
end;

Function VerificarEdad(Edad: Integer): Boolean;
begin
	VerificarEdad:= (Edad = 1983) or (Edad = 1990);
end; 
		
Procedure CargarListOrdenada (var l: Lista; v: Equipos);
Var
	i: Integer;
begin
	For i:= 1 to DimF + 1 do begin
		While(v[i] <> Nil) do begin
			If (Impar(v[i]^.Dato.Cod)) and (VerificarEdad(v[i]^.Dato.Fecha.Anio))then
				InsertarOrdenado(l, v[i]^.Dato);
			v[i]:= v[i]^.Sig;
		end;
	end;
end;

// Programa Principal

Var 
	l1, l2: Lista;
	v: Equipos;
	Max1, Max2: Integer;
	PromMax1, PromMax2: Real;
Begin
	Max1:= -1;
	Max2:= -1;
	PromMax1:= -1;
	PromMax2:= -1;
	l1:= Nil;
	l2:= Nil;
	InicializarVector(v);
	CargarLista(l1, v);
	InformarEdad(v);
	Maximo(Max1, Max2, PromMax1, PromMax2, v);
	Writeln('Los códigos de los 2 jugadores con mejor calificación promedio son: ', Max1, ' con promedio ', PromMax1, ' y ', Max2, ' con promedio ', PromMax2);
	CargarListOrdenada(l2, v);
End.

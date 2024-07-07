Program Agregar_Insertar_Eliminar;
Const
	DimF = 10;
	Corte = 0;
Type
	Index = 0..DimF;
	Vector = array [1..DimF] of Integer;

Procedure CargarVector (var v: Vector; var DimL: Integer);
Var
	num: Integer;
begin
	DimL:= 0; {Inicializo la dimension logica en 0}
	writeln('Ingrese un valor a agregar:');
	readln(num);
	While (DimL < DimF) and (num <> Corte) do begin {Controlo si hay espacio}
		DimL:= DimL + 1; {Incremento la dimension logica}
		v[DimL]:= num; {Agrego el elemento}
		writeln('Ingrese un valor a agregar:');
		readln(num);
	end;
end;

Procedure AgregarVector (var v: Vector; var DimL: Integer; var Exito: boolean);
Var
	num: Integer;
begin
	writeln('Ingrese el numero que desea agregar:');
	readln(num);
	Exito:= False; {Inicializo la variable booleana en false}
	If (DimL + 1 <= DimF) then begin {Verifico si hay espacio}
		Exito:= True; {Registro que se pudo realizar la operacion}
		DimL:= DimL + 1; {Incremento la dimension logica}
		v[DimL]:= num; {Agrego el elemento}
	end
	else
		writeln('No se pudo realizar la operacion');
end;

Procedure InsertarVector (var v:Vector; var DimL: Integer; var Exito: Boolean);
Var
	num, pos: Integer;
	i: Index;
begin
	writeln('Ingrese el numero que desea agregar:');
	readln(num);
	writeln('Ingrese la posicion donde desea agregar el numero:');
	readln(pos);
	Exito:= False; {Inicializo la variable booleana en false}
	If (DimL + 1 <= DimF) and (pos >= 1) and (pos <= DimL) then begin {Verifico si hay espacio}
		For i:= DimL downto pos do {Hago el corrimiento empezando desde la dimension logica hasta la posicion a insertar para hacer un hueco donde voy a insertar el valor}
			v[i+1]:= v[i]; 
		Exito:= True; {Registro que se pudo realizar la operacion}
		v[pos]:= num; {Inserto el valor en el vector}
		DimL:= DimL + 1; {Incremento la dimension logica}
	end
	else
		writeln('No se pudo realizar la operacion');
end;

Procedure EliminarVector (var v: vector; var DimL: Integer; var Exito: Boolean);
Var
	pos: Integer;
	i: Index;
begin
	writeln('Ingrese la posicion donde desea eliminar el numero:');
	readln(pos);
	Exito:= False;
	If (pos >= 1) and (pos <= DimL) then begin {Verifico si la posicion es validad}
		For i:= pos to DimL-1 do {Corro los elementos empezando desde DimL - 1 para tapar el elemento a eliminar}
			v[i]:= v[i+1];
		Exito:= True; {Registro que se pudo realizar la operacion}
		DimL:= DimL - 1; {Decremento la dimension logica}
	end
	else
		writeln('No se pudo realizar la operacion');
	v[DimL + 1]:= 0;
end;

Procedure ImprimirVector (v:vector; DimL:Integer);
Var
	i: Index;
begin
	For i:= 1 to DimF do 
		writeln('Para la posicion ' ,i, ' el vector vale: ' ,v[i]);
end;

// Programa Principal

Var
	v: Vector;
	DimL: Integer;
	Exito: Boolean;
Begin
	CargarVector(v, DimL);
	AgregarVector(v, DimL, Exito);
	writeln('--------------------------Impresion del vector--------------------------');
	ImprimirVector(v, DimL);
	InsertarVector(v, DimL, Exito);
	writeln('--------------------------Impresion del vector--------------------------');
	ImprimirVector(v, DimL);
	EliminarVector(v, DimL, Exito);
	writeln('--------------------------Impresion del vector--------------------------');
	ImprimirVector(v, DimL);
End.

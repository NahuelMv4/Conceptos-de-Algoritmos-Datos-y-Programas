Program Busqueda_Vectores;
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
	DimL:= 0;
	writeln('Ingrese un valor a agregar:');
	readln(num);
	While (DimL < DimF) and (num <> Corte) do begin {Controlo si hay espacio}
		DimL:= DimL + 1; {Incremento la dimension logica}
		v[DimL]:= num; {Agrego el elemento}
		writeln('Ingrese un valor a agregar:');
		readln(num);
	end;
end;

Function BuscarVectorDesordenado (v: vector; DimL: Integer):Boolean;
Var
	pos: Index;
	num: Integer;
	Exito: Boolean;
begin
	writeln('Ingrese el valor a buscar:');
	readln(num);
	Exito:= False; {Inicializo Exito en false}
	pos:= 1; {Inicializo pos en 1}
	While (pos <= DimL) and (not Exito) do begin {Itero hasta encontrar el valor o hasta que la posicion se mayor a la dimension logica}
		If (v[pos] = num) then
			Exito:= True {Si el vector en pos es igual al valor a buscar Exito pasa a ser True}
		Else 
			pos:= pos + 1; {Si pos no es igual al num incremento la posicion}
	end;
	BuscarVectorDesordenado:= Exito; {Asigno el valor de Exito a la funcion}
end;

Function BuscarVectorOrdenado (v: vector; DimL: Integer):Boolean;
Var
	pos: Index;
	num: Integer;
begin	
	writeln('Ingrese el valor a buscar:');
	readln(num);
	pos:= 1; {Inicializo pos en 1}	
	While (pos <= DimL) and (v[pos] < num) do {Itero hasta encontrar el valor o hasta que la posicion se mayor a la dimension logica}
		pos:= pos + 1;
	If (pos <= DimL) and (v[pos] = num) then {Pregunto si posicion excedio la dimension logica y si el vector en la posicion es igual al numero}
		BuscarVectorOrdenado:= True {En caso de ser verdadero asigno True a la funcion}
	Else
		BuscarVectorOrdenado:= False; {En caso de ser falso asigno False a la funcion}
end;

Function BusquedaDicotomica (v: vector; DimL: Integer):Boolean;
Var
	num, pri, ult, mid: Integer;
	Exito: Boolean;
begin
	writeln('Ingrese el valor a buscar:');
	readln(num);
	Exito:= False; {Inicializo Exito en false}
	pri:= 1; 
	ult:= DimL;
	mid:= (pri + ult) DIV 2; {Calculo la posicion media del vector}
	While (pri <= ult) and (num <> v[mid]) do begin {Me fijo que el elemento a buscar sea distinto de v[mid] y que pri sea menor a ult}
		If (num < v[mid]) then {Si el elemento a buscar es menor a v[mid]}
			ult:= mid - 1 {Actualizo ult}
		else
			pri:= mid + 1; {Sino actualizo pri}
		mid:= (pri + ult) div 2; {Calculo nuevamente el medio del vector}
	end;
	If (pri <= ult) and (v[mid] = num) then {Determino porque condicion se ha terminado el while y devuelvo el resultado}
		Exito:= True;
	BusquedaDicotomica:= Exito;
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
	writeln('--------------------------Impresion del vector--------------------------');
	ImprimirVector(v, DimL);
	Exito:= BuscarVectorDesordenado(v, DimL);
	if (Exito) then
		writeln('La busqueda funciono correctamente')
	else
		writeln('No se encontro el valor a buscar');
	Exito:= BuscarVectorOrdenado(v, DimL);
	if (Exito) then
		writeln('La busqueda funciono correctamente')
	else
		writeln('No se encontro el valor a buscar');
	Exito:= BusquedaDicotomica(v, DimL);
	if (Exito) then
		writeln('La busqueda funciono correctamente')
	else
		writeln('No se encontro el valor a buscar');
End. 

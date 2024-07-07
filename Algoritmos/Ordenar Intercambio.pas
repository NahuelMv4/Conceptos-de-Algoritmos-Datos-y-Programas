Program Ordenacion_Intercambio;
Const
	DimF = 10;
Type
	Index = 0..DimF;
	Vector = array [1..DimF] of Integer;

Procedure CargarVector (var v: Vector; var DimL: Integer);
Var
	i: Index;
begin
	DimL:= 0;
	For i:= 1 to DimF do begin
		writeln('Ingrese un valor para la posicion: ' ,i);
		readln(v[i]);
		DimL:= DimL +1;
	end;
end;

Procedure OrdenarIntercambio (var v: Vector; DimL: Integer);
Var
	i, j: Index;
	Item: Integer;
begin
	For i:= DimL downto 2 do begin
		{Poner el mayor elemento de v[1],...,v[i] en v[i]}
		For j:= 1 to i-1 do
			If(v[j] > v[j+1]) then begin
				{Intercambiar elementos}
				Item:= v[j];
				v[j]:= v[j+1];
				v[j+1]:= Item;
			end;
	end;
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
Begin
	CargarVector(v, DimL);
	OrdenarIntercambio(v, DimL);
	ImprimirVector(v, DimL);
End.

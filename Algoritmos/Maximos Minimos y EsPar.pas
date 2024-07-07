Program Maximos_Minimos_EsPar;
Const
	Max = -1;
	Min = 9999;
	DimF = 10;
Type
	Rango = 1..DimF;
	
	Vector = Array [Rango] of Integer;

Procedure CargarVector (var v: Vector; var DimL: Integer);
Var
	i: Rango;
begin
	DimL:= 0;
	For i:= 1 to DimF do begin
		Writeln('Ingrese un valor para la posicion: ' ,i);
		Readln(v[i]);
		DimL:= DimL +1;
	end;
end;
	
Procedure Maximo (Var Max1, Max2, IndiceMax1, IndiceMax2: Integer; v: Vector; DimL: Integer);
Var
	i: Rango;
begin
	For i:= 1 to DimL do begin
		If (v[i] >= Max1) then begin
			Max2:= Max1;
			IndiceMax2:= IndiceMax1;
			Max1:= v[i];
			IndiceMax1:= i;
		end
		Else 
			If (v[i] >= Max2) then begin
				Max2:= v[i];
				IndiceMax2:= i;
			end;
	end;
end;

Procedure Minimo (Var Min1, Min2, IndiceMin1, IndiceMin2: Integer; v: Vector; DimL: Integer);
Var
	i: Rango;
begin
	For i:= 1 to DimL do begin
		If (v[i] <= Min1) then begin
			Min2:= Min1;
			IndiceMin2:= IndiceMin1;
			Min1:= v[i];
			IndiceMin1:= i;
		end
		Else 
			If (v[i] <= Min2) then begin
				Min2:= v[i];
				IndiceMin2:= i;
			end;
	end;
end;

Function EsPar (num: Integer): Boolean;
begin
	EsPar:= num MOD 2 = 0;
end;

Var
	v: Vector;
	DimL, num: Integer;
	Min1, Min2, Max1, Max2: Integer;
	IndiceMax1, IndiceMax2, IndiceMin1, IndiceMin2: Integer;
Begin
	Min1:= Min;
	Min2:= Min;
	Max1:= Max;
	Max2:= Max;
	CargarVector(v, DimL);
	Maximo(Max1, Max2, IndiceMax1, IndiceMax2, v, DimL);
	Writeln('Los dos numeros maximos en el vector son: ', Max1, ' Y ', Max2, ' Encontrados en las posiciones: ', IndiceMax1, ' Y ', IndiceMax2);
	Minimo(Min1, Min2, IndiceMin1, IndiceMin2, v, DimL);
	Writeln('Los dos numeros minimos en el vector son: ', Min1, ' Y ' , Min2, ' Encontrados en las posiciones: ', IndiceMin1, ' Y ', IndiceMin2);
	Writeln('Ingrese un numero para comprobar que es par: ');
	Readln(num);
	If(EsPar(num)) then
		Writeln('El numero es par')
	Else
		Writeln('El numero es impar');
End.

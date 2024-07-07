Program Corte_de_Control;

Const
	Corte = 'ZZZ';

Type
	Informe = record
		Ciudad: String[30];
		Prov: String[30];
		Pais: String[30];
		Habitantes: Integer;
	end;

Procedure LeerInforme (var r: Informe);
begin
	Writeln('Ingresar la siguiente informacion ordenada por: Pais, Provincia, y Ciudad');
	With r do begin
		Writeln('Ingrese una Ciudad: ');
		Readln(Ciudad);
		Writeln('Ingrese una Provincia: ');
		Readln(Prov);
		Writeln('Ingrese un Pais: ');
		Readln(Pais);
		Writeln('Ingrese la cantidad de Habitantes: ');
		Readln(Habitantes);
	end;
end;

Procedure CorteDeControl(var r: Informe);
Var
	CiudadAct, ProvAct, PaisAct: String[30];
	TotHabCiudad, TotHabProv, TotHabPais: Integer;
begin
	While (r.Pais <> Corte) do begin
		TotHabPais := 0;
		PaisAct := r.Pais;
		While (r.Pais = PaisAct) do begin
			TotHabProv := 0;
			ProvAct := r.Prov;
			While (r.Pais = PaisAct) and (r.Prov = ProvAct) do begin
				TotHabCiudad := 0;
				CiudadAct := r.Ciudad;
				While (r.Pais = PaisAct) and (r.Prov = ProvAct) and (r.Ciudad = CiudadAct) do begin
					TotHabCiudad := TotHabCiudad + r.Habitantes;
					LeerInforme(r);
				end;
				Writeln('En la ciudad de ', CiudadAct, ' hay ', TotHabCiudad, ' habitantes');
				TotHabProv := TotHabProv + TotHabCiudad;
			end;
			Writeln('En la provincia de ', ProvAct, ' hay ', TotHabProv, ' habitantes');
			TotHabPais := TotHabPais + TotHabProv;
		end;
		Writeln('En el pais de ', PaisAct, ' hay ', TotHabPais, ' habitantes');
	end;
end;

Var
	r: Informe;
Begin
	LeerInforme(r);
	CorteDeControl(r);
End.

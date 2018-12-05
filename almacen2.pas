program almacen;
uses 
crt;
type
	
	tipo_de_dato =record
			codigo:string;
			precio:real;
			existencia:integer;
			nombre:string;
			eliminado:boolean;
		end;

	procedure menup(var b:integer);
		var
		tecla:char;
		posicion:integer;
		ciclo:boolean;
begin
		ciclo:=true;
		posicion:=1;
		window(1,1,80,25);
		textbackground(blue);
		clrscr;
		window(30,5,49,14);
		textbackground(cyan);
		clrscr;
		while(ciclo=true)do
			begin
			clrscr;
				gotoxy(1,3+posicion);write('>>>');
				gotoxy(18,3+posicion);write('<<<');
				gotoxy(1,1);write('Almacen El Emperador');
				gotoxy(8,4);write('Agregar');
				gotoxy(7,5);write('Eliminar');
				gotoxy(4,6);write('Modificaciones');
				gotoxy(7,7);write('Consulta');
				gotoxy(7,8);write('Recuperar');
				gotoxy(7,9);write('Consumos');
		
					repeat
						begin
						tecla:=readkey;
						end
					until (tecla=#13)or(tecla=#72)or(tecla=#80)or(tecla=#27);
			if tecla=#80then
				posicion:=posicion+1;
			if tecla=#72then
				posicion:=posicion-1;
			if posicion=7 then
				posicion:=1;
			if posicion=0then
				posicion:=6;
			if tecla=#27then
				begin
				ciclo:=false;
				posicion:=0;
				end;
			if tecla=#13then
				ciclo:=false;
			
			
			end;
			b:=posicion;
		end;
		function no_error_entero (a:string):integer;
		var
		b:integer;
		begin
		b:=0;
			repeat
			begin
				val(a,no_error_entero,b);
			delete(a,b,1);
			end
			until (b=0) or (a='');
			
		end;
		function no_error_real (a:string):real;
		var
		b:integer;
		begin
		b:=0;
			repeat
			begin
				val(a,no_error_real,b);
			delete(a,b,1);
			end
			until (b=0) or (a='');
			
		end;
		
		procedure agregar(var g:array of tipo_de_dato;var b:integer);
		var
		buffer:string;
		ciclo,repetido:boolean;
		pos1,pos2,i:integer;
		tec:char;
begin

pos2:=-1;
pos1:=1;
ciclo:=true;


		window(1,1,80,25);
		textbackground(blue);
		clrscr;
		window(2,2,79,24);
		textbackground(cyan);
		clrscr;
		while(ciclo=true)do
			begin
				gotoxy(1,1);write('Codigo');
				gotoxy(20,1);write('nombre');
				gotoxy(40,1);write('Precio');
				gotoxy(60,1);write('Existencia');
			repeat
				pos2:=pos2+1;
			until (g[pos2].eliminado=false) or (pos2>=20);
				if pos2 < 20 then
				begin
				gotoxy(1,1+pos1);readln(g[pos2].codigo);
				if pos2 <>0 then
				begin
				i:=0;
				repetido:=true;
						while repetido do
						begin
							if i=pos2 then
							repetido:=false
							else
							begin
							if g[i].codigo = g[pos2].codigo then
								begin
									i:=0;
									gotoxy(1,1+pos1);readln(g[pos2].codigo);
								end
								else
								i:=i+1;
							end;
						end;
				end;	
						gotoxy(20,1+pos1);readln(g[pos2].nombre);
						gotoxy(40,1+pos1);readln(buffer);
						g[pos2].precio:=no_error_real(buffer);
						gotoxy(60,1+pos1);readln(buffer);
						g[pos2].existencia:=no_error_entero(buffer);
						g[pos2].eliminado:=true;
						
						repeat
							begin
								gotoxy(1,2+pos1);writeln('introducira otro producto?  si=y,no=n');
								tec:=readkey;
								gotoxy(1,2+pos1);clreol;
							end
						until (tec='y')or(tec='Y')or(tec='n')or(tec='N');	
						
					if (tec='n')or(tec='N') then
						begin
							ciclo:=false;
							b:=0;	
						end;
				end
			else
			begin
			gotoxy(1,22);writeln('No hay espacio');
			ciclo:=false;
			readkey;
			b:=0;
			end;
				pos1:=pos1+1;
				end;
			
			end;
		
		procedure consulta (var g:array of tipo_de_dato;var b:integer);
		var
		posicion,i,c,h:integer;
		ciclo:boolean;
		tecla:char;
		codigo:string;
begin
	c:=0;
	posicion:=1;
	ciclo:=true;
	window(1,1,80,25);
	textbackground(blue);
	clrscr;
	window(32,9,48,12);
	textbackground(cyan);
	clrscr;
		while ciclo=true do
		 begin
			 clrscr;
			gotoxy(1,1+posicion);write('>>>');
			gotoxy(14,1+posicion);write('<<<');
			gotoxy(1,1);write('Tipo de consulta:');
			gotoxy(4,2);write('Por codigo');
			gotoxy(5,3);write('General');
		repeat
						begin
							tecla:=readkey;
						end
					until (tecla=#13)or(tecla=#72)or(tecla=#80)or(tecla=#27);
			if tecla=#80then
				posicion:=posicion+1;
			if tecla=#72then
				posicion:=posicion-1;
			if posicion=3 then
				posicion:=1;
			if posicion=0then
				posicion:=2;
			if tecla=#13then
				ciclo:=false;
		end;
				if posicion=1 then
				 begin
					 window(1,1,80,25);
					textbackground(blue);
					clrscr;
					window(2,2,79,5);
					textbackground(cyan);
					clrscr;
					gotoxy(1,1);writeln('introduzca el codigo del producto:');
					gotoxy(1,2);readln(codigo);
						for i:=0 to 19 do
						  begin
							if (g[i].codigo=codigo) and (g[i].eliminado=true) then
								begin
									gotoxy(1,3);write('Codigo');
									gotoxy(20,3);write('nombre');
									gotoxy(40,3);write('Precio');
									gotoxy(60,3);write('Existencia');
									
									gotoxy(1,4);write(g[i].codigo);
									gotoxy(20,4);write(g[i].nombre);
									gotoxy(40,4);write(g[i].precio:5:2);
									gotoxy(60,4);write(g[i].existencia);
								end
								ELSE
								c:=c+1;
								
						  end;
					if c=20 then
					writeln('El codigo que introdujo no existe');
		 end;
		 
		 if posicion=2 then
		 begin
		window(1,1,80,25);
		textbackground(blue);
		clrscr;
		window(2,2,79,24);
		textbackground(cyan);
		clrscr;
								gotoxy(1,1);write('Codigo');
								gotoxy(20,1);write('nombre');
								gotoxy(40,1);write('Precio');
								gotoxy(60,1);write('Existencia');
		{if g[0].codigo='' then
		begin
		 gotoxy(1,2);
		 writeln('no hay nada');						
		end;}
		h:=0;
		for i:=0 to 19 do
		begin
		if (g[i].codigo <> '') and (g[i].eliminado <> false) then
		begin
			gotoxy(1,2+h);write(g[i].codigo);
			gotoxy(20,2+h);write(g[i].nombre);
			gotoxy(40,2+h);write(g[i].precio:5:2);
			gotoxy(60,2+h);write(g[i].existencia);
			h:=h+1;
		end;
		
		end;
		 end;
		
		readkey;
		b:=0;
		
end;
		
		procedure eliminar(var g:array of tipo_de_dato;var b:integer);
		var
		codigo:string;
		h,i:integer;
begin
				h:=0;
				window(1,1,80,25);
				textbackground(blue);
				clrscr;
				window(2,2,79,5);
				textbackground(cyan);
				clrscr;
				gotoxy(1,1);writeln('Introduzca el codigo del producto que va a eliminar:');
				readln(codigo);
				for i:=0 to 19 do
				begin
				if (g[i].codigo=codigo) and (g[i].eliminado=true) then
				begin
				g[i].eliminado:=false;
				Writeln('Eliminado');
				end
				else
				h:=h+1;
				end;
				if h=20 then
				writeln('El codigo no existe');
			readkey;
			b:=0;
		end;
			
		procedure modificar (var g:array of tipo_de_dato;var b:integer);
		var
		ciclo,selec:boolean;
		tecla:char;
		posicion,i,h:integer;
		codigo:string;
begin
		h:=0;
		posicion:=0;
		selec:=false;
		ciclo:=true;
				window(1,1,80,25);
				textbackground(blue);
				clrscr;
				window(2,2,79,8);
				textbackground(cyan);
				clrscr;
				gotoxy(1,1);writeln('introduzca el codigo del producto');
				readln(codigo);
				for i:=0 to 19 do
		begin
		if (g[i].codigo=codigo) and (g[i].eliminado=true)then
			begin
					while ciclo=true do
					begin
					
					clrscr;
					gotoxy(1+posicion,1);write('>>>');
					gotoxy(11+posicion,1);write('<<<');
					gotoxy(4,1);write('Codigo');
					gotoxy(23,1);write('nombre');
					gotoxy(43,1);write('Precio');
					gotoxy(63,1);write('Existencia');
					gotoxy(4,2);write(g[i].codigo);
					gotoxy(23,2);write(g[i].nombre);
					gotoxy(43,2);write(g[i].precio:5:2);
					gotoxy(63,2);write(g[i].existencia);
						repeat
						begin
						tecla:=readkey;
						end
						until (tecla=#13)or(tecla=#77)or(tecla=#75);
							if tecla=#77then
								posicion:=posicion+20;
							if tecla=#75then
								posicion:=posicion-20;
							if posicion=80 then
								posicion:=0;
							if posicion=-20then
								posicion:=60;
							if tecla=#13then//ojo
								selec:=true;
						
						if (posicion=0)and(selec=true) then
									begin
									gotoxy(1,3);writeln('Nuevo codigo:');
									readln(g[i].codigo);
									ciclo:=false;
									end;
						if (posicion=20)and(selec=true)then
									begin
									gotoxy(1,3);writeln('Nuevo nombre:');
									readln(g[i].nombre);
									ciclo:=false;
									end;
						if (posicion=40)and (selec=true)then
									begin
									gotoxy(1,3);writeln('Nuevo precio:');
									readln(g[i].precio);
									ciclo:=false;
									end;
						if (posicion=60) and (selec=true)then
									begin
									gotoxy(1,3);writeln('Nueva existencia:');
									readln(g[i].existencia);
									ciclo:=false
									end;
						end;
			end
			ELSE
			begin
		    h:=h+1;
			end;
		end;
		
		if h=20 then
		writeln('el codigo no existe');
		readkey;

		
		b:=0;
		end;
		
		procedure recuperar (var g:array of tipo_de_dato;var b:integer);
		var
		verificar,i,j,c:integer;
		codigo:string;
begin
c:=0;
verificar:=-1;
window(1,1,80,25);
textbackground(blue);
clrscr;
window(2,2,79,24);
textbackground(cyan);
clrscr;
Writeln('Lista de productos eliminados:');
gotoxy(1,2);writeln('Codigo');
gotoxy(20,2);writeln('nombre');
gotoxy(40,2);writeln('Precio');
gotoxy(60,2);writeln('Existencia');
			repeat
			verificar:=verificar+1;
			until ((g[verificar].eliminado=false)and (g[verificar].codigo<>'')) or (verificar>19);
	
	
	if verificar <> 20 then
	begin;	
		for i:=0 to 19 do
		begin
				if (g[i].codigo <> '') and (g[i].eliminado <> true) then
				begin
					gotoxy(1,3+i);writeln(g[i].codigo);
					gotoxy(20,3+i);writeln(g[i].nombre);
					gotoxy(40,3+i);writeln(g[i].precio:5:2);
					gotoxy(60,3+i);writeln(g[i].existencia);
				end;	
		end;
	writeln('introduzca el codigo de producto que decea recuperar');
	readln(codigo);
		for j:=0 to 19 do
			begin
				if (g[j].codigo=codigo) and (g[j].eliminado=false) then
				begin
					g[j].eliminado:=true;
					writeln('Recuperacion completada');
				end
				ELSE
					c:=c+1;	
			end;
					if c=20 then
					writeln('El codigo que introdujo no existe');
	end
	else
	writeln('No hay productos eliminados');	
	readkey;
b:=0;
end;
			
		procedure consumos (var g:array of tipo_de_dato;var b:integer);
		var
		codigo:string;
		cantidad,i:integer;
begin
i:=-1;
window(1,1,80,25);
textbackground(blue);
clrscr;
window(2,2,79,24);
textbackground(cyan);
clrscr;
	writeln('Introduzca el codigo del producto');
	Readln(codigo);
	repeat
	begin
	i:=i+1;
	end
	until (g[i].codigo=codigo) or (i>19);
	if i<20 then
	begin
	writeln('Cantidad que desea extraer');
	readln(cantidad);
		if (cantidad <= g[i].existencia) then
			begin
			writeln('Extraido correctamente');
			g[i].existencia:=g[i].existencia-cantidad;
			end
			else
			writeln('No hay suficientes productos');
	end
	else
	writeln('El codigo del producto que introdujo no existe');

readkey;
b:=0;
end;	
			var
			pos:integer;
			datos:array[1..20] of tipo_de_dato;	
			
	begin
	cursoroff;
	pos:=0;
	while pos <> -1 do
	begin
	case pos of
	0:menup(pos);
	1:agregar(datos,pos);
	4:consulta(datos,pos);
	2:eliminar(datos,pos);
	3:modificar(datos,pos);
	5:recuperar(datos,pos);
	6:consumos(datos,pos);
	end
	end;
	readkey;
	end.


{Sistema de reservacion para el hotel LIDOTEL; realizado por Samuel Marcano, Angel Perez, Abdl Taktak}

program Sistema_de_Reservacionlidotel;
uses crt;
{Se empiezan inicializando variables necesarias para el programa}
var  menu, datos: string;
var x1, cod1: integer;

BEGIN
	textcolor (lightblue);
	writeln ('=========================================================================================');
	writeln;
	writeln(' H O T E L   L I D O T E L   B O U T I Q U E  M A R G A R I T A');
	writeln;
	writeln ('=========================================================================================');
	writeln;
	writeln ('presione [ENTER] para continuar');
	readln;
	writeln ('BIENVENIDO AL SISTEMA DE RESERVACION DEL HOTEL LIDOTEL');
	writeln;
	writeln ('¿QUE DESEA HACER?');
	writeln;
	writeln ('A-Registrar nuevo cliente');
	writeln ('B-Realizar reservacion');
	writeln ('C-Cerrar sistema');
	//Primer vistazo al menu (sujeto a cambios)
	repeat
		begin
			repeat
				begin
					readln (menu);
				end;
			until (menu= 'A') or (menu='B') or (menu='C');  //primera validacion del programa (solo se pueden ingresar las letras indicadas)
			val (menu,x1,cod1)
		end;
	until cod1>0;
	
		case menu of
			'A':
				begin
					writeln ('Ingrese sus datos');
				end;//end del primer caso
			'B':
				begin
					writeln ('A continuacion se mostraran las Habitaciones disponibles');
				end; // end del segundo caso
			'C':
				begin
					writeln ('Hasta luego, tenga feliz dia.');
				end;// end del tercer caso
				
		end;// end del primer case

	
	
END.


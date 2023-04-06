
{Sistema de reservacion para el hotel LIDOTEL; realizado por Samuel Marcano, Angel Perez, Abdl Taktak}

program Sistema_de_Reservacionlidotel;
uses crt;
{Se empiezan inicializando variables necesarias para el programa}
var  menu, reservacion: string;
var x1, cod1,x2,cod2, Tdatos, i: integer;
var
	datos: array [1..2000] of
		record
			nombre: string;
			apellido: string;
			cedula: longint;
			telefono: longint;
			email: string;
			TDestadia: string;
		end;
var
archivo1: text;
	
	
	
		

BEGIN
	Tdatos:=0;
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
	writeln ('A-Registrar Nuevo cliente');
	writeln ('B-Realizar reservacion (Nuevo cliente)');
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
					writeln ('Comenzando el proceso de registro...');
					writeln;
					Tdatos:= Tdatos+1;
					writeln ('por favor favor ingrese sus datos: ','Cliente numero [',Tdatos,']');
					writeln;
							writeln ('Nombre: ');
							readln (datos[Tdatos].nombre);
							writeln;
							writeln ('Apellido: ');
							readln (datos[Tdatos].apellido);
							writeln;
							writeln ('Cedula de identidad: ');
							readln (datos[Tdatos].cedula);
							writeln;
							writeln ('Email: ');
							readln (datos[Tdatos].email);
							writeln;
							writeln ('Numero de Telefono: ');
							readln (datos[Tdatos].telefono);
							writeln; 
							writeln ('Cantidad de dias de su estadia: ');
							readln (datos[Tdatos].TDestadia);
							writeln;
						
							
					
				end;//end del primer caso
			'B':
				begin
					assign (archivo1, 'registro_reservacion_individual'); //archivo de reservacion individual
					rewrite (archivo1);
					begin
						for i := 1 to Tdatos do
							WriteLn(i,'-', ' ', datos[i].nombre, ' ' ,datos[i].apellido); //posible manera para mostrar las personas del registro
					end;
					close (archivo1);
					
					writeln ('Por favor, seleccione el tipo de reservacion:');
					writeln ('a-INDIVIDUAL');
					writeln ('b-ACOMPAÑADO');
					writeln ('c-GRUPO/FAMILIA');
					repeat
						begin
							repeat
								begin
									readln (reservacion); //segunda validacion
								end;
							until (reservacion='a') or (reservacion= 'b') or (reservacion= 'c');
							val (reservacion,x2,cod2)
						end;
					until cod2>0;
					case reservacion of
						'a': 
							begin
								writeln ('usted ha seleccionado la reservacion de tipo individual');
							end;
						'b':
							begin
								writeln ('usted ha seleccionado la reservacion de tipo acompañado');
							end;
						'c':
							begin
								writeln ('usted ha seleccionado la reservacion de tipo grupo/familia');
							end;
							
					end;// end del case de reservacion
				end; // end del segundo caso
			'C':
				begin
					writeln ('Hasta luego, tenga feliz dia.');
				end;// end del tercer caso
				
		end;// end del primer case

	
	
END.


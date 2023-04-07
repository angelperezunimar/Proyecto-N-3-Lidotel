
{Sistema de reservacion para el hotel LIDOTEL; realizado por Samuel Marcano, Angel Perez, Abdl Taktak}

program Sistema_de_Reservacionlidotel;
uses 
CRT,SysUtils;

//Se declaran tipos necesarios para la organizacion y el desarrollo del programa
type
    TipoReservacion = (Individual, Acompanado, GrupoFamilia);
	datos = record
			nombre: string;
			apellido: string;
			cedula: string[10];
			telefono: string;
			email: string;
			TDestadia: string;
		end;

{Se empiezan inicializando variables necesarias para el programa}
var  menu, reservacion, habitaciones,TRegistro: string;
     x1, cod1, x2, cod2, x3, cod3, Tdatos, i: integer;
     ECliente:string[10];
     DCliente, DRegistrar: datos;
	 archivo1: text;
	 archivo: file of datos;
	 ECedula: boolean;
	
	//Procedimiento para el registro del cliente
Procedure RCliente;
begin

	Assign(archivo, TRegistro);
	
		// Crear archivo si no existe
		if not FileExists(TRegistro) then
		  begin
			Rewrite(archivo);
			Close(archivo);
		  end;
		  
	Reset(archivo);
	
	writeln ('Comenzando el proceso de registro...');
					writeln;
					writeln ('por favor favor ingrese sus datos: ');
					writeln;
							writeln ('Nombre: ');
							readln (DCliente.nombre);
							DRegistrar.nombre := DCliente.nombre;
							writeln;
							writeln ('Apellido: ');
							readln (DCliente.apellido);
							DRegistrar.apellido := DCliente.apellido;
							writeln;
							writeln ('Cedula de identidad: ');
							readln (DCliente.cedula);
							DRegistrar.cedula := DCliente.cedula;
							writeln;
							writeln ('Email: ');
							readln (DCliente.email);
							DRegistrar.email := DCliente.email;
							writeln;
							writeln ('Numero de Telefono: ');
							readln (DCliente.telefono);
							DRegistrar.telefono := DCliente.telefono;
							writeln; 
							writeln ('Cantidad de dias de su estadia: ');
							readln (DCliente.TDestadia);
							DRegistrar.TDestadia := DCliente.TDestadia;
							writeln;
							ECliente:= DCliente.cedula;
					        ECedula:= false;
					        
					        // Verifica si la cedula ha sido registrada
					        while not EOF(archivo) do
							  begin
								Read(archivo, DCliente);
								if DCliente.cedula = ECliente then
								begin
								  ECedula := True;
								  Break;
								end;
							  end;
	
							Reset(archivo);
							
							DCliente.nombre := DRegistrar.nombre;
							DCliente.apellido := DRegistrar.apellido;
							DCliente.cedula := DRegistrar.cedula;
							DCliente.email := DRegistrar.email;
							DCliente.telefono := DRegistrar.telefono;
							DCliente.TDestadia := DRegistrar.TDestadia;
							
							// Si la cedula no esta registrada, registra al usuario
							  if not ECedula then
							  begin
								Seek(archivo, FileSize(archivo));
								Write(archivo, DCliente);
								Writeln('Registro realizado con exito');
							  end
							  else
							  begin
								Writeln('Este DNI ya está registrado.');
							  end;

  Close(archivo);		
	
end;

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
	writeln ('A-Realizar reservacion');
	writeln ('B-Cerrar sistema');
	writeln;
	//Primer vistazo al menu (sujeto a cambios)
	repeat
		begin
			repeat
				begin
					readln (menu);
				end;
			until (menu= 'A') or (menu='B');//primera validacion del programa (solo se pueden ingresar las letras indicadas)
			val (menu,x1,cod1)
		end;
	until cod1>0;
	
		case menu of
			'A':
				begin
				    TRegistro := 'RegistroPrueba';
					RCliente;
						
							//Como se deben realizar tres registros y tres archivos (uno por cada tipo de reservacion) esta idea está sujeta a cambios puesto que se esta planteando hacer el proceso anterior mostrado dos veces mas
					
				end;//end del primer caso
			'B':
				begin
					assign (archivo1, 'registro_reservacion_individual'); //archivo de reservacion individual
					rewrite (archivo1);
					begin
						for i := 1 to Tdatos do
							WriteLn(i,'-', ' ', DCliente.nombre, ' ' ,DCliente.apellido); //posible manera para mostrar las personas del registro
					end;
					close (archivo1);
					
					writeln ('Por favor, seleccione el tipo de reservacion:');
					writeln ('a-INDIVIDUAL');
					writeln ('b-ACOMPAÑADO');
					writeln ('c-GRUPO/FAMILIA');
					writeln;
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
								writeln;
								writeln ('Seleccione el tipo de habitacion');
								writeln;
								writeln('a-FAMILY ROOM');
								writeln ('b-SENCILLA');
								writeln ('c-DOBLE');
								writeln ('d-SUITE');
								writeln;
								repeat
									begin
										repeat
											begin
												readln (habitaciones);  //tercer validacion del programa
											end;
										until (habitaciones = 'a') or (habitaciones = 'b') or (habitaciones = 'c') or (habitaciones = 'd'); 
										val (habitaciones, x3, cod3);
									end;
								until cod3>0;
								case habitaciones of
								'a':
									begin
										writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche.');
										writeln;
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo,cama Lidotel Royal King, con reloj despertador TV 32” HD Plasma con cable, banyo con  ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');							
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								'b':
									begin
										writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche.');
										writeln;
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista, cama Lidotel Royal King con sábanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
									end;
								
								'c':
									begin
										writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche.');
										writeln;
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista, Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
									end;
								
								'd':
									begin
										writeln ('Usted ha seleccionado la SUITE - 300$ la noche.');
										writeln;
										writeln('Cálida y confortable habitación decorada con un estilo vanguardista, 100% libre de humo, Cama Lidotel Royal King, con reloj despertador, TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								end; // end del case de las habitaciones
							
							end; // end de la primera opcion del case de los tipos de reservaciones
						'b':
							begin
								writeln ('usted ha seleccionado la reservacion de tipo acompañado');
								writeln;
								writeln ('Seleccione el tipo de habitacion');
								writeln;
								writeln('a-FAMILY ROOM');
								writeln ('b-SENCILLA');
								writeln ('c-DOBLE');
								writeln ('d-SUITE');
								writeln;
								repeat
									begin
										repeat
											begin
												readln (habitaciones);  //tercer validacion del programa
											end;
										until (habitaciones = 'a') or (habitaciones = 'b') or (habitaciones = 'c') or (habitaciones = 'd'); 
										val (habitaciones, x3, cod3);
									end;
								until cod3>0;
								case habitaciones of
								'a':
									begin
										writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche.');
										writeln;
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo,cama Lidotel Royal King, con reloj despertador TV 32” HD Plasma con cable, banyo con  ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');							
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								'b':
									begin
										writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche.');
										writeln;
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista, cama Lidotel Royal King con sábanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
									end;
								
								'c':
									begin
										writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche.');
										writeln;
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista, Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
									end;
								
								'd':
									begin
										writeln ('Usted ha seleccionado la SUITE - 300$ la noche.');
										writeln;
										writeln('Cálida y confortable habitación decorada con un estilo vanguardista, 100% libre de humo, Cama Lidotel Royal King, con reloj despertador, TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								end; // end del case de las habitaciones
							end;
						'c':
							begin
								writeln ('usted ha seleccionado la reservacion de tipo grupo/familia');
								writeln;
								writeln ('Seleccione el tipo de habitacion');
								writeln;
								writeln('a-FAMILY ROOM');
								writeln ('b-SENCILLA');
								writeln ('c-DOBLE');
								writeln ('d-SUITE');
								writeln;
								repeat
									begin
										repeat
											begin
												readln (habitaciones);  //tercer validacion del programa
											end;
										until (habitaciones = 'a') or (habitaciones = 'b') or (habitaciones = 'c') or (habitaciones = 'd'); 
										val (habitaciones, x3, cod3);
									end;
								until cod3>0;
								case habitaciones of
								'a':
									begin
										writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche.');
										writeln;
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo,cama Lidotel Royal King, con reloj despertador TV 32” HD Plasma con cable, banyo con  ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');							
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								'b':
									begin
										writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche.');
										writeln;
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista, cama Lidotel Royal King con sábanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
									end;
								
								'c':
									begin
										writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche.');
										writeln;
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista, Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
									end;
								
								'd':
									begin
										writeln ('Usted ha seleccionado la SUITE - 300$ la noche.');
										writeln;
										writeln('Cálida y confortable habitación decorada con un estilo vanguardista, 100% libre de humo, Cama Lidotel Royal King, con reloj despertador, TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln;
										writeln ('Incluye: ');
										writeln;
										writeln('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
									end;
								
								end; // end del case de las habitaciones
							end;
							
					end;// end del case de reservacion
				end; // end del segundo caso
			'C':
				begin
					writeln ('Hasta luego, tenga feliz dia.');
				end;// end del tercer caso
				
		end;// end del primer case

	
	
END.


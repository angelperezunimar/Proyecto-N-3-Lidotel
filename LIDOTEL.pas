
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
			TDestadia: integer;
		end;

{Se empiezan inicializando variables necesarias para el programa}
var  menu, reservacion, habitaciones,SDatos,vali: string;
     x1, cod1, x2, cod2, x3, cod3,x4, Tdatos, i, TRegistro, PTotal, DEstadia,n,j: longint;
     ECliente: string[10];
     DCliente, DRegistrar: array of datos;
	 archivo1: text;
	 archivo: file of datos;
	 ECedula,CSistema,MDatos,valvali: boolean;
	
	//Procedimiento para el registro del cliente
Procedure RCliente;
begin
	
	SetLength(DCliente, n);
	SetLength(DRegistrar, n);
	
	case TRegistro of
	1:
	 begin
		Assign(archivo, 'Individual.dat');
		
		// Crear archivo si no existe
			if not FileExists('Individual.dat') then
			  begin
				Rewrite(archivo);
				Close(archivo);
		  end;
	end;
	2:
	begin
		 Assign(archivo, 'Acompanado.dat');
		 // Crear archivo si no existe
			if not FileExists('Acompanado.dat') then
			  begin
				Rewrite(archivo);
				Close(archivo);
			  end;
		 end;
	3:
	begin
		Assign(archivo, 'Grupo_Familia.dat');
		// Crear archivo si no existe
			if not FileExists('Grupo_Familia.dat') then
			begin
				Rewrite(archivo);
				Close(archivo);
			end;
			end;
			end;
	Reset(archivo);
	
	gotoxy(30,15);writeln ('Comenzando el proceso de registro...');
	delay(2000);
	read;
			clrscr;
					writeln;
					writeln ('////Por favor favor ingrese los datos del cliente numero ', i,': ');
					writeln;
							gotoxy(20,6);writeln ('========================');
							gotoxy(20,7);write ('Nombre: ');
							
							readln (DCliente[i].nombre);
							DRegistrar[i].nombre := DCliente[i].nombre;
							writeln;
							gotoxy(20,9);writeln ('========================');
							gotoxy(20,10);write ('Apellido: ');
							
							readln (DCliente[i].apellido);
							DRegistrar[i].apellido := DCliente[i].apellido;
							writeln;
							gotoxy(20,12);writeln ('========================');
							gotoxy(20,13);write ('Cedula de identidad: ');
							
							readln (DCliente[i].cedula);
							DRegistrar[i].cedula := DCliente[i].cedula;
							writeln;
							gotoxy(20,15);writeln ('========================');
							gotoxy(20,16);write ('Email: ');
							
							readln (DCliente[i].email);
							DRegistrar[i].email := DCliente[i].email;
							writeln;
							gotoxy(20,18);writeln ('========================');
							gotoxy(20,19);write ('Numero de Telefono: ');
							
							readln (DCliente[i].telefono);
							DRegistrar[i].telefono := DCliente[i].telefono;
							writeln; 
							gotoxy(20,21);writeln ('========================');
							gotoxy(20,22);write ('Cantidad de dias de su estadia: ');
							
							readln (DCliente[i].TDestadia);
							DRegistrar[i].TDestadia := DCliente[i].TDestadia;
							writeln;
							
							DEstadia:= DCliente[i].TDestadia;
							ECliente:= DCliente[i].cedula;
					        ECedula:= false;
					        
					        // Verifica si la cedula ha sido registrada
					        while not EOF(archivo) do
							  begin
								Read(archivo, DCliente[i]);
								if DCliente[i].cedula = ECliente then
								begin
								  ECedula := True;
								  Break;
								end;
							  end;
	
							Reset(archivo);
							
							DCliente[i].nombre := DRegistrar[i].nombre;
							DCliente[i].apellido := DRegistrar[i].apellido;
							DCliente[i].cedula := DRegistrar[i].cedula;
							DCliente[i].email := DRegistrar[i].email;
							DCliente[i].telefono := DRegistrar[i].telefono;
							DCliente[i].TDestadia := DRegistrar[i].TDestadia;
							
							if ECedula = True then
							begin
								Writeln('Este DNI ya está registrado.');
								i:= i-1;
							  end;
							Close(archivo);	
							// Si la cedula no esta registrada, registra al usuario
	
end;

procedure GRegistro;

begin 

	case TRegistro of
	1:
	 begin
		Assign(archivo, 'Individual.dat');
		
		// Crear archivo si no existe
			if not FileExists('Individual.dat') then
			  begin
				Rewrite(archivo);
				Close(archivo);
		  end;
	end;
	2:
	begin
		 Assign(archivo, 'Acompanado.dat');
		 // Crear archivo si no existe
			if not FileExists('Acompanado.dat') then
			  begin
				Rewrite(archivo);
				Close(archivo);
			  end;
		 end;
	3:
	begin
		Assign(archivo, 'Grupo_Familia.dat');
		// Crear archivo si no existe
			if not FileExists('Grupo_Familia.dat') then
			begin
				Rewrite(archivo);
				Close(archivo);
			end;
			end;
			end;
	Reset(archivo);
	
								if not ECedula then
							  begin
							  clrscr;
								Seek(archivo, FileSize(archivo));
								Write(archivo, DCliente[i]);
								gotoxy(20,10);writeln('============================');
								gotoxy(20,11);Writeln('Registro realizado con exito');
								gotoxy(20,12);writeln('============================');
								delay(2000);
								read;
								clrscr;
								gotoxy(20,11);Writeln('Agregando su informacion al sistema, porfavor espere');
								gotoxy(20,15);writeln('==========');
								gotoxy(20,17);writeln('==========');
								
								gotoxy(20,16);Writeln('/');
								delay(2000);
								read;
								gotoxy(21,16);Writeln('/');
								delay(100);
								read;
								gotoxy(22,16);Writeln('/');
								delay(100);
								read;
								gotoxy(23,16);Writeln('/');
								delay(300);
								read;
								gotoxy(24,16);Writeln('/');
								delay(200);
								read;
								gotoxy(25,16);Writeln('/');
								delay(100);
								read;
								gotoxy(26,16);Writeln('/');
								delay(100);
								read;
								gotoxy(27,16);Writeln('/');
								delay(100);
								read;
								gotoxy(28,16);Writeln('/');
								delay(100);
								read;
								gotoxy(29,16);Writeln('/');
								delay(100);
								read;
								
							  end;

  Close(archivo);		
	

end;

BEGIN
	CSistema:=true;
	Tdatos:=0;
	textcolor (lightblue);
	gotoxy(20,10);writeln ('=========================================================================================');
	writeln;
	gotoxy(32,12);writeln(' H O T E L   L I D O T E L   B O U T I Q U E  M A R G A R I T A');
	writeln;
	gotoxy(20,14);writeln ('=========================================================================================');
	writeln;
	delay(2000);
	read;
	repeat
	clrscr;
	gotoxy(32,1);writeln ('======================================================');
	gotoxy(32,2);writeln ('BIENVENIDO AL SISTEMA DE RESERVACION DEL HOTEL LIDOTEL');
	gotoxy(32,3);writeln ('======================================================');
	writeln;
	gotoxy(25,5);writeln('------------------------------------------------------');
	gotoxy(30,6);writeln ('---QUE DESEA HACER?');
	writeln;
	gotoxy(25,7);writeln('------------------------------------------------');
	gotoxy(35,8);writeln ('A-Realizar reservacion');
	gotoxy(25,9);writeln('---------------------------------------------');
	gotoxy(35,10);writeln ('B-Cerrar sistema');
	gotoxy(25,11);writeln('------------------------------------------');
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
				    clrscr;
				    writeln ('///Por favor, seleccione el tipo de reservacion:');
				    gotoxy(30,6);writeln('------------------------------------------------');
					gotoxy(45,7);writeln ('a-INDIVIDUAL');
					gotoxy(30,8);writeln('------------------------------------------------');
					gotoxy(45,9);writeln ('b-ACOMPANADO');
					gotoxy(30,10);writeln('------------------------------------------------');
					gotoxy(45,11);writeln ('c-GRUPO/FAMILIA');
					gotoxy(30,12);writeln('------------------------------------------------');
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
								i:=1;
								n:=1;
								clrscr;
								TRegistro:= 1;
								gotoxy(30,1);writeln('/=====================================================/');
								gotoxy(30,2);writeln('Usted ha seleccionado la reservacion de tipo individual');
								gotoxy(30,3);writeln('/=====================================================/');
								writeln;
								RCliente;
								clrscr;
								writeln ('--------------------------------');
								writeln ('Seleccione el tipo de habitacion');
								writeln ('--------------------------------');
								writeln;
								writeln ('');
								writeln('a-FAMILY ROOM');
								writeln ('-----------------------------');
								writeln ('b-SENCILLA');
								writeln ('--------------------------');
								writeln ('c-DOBLE');
								writeln ('-----------------------');
								writeln ('d-SUITE');
								writeln ('--------------------');
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
										PTotal:= 200 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										
										
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
										PTotal:= 60 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
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
										PTotal:= 120 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
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
										PTotal:= 300 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
									end;
								
								end; // end del case de las habitaciones
							
							end; 
						'b':
							begin
								TRegistro:= 2;
								i:= 2;
								n:= 2;
								writeln ('usted ha seleccionado la reservacion de tipo acompañado');
								writeln;
								for i:= 1 to n do
								begin
								RCliente;
								end;
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
										PTotal:= 200 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos= false;
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
										PTotal:= 60 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos= false;
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
										PTotal:= 120 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos= false;
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
										PTotal:= 300 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										
									end;
									until MDatos = false;
							
								
							end;
							
							end;
							end;
						'c':
							begin
								TRegistro:= 3;
								writeln ('usted ha seleccionado la reservacion de tipo grupo/familia');
								writeln;
								repeat
								writeln ('Ingrese el numero de personas que desea registrar en la reservacion');
								readln (vali);
								if not TryStrToInt(vali, i) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									Exit;
									valvali:= true;
								  end;
								 until valvali = false; 
								n:=i;
								writeln;
								for i:= 1 to n do
								begin
								RCliente;
								end;
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
										PTotal:= 200 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos = false;
										for i:= 1 to n do
										begin
										GRegistro;
										end;
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
										PTotal:= 60 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos = false;
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
										PTotal:= 120 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos = false;
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
										PTotal:= 300 * (DEstadia - 1);
										writeln;
										writeln ('Presione [enter] para continuar');
										readln;
										clrscr;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										MDatos := true;
										clrscr;
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln(i);
										writeln('DATOS DE LA RESERVACION');
										writeln('===========================================================');
										writeln(Dregistrar[i].nombre);
										writeln('===========================================================');
										writeln(Dregistrar[i].apellido);
										writeln('===========================================================');
										writeln(Dregistrar[i].cedula);
										writeln('===========================================================');
										writeln(Dregistrar[i].telefono);
										writeln('===========================================================');
										writeln(Dregistrar[i].email);
										writeln('===========================================================');
										writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										end;
										until MDatos = false;
									end;
								
								end; // end del case de las habitaciones
							end;// end de la primera opcion del case de los tipos de reservaciones
							
					end;// end del case de reservacion
				end; // end del segundo caso
					
				
				
			'B':
				begin
				clrscr;
				CSistema:=false;
					gotoxy(40,9);writeln ('============================');
					gotoxy(40,11);writeln ('Hasta luego, tenga feliz dia');
					gotoxy(40,13);writeln ('============================');
					delay(2000);
					read;
					clrscr;
					gotoxy(32,5);writeln ('__________,-~-. _.-._.-~-,');
					gotoxy(32,6);writeln ('_________/ .- ,_______`-. \');
					gotoxy(32,7);writeln ('_________\ /`__________\/');
					gotoxy(32,8);writeln ('_________ /___-a___a`___\');
					gotoxy(32,9);writeln ('_________|____,-(_)`.____ |');
					gotoxy(32,10);writeln ('_________\___( ._|_. )___ /');
					gotoxy(32,11);writeln ('__________\___ .__,*___ /');
					gotoxy(32,12);writeln ('__________.-`._______,*-.__');
					gotoxy(32,13);writeln ('________,*__,*___`-*___`.__`.');
					gotoxy(32,14);writeln ('_______/___/____V_____\___\_');
					gotoxy(32,15);writeln ('_____,*____/_____o______\___`.__');
					gotoxy(32,16);writeln ('___,*_____|______o_______|_____`.');
					gotoxy(32,17);writeln ('__|_____,*|______o_______|`._____|');
					gotoxy(32,18);writeln ('___`.__,*_.-\_____o______/-._`.__,');
					gotoxy(32,19);writeln ('_________/_`.___o____,*__\_');
					gotoxy(32,20);writeln ('__.""-._,*______`._:_,*_______`.,-""._');
					gotoxy(32,21);writeln ('_/_,-._`_______)___(________*_,-.__\');
					gotoxy(32,22);writeln ('(_(___`._____,*_____`.______,*___)_)');
					gotoxy(32,23);writeln ('_\_\____\__,*________`.____/.___/_/');
					delay(2000);
					read;
					clrscr;
				end;// end del tercer caso

			end;//end del primer caso
	
	until CSistema = false;
END.


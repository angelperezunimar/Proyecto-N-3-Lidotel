{Sistema de reservacion para el hotel LIDOTEL; realizado por Samuel Marcano, Angel Perez, Abdl Taktak}

program Sistema_de_Reservacionlidotel;
uses 
CRT,SysUtils;

//Se declaran tipos necesarios para la organizacion y el desarrollo del programa
type
	datos = record
			nombre: string;
			apellido: string;
			cedula: string[10];
			telefono: longint;
			email: string;
			TDestadia: longint;
		end;

{Se empiezan inicializando variables necesarias para el programa}
var  menu, reservacion, habitaciones,SDatos,vali,AClientes,CRegistro,CTDatos: string;
     x1, cod1, x2, cod2, x3, cod3,x4,cod4,x5,cod5,x6,cod6,x7,cod7,x8,cod8, Tdatos, i, TRegistro, PTotal, DEstadia,n,j,n2,n3,n4,n5: longint;
     ECliente: string[10];
     DCliente: array of datos; 
     DRegistrar: array of datos;
	 archivo1: text;
	 archivo: file of datos;
	 ECedula,CSistema,MDatos,valvali,MClientes,CDatos: boolean;
	
	//Procedimiento para el registro del cliente
Procedure RCliente;
begin

	SetLength(DCliente,n);
	SetLength(DRegistrar,n);
	
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
	clrscr;
	gotoxy(35,16);writeln ('Comenzando el proceso de registro...');
	delay(2000);
	read;
			clrscr;
					writeln;
					writeln ('////Por favor favor ingrese los datos del cliente numero ', i,': ');
					writeln;
							repeat
								gotoxy(20,6);writeln ('========================');
								gotoxy(20,7);write ('Nombre: ');
								begin
									repeat
										begin
											readln (DCliente[i].nombre);
										end;
									until DCliente[i].nombre <> '';
									val (DCliente[i].nombre, x5, cod5);
								end;
							until cod5 > 0;
							DRegistrar[i].nombre := DCliente[i].nombre;
							writeln;
							repeat
								gotoxy(20,9);writeln ('========================');
								gotoxy(20,10);write ('Apellido: ');
								begin
									repeat
										begin
											readln (DCliente[i].apellido);
										end;
									until DCliente[i].apellido <> '';
									val (DCliente[i].apellido, x6, cod6);
								end;
							until cod6 > 0;
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
							repeat
							gotoxy(20,18);writeln ('========================');
							gotoxy(20,19);write ('Numero de Telefono: ');
							readln (vali);
							if not TryStrToInt(vali, DCliente[i].telefono ) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									valvali:= true;
								  end
								  else 
								  valvali:=false;
							until valvali = false;
							DRegistrar[i].telefono := DCliente[i].telefono;
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
								Write(archivo, DCliente[j]);
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
	n2:= 0;
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
								j:=1;
								i:=1;
								n:=1;
								clrscr;
								TRegistro:= 1;
								gotoxy(30,1);writeln('/=====================================================/');
								gotoxy(30,2);writeln('Usted ha seleccionado la reservacion de tipo individual');
								gotoxy(30,3);writeln('/=====================================================/');
								delay(2000);
								read;
								RCliente;
								clrscr;
								repeat
								gotoxy(20,21);writeln ('========================');
								gotoxy(20,22);write ('Cantidad de dias de su estadia: ');
								readln(vali);
								if not TryStrToInt(vali, DCliente[1].TDestadia) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									valvali:= true;
								  end
								  else 
								  valvali:=false;
								 until valvali = false; 
								DRegistrar[i].TDestadia := DCliente[i].TDestadia;
								clrscr;
								writeln;
								gotoxy(25,1);writeln ('--------------------------------');
								gotoxy(25,2);writeln ('Seleccione el tipo de habitacion');
								gotoxy(25,3);writeln ('--------------------------------');
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
									clrscr;
										gotoxy(30,1);writeln ('====================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche');
										gotoxy(30,3);writeln ('====================================================');
										writeln;
										writeln ('----------------------------------------------------------------------------------------');
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, ');							
										writeln ('100% libre de humo,cama Lidotel Royal King, con reloj despertador ');
										writeln ('TV 32” HD Plasma con cable, banyo con  ducha, cafetera electrica, ');
										writeln ('nevera ejecutiva, caja electronica de seguridad y secador de cabello, ');
										writeln ('armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');
										writeln ('----------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('----------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),');
										writeln ('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, ');
										writeln ('sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('----------------------------------------------------------------------------------------');
										PTotal:= 200 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 200;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										repeat
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[1].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										
										clrscr;
										writeln ('¿Desea cambiar algun dato del registro?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										clrscr;
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										
										until CDatos = false;
										GRegistro;
										
									end;
								
								'b':
									begin
									clrscr;
										gotoxy(30,1);writeln ('============================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche.');
										gotoxy(30,3);writeln ('============================================================');
										writeln;
										writeln ('-----------------------------------------------------------------------');
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista');
										writeln (' cama Lidotel Royal King con sábanas de algodon egipcio, soporte');
										writeln (' para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo ');
										writeln (' con ducha, cafetera electrica, nevera ejecutiva, caja electronica ');
										writeln (' de seguridad y secador de cabello.');
										writeln ('-----------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('-----------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), '); 
										writeln ('acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, '); 
										writeln ('acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
										writeln ('-----------------------------------------------------------------------------------------');
										PTotal:= 60 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 60;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										repeat
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[1].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar algun dato del registro?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										clrscr;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										
										until CDatos = false;
										GRegistro;
										
									end;
								
								'c':
									begin
									clrscr;
										gotoxy(30,1);writeln ('=========================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche');
										gotoxy(30,3);writeln ('=========================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------');
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista,');
										writeln ('Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod ');
										writeln ('con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha,');
										writeln ('cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln ('------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('-------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), ');
										writeln ('acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina,');
										writeln ('acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
										writeln ('-------------------------------------------------------------------------------------------');
										PTotal:= 120 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 120;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										repeat
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[1].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar algun dato del registro?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										clrscr;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										
										until CDatos = false;
										GRegistro;
										
									end;
								
								'd':
									begin
									clrscr;
										gotoxy(30,1);writeln ('==============================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la SUITE - 300$ la noche');
										gotoxy(30,3);writeln ('==============================================');
										writeln;
										writeln ('-------------------------------------------------------------------------------------');
										writeln ('Cálida y confortable habitación decorada con un estilo vanguardista,');
										writeln ('100% libre de humo, Cama Lidotel Royal King, con reloj despertador, ');
										writeln ('TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica,');
										writeln ('nevera ejecutiva, caja electronica de seguridad y secador de cabello,');
										writeln ('armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln ('-------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('-------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),');
										writeln ('Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio,');
										writeln ('sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('-------------------------------------------------------------------------------------');
										PTotal:= 300 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 300;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										repeat
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[1].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar algun dato del registro?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then 
										CDatos := false;
										
										until CDatos = false;
										GRegistro;
										
									end;
								
								end; // end del case de las habitaciones
							
							end; 
						'b':
							begin
							clrscr;
								TRegistro:= 2;
								i:= 2;
								n:= 2;
								gotoxy(30,1);writeln ('/=====================================================/');
								gotoxy(30,2);writeln ('Usted ha seleccionado la reservacion de tipo acompañado');
								gotoxy(30,3);writeln ('/=====================================================/');
								delay(2000);
								read;
								writeln;
								for i:= 1 to n do
								begin
								RCliente;
								end;
								clrscr;
								repeat
								gotoxy(20,21);writeln ('========================');
								gotoxy(20,22);write ('Cantidad de dias de su estadia: ');
								readln(vali);
								if not TryStrToInt(vali, DCliente[1].TDestadia) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									valvali:= true;
								  end
								  else 
								  valvali:=false;
								 until valvali = false; 
								for j:=1 to n do
								begin
								DRegistrar[j].TDestadia := DCliente[1].TDestadia;
								end;
								clrscr;
								writeln;
								gotoxy(25,1);writeln ('--------------------------------');
								gotoxy(25,2);writeln ('Seleccione el tipo de habitacion');
								gotoxy(25,3);writeln ('--------------------------------');
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
									clrscr;
										gotoxy(30,1);writeln ('====================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche');
										gotoxy(30,3);writeln ('====================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo,cama Lidotel Royal King, con reloj despertador TV 32 HD Plasma con cable, banyo con  ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');							
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 200 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 200;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										clrscr;
										repeat
										clrscr;
										gotoxy(30,1);writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										gotoxy(20,2);writeln ('========================================================================================');
										gotoxy(55,5);writeln('A-Si');
										gotoxy(50,6);writeln ('------------------');
										gotoxy(55,7);writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then
										begin
										repeat 
										MDatos := true;
										clrscr;
										repeat
										writeln('////Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln ('------------------');
										writeln('1- Cliente principal');
										writeln ('------------------');
										writeln('2- Acompanante');
										writeln ('------------------');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										until CDatos = false;
										
										end;
										
										until MDatos= false;
										for j:=1 to n do
										begin
										GRegistro;
										end;
									end;
								
								'b':
									begin
									clrscr;
										gotoxy(30,1);writeln ('===========================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche');
										gotoxy(30,3);writeln ('===========================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista, cama Lidotel Royal King con sábanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 60 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 60;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
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
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										until CDatos = false;
										end;
										until MDatos= false;
										for j:= 1 to n do
										begin
										GRegistro;
										end;
									end;
								
								'c':
									begin
									clrscr;
										gotoxy(30,1);writeln ('=========================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche');
										gotoxy(30,3);writeln ('=========================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista, Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 120 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 120;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
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
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										until CDatos = false;
										end;
										until MDatos= false;
										for j:= 1 to n do
										begin
										GRegistro;
										end;
									end;
								
								'd':
									begin
									clrscr;
										gotoxy(30,1);writeln ('==============================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la SUITE - 300$ la noche');
										gotoxy(30,3);writeln ('==============================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln('Cálida y confortable habitación decorada con un estilo vanguardista, 100% libre de humo, Cama Lidotel Royal King, con reloj despertador, TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 300 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 300;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
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
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero de acuerdo a los datos que desea visualizar');
										writeln('1- Cliente principal');
										writeln('2- Acompanante');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then CDatos := false;
										until CDatos = false;
										
									end;
									until MDatos = false;
									for j:= 1 to n do
										begin
										GRegistro;
										end;
							
								
							end;
							
							end;
							end;
						'c':
							begin
							clrscr;
								TRegistro:= 3;
								gotoxy(25,1);writeln ('==========================================================');
								gotoxy(25,2);writeln ('Usted ha seleccionado la reservacion de tipo grupo/familia');
								gotoxy(25,3);writeln ('==========================================================');
								delay(2000);
								read;
								writeln;
								repeat
								write ('Ingrese el numero de personas que desea registrar en la reservacion:');
								readln (vali);
								if not TryStrToInt(vali, n3) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									valvali:=true;
								  end
								  else 
								  valvali:=false;
								 until valvali = false; 
								 n:= n3;
								writeln;
								for i:= 1 to n do
								begin
								RCliente;
								end;
								clrscr;
								repeat
								gotoxy(20,21);writeln ('===========================');
								gotoxy(20,22);write ('Cantidad de dias de su estadia: ');
								gotoxy(20,23);writeln ('===========================');
								readln(vali);
								if not TryStrToInt(vali, DCliente[1].TDestadia) then
								  begin
									WriteLn('Entrada inválida. Solo se permiten números enteros.');
									valvali:= true;
								  end
								  else 
								  valvali:=false;
								 until valvali = false; 
								for j:=1 to n do
								begin
								DRegistrar[j].TDestadia := DCliente[1].TDestadia;
								end;
								clrscr;
								writeln;
								gotoxy(25,1);writeln ('--------------------------------');
								gotoxy(25,2);writeln ('Seleccione el tipo de habitacion');
								gotoxy(25,3);writeln ('--------------------------------');
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
									clrscr;
										gotoxy(30,1);writeln ('====================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la FAMILY ROOM - 200$ la noche');
										gotoxy(30,3);writeln ('====================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de humo,cama Lidotel Royal King, con reloj despertador TV 32” HD Plasma con cable, banyo con  ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio, una habitacion separada con 2 camas full, banyo con ducha.');							
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 200 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 200;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										clrscr;
										repeat
										if MClientes = true then
										begin
										for i:= n4 to n do
										begin
										RCliente;
										end;
										end;
										repeat
										clrscr;
										gotoxy(25,1);writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										repeat
										MDatos := true;
										clrscr;
										repeat
											writeln('Ingrese el numero del cliente que desee visualizar los datos');
											writeln;
											readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
													WriteLn('Entrada inválida. Solo se permiten números enteros.');
													valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										MDatos := true;
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then 
										CDatos := false;
										until CDatos = false;
										end;
										until MDatos = false;
										writeln('¿Desea agregar a mas personas dentro del registro?');
										writeln('A-Si');
										writeln('B-No');
										readln(AClientes);
										if AClientes = 'B' then MClientes := False;
										if AClientes = 'A' then 
										begin
										MClientes:= true;
										repeat
										writeln('Ingrese el numero de personas que desea agregar al registro');
										readln (vali);
												if not TryStrToInt(vali, n2) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										writeln;
										n4:= n;
										n5:= n + n2;
										n:= n5;
										end;
										until MClientes = false;
										for j:= 1 to n do
										begin
										GRegistro;
										end;
										
									end;
								
								'b':
									begin
									clrscr;
										gotoxy(30,1);writeln ('===========================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion SENCILLA - 60$ la noche');
										gotoxy(30,3);writeln ('===========================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln (' Amplia y confortable habitación decorada con un estilo vanguardista, cama Lidotel Royal King con sábanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos.'); 
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 60 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 60;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										clrscr;
										repeat
										if MClientes = true then
										begin
										for i:= (n + 1) to (n + n2) do
										begin
										RCliente;
										end;
										end;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										MDatos := true;
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then 
										CDatos := false;
										until CDatos = false;
										clrscr;
										end;
										until MDatos = false;
										writeln('¿Desea agregar a mas personas dentro del registro?');
										writeln('A-Si');
										writeln('B-No');
										readln(AClientes);
										if AClientes = 'B' then MClientes := False;
										if AClientes = 'A' then 
										begin
										MClientes:= true;
										repeat
										writeln('Ingrese el numero de personas que desea agregar al registro');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, n2 ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										end;
										until MClientes = false;
										for j:= 1 to n + n2 do
										begin
										GRegistro;
										end;
									end;
								
								'c':
									begin
									clrscr;
										gotoxy(30,1);writeln ('=========================================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la habitacion DOBLE - 120$ la noche');
										gotoxy(30,3);writeln ('=========================================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Amplia y confortable habitación decorada con un estilo vanguardista, Dos Camas Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, TV 32” HD Plasma con cable, banyo con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad secador de cabello.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln ('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninyos de 0 a 2 años sin recargos');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 120 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 120;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										clrscr;
										repeat
										if MClientes = true then
										begin
										for i:= (n + 1) to (n + n2) do
										begin
										RCliente;
										end;
										end;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										MDatos := true;
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then 
										CDatos := false;
										until CDatos = false;
										end;
										until MDatos = false;
										writeln('¿Desea agregar a mas personas dentro del registro?');
										writeln('A-Si');
										writeln('B-No');
										readln(AClientes);
										if AClientes = 'B' then MClientes := False;
										if AClientes = 'A' then 
										begin
										MClientes:= true;
										MDatos := true;
										CDatos := true;
										repeat
										writeln('Ingrese el numero de personas que desea agregar al registro');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, n2 ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
												
										
										until valvali = false;
										end;
										
										until MClientes = false;
										for j:= 1 to n + n2 do
										begin
										GRegistro;
										end;
									end;
								
								'd':
									begin
									clrscr;
										gotoxy(30,1);writeln ('==============================================');
										gotoxy(30,2);writeln ('Usted ha seleccionado la SUITE - 300$ la noche');
										gotoxy(30,3);writeln ('==============================================');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln('Cálida y confortable habitación decorada con un estilo vanguardista, 100% libre de humo, Cama Lidotel Royal King, con reloj despertador, TV 32” HD Plasma con cable, 2 banyos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individuales.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln;
										writeln ('Incluye: ');
										writeln ('///////');
										writeln;
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										writeln('Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninyos de 0 a 2 años sin recargos.');
										writeln ('------------------------------------------------------------------------------------------------------------------------');
										PTotal:= 300 * (DCliente[1].TDestadia - 1);
										if Ptotal = 0 then Ptotal:= 300;
										writeln;
										writeln ('///////////////////////////////');
										writeln ('Presione [enter] para continuar');
										writeln ('///////////////////////////////');
										readln;
										clrscr;
										repeat
										if MClientes = true then
										begin
										for i:= (n + 1) to (n + n2) do
										begin
										RCliente;
										end;
										end;
										repeat
										clrscr;
										writeln('¿Desea ver los datos de reservacion de alguno de los clientes?');
										writeln('A-Si');
										writeln('B-No');
										readln(SDatos);
										if SDatos = 'B' then MDatos := False;
										if SDatos = 'A' then 
										begin
										repeat
										MDatos := true;
										clrscr;
										repeat
										writeln('Ingrese el numero del cliente que desee visualizar los datos');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, i ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										
										
										clrscr;
										gotoxy(49,1);writeln('-----------------------');
										gotoxy(49,2);writeln('DATOS DE LA RESERVACION');
										gotoxy(49,3);writeln('-----------------------');
										gotoxy(30,4);writeln('===========================================================');
										gotoxy(30,6);writeln(Dregistrar[i].nombre);
										gotoxy(30,8);writeln('===========================================================');
										gotoxy(30,10);writeln(Dregistrar[i].apellido);
										gotoxy(30,12);writeln('===========================================================');
										gotoxy(30,14);writeln(Dregistrar[i].cedula);
										gotoxy(30,16);writeln('===========================================================');
										gotoxy(30,18);writeln(Dregistrar[i].telefono);
										gotoxy(30,20);writeln('===========================================================');
										gotoxy(30,22);writeln(Dregistrar[i].email);
										gotoxy(30,24);writeln('===========================================================');
										gotoxy(30,26);writeln('Los dias de estadia son: ' ,Dregistrar[i].TDestadia);
										gotoxy(30,28);writeln('===========================================================');
										writeln ('El monto total por la estadia es de: ', PTotal,'$');
										readln();
										clrscr;
										writeln ('¿Desea cambiar alguno de los datos del registro de este cliente?');
										writeln;
										writeln('A-Si');
										writeln ('B-No');
										readln(CRegistro);
										if CRegistro = 'A' then
										begin
										MDatos := true;
										CDatos := true;
										writeln ('¿Que dato desea cambiar?');
										writeln;
										writeln ('A-Nombre');
										writeln ('B-Apellido');
										writeln ('C-Cedula');
										writeln ('D-Telefono');
										writeln ('E-Email');
										writeln ('F-Dias de Estadia');
										repeat
											begin
												repeat
													begin
														readln(CTDatos);
													end;
												until (CTDatos = 'A') or (CTDatos = 'B') or (CTDatos = 'C') or (CTDatos = 'D') or (CTDatos = 'E') or (CTDatos = 'F');
												Val (CTDatos,x4,cod4); 
											end;
										until cod4 > 0;readln(CTDatos);
										case CTDatos of
										
										'A':begin
												repeat
													begin
														writeln('Ingrese el nuevo nombre');
														repeat
															begin
																Readln(Dregistrar[i].nombre);
															end;
														until Dregistrar[i].nombre <> '';
														val (Dregistrar[i].nombre, x7, cod7);
													end;
												until cod7>0;
											end;
											
										'B':begin
												repeat
													begin
														writeln('Ingrese el nuevo apellido');
														repeat
															begin
																Readln(Dregistrar[i].apellido);
															end;
														until Dregistrar[i].apellido <> '';
														val (Dregistrar[i].apellido,x8,cod8);
													end;
												until cod8>0;
											end;
										'C':begin
											writeln('Ingrese el nuevo cedula');
											Readln(Dregistrar[i].cedula);
											end;
								
										'D':begin
												repeat
													begin
														writeln('Ingrese el nuevo telefono');
														readln (vali);
														if not TryStrToInt(vali, Dregistrar[i].telefono ) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;	
												until valvali = false; 
											end;
											
										'E':begin
											writeln('Ingrese el nuevo email');
											Readln(Dregistrar[i].email);
											end;
											
										'F':begin
												repeat
													begin
														writeln('Ingrese la cantidad de dias de su estadia');
														readln(vali);
														if not TryStrToInt(vali, Dregistrar[1].TDestadia) then
															begin
																WriteLn('Entrada inválida. Solo se permiten números enteros.');
																valvali:= true;
															end
														else 
														valvali:=false;
													end;
												until valvali = false; 
											end;
										
										end;
										
										end;
										if CRegistro = 'B' then 
										CDatos := false;
										until CDatos = false;
										
									end;
									until MDatos = false;
									writeln('¿Desea agregar a mas personas dentro del registro?');
										writeln('A-Si');
										writeln('B-No');
										readln(AClientes);
										if AClientes = 'B' then MClientes := False;
										if AClientes = 'A' then 
										begin
										MClientes:= true;
										repeat
										writeln('Ingrese el numero de personas que desea agregar al registro');
										writeln;
										readln (vali);
												if not TryStrToInt(vali, n2 ) then
													begin
														WriteLn('Entrada inválida. Solo se permiten números enteros.');
														valvali:= true;
													end
												else 
												valvali:=false;
										until valvali = false;
										end;
										until MClientes = false;
									for j:= 1 to n do
										begin
										GRegistro;
										end;
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


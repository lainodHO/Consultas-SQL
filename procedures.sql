---Procedures.
---1.- Crear un procedure que pida la clave del avion(no olvidar usar trim para la busqueda sin espacios),
---capacidad de aviones. Si la capacidad del avion esta entre 200 y 250 debera actualizar las horas
---de autonimia en 5 horas mas.

exec aumentar_horas_aviones '34567'

CREATE PROCEDURE aumentar_horas_aviones
--crear parametros--
 @clave_avion char(18)
as
begin

	if exists(
	select * from AVIONES where trim (AVIONES.clave_aviones) = @clave_avion
	)
	begin
		select * from AVIONES where trim (AVIONES.clave_aviones) = @clave_avion

		UPDATE AVIONES SET 
		AVIONES.horas_autonomia_aviones = AVIONES.horas_autonomia_aviones + 5
		WHERE
		(AVIONES.capacidad_aviones between 200 and 250) AND (trim (AVIONES.clave_aviones) = @clave_avion)
	end

	else

	begin
		select 'este avion no esta registrado' as error
	end
end




---2.- Crear un procedure que pida la clave del piloto y nombre de la aerolinea para la que trabaja si la aerolinea
---es aeromexico volaris o iberia se debera aumentarle el sueldo a esos pilotos en un 8% 

exec  aumentar_sueldo_pilotos '123' , 'vueling'

CREATE PROCEDURE aumentar_sueldo_pilotos
@cla_pil char(30),
@nomb_aerolinea char(30)
as
begin
	if exists(
		select pilotos.clave_pilotos ,AEROLINEAS.nombre_aerolineas,pilotos.sueldo_pilotos from pilotos , AEROLINEAS , vuelos, aviones where (trim (pilotos.clave_pilotos) = @cla_pil)
		and ( trim (AEROLINEAS.nombre_aerolineas) = @nomb_aerolinea) 
		and(pilotos.clave_pilotos = vuelos.clave_pilotos and vuelos.clave_aviones = aviones.clave_aviones and aviones.clave_aerolineas = AEROLINEAS.clave_aerolineas)
		and (nombre_aerolineas = 'volaris' or aerolineas.nombre_aerolineas = 'aeromexico' or aerolineas.nombre_aerolineas = 'iberia')
			)
	begin
		update pilotos set 
		pilotos.sueldo_pilotos = pilotos.sueldo_pilotos + 80
		where trim (pilotos.clave_pilotos) = @cla_pil
	

		select pilotos.clave_pilotos ,AEROLINEAS.nombre_aerolineas,pilotos.sueldo_pilotos from pilotos , AEROLINEAS , vuelos, aviones where (trim (pilotos.clave_pilotos) = @cla_pil)
		and ( trim (AEROLINEAS.nombre_aerolineas) = @nomb_aerolinea) 
		and(pilotos.clave_pilotos = vuelos.clave_pilotos and vuelos.clave_aviones = aviones.clave_aviones and aviones.clave_aerolineas = AEROLINEAS.clave_aerolineas)
		and (nombre_aerolineas = 'volaris' or aerolineas.nombre_aerolineas = 'aeromexico' or aerolineas.nombre_aerolineas = 'iberia')
			
			
	end

	else
	begin
		select 'Los parametros no coinciden con los parametros solicitados' as error
	end

end
use AEROPUERTO

---Crear vistas de las tablas.
---1.- Crear una vista que contenga clave de la aerolinea, modelo del avion, clave del vuelo, fecha del vuelo 
---(solo el año) clave de piloto, nombre piloto y edad piloto

create view resumen_general
as
	select aerolineas.nombre_aerolineas , aviones.modelo_aviones, vuelos.clave_vuelos, year(vuelos.fecha_vuelos) as 'fecha' , 
	pilotos.clave_pilotos ,pilotos.nombre_pilotos, pilotos.edad_pilotos

	from aerolineas, aviones, vuelos, pilotos

	where 
	(
	AEROLINEAS.clave_aerolineas = AVIONES.clave_aerolineas and
	aviones.clave_aviones = vuelos.clave_aviones and
	vuelos.clave_pilotos = PILOTOS.clave_pilotos
	)

	---2.- Crear una vista cuales pilotos pilotean modelos de aviones que incluyen un 7 
	---utilizar la vista anterior para esta consulta.

	create view pilotos_modelo_avion_7
	as
	(
		select resumen_general.clave_pilotos , resumen_general.modelo_aviones from resumen_general
		
		where 

		(
			resumen_general.modelo_aviones like '%7%'
		)
	)
---Consulta y Subconsultas
---1.- Cuales aviones tienen mas horas de autonomia y el promedio de todas ellas.
select ( select avg(aviones.horas_autonomia_aviones))as 'horas promedio' ,
( select max(aviones.horas_autonomia_aviones))as 'horas maximas'  
from AVIONES

---2.- Cuantos pasajeros tienen mas edad que el promedio de todos ellos pero son hombres.
select ( select avg(pasajeros.edad_pasajeros)from pasajeros)as 'edadprom',
		pasajeros.clave_pasajeros, pasajeros.edad_pasajeros 
from pasajeros
where (pasajeros.sexo_pasajeros = 'M' AND PASAJEROS.edad_pasajeros > 47)
USE AEROPUERTO

---Consultas con multiples tablas
--1 Cuales vuelos y sus fechas de mes y dia fueron realizados por aeromexico o iberia
SELECT  VUELOS.fecha_vuelos AS 'FECHA DE REALIZACION', AEROLINEAS.nombre_aerolineas
FROM VUELOS , AEROLINEAS , AVIONES
WHERE (AEROLINEAS.clave_aerolineas =AVIONES.clave_aerolineas AND  AVIONES.clave_aviones = VUELOS.clave_aviones) 
AND (AEROLINEAS.nombre_aerolineas = 'IBERIA' OR AEROLINEAS.nombre_aerolineas = 'AEROMEXICO')

--2 - Cuantos pilotos hay por cada aerolinea que volaron en el año 2019
SELECT PILOTOS.clave_pilotos  AS 'CANTIDAD', AEROLINEAS.NOMBRE_AEROLINEAS, PILOTOS.NOMBRE_PILOTOS , VUELOS.fecha_vuelos
FROM PILOTOS , VUELOS , AEROLINEAS 
WHERE  (VUELOS.clave_pilotos = PILOTOS.clave_pilotos AND VUELOS.fecha_vuelos LIKE '%2019%')
ORDER BY (AEROLINEAS.nombre_aerolineas)

--3 Cuales aviones y su capacidad fueron pilotados por mujeres mayores a 40 años  horas de vuelos mayores
--a 150 y su pasaporte tiene una e o una a
SELECT
    AVIONES.matricula_aviones,
    AVIONES.capacidad_aviones,
	AVIONES.clave_aviones,
	AVIONES.modelo_aviones
FROM AVIONES
WHERE
   AVIONES.clave_aviones IN (
  SELECT VUELOS.clave_aviones
  FROM  VUELOS
  WHERE VUELOS.clave_pilotos IN (
  SELECT PILOTOS.clave_pilotos
  FROM  PILOTOS
  WHERE PILOTOS.sexo_pilotos = 'F' -- Femenino
  AND PILOTOS.edad_pilotos > 40 AND PILOTOS.hras_vuelo_pilotos > 150
  AND (PILOTOS.pasaporte_pilotos LIKE '%e%' OR PILOTOS.pasaporte_pilotos LIKE '%a%')) );

--4.- Cuales aerolineas volaron en el 2019 aviones cullas horas de autonomia son de 20 o mas y su peso del avion 4500 o mas.
SELECT VUELOS.fecha_vuelos, AVIONES. peso_aviones, AVIONES.horas_autonomia_aviones,AEROLINEAS.nombre_aerolineas
FROM VUELOS, AVIONES , AEROLINEAS
WHERE
(VUELOS.clave_aviones = AVIONES.clave_aviones AND AVIONES.clave_aerolineas = AEROLINEAS.clave_aerolineas
)
AND 
(AVIONES.horas_autonomia_aviones >= 20 AND AVIONES.peso_aviones >= 4500)
AND 
(VUELOS.fecha_vuelos LIKE '%2019%')

---Procedures.
---1.- Crear un procedure que pida la clave del avion(no olvidar usar trim para la busqueda sin espacios),
---capacidad de aviones. Si la capacidad del avion esta entre 200 y 250 debera actualizar las horas
---de autonimia en 5 horas mas.

---Para ejecutar el Procedure Subir_Horas_Aviones
--exec Subir_Horas_Aviones '34567'

CREATE PROCEDURE Subir_Horas_Aviones
--crear parametros--
 @clave_avion char(18)
as
begin
	if exists(
	select * from AVIONES where trim (AVIONES.clave_aviones) = @clave_avion)
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

---Ejecutar el Procedure Subir_Sueldos_Pilotos
--exec  Subir_Sueldos_Pilotos '123' , 'vueling'
CREATE PROCEDURE Subir_Sueldos_Pilotos
@cla_pil char(30),
@nomb_aerolinea char(30)
as
begin
	if exists(
		select pilotos.clave_pilotos ,AEROLINEAS.nombre_aerolineas,pilotos.sueldo_pilotos from pilotos , AEROLINEAS , vuelos, aviones where (trim (pilotos.clave_pilotos) = @cla_pil)
		and ( trim (AEROLINEAS.nombre_aerolineas) = @nomb_aerolinea) 
		and(pilotos.clave_pilotos = vuelos.clave_pilotos and vuelos.clave_aviones = aviones.clave_aviones and aviones.clave_aerolineas = AEROLINEAS.clave_aerolineas)
		and (nombre_aerolineas = 'volaris' or aerolineas.nombre_aerolineas = 'aeromexico' or aerolineas.nombre_aerolineas = 'iberia'))
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
--1.- Agregarle Triggers de modificacion a la tabla aviones.
-----Crear Trigger de Insertar 
 Create trigger Insertar_Aviones 
 on AVIONES
 for insert
 as 
 insert into Bitacora values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION INSERTAR')
 -----Crear Trigger de Borrar
 Create trigger Borrar_Aviones 
 on AVIONES
 for delete
 as 
 insert into Bitacora values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION BORRAR')
 -----Crear Trigger de Actualizar
 Create trigger Actualizar_Aerolineas 
 on AVIONES
 for update
 as 
 insert into Bitacora values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION ACTUALIZAR')
 --Agregale un trigger de insert a la tabla vuelos
 Create trigger Insertar_Vuelos 
 on Vuelos
 for insert
 as 
 insert into Bitacora values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION INSERTAR')
--use AEROPUERTO
---Crear vistas de las tablas.
---1.- Crear una vista que contenga clave de la aerolinea, modelo del avion, clave del vuelo, fecha del vuelo 
---(solo el año) clave de piloto, nombre piloto y edad piloto
create view Informacion_General
as
	select aerolineas.nombre_aerolineas , aviones.modelo_aviones, vuelos.clave_vuelos, year(vuelos.fecha_vuelos) as 'fecha' , 
	pilotos.clave_pilotos ,pilotos.nombre_pilotos, pilotos.edad_pilotos
	from aerolineas, aviones, vuelos, pilotos
	where 
	(AEROLINEAS.clave_aerolineas = AVIONES.clave_aerolineas and
	aviones.clave_aviones = vuelos.clave_aviones and
	vuelos.clave_pilotos = PILOTOS.clave_pilotos)
---2.- Crear una vista cuales pilotos pilotean modelos de aviones que incluyen un 7 
---utilizar la vista anterior para esta consulta.
	create view Pilotos_Modelos_Avion
	as
	(select Informacion_General.clave_pilotos , Informacion_General.modelo_aviones from Informacion_General
		where (Informacion_General.modelo_aviones like '%7%'))
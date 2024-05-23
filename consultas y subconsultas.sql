---Consulta y Subconsultas
---1.- Cuales aviones tienen mas horas de autonomia y el promedio de todas ellas.
---2.- Cuantos pasajeros tienen mas edad que el promedio de todos ellos pero son hombres.

--1
select ( select avg(aviones.horas_autonomia_aviones))as 'horas promedio' ,
( select max(aviones.horas_autonomia_aviones))as 'horas maximas'  
from AVIONES
--2
select ( select avg(pasajeros.edad_pasajeros)from pasajeros)as 'edadprom',
		pasajeros.clave_pasajeros, pasajeros.edad_pasajeros 
from pasajeros
where (pasajeros.sexo_pasajeros = 'M' AND PASAJEROS.edad_pasajeros > 47)


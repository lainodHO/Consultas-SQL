select * from aerolineas
select * from AVIONES
select * from BOLETOS
select * from PASAJEROS
select * from PILOTOS
select * from VUELOS

/* 2 o + matrices o tablas*/
select * from AVIONES, AEROLINEAS /prod  cartesiano/
where (AEROLINEAS.clave_aerolineas=AVIONES.clave_aerolineas)

/* todas las aerolineas que tienen aviones con capacidad de pasajeros
entre 200 y 250*/
/* campos se suman*/
SELECT AE.clave_aerolineas,AE.nombre_aerolineas,AV.capacidad_aviones
FROM AEROLINEAS AS AE,AVIONES AS AV
WHERE
(AE.clave_aerolineas=AV.clave_aerolineas) AND (AV.CAPACIDAD_AVIONES BETWEEN 200 AND 250)  
ORDER BY AE.nombre_aerolineas

/* TODOSO LOS VUELOS QUE VUELAN A MADRID Y SON DE LA AEROLINEA AEREOMEXICO */
SELECT * FROM VUELOS,AVIONES,AEROLINEAS  WHERE (VUELOS.clave_aviones=AVIONES.clave_aviones)
AND (AEROLINEAS.clave_aerolineas=AVIONES.clave_aerolineas)
AND (VUELOS.ciudad_destino_vuelos='MADRID' AND AEROLINEAS.nombre_aerolineas='AEROMEXICO')

/* TODOS LOS PILOTOS QUE VIVEN EN LA MISMA CD DE LA AEROLINA EN LA QUE TRABAJAN */
SELECT * FROM PILOTOS,VUELOS,AVIONES,AEROLINEAS WHERE(PILOTOS.clave_pilotos=VUELOS.clave_pilotos)
AND (VUELOS.clave_aviones=AVIONES.clave_aviones) AND (AVIONES.clave_aerolineas=AEROLINEAS.clave_aerolineas)
AND (PILOTOS.ciudad_natal_pilotos=AEROLINEAS.ciudad_aerolineas)

/* TODOS LOS PILOTOS ENTRE 45 Y 55 AÑOS Y QUE PILOTEAN AVIONES CON 20 HORAS O MAS DE AUTONOMIA */
SELECT PILOTOS.nombre_pilotos,PILOTOS.edad_pilotos,AVIONES.clave_aviones,AVIONES.horas_autonomia_aviones 
FROM PILOTOS,VUELOS,AVIONES -- CARTESIANO
--SACAR PRODUCTO NATURAL 
WHERE(PILOTOS.clave_pilotos=VUELOS.clave_pilotos AND VUELOS.clave_aviones=AVIONES.clave_aviones) 
AND (PILOTOS.edad_pilotos BETWEEN 45 AND 55 AND AVIONES.horas_autonomia_aviones>=20)

/* TODOS LOS VUELOS QUE SON DE LA AEROLINEA IBERIA O VOLARIS Y QUE LO PILOTEAN MUJERES */
SELECT VUELOS.clave_vuelos, PILOTOS.nombre_pilotos,PILOTOS.sexo_pilotos,AEROLINEAS.nombre_aerolineas
FROM PILOTOS,VUELOS,AVIONES,AEROLINEAS WHERE(PILOTOS.clave_pilotos=VUELOS.clave_pilotos AND 
VUELOS.clave_aviones=AVIONES.clave_aviones AND AVIONES.clave_aerolineas=AEROLINEAS.clave_aerolineas)
AND (PILOTOS.sexo_pilotos='F' AND (AEROLINEAS.nombre_aerolineas='VOLARIS' OR 
AEROLINEAS.nombre_aerolineas='IBERIA'))

/* TODOS LOS AVIONES QUE PESAN MAS DE 5000 KILOS, PUEDEN TRANSPORTAR ENTRE 200 Y 230 PASAJEROS 
    QUE LLEGAN A NY O BOGOTA*/
	SELECT AVIONES.clave_aviones,VUELOS.ciudad_destino_vuelos FROM AVIONES, VUELOS
	WHERE (AVIONES.clave_aviones=VUELOS.clave_aviones) AND 
	(AVIONES.peso_aviones>=5000) AND (AVIONES.capacidad_aviones BETWEEN 200 AND 230
	AND (VUELOS.ciudad_destino_vuelos='BOGOTA' OR VUELOS.ciudad_destino_vuelos='NEW YORK'))
/* CUANTOS VUELOS SALEN O LLEGAN A LA CDMX DE LA AEROLINEA CONTINENTAL O AEROMEXICO*/
    SELECT COUNT (VUELOS.clave_vuelos)AS 'NUMERO DE VUELOS' 
	FROM VUELOS,AVIONES,AEROLINEAS
	WHERE (VUELOS.clave_aviones=AVIONES.clave_aviones
	AND AVIONES.clave_aerolineas=AEROLINEAS.clave_aerolineas) AND
	(VUELOS.ciudad_destino_vuelos='CDMX' OR VUELOS.ciudad_origen_vuelos='CDMX')
	AND (AEROLINEAS.nombre_aerolineas='CONTINENTAL' OR AEROLINEAS.nombre_aerolineas='AEROMEXICO')
/* CUANTOS AVIONES PESAN MAS QUE EL PROMEDIO DE TODOS ELLOS */
 /*INCLUYE SUBCONCULTAS */
    SELECT COUNT (AVIONES.clave_aviones) AS 'NUMERO DE AVIONES'
	FROM AVIONES 
	WHERE AVIONES.peso_aviones>
	(SELECT AVG (AVIONES.peso_aviones) AS 'PESO PROMEDIO DE AVIONES'
	FROM AVIONES)
/* CUALES PILOTOS VOLARON EN EL 2019 A MADRID O JUAREZ, TIENEN 200 O MENOS HORAS DE VUELO Y GANAN ENTRE 
   10000 Y 15000 DOLARES*/
    SELECT PILOTOS.nombre_pilotos,
		   YEAR (VUELOS.fecha_vuelos) AS 'AÑO',
			VUELOS.ciudad_destino_vuelos,
			PILOTOS.sueldo_pilotos,
			VUELOS.clave_vuelos
	FROM PILOTOS,VUELOS -->PROD.CARTESIANO
	WHERE 
	(
	PILOTOS.clave_pilotos=VUELOS.clave_pilotos 
	) AND --> CONDICIONES PROD NATURAL
	(
	YEAR(VUELOS.fecha_vuelos)=2019 AND (VUELOS.ciudad_destino_vuelos='MADRID' OR
	VUELOS.ciudad_destino_vuelos='NEW YORK')  AND (PILOTOS.hras_vuelo_pilotos<=200) AND
	(PILOTOS.sueldo_pilotos BETWEEN 10000 AND 15000)
	)-->CONDICIONES DEL PROBLEMA





	--Cuantos vuelos se realizaron por año
SELECT  COUNT (YEAR(VUELOS.fecha_vuelos)) AS 'Cantidad', YEAR(VUELOS.fecha_vuelos) as 'Año'
FROM VUELOS
GROUP BY YEAR(VUELOS.fecha_vuelos)
order BY YEAR(VUELOS.fecha_vuelos)

---Cuantos pasajeros hay por nacionalidad 
select count(PASAJEROS.nacionalidad_pasajeros) AS 'Nacionalidad',
PASAJEROS.nacionalidad_pasajeros
from PASAJEROS
group by(PASAJEROS.nacionalidad_pasajeros)
ORDER by (PASAJEROS.nacionalidad_pasajeros)
---Cuantos hombres y mujeres hay y el promedio de edad de cada uno de 
Select  count (PASAJEROS.sexo_pasajeros) as'Cantidad', PASAJEROS.sexo_pasajeros as'sexo',
avg (PASAJEROS.edad_pasajeros) as 'edad promedio'
from PASAJEROS
group by (PASAJEROS.sexo_pasajeros)
----Cual es la edad mayor de la mujer pasajero
Select max(PASAJEROS.edad_pasajeros )as 'edad'




SELECT *
FROM PILOTOS ,VUELOS
WHERE
(PILOTOS.clave_pilotos=VUELOS.clave_pilotos)---- Condiciones producto natural
AND
(YEAR(VUELOS.fecha_vuelos)=2019 and (VUELOS.ciudad_destino_vuelos='MADRID' or VUELOS.ciudad_destino_vuelos='JUAREZ') AND (PILOTOS.hras_vuelo_pilotos<=200) and())
---Condiciones de problema

Select VUELOS.ciudad_destino_vuelos,
COUNT(VUELOS.ciudad_destino_vuelos) AS 'Numero de vuelos'
from VUELOS
Group by(Vuelos.ciudad_destino_vuelos)
 order by ([Numero de vuelos]  (VUELOS.ciudad_destino_vuelos))




 /* ACTULIZACION O UPDATE */

UPDATE AVIONES 
SET AVIONES.peso_almacen=AVIONES.peso_almacen*1.10
WHERE AVIONES.tipo='MD'
SELECT * FROM AVIONES

UPDATE PASAJEROS
SET PASAJEROS.pasaporte=PASAJEROS.pasaporte+'T'
WHERE PASAJEROS.edad_pasajeros>20

    /*ACTUALIZAR EL NMBRE DE LOS PILTOS CON CLAVE AL FINAL DE SU NOMBRE, BASADOS EN 
	LA EDAD. SI TIENE ENTRE 40 Y 49 AGREGAR UNA A(MAYUSCULA) Y 60 O MAS UNA 
	C(MAYUSCULA). ANTES DE ESO TODOS LOS NOMBRES DEBERAN CONVERTIRSE EN A MAYUSCULA.*/

SELECT *
FROM PILOTOS 
UPDATE PILOTOS
SET nombre_pilotos= UPPER (nombre_pilotos)

--Trim quita espacios en blanco
UPDATE PILOTOS
SET nombre_pilotos= TRIM (nombre_pilotos)+'-C'
WHERE
 PILOTOS.edad_pilotos>59

 --Borrar de la tabla pasajeros
--- todos los pasajeros que tengan 's' en su nombre
DELETE
FROM PASAJEROS
Where
PASAJEROS.nombre_pasajeros LIKE '%S%'

--Borrar todos los pasajeros que tengan entre 18 y 22, una 'a' en su pasaporte 
delete
From PASAJEROS
where
(PASAJEROS.edad_pasajeros between 18 and 22)
and
(PASAJEROS.pasaporte_pasajeros like '%A%')
--borrar todos los pasajeros que su nombre termine E 'O' y tenga entre 25y 45 y ademas en su pasaporte contenga la netra b
Select *
from PASAJEROS
where
(PASAJEROS.nombre_pasajeros like '%O%')
and
(PASAJEROS.edad_pasajeros between 25 and 40)
and
(PASAJEROS.pasaporte_pasajeros like '%2%')


















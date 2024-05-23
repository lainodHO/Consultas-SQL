USE AEROPUERTO

---Consulta con multiples tablas

---1.- Cuales vuelos y sus fechas de mes y dia fueron realizados por aeromexico o iberia
---2.- Cuantos pilotos hay por cada aerolinea que volaron en el año 2019
---3.- Cuales avinoes y su capacidad fueron pilotados por mujeres mayores a 40 años, 
---horas de vuelo mayores a 150 y en su pasaporte tienen una e o una a.
---4.- Cuales aerolineas volaron en el 2019 aviones cullas horas de autonomia son de
---20 o mas y su peso del avion 4500 o mas.

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

--3 Cuales avinoes y su capacidad fueron pilotados por mujeres mayores a 40 años
SELECT  AV.clave_aviones, AV.capacidad_aviones, P.edad_pilotos, P.nombre_pilotos
FROM PILOTOS AS P , AVIONES AS AV , VUELOS AS V
WHERE (P.clave_pilotos = V.clave_pilotos AND V.clave_aviones = AV.clave_aviones)
AND (P.sexo_pilotos = 'F' AND P.edad_pilotos >= 40)

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






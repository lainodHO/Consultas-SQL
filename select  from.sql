
select * from aerolineas

select * from AVIONES

select * from BOLETOS

select * from PASAJEROS

select * from PILOTOS

select * from VUELOS

/* 2 0 MAS ATRICES O TABLAS */
SELECT * FROM 
AVIONES, AEROLINEAS /* PROD CARTESIANO */
WHERE 
(AVIONES.clave_aerolineas=AEROLINEAS.clave_aerolineas)

SELECT
AE.clave_aerolineas,
AE.nombre_aerolineas,
AV.capacidad_aviones
FROM AEROLINEAS AS AE, AVIONES AS AV
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


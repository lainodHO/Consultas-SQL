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
--Cuantas aerolíneas tienen un 2 o un 5 en su clave y su correo lo tienen en Gmail
SELECT COUNT(*) AS TotalAerolineasCon2o5EnClaveYCorreoGmail
FROM [AEROPUERTO].[dbo].[AEROLINEAS]
WHERE (CHARINDEX('2', [clave_aerolineas]) > 0 OR CHARINDEX('5', [clave_aerolineas]) > 0)
  AND [email_aerolineas] LIKE '%@gmail.com%';

--Cuales aerolíneas tienen una 'a' al final de su nombre son de nueva york o madrid 
SELECT [clave_aerolineas]
      ,[nombre_aerolineas]
      ,[ciudad_aerolineas]
      ,[direccion_aerolineas]
      ,[telefono_aerolineas]
      ,[email_aerolineas]
FROM [AEROPUERTO].[dbo].[AEROLINEAS]
WHERE 
  (UPPER([nombre_aerolineas]) LIKE '%A' OR UPPER([nombre_aerolineas]) LIKE '%Á') -- Termina con 'A' o 'Á'
  AND (UPPER([ciudad_aerolineas]) = 'NUEVA YORK' OR UPPER([ciudad_aerolineas]) = 'MADRID');


--Cuantos aviones pertenecen a la aerolínea Aeroméxico o america cuales aviones tienen entre 20-25 horas de autonomía, son de modelo entre 700-800 
SELECT COUNT(*) AS TotalAviones
FROM [AEROPUERTO].[dbo].[AVIONES]
WHERE
    ([clave_aerolineas] = 'Aeroméxico' OR [clave_aerolineas] = 'America')
    AND [horas_autonomia_aviones] BETWEEN 20 AND 25
    AND [modelo_aviones] BETWEEN 700 AND 800;


--Cuales pasajeros son de nacionalidad mexicana, hombres su pasaporte tiene una a o una e en su interior
SELECT [clave_pasajeros]
    ,[nombre_pasajeros]
    ,[edad_pasajeros]
    ,[nacionalidad_pasajeros]
    ,[sexo_pasajeros]
    ,[fecha_nacimiento_pasajeros]
    ,[pasaporte_pasajeros]
    ,[telefono_pasajeros]
FROM [AEROPUERTO].[dbo].[PASAJEROS]
WHERE [nacionalidad_pasajeros] = 'mexicana'
    AND [sexo_pasajeros] = 'hombre'
    AND (CHARINDEX('a', [pasaporte_pasajeros]) > 0 OR CHARINDEX('e', [pasaporte_pasajeros]) > 0);


--Cuales pasajeros han volado por Iberia o vuelin 
SELECT DISTINCT P.[clave_pasajeros]
    ,P.[nombre_pasajeros]
    ,P.[edad_pasajeros]
    ,P.[nacionalidad_pasajeros]
    ,P.[sexo_pasajeros]
    ,P.[fecha_nacimiento_pasajeros]
    ,P.[pasaporte_pasajeros]
    ,P.[telefono_pasajeros]
FROM [AEROPUERTO].[dbo].[PASAJEROS] AS P
JOIN [AEROPUERTO].[dbo].[VUELOS] AS V ON P.[clave_vuelo] = V.[clave_vuelo]
WHERE V.[aerolinea] IN ('Iberia', 'vuelin');


--Cuantos vuelos se hicieron en el 2017 a Juárez o Madrid
SELECT COUNT(*) AS TotalVuelos
FROM [AEROPUERTO].[dbo].[VUELOS]
WHERE YEAR([fecha_vuelos]) = 2017
  AND ([ciudad_destino_vuelos] = 'Juárez' OR [ciudad_destino_vuelos] = 'Madrid');


--Cuales vuelos volaron a nueva York o a Arabia en el 2019
SELECT *
FROM [AEROPUERTO].[dbo].[VUELOS]
WHERE YEAR([fecha_vuelos]) = 2019
  AND ([ciudad_destino_vuelos] = 'Nueva York' OR [ciudad_destino_vuelos] = 'Arabia');


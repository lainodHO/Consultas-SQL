--1. Cuantas aerolíneas tienen un 2 o un 5 en su clave y su correo lo tienen en Gmail:
CREATE PROCEDURE Contar_Aerolineas_2_5En_Clave_CorreoGmail
AS
BEGIN
    SELECT COUNT(*) AS Contar_Aerolineas_2_5En_Clave_CorreoGmail
    FROM [AEROPUERTO].[dbo].[AEROLINEAS]
    WHERE (CHARINDEX('2', [clave_aerolineas]) > 0 OR CHARINDEX('5', [clave_aerolineas]) > 0)
      AND [email_aerolineas] LIKE '%@gmail.com%';
END;


--2. Cuales aerolíneas tienen una 'a' al final de su nombre, son de Nueva York o Madrid:
Madrid:
CREATE PROCEDURE Aerolineas_A_AlFinal_Ciudad
AS
BEGIN
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
END;


--3. Cuantos aviones pertenecen a la aerolínea Aeroméxico o América, y tienen entre 20-25 horas de autonomía y son de modelo entre 700-800:
CREATE PROCEDURE Contar_Aviones_Aeromexico_America
AS
BEGIN
    SELECT COUNT(*) AS TotalAviones
    FROM [AEROPUERTO].[dbo].[AVIONES]
    WHERE
        ([clave_aerolineas] = 'Aeroméxico' OR [clave_aerolineas] = 'America')
        AND [horas_autonomia_aviones] BETWEEN 20 AND 25
        AND [modelo_aviones] BETWEEN 700 AND 800;
END;


--4. Cuales pasajeros son de nacionalidad mexicana, hombres y su pasaporte tiene una 'a' o una 'e' en su interior:
CREATE PROCEDURE Pasajeros_Mexicanos_Hombres__AOE_Pasaporte
AS
BEGIN
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
END;


--5. Cuales pasajeros han volado por Iberia o Vuelin:
CREATE PROCEDURE Pasajeros_Volado_Iberia_Vuelin
AS
BEGIN
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
END;


--6. Cuantos vuelos se hicieron en el 2017 a Juárez o Madrid:
CREATE PROCEDURE Contar_Vuelos_2017_Juarez_Madrid
AS
BEGIN
    SELECT COUNT(*) AS TotalVuelos
    FROM [AEROPUERTO].[dbo].[VUELOS]
    WHERE YEAR([fecha_vuelos]) = 2017
      AND ([ciudad_destino_vuelos] = 'Juárez' OR [ciudad_destino_vuelos] = 'Madrid');
END;


--7. Cuales vuelos volaron a Nueva York o Arabia en el 2019:
CREATE PROCEDURE Vuelos_NuevaYork_Arabia_2019
AS
BEGIN
    SELECT *
    FROM [AEROPUERTO].[dbo].[VUELOS]
    WHERE YEAR([fecha_vuelos]) = 2019
      AND ([ciudad_destino_vuelos] = 'Nueva York' OR [ciudad_destino_vuelos] = 'Arabia');
END;

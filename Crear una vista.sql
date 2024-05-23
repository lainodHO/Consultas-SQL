--Crear una vista que es una tabla virtual
-- las aerolineas a las que pertenece
--los pilotos de dichos vuelos
--Delos vuelos clave,cuidad origen y cuidad destino.

--De las aerolienas solo el nombre
-- Y de los pilotos  nombre del piloto y edad y horas de vuelo
--1.- crear la consulta 
--2.- crear la vista con la consulta
--3.- crear el procedure para actualizar de maneraconstante la vista

--1.- Crear la consulta
CREATE VIEW Listado_Vuelos_Aerolineas_Pilotos
AS
Select P.nombre_pilotos, 
p.edad_pilotos, 
p.hras_vuelo_pilotos,
v.clave_vuelos,
v.ciudad_destino_vuelos,
v.ciudad_origen_vuelos,
AR.nombre_aerolineas

from PILOTOS as P
,VUELOS as V
,AVIONES as AV,
AEROLINEAS as AR


Where
(P.clave_pilotos=v.clave_pilotos)
and
(v.clave_aviones=av.clave_aviones)
and
(av.clave_aerolineas=Ar.clave_aerolineas)

---------------------------------------------------------

if exists (Select *
from INFORMATION_SCHEMA.VIEWS
where
TABLE_NAME='Listado_Vuelos_Aerolineas_Pilotos')
begin
select 'si existe la vista '
end
else
begin
-------------Si no existe que la creee
(CREATE VIEW Listado_Vuelos_Aerolineas_Pilotos
AS
Select P.nombre_pilotos, 
p.edad_pilotos, 
p.hras_vuelo_pilotos,
v.clave_vuelos,
v.ciudad_destino_vuelos,
v.ciudad_origen_vuelos,
AR.nombre_aerolineas

from PILOTOS as P
,VUELOS as V
,AVIONES as AV,
AEROLINEAS as AR


Where
(P.clave_pilotos=v.clave_pilotos)
and
(v.clave_aviones=av.clave_aviones)
and
(av.clave_aerolineas=Ar.clave_aerolineas))

-------------
end
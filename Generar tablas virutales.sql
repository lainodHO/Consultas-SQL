--crear una vista (Tabla virtual)
--Que relacione los pilotos y las aerolineas
--en las que han volado 

---crear tabla virtual
Create view Lista_Pilotos_Aerolineas
as
Select PILOTOS.nombre_pilotos,
AEROLINEAS.nombre_aerolineas
From AEROLINEAS,AVIONES,VUELOS,PILOTOS
Where
---Producto natural
(AEROLINEAS.clave_aerolineas=AVIONES.clave_aerolineas and
VUELOS.clave_pilotos=PILOTOS.clave_pilotos)
---cunsulta usando una vista 
Select*
From Lista_Pilotos_Aerolineas
AS LPA
Where (LPA.nombre_pilotos like '%A%')
and
(LPA.nombre_aerolineas like '%AERO%')
order by LPA.nombre_pilotos

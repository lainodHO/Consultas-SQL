ALTER Table PILOTOS
add
pass char (20)

Update PILOTOS
set pass= SUBSTRING (nombre_pilotos,1,3)+
SUBSTRING(cast (edad_pilotos as char),2,1) +
SUBSTRING (pasaporte_pilotos, 3, 3)


Create Procedure Cambio_Password_Pilotos
@cla char(18),
@newpass char(20)
as
begin 
if exists (select *
from pilotos
where
trim (pilotos.clave_pilotos)= trim (@cla))
begin
Update PILOTOS
set pass=@newpass
where
trim (pilotos.clave_pilotos)= trim (@cla)
end
else
begin
Select 'No Existe esa clave piloto' as 'Mensaje'
end
end




exec Cambio_Password_Pilotos '123','ABC123'


ALTER Table PILOTOS
add
Email char (35)

--Crear una comlumna de correo qlectronico la cual se compodra de las 5 primeras letras del nombre, 
--Un punto dos, dos primeras letras de cuidad natal , un guion y las dso primeras letras de nacionalidad
--al final agregar @delicias.tecnm.mx
-- Agregar la columna 'Email' a la tabla 'PILOTOS'
ALTER TABLE PILOTOS
ADD Email CHAR(50);  -- Ajusta la longitud según tus necesidades

-- Actualizar la columna 'Email' según el patrón especificado
UPDATE PILOTOS
SET Email = lower (substring (nombre_pilotos,1,5) + '.' +
            substring(ciudad_natal_pilotos,1,2) + '-' +
            substring (nacionalidad_pilotos,1, 2) + '@delicias.tecnm.mx');

-- Crear el procedimiento almacenado 'Cambio_Password_Pilotos'
CREATE PROCEDURE Cambio_Password_Pilotos
    @cla CHAR(18),
    @newEmail CHAR(50)  -- Ajusta la longitud según tus necesidades
AS
BEGIN
    IF EXISTS (
            SELECT *
            FROM pilotos
            WHERE TRIM(pilotos.clave_pilotos) = TRIM(@cla)
        )
    BEGIN
        UPDATE PILOTOS
        SET Email = @newEmail
        WHERE TRIM(pilotos.clave_pilotos) = TRIM(@cla);
    END
    ELSE
    BEGIN
        SELECT 'No Existe esa clave piloto' AS 'Mensaje';
    END;
END;

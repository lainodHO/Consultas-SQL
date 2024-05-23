create procedure buscar_pilotos
---crean las variables (parametros )
@cla_pil char(18)
as begin
---- cuerpo del procedure
select *
from PILOTOS
where
trim(PILOTOS.clave_pilotos)=trim(@cla_pil)
end

exec buscar_pilotos '123'


---Nuevos CP
Alter procedure buscar_aerolineas
---crean las variables (parametros )
@nomb_aero char(30)
as begin
---- cuerpo del procedure
if exists(
select *
from AEROLINEAS
where
AEROLINEAS.nombre_aerolineas like '%' + trim(@nomb_aero) + '%')

begin
select *
from AEROLINEAS
where
AEROLINEAS.nombre_aerolineas like '%' + trim(@nomb_aero) + '%')
end

else
begin
select 'no hay ningun dato con esa cadena'
end

exec buscar_aerolineas 'a'


create procedure tablas_exists
@nombre char(30) 
as
begin
if exists(
Select *
from INFORMATION_SCHEMA.TABLES
where
TABLE_NAME= @nombre)
begin

Select *
from INFORMATION_SCHEMA.TABLES
where
TABLE_NAME= @nombre
end
else
begin
select'La tabla no existe'
end
end


exec tablas_exists 'b'
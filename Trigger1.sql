-----Trigger Insertar
create trigger INSERTAR_PILOTOS
on PILOTOS
for insert 
as 
Select* 
From PILOTOS
insert into Bitacora
Values(SUSER_NAME(),Getdate(),@@SERVERNAME,'INSERT')
Select* 
From Bitacora

-----Trigger Actualizar
create trigger UPDATE_PILOTOS
on PILOTOS
for UPDATE
as 
Select* 
From PILOTOS
insert into Bitacora
Values(SUSER_NAME(),Getdate(),@@SERVERNAME,'UPDATE')
Select* 
From Bitacora

-----Trigger Borrar
create trigger DELETE_PILOTOS
on PILOTOS
for delete
as 
Select* 
From PILOTOS
insert into Bitacora
Values(SUSER_NAME(),Getdate(),@@SERVERNAME,'DELETE')
Select* 
From Bitacora

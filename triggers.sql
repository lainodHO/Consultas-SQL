--1.- Agregarle Triggers de modificacion a la tabla aviones.
 Create trigger insert_aviones 
 on AVIONES
 for insert
 as 
 insert into Bitacora_1 values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION INSERTAR')

 Create trigger delete_aviones 
 on AVIONES
 for delete
 as 
 insert into Bitacora_1 values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION BORRAR')

 Create trigger update_aerolineas 
 on AVIONES
 for update
 as 
 insert into Bitacora_1 values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION ACTUALIZAR')
 
 --Agregale un trigger de insert a la tabla vuelos
 Create trigger insert_vuelos 
 on Vuelos
 for insert
 as 
 insert into Bitacora_1 values(SUSER_NAME() , getdate(),@@SERVERNAME, 'ACCION INSERTAR')
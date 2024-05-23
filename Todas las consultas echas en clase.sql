create table  Producto(
id_producto int identity  primary key, 
producto varchar(50),
fecha_compra date,
precio money
);

Select * From Producto

Use Soriana

create table  bitacora_producto(
id_bitacora int identity primary key, 
evento varchar(50),
tipo_reg varchar(50),
inicio_sesion varchar(50),
usuario varchar(50),
aplicacion varchar(50),
hostname varchar(50),
fecha datetime not null default getdate(),

id_producto int   ,
nombre_producto varchar(50),
fecha_compra date,
precio money,

constraint ck_evento check(evento in ('T','U','D')),
constraint ck_tipo_reg  check(tipo_reg in ('OLD','NEW')),
);

Select * From bitacora_producto


CREATE or ALTER trigger trigger_insert_producto
on Producto
after insert
not for replication
as
insert into bitacora_producto
(evento,
tipo_reg,
inicio_sesion,
usuario,
aplicacion,
hostname,
id_producto,
nombre_producto,
fecha_compra,
precio)
select 'I',
'NEW',
SUSER_NAME(),
USER_NAME(),
APP_NAME(),
HOST_NAME(),
id_producto,
Producto,
fecha_compra,
precio
from inserted
print 'trigger after insert has sido disparado...';


create or alter trigger trigger_update_producto
on Producto
after update 
not for replication
as
insert into bitacora_producto
(evento,
tipo_reg,
inicio_sesion,
usuario,
aplicacion,
hostname,
id_producto,
nombre_producto,
fecha_compra,
precio
from deleted)
select 'U',
'OLD',
SUSER_NAME(),
USER_NAME(),
APP_NAME(),
HOST_NAME(),
id_producto,
Producto,
fecha_compra,
precio
from inserted;
print 'El trigger after update ha sido disparado...';


create or alter trigger trigger_delete_producto
on Producto
after update 
not for replication
as
insert into bitacora_producto
(evento,
tipo_reg,
inicio_sesion,
usuario,
aplicacion,
hostname,
id_producto,
nombre_producto,
fecha_compra,
precio
)
select 'D',
'OLD',
SUSER_NAME(),
USER_NAME(),
APP_NAME(),
HOST_NAME(),
id_producto,
Producto,
fecha_compra,
precio
from inserted;
print 'El trigger after update ha sido disparado...';

Select object_name(parent_id) as Parent_Object-Name, *
From Sys.triggers
Go



----Probando todos los tiggers creados
-----Probando con el insert

insert into producto(producto, fecha_compra,precio)
Values('Pastel Carlos V', '2023/01/05,256,96');

Select * from producto;
select *from bitacora_producto;
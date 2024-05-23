SELECT *
from Bitacora

SELECT *
from AEROLINEAS

insert into AEROLINEAS
values('141','MEX','CDMX','Calle','222','MEX@Gmail.com')

delete from AEROLINEAS
where
clave_aerolineas = '141'

update AEROLINEAS
set AEROLINEAS.ciudad_aerolineas='Saucillo'
where
AEROLINEAS.ciudad_aerolineas='CDMX'
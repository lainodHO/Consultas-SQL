---actualizaro update campos
update AVIONES
set AVIONES.peso_almacen=AVIONES.peso_almacen*1.10
where
AVIONES.tipo='MD'
select*
from AVIONES
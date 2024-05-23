----Insertar Valores en la tabla pilotosn
INSERT INTO PILOTOS
VALUES
('323','Juan Pérez',23, 'Bogota','M',12,2500,'Mexicana','JBHM12')

INSERT INTO PILOTOS
VALUES
('424','Maria beltran',27, 'Bogota','F',5,2500,'Puruana','MBFP27')

----Uctualizar la tabla para aumentarle el sueldo en 1000 pesos a los pilotos de Bogota o Madrid
UPDATE PILOTOS
SET sueldo_pilotos = sueldo_pilotos + 1000
WHERE ciudad_natal_pilotos = 'Bogota'
OR ciudad_natal_pilotos = 'Madrid';


--Borrar todos los pilotos que tengan pilotos de la cuidad culiacan. 
DELETE FROM PILOTOS
WHERE (PILOTOS.ciudad_natal_pilotos = 'CULIACAN')





---Consulta con multiples tablas
---1.- Cuales vuelos y sus fechas de mes y dia fueron realizados por aeromexico o iberia
---2.- Cuantsos pilotos hay por cada aerolinea que volaron en el a�o 2019
---3.- Cuales avinoes y su capacidad fueron pilotados por mujeres mayores a 40 a�os, 
---horas de vuelo mayores a 150 y en su pasaporte tienen una e o una a.
---4.- Cuales aerolineas volaron en el 2019 aviones cullas horas de autonomia son de
---20 o mas y su peso del avion 4500 o mas.
---Consulta y Subconsultas
---1.- Cuales aviones tienen mas horas de autonomia que en promedio de todas ellas.
---2.- Cuantos pasajeros tienen mas edad que el promedio de todos ellos pero son hombres.
---Triggers.
---1.- Agregarle Triggers de modificacion de modificacion a la tabla aviones. 
---2.- Aggregarle trigger de insertar a la tabla vuelos 
---Procedures.
---1.- Crear un procedure que pida la clave del avion(no olvidar usar trim para la busqueda sin espacios),
---capacidad de aviones. Si la capacidad del avion esta entre 200 y 250 debera actualizar las horas
---de autonimia en 5 horas mas.
---2.- Crear un procedure que pida la clave del piloto y nombre de la aerolinea para la que trabaja si la aerolinea
---es aeromexico volaris o iberia se debera aumentarle el sueldo a esos pilotos en un 8% 
---Crear vistas de las tablas.
---1.- Crear una vista que contenga clave de la aerolinea, modelo del avion clave del vuelo, fecha del vuelo 
---(solo el a�o, clave de piloto, nombre piloto y edad piloto).
---2.- Crear una vista cuales pilotos pilotean modelos de aviones que incluyen un 7 
---utilizar la vista anterior para esta consulta.
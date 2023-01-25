-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE Departamento(
	id INT PRIMARY KEY,
	nombre TEXT,
	presupuesto INT
);

CREATE TABLE Empleado(
	dni TEXT PRIMARY KEY,
	nombre TEXT,
	apeillido TEXT,
	ref_departamento INT REFERENCES Departamento(id)
);

-- sentencia sql para la inserción de datos

INSERT INTO Departamento VALUES ("1","fisica","70000");
INSERT INTO Departamento VALUES ("2","informática","90000");
INSERT INTO Departamento VALUES ("3","matematicas","120000");
INSERT INTO Departamento VALUES ("4","quimica","83000");
INSERT INTO Departamento VALUES ("5","musica","75000");
INSERT INTO Departamento VALUES ("6","ingles","90000");
INSERT INTO Departamento VALUES ("7","literatura","200000");
INSERT INTO Departamento VALUES ("8","historia","100000");
INSERT INTO Departamento VALUES ("9","biologia","70000");
INSERT INTO Departamento VALUES ("10","enfermeria","80000");

INSERT INTO Empleado VALUES ("72839475","Pepe","López","2");
INSERT INTO Empleado VALUES ("95827403","Juan","Garcia","10");
INSERT INTO Empleado VALUES ("39857576","Marcos","Perez","1");
INSERT INTO Empleado VALUES ("00000000","Esther","Vázquez","10");
INSERT INTO Empleado VALUES ("32874365","Manuel","Page","4");
INSERT INTO Empleado VALUES ("54546466","Javier","Remedios","1");
INSERT INTO Empleado VALUES ("24345637","Lucas","Hotzel","8");
INSERT INTO Empleado VALUES ("53875365","Luis","Soto","9");
INSERT INTO Empleado VALUES ("54578476","Gara","Remedios","8");
INSERT INTO Empleado VALUES ("23875647","Jorge","Melian","9");

-- Sentencia sql para cada una de las consultas especificadas.

--- 1. Crear la base de datos: BD_EMPLEADO.

--- 3. Obtener los apellidos de los empleados.

SELECT apeillido FROM Empleado;

--- 4. Obtener los apellidos de los empleados sin repeticiones.

SELECT DISTINCT apeillido FROM Empleado;

--- 5. Obtener todos los datos de los empleados que se apellidan López.

SELECT * FROM Empleado WHERE apeillido = "López";

--- 6. Obtener todos los datos de los empleados que se apellidan López y los que se apellidan Pérez.

SELECT * FROM Empleado WHERE apeillido IN ("López","Perez");

--- 7. Obtener todos los datos de los empleados que trabajan para el departamento 10.

SELECT * FROM Empleado WHERE ref_departamento = "10";

--- 8. Obtener todos los datos de los empleados que trabajan para el departamento 8 y para el departamento 5.

SELECT * FROM Empleado WHERE ref_departamento IN ("8","5");

--- 9. Obtener todos los datos de los empleados cuyo apellido comience por P.

SELECT * FROM Empleado WHERE apeillido LIKE "P%";

--- 10. Obtener el presupuesto total de todos los departamentos.

SELECT SUM(presupuesto) FROM Departamento;

--- 11. Obtener el número de empleados en cada departamento.

SELECT ref_departamento, count(dni) FROM Empleado GROUP BY ref_departamento;

--- 12. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.

SELECT Empleado.*, Departamento.* FROM Empleado, Departamento WHERE Departamento.id = Empleado.ref_departamento;

--- 13. Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.

SELECT Empleado.nombre, Empleado.apeillido, Departamento.nombre, Departamento.presupuesto FROM Empleado, Departamento WHERE Departamento.id = Empleado.ref_departamento;

--- 14. Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.

SELECT Empleado.nombre, Empleado.apeillido FROM Empleado, Departamento WHERE Departamento.id = Empleado.ref_departamento AND Departamento.presupuesto > 60000;

--- 15. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.

SELECT * FROM Departamento WHERE presupuesto > (SELECT AVG(presupuesto) FROM Departamento);

--- 16. Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.
???????????????????
SELECT Departamento.nombre FROM Departamento, Empleado WHERE Departamento.id = Empleado.ref_departamento AND Empleado.ref_departamento (SELECT ref_departamento, count(*) as n FROM Empleado GROUP BY ref_departamento HAVING n > 1 )

--- 17. Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11.

INSERT INTO Departamento VALUES ("11","Calidad","40000");

--- 18. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.

UPDATE Empleado SET ref_departamento = "11" WHERE dni = "00000000";

--- 19. Calcular un recorte presupuestario del 10 % a todos los departamentos.

SELECT presupuesto - (presupuesto * 10 / 100) FROM Departamento

--- 20. Despedir a todos los empleados que trabajan para el departamento de informática (código 2).

DELETE FROM Empleado WHERE ref_departamento = "2";

--- 21. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.

DELETE FROM Empleado WHERE ref_departamento = (SELECT id FROM Departamento WHERE presupuesto > 60000);

--- 22. Despedir a todos los empleados.

DELETE FROM Empleado;
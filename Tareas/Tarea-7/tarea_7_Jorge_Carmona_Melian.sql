CREATE TABLE Despacho(
	id INT PRIMARY KEY,
	capacidad INT
);

CREATE TABLE Director(
	dni TEXT PRIMARY KEY,
	nombre TEXT,
	apellido TEXT,
	director_jefe TEXT REFERENCES Director(dni),
	id_despacho INT REFERENCES Despacho(id)
);

INSERT INTO Despacho VALUES ("1","3");
INSERT INTO Despacho VALUES ("2","5");
INSERT INTO Despacho VALUES ("3","2");
INSERT INTO Despacho VALUES ("4","2");
INSERT INTO Despacho VALUES ("5","3");

INSERT INTO Director VALUES ("11111111A", "Juan", "Garcia", NULL, "1");
INSERT INTO Director VALUES ("22222222B", "Manuel", "Sanchez", NULL, "3");
INSERT INTO Director VALUES ("33333333C", "Jesus", "Rodriguez", NULL, "3");
INSERT INTO Director VALUES ("44444444D", "Maria", "Victoria", NULL, "2");
INSERT INTO Director VALUES ("55555555E", "Pablo", "Hernandez", NULL, "4");

INSERT INTO Director VALUES ("66666666F", "Alejandro", "Acosta", "11111111A", "1");
INSERT INTO Director VALUES ("77777777G", "Luis Alberto", "Soto", "55555555E", "3");
INSERT INTO Director VALUES ("88888888H", "Javier", "Remedios", "33333333C", "2");
INSERT INTO Director VALUES ("99999999I", "Lucas", "Gonzales", "44444444D", "2");
INSERT INTO Director VALUES ("10101010J", "Miguel", "Vaquero", "44444444D", "5");

SELECT dni,nombre,apellido FROM Director;

SELECT * FROM Director WHERE director_jefe IS NULL;

SELECT Director.nombre, Director.apellido, Despacho.capacidad FROM Director,Despacho WHERE Director.id_despacho = Despacho.id;

SELECT count(id_despacho) FROM Director GROUP BY id_despacho;

SELECT * FROM Director WHERE director_jefe IN (SELECT dni FROM Director WHERE director_jefe IS NULL);

SELECT d1.nombre,d2.nombre FROM Director as d1, Director as d2 WHERE d2.dni = d1.director_jefe;
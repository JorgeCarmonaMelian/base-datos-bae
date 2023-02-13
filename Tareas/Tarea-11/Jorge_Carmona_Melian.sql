---Sentencias para la creación de la BBDD.

CREATE TABLE cientifico (
    id TEXT PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT
);

CREATE TABLE proyecto (
    id TEXT PRIMARY KEY,
    nombre TEXT,
    horas INTEGER
);

CREATE TABLE cientifico_proyecto (
    ref_cientifico TEXT REFERENCES cientifico(id),
    ref_proyecto TEXT REFERENCES proyecto(id)
);

--- Realiza la insercición de almenos 10 científicos, 5 proyectos y la relación entre estos.

INSERT INTO cientifico VALUES ("11111111A","Isaac","Newton",NULL);
INSERT INTO cientifico VALUES ("22222222B","Gregor","Mendel",NULL);
INSERT INTO cientifico VALUES ("33333333C","Marie","Curie",NULL);
INSERT INTO cientifico VALUES ("44444444D","Plinio","El","Viejo");
INSERT INTO cientifico VALUES ("55555555E","Hipatia","De Alejandría",NULL);
INSERT INTO cientifico VALUES ("66666666F","Joseph","Priestley",NULL);
INSERT INTO cientifico VALUES ("77777777G","Rosalind","Franklin",NULL);
INSERT INTO cientifico VALUES ("88888888H","Johan","Baptista","Van helmont");
INSERT INTO cientifico VALUES ("99999999I","Bárbara","MC","Clintock");
INSERT INTO cientifico VALUES ("10101010J","Thomas","Young",NULL);

INSERT INTO proyecto VALUES ("1","Escuela Neoplatónica",400);
INSERT INTO proyecto VALUES ("2","leyes del movimiento y gravitación universal",100);
INSERT INTO proyecto VALUES ("3","Teoria de la luz",200);
INSERT INTO proyecto VALUES ("4","ADN",500);
INSERT INTO proyecto VALUES ("5","Gases",700);

INSERT INTO cientifico_proyecto VALUES ("55555555E","1");
INSERT INTO cientifico_proyecto VALUES ("11111111A","2");
INSERT INTO cientifico_proyecto VALUES ("11111111A","3");
INSERT INTO cientifico_proyecto VALUES ("77777777G","4");
INSERT INTO cientifico_proyecto VALUES ("88888888H","5");

--- Realizar las siguientes consultas:

--- 1. Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto.

SELECT cientifico.id, cientifico.nombre, proyecto.id, proyecto.nombre from cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto;

--- 2. Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).

SELECT cientifico.id, cientifico.nombre, count() FROM cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto GROUP BY cientifico.id;

--- 3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).

SELECT proyecto.id, proyecto.nombre, count() FROM cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto GROUP BY proyecto.id;

--- 4. Obtener el número de horas de dedicación de cada científico.

SELECT cientifico.nombre, sum(proyecto.horas) FROM cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto GROUP BY cientifico_proyecto.ref_cientifico;

---

SELECT cientifico.nombre, avg(proyecto.horas) FROM cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto
GROUP by cientifico_proyecto.ref_cientifico HAVING avg(proyecto.horas) > 10 AND count()

---

SELECT cientifico.nombre, avg(proyecto.horas) FROM cientifico, cientifico_proyecto, proyecto
WHERE cientifico.id = cientifico_proyecto.ref_cientifico
AND proyecto.id = cientifico_proyecto.ref_proyecto
GROUP by cientifico_proyecto.ref_cientifico HAVING avg(proyecto.horas) > 10 AND count(cientifico.id) > 1;
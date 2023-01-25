# Tarea 2

<b>Creación de la tabla.</b>

- Usuario:
    - id número,
    - login texto;
    - nombre texto;
    - sexo texto;
    - nivel numero,
    - email texto;
    - telefono texto;
    - marca texto;
    - compañia texto;
    - saldo número,
    - activo booleano
        - clave primaria(id)

```sql

-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE Usuario(
	id INTEGER PRIMARY KEY,
	login TEXT,
	nombre TEXT,
	sexo TEXT,
	nivel INTEGER,
	email TEXT,
	telefono TEXT,
	marca TEXT,
	compañia TEXT,
	saldo INTEGER,
	activo INTEGER
);

-- sentencia sql para la inserción de datos

INSERT INTO Usuario  VALUES ('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','KINKI','IUSACELL','100','1');
INSERT INTO Usuario  VALUES ('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG4','TELCEL','0','1');
INSERT INTO Usuario  VALUES ('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','TOMTON','MOVISTAR','150','1');
INSERT INTO Usuario  VALUES ('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','KINKI','TELCEL','50','1');
INSERT INTO Usuario  VALUES ('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','TOMTON','IUSACELL','50','0');
INSERT INTO Usuario  VALUES ('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','DREAMS','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACK','AXEL','0','1');
INSERT INTO Usuario  VALUES ('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG4','IUSACELL','50','1');
INSERT INTO Usuario  VALUES ('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG4','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','KINKI','TELCEL','500','1');
INSERT INTO Usuario  VALUES ('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','DREAMS','UNEFON','100','0');
INSERT INTO Usuario  VALUES ('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOT','IUSACELL','150','1');
INSERT INTO Usuario  VALUES ('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACK','AT&T','50','0');
INSERT INTO Usuario  VALUES ('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOT','NEXTEL','150','1');
INSERT INTO Usuario  VALUES ('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACK','IUSACELL','0','1');
INSERT INTO Usuario  VALUES ('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','KINKI','AXEL','0','0');
INSERT INTO Usuario  VALUES ('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOT','MOVISTAR','500','1');
INSERT INTO Usuario  VALUES ('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','DREAMS','IUSACELL','200','1');
INSERT INTO Usuario  VALUES ('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACK','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','DREAMS','UNEFON','150','1');
INSERT INTO Usuario  VALUES ('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOT','AT&T','500','1');

-- Sentencia sql para cada una de las consultas especificadas.
--- 1. Contar el número de usuarios por marca de teléfono.

SELECT DISTINCT count(marca) FROM Usuario;

--- 2. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG4.

--- 3. Listar las diferentes compañias en orden alfabético ascendentemente.

--- 4. Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL.

--- 5. Mostrar el email de los usuarios que usan hotmail.

--- 6. Listar los nombres de los usuarios sin saldo o inactivos.

--- 7. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL.

--- 8. Listar las diferentes marcas de celular en orden alfabético ascendentemente.

--- 9. Listar las diferentes marcas de celular en orden alfabético aleatorio.

--- 10. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o NEXTEL.

--- 11. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca KINKI o MOT.

--- 12. Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL.


```

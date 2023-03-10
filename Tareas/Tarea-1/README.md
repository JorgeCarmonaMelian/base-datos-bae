# Creación y manipulación de BBDD

## Realiza la creación de la BBDD, creando las sentencias sql necesarias.

<br>

- tabla fabricante:
    - id_fab:entero;
    - nombre:texto;
    - pais:texto;
        - clave primaria(id_fab);

```sql
CREATE TABLE fabricante(
	id_fab INT PRIMARY KEY,
	nombre TEXT,
	pais TEXT
);
```

- tabla programa:
    - codigo:entero,
    - nombre:texto;
    - version:texto;
        - clave primaria(codigo);

```sql
CREATE TABLE programa(
	codigo INT PRIMARY KEY,
	nombre TEXT,
	version TEXT
);
```

- tabla comercio:
    - cif:entero,
    - nombre:texto,
    - ciudad:texto);
        - clave primaria(cif);

```sql
CREATE TABLE comercio(
	cif INT PRIMARY KEY,
	nombre TEXT,
	ciudad TEXT
);
```

- tabla cliente:
    - dni:entero,
    - nombre:texto,
    - edad:entero;
        - clave primaria(dni);

```sql
CREATE TABLE cliente(
	dni INT PRIMARY KEY,
	nombre TEXT,
	edad INT
);
```

- tabla desarrolla:
    - id_fab entero:
    - codigo entero:
        - clave primaria(id_fab,codigo);

```sql
CREATE TABLE desarrolla(
	id_fab INT,
	codigo INT,
	PRIMARY KEY(id_fab,codigo)
);
```

- tabla distribuye:
    - cif entero:
    - codigo entero:
    - cantidad entero,
        - clave primaria(cif,codigo);

```sql
CREATE TABLE distribuye(
	cif INT,
	codigo INT,
	cantidad INT,
	PRIMARY KEY(cif,codigo)
);
```

- tabla registra:
    - cif entero:
    - dni entero:
    - codigo entero:
    - medio texto:
        - clave primaria(cif,dni);

```sql
CREATE TABLE registra(
	cif INT,
	dni INT,
	codigo INT,
	medio TEXT,
	PRIMARY KEY(cif,dni)
);
```

##  Realiza la inserción de los valores.

<br>

<center><img src="images/insercion.png" width=80%></center>

<br>

## Realiza las siguientes consultas:

<b> 1. Averigua el DNI de todos los clientes. </b>

```sql
SELECT dni FROM cliente;
```

<b> 2. Consulta todos los datos de todos los programas. </b>

```sql
SELECT * FROM programa
```

<b> 3. Obtén un listado con los nombres de todos los programas. </b>

```sql
SELECT nombre FROM programa;
```

<b> 4. Genera una lista con todos los comercios. </b>

```sql
SELECT DISTINCT nombre FROM comercio;
```

<b> 5. Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza DISTINCT). </b>

```sql
SELECT DISTINCT ciudad FROM comercio;
```

<b> 6. Obtén una lista con los nombres de programas, sin que aparezcan valores duplicados (utiliza DISTINCT). </b>

```sql
SELECT DISTINCT nombre FROM programa;
```

<b> 7. Obtén el DNI más 4 de todos los clientes. </b>

```sql
SELECT dni+4 FROM cliente;
```

<b> 8. Haz un listado con los códigos de los programas multiplicados por 7.</b>

```sql
SELECT codigo*7 FROM programa;
```

<b> 9. ¿Cuáles son los programas cuyo código es inferior o igual a 10? </b>

```sql
SELECT codigo*7.6 as multiplicado FROM programa WHERE multiplicado <= 10
```

<b> 10. ¿Cuál es el programa cuyo código es 11? </b>

```sql
SELECT nombre FROM programa WHERE codigo == 11
```

<b> 11. ¿Qué fabricantes son de Estados Unidos? </b>

```sql
SELECT nombre FROM fabricante WHERE pais == "Estados Unidos"
```

<b> 12. ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.</b>

```sql
SELECT nombre FROM fabricante WHERE pais == "Estados Unidos"
```

<b> 13. Obtén un listado con los códigos de las distintas versiones de Windows.</b>

```sql
SELECT codigo FROM programa WHERE nombre == "Windows"
```

<b> 14. ¿En qué ciudades comercializa programas El Corte Inglés?.</b>

```sql
SELECT ciudad FROM comercio WHERE nombre == "El Corte Inglés"
```

<b> 15. ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN.</b>

```sql
SELECT nombre FROM comercio WHERE nombre NOT IN ("El Corte Inglés")
```

<b> 16. Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador IN.</b>

```sql
SELECT codigo FROM programa WHERE nombre IN ("Windows","Access")
```

<b> 17. Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN y otra sin BETWEEN.</b>

Sin BETWEEN:

```sql
SELECT nombre FROM cliente WHERE edad >= 10 AND edad <= 15 OR edad > 50
```

Con BETWEEN:

```sql
SELECT nombre FROM cliente WHERE edad BETWEEN 10 AND 15 OR edad > 50
```

<b> 18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.</b>

```sql
SELECT DISTINCT nombre FROM comercio WHERE ciudad IN ("Sevilla","Madrid")
```

<b> 19. ¿Qué clientes terminan su nombre en la letra “o”?</b>

```sql
SELECT nombre FROM cliente WHERE nombre like "%o %"
```

<b> 20. ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?</b>

```sql
SELECT nombre FROM cliente WHERE nombre like "%o %" AND edad > 30
```

<b> 21. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W.</b>

```sql
SELECT nombre FROM programa WHERE version like "%i" OR nombre LIKE "A%" OR nombre LIKE "W%"
```

<b> 22. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.</b>

```sql
SELECT nombre FROM programa WHERE version like "%i" OR nombre LIKE "A%S"
```

<b> 23. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A.</b>

```sql
SELECT nombre FROM programa WHERE version like "%i" AND nombre NOT LIKE "A%"
```

<b> 24. Obtén una lista de empresas por orden alfabético ascendente.</b>

```sql
SELECT nombre FROM fabricante ORDER BY nombre
```

<b> 25. Genera un listado de empresas por orden alfabético descendente.</b>

```sql
SELECT nombre FROM fabricante ORDER BY nombre DESC
```

<b> 26. Obtén un listado de programas por orden de versión. </b>

```sql
SELECT nombre FROM programa ORDER BY version
```

<b> 27. Genera un listado de los programas que desarrolla Oracle. </b>

```sql
SELECT DISTINCT p.nombre FROM programa as p, fabricante as f, desarrolla as d 
WHERE p.codigo = d.codigo AND f.id_fab = d.id_fab AND f.nombre = "Oracle"
```

<b> 28. ¿Qué comercios distribuyen Windows? </b>

```sql
SELECT c.nombre FROM comercio as c, distribuye as d, programa as p 
WHERE c.cif = d.cif AND d.codigo = p.codigo AND p.nombre = "Windows"
```

<b> 29. Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid. </b>

```sql
SELECT programa.nombre, distribuye.cantidad FROM programa, distribuye, comercio 
WHERE programa.codigo = distribuye.codigo AND distribuye.cif = comercio.cif AND comercio.nombre = "El Corte Inglés"
```

<b> 30. ¿Qué fabricante ha desarrollado Freddy Hardest? </b>

```sql
SELECT fabricante.nombre FROM fabricante, desarrolla, programa 
WHERE fabricante.id_fab = desarrolla.id_fab AND desarrolla.codigo = programa.codigo AND programa.nombre = "Freddy Hardest"
```

<b> 31. Selecciona el nombre de los programas que se registran por Internet. </b>

```sql
SELECT programa.nombre FROM programa, registra 
WHERE programa.codigo = registra.codigo AND registra.medio = "Internet"
```

<b> 32. ¿Qué medios ha utilizado para registrarse Pepe Pérez? </b>

```sql
SELECT registra.medio FROM cliente, registra 
WHERE registra.dni = cliente.dni AND cliente.nombre = "Pepe Pérez"
```

<b> 33. ¿Qué usuarios han optado por Internet como medio de registro?</b>

```sql
SELECT cliente.nombre FROM cliente, registra 
WHERE registra.dni = cliente.dni AND registra.medio == "Internet"
```

<b> 34. ¿Qué programas han recibido registros por tarjeta postal?</b>

```sql
SELECT programa.nombre FROM programa, registra 
WHERE registra.codigo = programa.codigo AND registra.medio == "Tarjeta postal"
```

<b> 35. ¿En qué localidades se han vendido productos que se han registrado por Internet? </b>

```sql
SELECT comercio.ciudad FROM comercio, registra 
WHERE registra.cif = comercio.cif AND registra.medio == "Internet"
```

<b> 36. Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro. </b>

```sql
SELECT cliente.nombre, programa.nombre
FROM cliente, programa, registra
WHERE cliente.dni = registra.dni
AND programa.codigo = registra.codigo
AND registra.medio = "Internet"
```

<b> 37. Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido. </b>

```sql
SELECT cliente.nombre, programa.nombre, registra.medio, comercio.nombre
FROM cliente, programa, registra, comercio
WHERE cliente.dni = registra.dni AND programa.codigo = registra.codigo AND comercio.cif = registra.cif
```

<b> 38. Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle. </b>

```sql
SELECT comercio.ciudad FROM comercio, programa, distribuye, fabricante, desarrolla
WHERE comercio.cif = distribuye.cif AND programa.codigo = distribuye.codigo
AND fabricante.id_fab = desarrolla.id_fab AND desarrolla.codigo = programa.codigo
AND fabricante.nombre = "Oracle"
```

<b> 39. Obtén el nombre de los usuarios que han registrado Access XP. </b>

```sql
SELECT cliente.nombre
FROM cliente, programa, registra
WHERE cliente.dni = registra.dni
AND programa.codigo = registra.codigo
AND programa.nombre = "Access" AND programa.version = "Access" AND programa.version = "XP"
```

<b> 40. Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ. (Subconsulta). </b>

```sql
SELECT nombre FROM fabricante 
WHERE fabricante.pais =(SELECT pais FROM fabricante WHERE nombre = "Oracle")
```

<b> 41. Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta). </b>

```sql
SELECT nombre FROM cliente WHERE edad = (SELECT edad FROM cliente WHERE nombre = "Pepe Pérez")
```

<b> 42. Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta). </b>

```sql
SELECT nombre FROM comercio WHERE ciudad = (SELECT ciudad FROM comercio WHERE nombre = "FNAC")
```

<b> 43. Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).</b>

```sql
SELECT cliente.nombre, registra.medio FROM cliente, registra 
WHERE cliente.dni = registra.dni 
AND medio IN (SELECT registra.medio FROM cliente, registra WHERE cliente.dni = registra.dni AND nombre = "Pepe Pérez")
```
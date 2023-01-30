-- sentencia sql de creación de la/s tabla/s de la bbdd

CREATE TABLE Fabricante(
	clave TEXT PRIMARY KEY,
	nombre TEXT
);

CREATE TABLE Articulo(
	clave INT PRIMARY KEY,
	nombre TEXT,
	precio INT,
    clave_fabricante TEXT REFERENCES Fabricante (clave)
);

-- sentencia sql para la inserción de datos

INSERT INTO fabricante VALUES (1 ,
"Kingston");
INSERT INTO fabricante VALUES (2 ,
"Adata");
INSERT INTO fabricante VALUES (3 ,
"Logitech");
INSERT INTO fabricante VALUES (4 ,
"Lexar");
INSERT INTO fabricante VALUES (5 ,
"Seagate");

INSERT INTO Articulo VALUES ("1", "Teclado", "100", "3");
INSERT INTO Articulo VALUES ("2", "Disco duro 300 Gb", "500", "5");
INSERT INTO Articulo VALUES ("3", "Mouse", "80", "3");
INSERT INTO Articulo VALUES ("4", "Memoria USB", "140", "4");
INSERT INTO Articulo VALUES ("5", "Memoria RAM 290", "1", NULL);
INSERT INTO Articulo VALUES ("6", "Disco duro extraible 250 Gb", "650", "5");
INSERT INTO Articulo VALUES ("7", "Memoria USB", "279", "1");
INSERT INTO Articulo VALUES ("8", "DVD Rom", "450", "2");
INSERT INTO Articulo VALUES ("9", "CD Rom", "200", "2");
INSERT INTO Articulo VALUES ("10", "Tarjeta de red", "180", "3");

-- Sentencia sql para cada una de las consultas especificadas.

--- 1.Obtener todos los datos de los productos de la tienda.

SELECT * FROM Articulo;

--- 2.Obtener los nombres de los productos de la tienda.

SELECT nombre FROM Articulo;

--- 3.Obtener los nombres y precio de los productos de la tienda. Obtener los nombres de los artículos sin repeticiones.

SELECT nombre, precio FROM Articulo GROUP BY nombre ORDER BY clave;

--- 4.Obtener todos los datos del artículo cuya clave de producto es 5.

SELECT * FROM Articulo WHERE clave = "5";

--- 5.Obtener todos los datos del artículo cuyo nombre del producto es Teclado.

SELECT * FROM Articulo WHERE nombre = "Teclado";

--- 6.Obtener todos los datos de la Memoria RAM y memorias USB.

SELECT * FROM Articulo WHERE nombre LIKE "%RAM%" OR nombre LIKE "%USB%";

--- 7.Obtener todos los datos de los artículos que empiezan con M.

SELECT * FROM Articulo WHERE nombre LIKE "M%";

--- 8.Obtener el nombre de los productos donde el precio sea 100.

SELECT * FROM Articulo WHERE precio = "100";

--- 9.Obtener el nombre de los productos donde el precio sea mayor a 200.

SELECT * FROM Articulo WHERE precio > "200";

--- 10.Obtener todos los datos de los artículos cuyo precio este entre 100 y 350.

SELECT * FROM Articulo WHERE precio > "100" AND precio < "350";

--- 11.Obtener el precio medio de todos los productos.

SELECT AVG(precio) FROM Articulo;

--- 12.Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

SELECT AVG(precio) FROM Articulo WHERE clave_fabricante = "2";

--- 13.Obtener el nombre y precio de los artículos ordenados por Nombre.

SELECT nombre, precio FROM Articulo ORDER BY nombre;

--- 14.Obtener todos los datos de los productos ordenados descendentemente por Precio.

SELECT * FROM Articulo ORDER BY precio DESC;

--- 15.Obtener el nombre y precio de los artículos cuyo precio sea mayor a 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre.

SELECT nombre, precio FROM Articulo WHERE precio > "250" ORDER BY precio DESC;
SELECT nombre, precio FROM Articulo WHERE precio > "250" ORDER BY nombre ASC;

--- 16.Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante.

SELECT * FROM Articulo, Fabricante WHERE Articulo.clave_fabricante = Fabricante.clave;

--- 17.Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta.

SELECT Articulo.clave, Articulo.nombre, Fabricante.nombre FROM Articulo, Fabricante WHERE Articulo.clave_fabricante = Fabricante.clave;

--- 18.Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre del producto.

SELECT Articulo.nombre, Articulo.precio, Fabricante.nombre FROM Articulo, Fabricante WHERE Articulo.clave_fabricante = Fabricante.clave AND Fabricante.nombre = "Logitech" ORDER BY Articulo.nombre;

--- 19.Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendentemente por precio.

SELECT Articulo.nombre, Articulo.precio, Fabricante.nombre FROM Articulo, Fabricante WHERE Articulo.clave_fabricante = Fabricante.clave AND Fabricante.nombre IN ("Lexar","Kingston") ORDER BY Articulo.precio DESC;

--- 20.Añade un nuevo producto: Clave del producto 11, Altavoces de 120 del fabricante 2.

INSERT INTO Articulo VALUES ("11","Altavoces", "120", "2");

--- 21.Cambia el nombre del producto 6 a Impresora Laser.

UPDATE Articulo SET nombre = "Impresora Laser" WHERE clave = "6";

--- 22.Aplicar un descuento del 10% a todos los productos.

UPDATE Articulo SET precio = precio - precio*10 / 100;

--- 23.Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 300.

UPDATE Articulo SET precio = precio - 10 WHERE precio >= 300;

--- 24.Borra el producto número 6.

DELETE FROM Articulo WHERE clave = "6";
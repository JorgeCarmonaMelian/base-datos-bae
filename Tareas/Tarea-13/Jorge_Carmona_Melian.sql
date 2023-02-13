CREATE TABLE fabricante(
    codigo INTEGER PRIMARY KEY,
    nombre TEXT
);

CREATE TABLE producto(
    codigo INTEGER PRIMARY KEY,
    nombre TEXT,
    precio REAL,
    codigo_fabricante INTEGER REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

---

SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo;

---

SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;

---

SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo;

---

SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante;

---

SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND producto.precio = (SELECT min(precio) from producto);

---

SELECT producto.nombre, producto.precio, fabricante.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND producto.precio = (SELECT max(precio) from producto);

---

SELECT producto.nombre from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo";

---

SELECT producto.*  from producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Crucial" AND producto.precio > 200;

---

SELECT producto.* from fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante REGEXP 'Asus|Hewlett-Packard|Seagate';

---

SELECT producto.* from fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre REGEXP 'Asus|Hewlett-Packard|Seagate';

---

SELECT producto.* from fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre in ("Asus","Hewlett-Packard","Seagate");

---

SELECT producto.nombre,producto.precio from fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre REGEXP 'e$';

---

SELECT producto.nombre,producto.precio from fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre REGEXP "w";
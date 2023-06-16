USE mangablog;

-- Estructura básica de un Query

SELECT *
FROM capitulos
WHERE fecha_publicacion < "2024";

SELECT *
FROM capitulos
WHERE fecha_publicacion > "2024";

-- SELECT, COUNT, AS
SELECT *
FROM mangakas;

SELECT nombre_artistico, biografia
FROM mangakas;

SELECT nombre_artistico AS autor, biografia
FROM mangakas;

SELECT COUNT(*) AS cantidad_artistas
FROM mangakas;

-- JOINs

SELECT *
FROM usuarios
	LEFT JOIN mangakas ON usuarios.id=mangakas.usuario_id;
    
SELECT *
FROM mangakas
	RIGHT JOIN mangas ON mangakas.id=mangas.mangaka_id;

SELECT *
FROM capitulos
	LEFT JOIN comentarios ON capitulos.id=comentarios.capitulo_id;
    
SELECT *
FROM capitulos
	LEFT JOIN comentarios ON capitulos.id=comentarios.capitulo_id
WHERE comentarios.capitulo_id IS NULL;

SELECT *
FROM capitulos
	RIGHT JOIN comentarios ON capitulos.id=comentarios.capitulo_id
WHERE comentarios.capitulo_id IS NULL;

SELECT *
FROM capitulos
	INNER JOIN comentarios ON capitulos.id=comentarios.capitulo_id;
    
SELECT *
FROM capitulos
	LEFT JOIN comentarios ON capitulos.id=comentarios.capitulo_id
UNION
SELECT *
FROM capitulos
	RIGHT JOIN comentarios ON capitulos.id=comentarios.capitulo_id;

SELECT *
FROM capitulos
	LEFT JOIN comentarios ON capitulos.id=comentarios.capitulo_id
WHERE comentarios.capitulo_id IS NULL
UNION
SELECT *
FROM capitulos
	RIGHT JOIN comentarios ON capitulos.id=comentarios.capitulo_id
WHERE comentarios.capitulo_id IS NULL;

-- WHERE LIKE BETWEEN YEAR

SELECT *
FROM mangas
WHERE id > 3;

SELECT *
FROM mangakas
WHERE id > 3;

SELECT *
FROM mangakas
WHERE estado ="activo";

SELECT *
FROM mangakas
WHERE estado ="inactivo";

SELECT *
FROM mangakas
WHERE estado !="activo";

SELECT *
FROM mangakas
WHERE id != 3;

SELECT *
FROM mangas
WHERE nombre_manga LIKE "%1%";

SELECT *
FROM mangakas
WHERE biografia LIKE "%YU%";

SELECT *
FROM capitulos
WHERE fecha_publicacion > "2023-01-010";

SELECT *
FROM capitulos
WHERE fecha_publicacion < "2023-01-010";

SELECT *
FROM capitulos
WHERE fecha_publicacion BETWEEN "2023-01-010" AND "2023-01-023";

SELECT *
FROM capitulos
WHERE id BETWEEN 2 AND 4;

SELECT *
FROM capitulos
WHERE YEAR(fecha_publicacion) BETWEEN "2021" AND "2024";

SELECT *
FROM capitulos
WHERE MONTH(fecha_publicacion) = "06";

-- WHERE nulo y no nulo

SELECT *
FROM capitulos
WHERE manga_id IS NULL;

SELECT *
FROM mangakas
WHERE usuario_id IS NOT NULL
AND estado != "activo";

SELECT *
FROM mangakas
WHERE usuario_id IS NOT NULL
AND estado != "activo"
AND id < 14;

-- GROUP BY
SELECT estado, COUNT(*) as mangaka_quantity
FROM mangakas
GROUP BY estado;

SELECT estado, SUM(id) as suma_id
FROM mangakas
GROUP BY estado;

SELECT MONTHNAME(fecha_publicacion) AS capitulo_month,DAYNAME(fecha_publicacion) AS capitulo_dia, numero, COUNT(*) AS capitulo_quantity
FROM capitulos
GROUP BY numero, capitulo_month, capitulo_dia;

-- ORDER BY HAVING LIMIT

SELECT *
FROM capitulos
ORDER BY fecha_publicacion ASC;

SELECT *
FROM capitulos
ORDER BY fecha_publicacion DESC;

SELECT *
FROM mangakas
ORDER BY nombre_artistico  DESC;

SELECT *
FROM capitulos
ORDER BY numero  DESC
LIMIT 5;

SELECT MONTHNAME(fecha_publicacion) AS capitulo_month, numero, COUNT(*) AS capitulo_quantity
FROM capitulos
GROUP BY numero, capitulo_month
ORDER BY capitulo_month;

SELECT MONTHNAME(fecha_publicacion) AS capitulo_month, numero, COUNT(*) AS capitulo_quantity
FROM capitulos
GROUP BY numero, capitulo_month
HAVING capitulo_quantity >1
ORDER BY capitulo_month
;

-- Nested queries
SELECT new_table_projection.date, COUNT(*) AS capitulo_count
FROM(
	SELECT DATE(MIN(fecha_publicacion)) AS date, MONTH(fecha_publicacion) AS capitulo_month
    FROM capitulos
    GROUP BY capitulo_month) AS  new_table_projection
    GROUP BY new_table_projection.date
    ORDER BY new_table_projection.date;
    
SELECT *
FROM capitulos
WHERE fecha_publicacion =(
	SELECT MAX(fecha_publicacion)
    FROM capitulos);
    
-- Preguntándole a la base de datos
SELECT capitulos.fecha_publicacion, COUNT(*) num_etiquetas, nombre_manga
FROM capitulos
	INNER JOIN mangas ON mangas.id = capitulos.manga_id
	INNER JOIN capitulo_etiquetas ON capitulos.id = capitulo_etiquetas.capitulos_id
    INNER JOIN etiquetas ON etiquetas.id = capitulo_etiquetas.etiquetas_id
    GROUP BY capitulos.id
    ORDER BY num_etiquetas;
    
SELECT capitulos.fecha_publicacion, COUNT(*) num_etiquetas, GROUP_CONCAT(name_etiquetas)
FROM capitulos
	INNER JOIN capitulo_etiquetas ON capitulos.id = capitulo_etiquetas.capitulos_id
    INNER JOIN etiquetas ON etiquetas.id = capitulo_etiquetas.etiquetas_id
    GROUP BY capitulos.id;
    
SELECT *
FROM etiquetas
	LEFT JOIN capitulo_etiquetas ON etiquetas.id = capitulo_etiquetas.etiquetas_id
WHERE capitulo_etiquetas.etiquetas_id IS NULL;

SELECT e.name_etiquetas, COUNT(*) AS cant_capitulos
FROM etiquetas AS e
	INNER JOIN capitulos AS c ON e.id = c.etiquetas_id
GROUP BY e.id
ORDER BY cant_capitulos DESC;

SELECT c.categoria, COUNT(*) AS cant_mangas
FROM categorias AS c
	INNER JOIN mangas AS m ON c.id = m.categoria_id
GROUP BY c.id
ORDER BY cant_mangas DESC
LIMIT 1;

SELECT mk.nombre_artistico, COUNT(*) AS cant_mangas
FROM mangakas  AS mk
	INNER JOIN mangas AS m ON mk.id = m.mangaka_id
GROUP BY mk.id
ORDER BY cant_mangas DESC;

SELECT mk.nombre_artistico, COUNT(*) AS cant_mangas, GROUP_CONCAT(categoria)
FROM mangakas  AS mk
	INNER JOIN mangas AS m ON mk.id = m.mangaka_id
    INNER JOIN categorias AS c ON c.id = m.categoria_id
GROUP BY mk.id
ORDER BY cant_mangas DESC;

SELECT *
FROM mangakas AS mk
	LEFT JOIN mangas AS m ON mk.id= m.mangaka_id
WHERE m.mangaka_id IS NULL;
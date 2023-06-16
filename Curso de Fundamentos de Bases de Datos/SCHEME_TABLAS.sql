CREATE SCHEMA mangablog DEFAULT CHARACTER SET utf8;

USE mangablog;

CREATE TABLE categorias
(
id INT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (id)
);

CREATE TABLE etiquetas
(
id INT NOT NULL AUTO_INCREMENT,
name_etiquetas VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (id)
);


CREATE TABLE usuarios 
(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
fecha_registro DATE NOT NULL,
login VARCHAR(30) NOT NULL,
contrasena VARCHAR(32) not null,
nickname VARCHAR(40) not null,
email VARCHAR(40) not null,
CONSTRAINT PRIMARY KEY (id),
UNIQUE KEY email_unique (email)
);

CREATE TABLE mangakas
(
id INT NOT NULL AUTO_INCREMENT,
nombre_artistico VARCHAR(50) NOT NULL,
biografia TEXT,
estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'inactivo',
usuario_id INT NOT NULL,
UNIQUE KEY name_unique (nombre_artistico),
CONSTRAINT PRIMARY KEY (id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE mangas (
id INT NOT NULL AUTO_INCREMENT,
nombre_manga VARCHAR(100) not null,
imagen_manga BLOB not null,
descripcion_manga TEXT,
fecha_creacion DATE NOT NULL,
mangaka_id INT NOT NULL,
categoria_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (id),
FOREIGN KEY (mangaka_id) REFERENCES mangakas(id),
FOREIGN KEY (categoria_id) REFERENCES mangas(id)
);

CREATE TABLE capitulos (
id INT NOT NULL AUTO_INCREMENT,
numero INT NOT NULL,
fecha_publicacion DATE NOT NULL,
manga_id INT NOT NULL,
etiqueta_id INT,
CONSTRAINT PRIMARY KEY (id),
FOREIGN KEY (manga_id) REFERENCES mangas(id),
CONSTRAINT fk_capitulos_etiqueta
FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id)
);

CREATE TABLE imagenes_capitulo
(
id INT NOT NULL AUTO_INCREMENT,
numero_orden INT NOT NULL,
capitulo_id INT NOT NULL,
imagen BLOB,
CONSTRAINT PRIMARY KEY (id),
CONSTRAINT fk_imagenes_capitulo_capitulo
	FOREIGN KEY (capitulo_id) REFERENCES capitulos(id)
);

CREATE TABLE comentarios 
(
comentarios_id INT NOT NULL AUTO_INCREMENT,
comentario TEXT NOT NULL, 
usuarios_id INT NOT NULL,
capitulo_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (comentarios_id),
CONSTRAINT fk_comentarios_usuarios
	FOREIGN KEY (usuarios_id) REFERENCES usuarios(`id`),
CONSTRAINT fk_comentarios_capitulo
	FOREIGN KEY (capitulo_id) REFERENCES capitulos(`id`),
INDEX idx_capitulo_id (capitulo_id)
);

CREATE TABLE `capitulo_etiquetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capitulos_id` int(11) NOT NULL,
  `etiquetas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capituloetiquetas_capitulos_idx` (`capitulos_id`),
  KEY `capitulosetiquetas_etiquetas_idx` (`etiquetas_id`),
  CONSTRAINT `capituloetiquetas_capitulos` FOREIGN KEY (`capitulos_id`) REFERENCES `capitulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `capitulosetiquetas_etiquetas` FOREIGN KEY (`etiquetas_id`) REFERENCES `etiquetas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
CREATE TABLE `manga_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manga_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_manga_categoria_mangas` (`manga_id`),
  KEY `fk_manga_categoria_categoria` (`categoria_id`),
  CONSTRAINT `fk_manga_categoria_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manga_categoria_mangas` FOREIGN KEY (`manga_id`) REFERENCES `mangas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


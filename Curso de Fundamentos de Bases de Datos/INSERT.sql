USE mangablog;
INSERT INTO categorias (id, categoria)
VALUES
(1,'Acción'),
(2,'Aventura'),
(3,'Comedia'),
(4,'Drama'),
(5,'Fantasía'),
(6,'Romántico'),
(7,'Misterio'),
(8,'Fantástico'),
(9,'Comedia'),
(10,'Aventura');

INSERT INTO etiquetas (id, name_etiquetas)
VALUES
(1,'Romance'),
(2,'Suspenso'),
(3,'Misterio'),
(4,'Histórico'),
(5,'Ciencia Ficción'),
(6,'Acción'),
(7,'Suspenso'),
(8,'Histórico'),
(9,'Ciencia Ficción'),
(10,'Sobrenatural');

INSERT INTO usuarios (id,nombre, apellido, fecha_registro, login, contrasena, nickname, email)
VALUES
(1,'John','Doe','2023-06-01','johndoe','password123','JD','johndoe@example.com'),
(2,'Alice','Smith','2023-06-02','alicesmith','securepass','AS','alice.smith@example.com'),
(3,'Robert','Johnson','2023-06-03','robertjohnson','pass1234','RJ','robert.johnson@example.com'),
(4,'Emily','Davis','2023-06-04','emilydavis','12345678','ED','emily.davis@example.com'),
(5,'Michael','Wilson','2023-06-05','michaelwilson','mypass123','MW','michael.wilson@example.com'),
(6,'Laura','García','2023-06-06','laurag','pass123','LG','laura.garcia@example.com'),
(7,'Carlos','Martínez','2023-06-07','carlosm','securepass','CM','carlos.martinez@example.com'),
(8,'Ana','López','2023-06-08','analopez','12345678','AL','ana.lopez@example.com'),
(9,'Daniel','Rodríguez','2023-06-09','danielr','mypass123','DR','daniel.rodriguez@example.com'),
(10,'María','Hernández','2023-06-10','mariah','password123','MH','maria.hernandez@example.com');

INSERT INTO mangakas (id,nombre_artistico, biografia, estado, usuario_id)
VALUES
(1,'Sakura','Biografía de Sakura','activo',1),
(2,'Hiroshi','Biografía de Hiroshi','activo',2),
(3,'Yumi','Biografía de Yumi','activo',3),
(4,'Takashi','Biografía de Takashi','activo',4),
(5,'Aya','Biografía de Aya','activo',5),
(11,'Satoshi','Biografía de Satoshi','activo',6),
(12,'Yoko','Biografía de Yoko','activo',7),
(13,'Kenji','Biografía de Kenji','inactivo',8),
(14,'Aiko','Biografía de Aiko','inactivo',9),
(15,'Takahiro','Biografía de Takahiro','activo',10);

INSERT INTO mangas (id,nombre_manga, imagen_manga, descripcion_manga, fecha_creacion, mangaka_id,`categoria_id`)
VALUES
(1,'Manga 1',?,'Descripción del manga 1','2023-01-01',1,1),
(2,'Manga 2',?,'Descripción del manga 2','2023-02-01',2,2),
(3,'Manga 3',?,'Descripción del manga 3','2023-03-01',3,3),
(4,'Manga 4',?,'Descripción del manga 4','2023-04-01',4,4),
(5,'Manga 5',?,'Descripción del manga 5','2023-05-01',5,6),
(16,'Manga 16',?,'Descripción del manga 16','2023-06-11',11,5),
(17,'Manga 17',?,'Descripción del manga 17','2023-06-12',5,1),
(18,'Manga 18',?,'Descripción del manga 18','2023-06-13',13,3),
(19,'Manga 19',?,'Descripción del manga 19','2023-06-14',4,1),
(20,'Manga 20',?,'Descripción del manga 20','2023-06-15',15,2),
(21,'Manga 16',?,'Descripción del manga 16','2023-06-11',11,3),
(22,'Manga 17',?,'Descripción del manga 17','2023-06-12',5,4),
(23,'Manga 18',?,'Descripción del manga 18','2023-06-13',13,5),
(24,'Manga 19',?,'Descripción del manga 19','2023-06-14',4,6),
(25,'Manga 20',?,'Descripción del manga 20','2023-06-15',15,7);


INSERT INTO capitulos (`id`,`numero`,`fecha_publicacion`,`manga_id`,`etiquetas_id`)
VALUES
(1,1,'2023-01-01',1,1),
(2,2,'2023-01-08',1,2),
(3,1,'2023-01-15',2,3),
(4,2,'2023-01-22',2,1),
(5,1,'2023-01-29',3,4),
(6,3,'2023-06-16',16,1),
(7,4,'2023-06-17',16,2),
(8,5,'2023-06-18',17,3),
(9,6,'2023-06-19',17,1),
(10,7,'2023-06-20',18,4);

INSERT INTO imagenes_capitulo (numero_orden, capitulo_id, imagen)
VALUES
(3, 3, 'imagen3-3.jpg'),
(4, 3, 'imagen3-4.jpg'),
(3, 4, 'imagen4-3.jpg'),
(4, 4, 'imagen4-4.jpg'),
(3, 5, 'imagen5-3.jpg'),
(1, 1, 'imagen3-3.jpg'),
(2, 1, 'imagen3-4.jpg'),
(1, 2, 'imagen4-3.jpg'),
(2, 2, 'imagen4-4.jpg'),
(1, 3, 'imagen5-3.jpg');

INSERT INTO comentarios (`comentarios_id`,`comentario`,`usuarios_id`,`capitulo_id`)
VALUES
(1,'¡Me encantó este capítulo!',1,1),
(2,'No puedo esperar por el próximo capítulo',2,1),
(3,'Excelente trabajo del autor',3,2),
(4,'La trama se pone cada vez más interesante',4,2),
(5,'Increíbles ilustraciones en este capítulo',5,3),
(11,'¡Este capítulo fue emocionante!',5,3),
(12,'No puedo esperar por el siguiente capítulo',9,3),
(13,'El autor ha creado una trama intrigante',3,4),
(14,'Las ilustraciones son realmente impresionantes',8,4),
(15,'¡Me encanta este manga!',10,5);


INSERT INTO capitulo_etiquetas (`id`,`capitulos_id`,`etiquetas_id`)
VALUES
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,4),
(5,3,5),
(11,8,1),
(12,9,2),
(13,10,8),
(14,5,4),
(15,6,10);

INSERT INTO manga_categorias (`id`,`manga_id`,`categoria_id`)
VALUES
(1,1,1),
(2,1,3),
(3,2,2),
(4,3,4),
(5,3,5),
(6,16,1),
(7,17,2),
(8,18,3),
(9,19,4),
(10,20,5);
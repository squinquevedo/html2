CREATE DATABASE IF NOT EXISTS tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario      int(11) auto_increment  NOT NULL,
    nombre          varchar(100)            NOT NULL,
    apellidos       varchar(100)            NOT NULL,
    email           varchar(200)            NOT NULL,
    password        varchar(255)            NOT NULL,
    rol             varchar(20),
    imagen          varchar(255),
    CONSTRAINT      pk_usuario      PRIMARY KEY(id_usuario),
    CONSTRAINT      uq_email        UNIQUE(email)
)ENGINE=InnoDb;

INSERT INTO t_usuarios VALUES(NULL, 'admin', 'admin','admin@admin.com','1234','admin','imagen');

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria        int(11) auto_increment  NOT NULL,
    nombre_categoria    varchar(100)            NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY(id_categoria)
)ENGINE=InnoDb;

INSERT INTO t_categorias VALUE(NULL, 'Granos'),(null,'Arroz'),(null,'Arroz blanco');

CREATE TABLE IF NOT EXISTS t_productos(
    id_producto         int(11) auto_increment  NOT NULL,
    nombre_producto     varchar(100)            NOT NULL,
    precio              float(100,2)            NOT NULL,
    stock               int(100)                NOT NULL,
    oferta              varchar(50)             NOT NULL,
    fecha               date                    NOT NULL,
    imagen              varchar(255),
    id_categoria        int(11)                 NOT NULL,
    CONSTRAINT          pk_producto             PRIMARY KEY(id_producto),
    CONSTRAINT          fk_producto_categoria   FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria)
)ENGINE=InnoDb;
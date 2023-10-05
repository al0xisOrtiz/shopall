CREATE DATABASE IF NOT EXISTS shopall;
USE shopall;

CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT,
    correo_usuario VARCHAR(255) NOT NULL,
    password_usuario CHAR(60) NOT NULL,
    PRIMARY KEY (id_usuario),
    UNIQUE(correo_usuario) 
);

CREATE TABLE IF NOT EXISTS detalles_usuario (
	id_detalles INT NOT NULL AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    fecha_nacimiento_usuario DATE NOT NULL,
    calle_usuario VARCHAR(255) NOT NULL,
    colonia_usuario VARCHAR(255) NOT NULL,
    ciudad_usuario VARCHAR(255) NOT NULL,
    estado_usuario VARCHAR(255) NOT NULL,
    cp_usuario VARCHAR(255) NOT NULL,
    telefono_usuario VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_detalles),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS vendedor (
	id_vendedor INT NOT NULL AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    nombre_tienda VARCHAR(255) NOT NULL,
    descripcion_tienda VARCHAR(255),
    contacto_tienda VARCHAR(100),
    PRIMARY KEY (id_vendedor),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS categoria (
	categoria_id INT NOT NULL AUTO_INCREMENT,
    nombre_categoria VARCHAR(255) NOT NULL,
    PRIMARY KEY (categoria_id)
);

CREATE TABLE IF NOT EXISTS producto (
	id_producto INT NOT NULL AUTO_INCREMENT,
    fk_categoria INT NOT NULL,
    fk_vendedor INT NOT NULL,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion_producto VARCHAR(255) NOT NULL,
    precio_producto FLOAT(12) NOT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (fk_categoria) REFERENCES categoria(categoria_id),
    FOREIGN KEY (fk_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE IF NOT EXISTS carrito (
	id_carrito INT NOT NULL AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    PRIMARY KEY (id_carrito),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS productos_carrito (
	id_productos_carrito INT NOT NULL AUTO_INCREMENT,
    fk_carrito INT NOT NULL,
    fk_producto INT NOT NULL,
    cantidad_producto INT NOT NULL,
    PRIMARY KEY (id_productos_carrito),
    FOREIGN KEY (fk_carrito) REFERENCES carrito(id_carrito),
    FOREIGN KEY (fk_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS 	transaccion (
	id_transaccion INT NOT NULL AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    fk_carrito INT NOT NULL,
    total FLOAT(12) NOT NULL,
    tipo_pago VARCHAR(100) NOT NULL,
    hora_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_transaccion),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
	FOREIGN KEY (fk_carrito) REFERENCES carrito(id_carrito)
);

CREATE TABLE IF NOT EXISTS review (
	id_review INT NOT NULL AUTO_INCREMENT,
    fk_usuario INT NOT NULL,
    fk_producto INT NOT NULL,
    estrellas TINYINT NOT NULL,
    comentario VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_review),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (fk_producto) REFERENCES producto(id_producto)
);
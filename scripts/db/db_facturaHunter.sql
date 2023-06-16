-- SQLBook: Code
CREATE DATABASE db_hunter_facture;
USE db_hunter_facture;
CREATE TABLE tb_bill(
    n_bill VARCHAR(25) NOT NULL PRIMARY KEY COMMENT 'Numero de la factura unico con las combinaciones necesarias',
    bill_date DATETIME NOT NULL DEFAULT NOW() UNIQUE COMMENT 'Fecha cuando se genero la factura'
);
CREATE TABLE tb_client(
    identificacion INT(25) NOT NULL PRIMARY KEY COMMENT 'número de identificacion unico cliente',
    full_name VARCHAR (50) NOT NULL  COMMENT 'nombre completo de cliente ',
    email VARCHAR(50) NOT NULL COMMENT 'email del cliente',
    address VARCHAR (70) NOT NULL COMMENT 'direccion del cliente',
    phone VARCHAR (11) NOT NULL COMMENT 'telefono del cliente'
);
CREATE TABLE tb_product(
    id_product INT(25) NOT NULL PRIMARY KEY COMMENT 'número del producto unico',
    name_product VARCHAR(15) NOT NULL  COMMENT 'nombre del producto',
    amount INT(3) NOT NULL COMMENT 'cantidad de productos',
    value_prodcut FLOAT(6) NOT NULL COMMENT 'valor del producto'
);
CREATE TABLE tb_seller(
    id_seller INTEGER(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Numero del vendedor',
    seller VARCHAR(60) NOT NULL COMMENT 'Nombre del vendedor'
);
/* 
* * Creamos los campos de la llaves foraneas 
*/
ALTER TABLE tb_bill ADD fk_identificacion INT(25) NOT NULL COMMENT 'Relacion del la tabla tb_client';
ALTER TABLE tb_bill ADD fk_id_seller INTEGER(11) NOT NULL COMMENT 'Relacion del la tabla tb_seller';
ALTER TABLE tb_bill ADD fk_id_product INT(25) NOT NULL COMMENT 'Relacion del la tabla tb_product';
/*
* * Creamos la relacion de la tablas
*/
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_client_fk FOREIGN KEY(fk_identificacion) REFERENCES tb_client(identificacion);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_seller_fk FOREIGN KEY(fk_id_seller) REFERENCES tb_seller(id_seller);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_product_fk FOREIGN KEY(fk_id_product) REFERENCES tb_product(id_product);

SELECT * FROM tb_client WHERE identificacion=1215496 OR address = "campus";



INSERT INTO tb_client(identificacion,full_name,email,address,phone) VALUES("123456789","Miguel Angel","ma@gmail.com","Calle 11","+57 3055484");

SELECT * FROM tb_client ORDER BY full_name LIMIT 5 OFFSET 9;

SELECT full_name as 'Nombre' FROM tb_client ORDER BY full_name;
SELECT COUNT(*) INTO @AAA FROM tb_client;
SELECT @AAA;


UPDATE tb_client SET full_name = "MARSHALL NOSSA", address = "Campus" WHERE identificacion = 1005541741;

DELETE FROM tb_client WHERE identificacion = 54354345;

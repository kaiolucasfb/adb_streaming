CREATE DATABASE IF NOT EXISTS db_jogo
COLLATE utf8mb4_general_ci
CHARSET utf8mb4;

USE db_jogo;

CREATE TABLE IF NOT EXISTS tb_usuario (
id_usuario  INT PRIMARY KEY AUTO_INCREMENT  UNIQUE,
email VARCHAR (250) NOT NULL UNIQUE,genero Varchar (10) 
 );

DROP TABLE tb_usuario;

CREATE TABLE IF NOT EXISTS tb_classes (
id_classes  INT PRIMARY KEY AUTO_INCREMENT  UNIQUE,
assassino VARCHAR (250)  UNIQUE,
barbaro Varchar (255)  UNIQUE,
monge VARCHAR (250)  
 )AUTO_INCREMENT = 1;
 
 DROP  TABLE tb_classes;
 
 CREATE TABLE IF NOT EXISTS tb_personagem (
id_personagem  INT PRIMARY KEY UNIQUE,
nome VARCHAR (250) NOT NULL UNIQUE,
genero Varchar (10) NOT NULL,
id_personagem_classes INT NOT NULL ,
id_personagem_usuario INT NOT NULL,
CONSTRAINT       fk_personagem_classes FOREIGN KEY     (id_personagem_classes)   REFERENCES      tb_classes (id),
CONSTRAINT      fk_personagem_usuario  FOREIGN KEY     (id_personagem_usuario)   REFERENCES      tb_usuario (id)

 ) ;
 DROP  TABLE tb_personagem;
 



		
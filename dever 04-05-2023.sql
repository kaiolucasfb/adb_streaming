CREATE DATABASE IF NOT EXISTS db_jogos
COLLATE utf8mb4_general_ci
CHARSET utf8mb4;

USE db_jogos;

CREATE TABLE IF NOT EXISTS tb_usuario (
id_usuario  INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR (255) NOT NULL UNIQUE,
dt_nascimento DATE,
 senha VARCHAR(255),
 nickname VARCHAR (111) UNIQUE
 )AUTO_INCREMENT = 1;
 DROP TABLE tb_usuario;

 CREATE TABLE IF NOT EXISTS tb_personagem (
id_personagem  INT PRIMARY KEY AUTO_INCREMENT,
nome  VARCHAR (12) NOT NULL UNIQUE,
genero  ENUM ('F','M') NOT NULL,
 nivel TINYINT NOT NULL,
 experiencia INT

 )AUTO_INCREMENT = 1;
  DROP  TABLE tb_personagem;
  
  
  
 CREATE TABLE IF NOT EXISTS tb_classe (
id_classe  INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
descricao VARCHAR (100)
 )AUTO_INCREMENT = 1;
 
  DROP  TABLE tb_classe;
  
 
 
  CREATE TABLE IF NOT EXISTS tb_habilidade (
id  INT PRIMARY KEY AUTO_INCREMENT  UNIQUE,
nome VARCHAR (100) NOT NULL,
descricao VARCHAR (100),
exclusividade VARCHAR (100),
id_habilidade_classe INT NOT NULL ,
id_habilidade_usuario INT NOT NULL,
CONSTRAINT          fk_habilidade_classe            FOREIGN KEY               (id_habilidade_classe)             REFERENCES           tb_classes (id_classe),
CONSTRAINT          fk_habilidade_usuario           FOREIGN KEY               (id_habilidade_usuario)            REFERENCES           tb_usuario (id_usuario)
 );
 
 
 
 
 DROP TABLE tb_habilidade;
 
 
 
 
 
 
 
 
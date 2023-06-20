-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_jogo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_jogo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_jogo` DEFAULT CHARACTER SET utf8mb4 ;
USE `db_jogo` ;

-- -----------------------------------------------------
-- Table `db_jogo`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_jogo`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`tb_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `uq_nickname` (`nickname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_jogo`.`tb_classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`tb_classe` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_nome_classe` (`id` ASC) INVISIBLE,
  UNIQUE INDEX () INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_jogo`.`tb_personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`tb_personagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(12) NOT NULL,
  `genero` ENUM('f', 'm') NOT NULL,
  `nivel` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `experiencia` INT UNSIGNED NOT NULL DEFAULT 1,
  `id_usuario` INT NOT NULL,
  `id_classe` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_nome_personagem` (`nome` ASC) VISIBLE,
  INDEX `fk_id_usuario` (`id_usuario` ASC) INVISIBLE,
  INDEX `fk_id_classe` (`id_classe` ASC) VISIBLE,
  CONSTRAINT `fk_personagem_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_jogo`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_personagem_tb_classe1`
    FOREIGN KEY (`id_classe`)
    REFERENCES `db_jogo`.`tb_classe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_jogo`.`tb_habilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`tb_habilidade` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `exclusividade` VARCHAR(255) NOT NULL,
  `` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `exclusividade_UNIQUE` (`exclusividade` ASC) VISIBLE,
  UNIQUE INDEX `uq_nome_habilidade` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_jogo`.`tb_classe_habilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_jogo`.`tb_classe_habilidade` (
  `id_classe` INT NULL,
  `id_habilidade` INT NOT NULL,
  PRIMARY KEY (`id_classe`, `id_habilidade`),
  INDEX `fk_id_habilidade` (`id_habilidade` ASC) VISIBLE,
  INDEX `fk_id_classe` (`id_classe` ASC) INVISIBLE,
  CONSTRAINT `fk_tb_classe_has_tb_habilidade_tb_classe1`
    FOREIGN KEY (`id_classe`)
    REFERENCES `db_jogo`.`tb_classe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_classe_has_tb_habilidade_tb_habilidade1`
    FOREIGN KEY (`id_habilidade`)
    REFERENCES `db_jogo`.`tb_habilidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8 ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `twitter`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`users` (
  `idusers` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `twitter`.`tuits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`tuits` (
  `idtuits` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(140) NULL,
  `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`idtuits`),
  INDEX `fk_tuits_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tuits_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `twitter`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tuits_idtuits` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  INDEX `fk_tuits_has_users_users1_idx` (`users_idusers` ASC) VISIBLE,
  INDEX `fk_tuits_has_users_tuits1_idx` (`tuits_idtuits` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tuits_has_users_tuits1`
    FOREIGN KEY (`tuits_idtuits`)
    REFERENCES `twitter`.`tuits` (`idtuits`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tuits_has_users_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `twitter`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

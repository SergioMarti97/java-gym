-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gym_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gym_db` ;

-- -----------------------------------------------------
-- Schema gym_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gym_db` DEFAULT CHARACTER SET utf8 ;
USE `gym_db` ;

-- -----------------------------------------------------
-- Table `gym_db`.`exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`exercise` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`exercise` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `brief_description` TINYTEXT NULL,
  `img_path` TINYTEXT NULL,
  `id_parent` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exercise_exercise_idx` (`id_parent` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_exercise`
    FOREIGN KEY (`id_parent`)
    REFERENCES `gym_db`.`exercise` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`muscle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`muscle` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`muscle` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`muscle_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`muscle_group` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`muscle_group` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`muscle_group_has_muscle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`muscle_group_has_muscle` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`muscle_group_has_muscle` (
  `muscle_group_id` INT UNSIGNED NOT NULL,
  `muscle_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`muscle_group_id`, `muscle_id`),
  INDEX `fk_muscle_has_muscle_group_muscle_group1_idx` (`muscle_group_id` ASC) VISIBLE,
  INDEX `fk_muscle_has_muscle_group_muscle1_idx` (`muscle_id` ASC) VISIBLE,
  CONSTRAINT `fk_muscle_has_muscle_group_muscle1`
    FOREIGN KEY (`muscle_id`)
    REFERENCES `gym_db`.`muscle` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_muscle_has_muscle_group_muscle_group1`
    FOREIGN KEY (`muscle_group_id`)
    REFERENCES `gym_db`.`muscle_group` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`series_block`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`series_block` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`series_block` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`series` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`series` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id_exercise` INT UNSIGNED NULL,
  `id_series_block` INT UNSIGNED NULL,
  `reps` SMALLINT NULL,
  `weight` DECIMAL(5,2) NULL,
  `duration` DECIMAL(7,2) NULL,
  `rest` DECIMAL(7,2) NULL,
  `rir` SMALLINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_series_exercise1_idx` (`id_exercise` ASC) VISIBLE,
  INDEX `fk_series_series_block1_idx` (`id_series_block` ASC) VISIBLE,
  CONSTRAINT `fk_series_exercise1`
    FOREIGN KEY (`id_exercise`)
    REFERENCES `gym_db`.`exercise` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_series_series_block1`
    FOREIGN KEY (`id_series_block`)
    REFERENCES `gym_db`.`series_block` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`workout` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`workout` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `date` DATE NULL,
  `start` TIME NULL,
  `end` TIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`workout_has_block`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`workout_has_block` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`workout_has_block` (
  `id_workout` INT UNSIGNED NOT NULL,
  `id_block` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_workout`, `id_block`),
  INDEX `fk_series_block_has_workout_workout1_idx` (`id_workout` ASC) VISIBLE,
  INDEX `fk_series_block_has_workout_series_block1_idx` (`id_block` ASC) VISIBLE,
  CONSTRAINT `fk_series_block_has_workout_series_block1`
    FOREIGN KEY (`id_block`)
    REFERENCES `gym_db`.`series_block` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_series_block_has_workout_workout1`
    FOREIGN KEY (`id_workout`)
    REFERENCES `gym_db`.`workout` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`exercise_has_muscle_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`exercise_has_muscle_group` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`exercise_has_muscle_group` (
  `id_exercise` INT UNSIGNED NOT NULL,
  `id_muscle_group` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_exercise`, `id_muscle_group`),
  INDEX `fk_exercise_has_muscle_group_muscle_group1_idx` (`id_muscle_group` ASC) VISIBLE,
  INDEX `fk_exercise_has_muscle_group_exercise1_idx` (`id_exercise` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_has_muscle_group_exercise1`
    FOREIGN KEY (`id_exercise`)
    REFERENCES `gym_db`.`exercise` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_exercise_has_muscle_group_muscle_group1`
    FOREIGN KEY (`id_muscle_group`)
    REFERENCES `gym_db`.`muscle_group` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gym_db`.`exercise_has_muscle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gym_db`.`exercise_has_muscle` ;

CREATE TABLE IF NOT EXISTS `gym_db`.`exercise_has_muscle` (
  `id_exercise` INT UNSIGNED NOT NULL,
  `id_muscle` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_exercise`, `id_muscle`),
  INDEX `fk_muscle_has_exercise_exercise1_idx` (`id_exercise` ASC) VISIBLE,
  INDEX `fk_muscle_has_exercise_muscle1_idx` (`id_muscle` ASC) VISIBLE,
  CONSTRAINT `fk_muscle_has_exercise_muscle1`
    FOREIGN KEY (`id_muscle`)
    REFERENCES `gym_db`.`muscle` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_muscle_has_exercise_exercise1`
    FOREIGN KEY (`id_exercise`)
    REFERENCES `gym_db`.`exercise` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

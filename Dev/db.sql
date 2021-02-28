-- MySQL Script generated by MySQL Workbench
-- seg 22 fev 2021 14:19:37 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ambflix_com
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ambflix_com` ;

-- -----------------------------------------------------
-- Schema ambflix_com
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ambflix_com` ;
USE `ambflix_com` ;

-- -----------------------------------------------------
-- Table `ambflix_com`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`users` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `level` INT(2) NOT NULL DEFAULT 2 COMMENT '1 - Admin \\n 2 - Vendedor  \\n 3 - Cliente ',
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password_digest` VARCHAR(255) NOT NULL,
  `credit` DECIMAL(8,2) NOT NULL DEFAULT 1.00,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `status` INT(2) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ambflix_com`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`courses` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`courses` (
  `id` INT(11) NOT NULL,
  `name` DECIMAL(8,2) NOT NULL,
  `description` TEXT NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_routes_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_routes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `ambflix_com`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ambflix_com`.`params`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`params` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`params` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `value` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ambflix_com`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`locations` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`locations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(10,8) NOT NULL DEFAULT 0,
  `longitude` DECIMAL(11,8) NOT NULL DEFAULT 0,
  `user_id` INT(11) NULL,
  `course_id` INT(11) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_locations_users1_idx` (`user_id` ASC),
  INDEX `fk_locations_courses1_idx` (`course_id` ASC),
  CONSTRAINT `fk_locations_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ambflix_com`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locations_routes1`
    FOREIGN KEY (`course_id`)
    REFERENCES `ambflix_com`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ambflix_com`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`products` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ambflix_com`.`products_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ambflix_com`.`products_users` ;

CREATE TABLE IF NOT EXISTS `ambflix_com`.`products_users` (
  `product_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  INDEX `fk_products_has_users_users1_idx` (`user_id` ASC),
  INDEX `fk_products_has_users_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_products_has_users_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ambflix_com`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ambflix_com`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- 02/04/15 13:46:09
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema victimas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `victimas` ;
CREATE SCHEMA IF NOT EXISTS `victimas` DEFAULT CHARACTER SET utf8 ;
USE `victimas` ;

-- -----------------------------------------------------
-- Table `victimas`.`auth_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_group` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`django_content_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`django_content_type` ;

CREATE TABLE IF NOT EXISTS `victimas`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_3ec8c61c_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`auth_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_permission` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `content_type_id` (`content_type_id` ASC, `codename` ASC),
  INDEX `auth_permission_417f1b1c` (`content_type_id` ASC),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `victimas`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`auth_group_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_group_permissions` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `group_id` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissions_0e939a4f` (`group_id` ASC),
  INDEX `auth_group_permissions_8373b171` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `victimas`.`auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `victimas`.`auth_permission` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`auth_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_user` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(254) NULL DEFAULT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
PACK_KEYS = 1;


-- -----------------------------------------------------
-- Table `victimas`.`auth_user_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_user_groups` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_e8701ad4` (`user_id` ASC),
  INDEX `auth_user_groups_0e939a4f` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `victimas`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `victimas`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`auth_user_user_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`auth_user_user_permissions` ;

CREATE TABLE IF NOT EXISTS `victimas`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_user_permissions_e8701ad4` (`user_id` ASC),
  INDEX `auth_user_user_permissions_8373b171` (`permission_id` ASC),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `victimas`.`auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `victimas`.`auth_permission` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`django_admin_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`django_admin_log` ;

CREATE TABLE IF NOT EXISTS `victimas`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_417f1b1c` (`content_type_id` ASC),
  INDEX `django_admin_log_e8701ad4` (`user_id` ASC),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `victimas`.`auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `victimas`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`django_migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`django_migrations` ;

CREATE TABLE IF NOT EXISTS `victimas`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`django_session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`django_session` ;

CREATE TABLE IF NOT EXISTS `victimas`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_de54fa62` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`python_hol_document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`python_hol_document` ;

CREATE TABLE IF NOT EXISTS `victimas`.`python_hol_document` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `filePath` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`r_dominio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`r_dominio` ;

CREATE TABLE IF NOT EXISTS `victimas`.`r_dominio` (
  `iddominio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `valor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iddominio`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`r_fuid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`r_fuid` ;

CREATE TABLE IF NOT EXISTS `victimas`.`r_fuid` (
  `num_orden` INT(45) NOT NULL,
  `codigo` INT(45) NULL DEFAULT NULL,
  `num_serie_sub_asuntos` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_extrema_inicio` DATE NULL DEFAULT NULL,
  `fecha_extrema_fin` DATE NULL DEFAULT NULL,
  `und_caja` INT(45) NULL DEFAULT NULL,
  `und_carpeta` INT(45) NULL DEFAULT NULL,
  `und_tomo` INT(45) NULL DEFAULT NULL,
  `und_otro` INT(45) NULL DEFAULT NULL,
  `num_estante` INT(45) NULL DEFAULT NULL,
  `num_entrepaño` INT(45) NULL DEFAULT NULL,
  `num_caja` INT(45) NULL DEFAULT NULL,
  `num_folios` INT(45) NULL DEFAULT NULL,
  `soporte` VARCHAR(45) NULL DEFAULT NULL,
  `frecuencia_consulta` VARCHAR(45) NULL DEFAULT NULL,
  `notas` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`num_orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `victimas`.`r_indexacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victimas`.`r_indexacion` ;

CREATE TABLE IF NOT EXISTS `victimas`.`r_indexacion` (
  `cod_carpeta` INT(45) NOT NULL,
  `cod_caja` INT(45) NULL DEFAULT NULL,
  `folios` INT(45) NULL DEFAULT NULL,
  `num_radicado` INT(45) NULL DEFAULT NULL,
  `id_victima` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_victima` VARCHAR(100) NULL DEFAULT NULL,
  `id_declara` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_declara` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_carpeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
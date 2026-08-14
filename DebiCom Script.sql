-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema debicom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema debicom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `debicom` DEFAULT CHARACTER SET utf8 ;
USE `debicom` ;

-- -----------------------------------------------------
-- Table `debicom`.`tipo_identificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`tipo_identificaciones` (
  `id_tipo_identificacion` INT NOT NULL,
  `nombre_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_identificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`perfiles` (
  `id_perfil` INT NOT NULL,
  `nombre_perfil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `identificacion` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `fecha_vencimiento_clave` DATE NOT NULL,
  `autoriza_datos` TINYINT NOT NULL,
  `id_tipo_identificacion` INT NOT NULL,
  `id_perfil` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_tipoidentificacion1_idx` (`id_tipo_identificacion` ASC) ,
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC) ,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) ,
  INDEX `fk_Usuario_Perfiles1_idx` (`id_perfil` ASC) ,
  CONSTRAINT `fk_Usuario_tipoidentificacion1`
    FOREIGN KEY (`id_tipo_identificacion`)
    REFERENCES `debicom`.`tipo_identificaciones` (`id_tipo_identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Perfiles1`
    FOREIGN KEY (`id_perfil`)
    REFERENCES `debicom`.`perfiles` (`id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`tipo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`tipo_pago` (
  `id_tipo_pago` INT NOT NULL,
  `nombre_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `cupo_disponible` DECIMAL NOT NULL,
  `credito_actual` DECIMAL NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_Usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_cliente_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `debicom`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`pagos` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `numero_referencia_pago` DECIMAL NOT NULL,
  `fecha_pago` DATE NOT NULL,
  `id_tipo_pago` INT NOT NULL,
  PRIMARY KEY (`id_pago`),
  INDEX `fk_Pago_TipoPago1_idx` (`id_tipo_pago` ASC) ,
  CONSTRAINT `fk_Pago_TipoPago1`
    FOREIGN KEY (`id_tipo_pago`)
    REFERENCES `debicom`.`tipo_pago` (`id_tipo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`cabeza_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`cabeza_facturas` (
  `id_cabeza_factura` INT NOT NULL AUTO_INCREMENT,
  `numero_factura` VARCHAR(45) NOT NULL,
  `documento_factura` INT NOT NULL,
  `subtotal` DECIMAL NOT NULL,
  `fecha_emision` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_pago` INT NOT NULL,
  PRIMARY KEY (`id_cabeza_factura`),
  INDEX `fk_cabezafactura_cliente1_idx` (`id_cliente` ASC) ,
  INDEX `fk_cabezafactura_Pago1_idx` (`id_pago` ASC) ,
  CONSTRAINT `fk_cabezafactura_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `debicom`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cabezafactura_Pago1`
    FOREIGN KEY (`id_pago`)
    REFERENCES `debicom`.`pagos` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`unidades` (
  `id_unidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_unidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_unidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio_final` DECIMAL NOT NULL,
  `id_unidades` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_unidades1_idx` (`id_unidades` ASC) ,
  CONSTRAINT `fk_producto_unidades1`
    FOREIGN KEY (`id_unidades`)
    REFERENCES `debicom`.`unidades` (`id_unidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`detalle_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`detalle_facturas` (
  `id_detalle_factura` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `precio_final` DECIMAL NOT NULL,
  `id_cabeza_factura` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  INDEX `fk_detalle_factura_cabezafactura1_idx` (`id_cabeza_factura` ASC) ,
  INDEX `fk_detalle_factura_producto1_idx` (`id_producto` ASC) ,
  CONSTRAINT `fk_detalle_factura_cabezafactura1`
    FOREIGN KEY (`id_cabeza_factura`)
    REFERENCES `debicom`.`cabeza_facturas` (`id_cabeza_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_factura_producto1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `debicom`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`rol_permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`rol_permisos` (
  `id_rol_permiso` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol_permiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `debicom`.`perfiles_y_permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `debicom`.`perfiles_y_permisos` (
  `id_perfil` INT NOT NULL,
  `id_rol_permiso` INT NOT NULL,
  PRIMARY KEY (`id_perfil`, `id_rol_permiso`),
  INDEX `fk_Perfiles_has_RolPermisos_RolPermisos1_idx` (`id_rol_permiso` ASC) ,
  INDEX `fk_Perfiles_has_RolPermisos_Perfiles1_idx` (`id_perfil` ASC) ,
  CONSTRAINT `fk_Perfiles_has_RolPermisos_Perfiles1`
    FOREIGN KEY (`id_perfil`)
    REFERENCES `debicom`.`perfiles` (`id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfiles_has_RolPermisos_RolPermisos1`
    FOREIGN KEY (`id_rol_permiso`)
    REFERENCES `debicom`.`rol_permisos` (`id_rol_permiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

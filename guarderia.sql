-- MySQL Workbench Forward Engineering
-- Script ajustado: se reemplazan `docentes` y `acudiente` por `usuario` + `roles`.
-- `ninos` se mantiene como entidad independiente (no es un usuario del sistema).

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema guarderia
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `guarderia` ;
CREATE SCHEMA IF NOT EXISTS `guarderia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `guarderia` ;

-- -----------------------------------------------------
-- Table `guarderia`.`actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`actividades` (
  `id_actividades` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_actividad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_actividades`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`tipo_documento` (
  `id_tipo_documento` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`roles`
-- Nueva entidad: reemplaza la distinción "docente" / "acudiente"
-- que antes vivía en dos tablas separadas.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`roles` (
  `id_rol` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE INDEX `nombre_rol` (`nombre_rol` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`usuario`
-- Fusiona `docentes` y `acudiente`. Ya no incluye `profesion`:
-- ese dato es exclusivo del rol Docente y vive en `docente_detalle`
-- para no dejar columnas nulas en usuarios que no son docentes.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `numero_documento` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `tipo_documento_id_tipo_documento` INT(11) NOT NULL,
  `id_rol` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `numero_documento` (`numero_documento` ASC),
  INDEX `fk_usuario_tipo_documento1_idx` (`tipo_documento_id_tipo_documento` ASC),
  INDEX `fk_usuario_roles1_idx` (`id_rol` ASC),
  CONSTRAINT `fk_usuario_tipo_documento1`
    FOREIGN KEY (`tipo_documento_id_tipo_documento`)
    REFERENCES `guarderia`.`tipo_documento` (`id_tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_roles1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `guarderia`.`roles` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`docente_detalle`
-- Relación 1:1 con `usuario`: solo existe una fila por cada
-- usuario cuyo rol sea Docente. Evita columnas nulas en `usuario`
-- para el resto de roles.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`docente_detalle` (
  `id_usuario` INT(11) NOT NULL,
  `profesion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_docente_detalle_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `guarderia`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`estado_asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`estado_asistencia` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`aulas` (
  `id_aulas` INT(11) NOT NULL AUTO_INCREMENT,
  `numero_aula` INT(11) NOT NULL,
  `capacidad` INT(11) NOT NULL DEFAULT 20,
  PRIMARY KEY (`id_aulas`),
  UNIQUE INDEX `numero_aula` (`numero_aula` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`grupos`
-- `id_docentes` ahora referencia a `usuario` (rol Docente).
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`grupos` (
  `id_grupos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_grupo` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NOT NULL DEFAULT 0,
  `id_usuario_docente` INT(11) NOT NULL,
  `id_aulas` INT(11) NOT NULL,
  PRIMARY KEY (`id_grupos`),
  INDEX `fk_Usuario_Grupos` (`id_usuario_docente` ASC),
  INDEX `fk_Aulas_Grupos` (`id_aulas` ASC),
  CONSTRAINT `fk_Aulas_Grupos`
    FOREIGN KEY (`id_aulas`)
    REFERENCES `guarderia`.`aulas` (`id_aulas`),
  CONSTRAINT `fk_Usuario_Grupos`
    FOREIGN KEY (`id_usuario_docente`)
    REFERENCES `guarderia`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`ninos`
-- Se mantiene independiente de `usuario`: un niño no inicia
-- sesión ni tiene rol de acceso, es un registro atendido, no un
-- actor del sistema.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`ninos` (
  `id_ninos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `codigo_unico` INT(11) NOT NULL,
  `numero_documento` VARCHAR(45) NOT NULL,
  `id_grupos` INT(11) NOT NULL,
  `tipo_documento_id_tipo_documento` INT(11) NOT NULL,
  PRIMARY KEY (`id_ninos`),
  UNIQUE INDEX `codigo_unico` (`codigo_unico` ASC),
  UNIQUE INDEX `numero_documento` (`numero_documento` ASC),
  INDEX `fk_Grupos_Ninos` (`id_grupos` ASC),
  INDEX `fk_ninos_tipo_documento1_idx` (`tipo_documento_id_tipo_documento` ASC),
  CONSTRAINT `fk_Grupos_Ninos`
    FOREIGN KEY (`id_grupos`)
    REFERENCES `guarderia`.`grupos` (`id_grupos`),
  CONSTRAINT `fk_ninos_tipo_documento1`
    FOREIGN KEY (`tipo_documento_id_tipo_documento`)
    REFERENCES `guarderia`.`tipo_documento` (`id_tipo_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`asistencia` (
  `id_asistencia` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `id_ninos` INT(11) NOT NULL,
  `id_estado` INT(11) NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  INDEX `fk_Ninos_Asistencia` (`id_ninos` ASC),
  INDEX `fk_Estado_Asistencia` (`id_estado` ASC),
  CONSTRAINT `fk_Estado_Asistencia`
    FOREIGN KEY (`id_estado`)
    REFERENCES `guarderia`.`estado_asistencia` (`id_estado`),
  CONSTRAINT `fk_Ninos_Asistencia`
    FOREIGN KEY (`id_ninos`)
    REFERENCES `guarderia`.`ninos` (`id_ninos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`ninos_has_actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`ninos_has_actividades` (
  `id_ninos` INT(11) NOT NULL,
  `id_actividades` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `observacion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ninos`, `id_actividades`, `fecha`),
  INDEX `fk_Act_NinosAct` (`id_actividades` ASC),
  CONSTRAINT `fk_Act_NinosAct`
    FOREIGN KEY (`id_actividades`)
    REFERENCES `guarderia`.`actividades` (`id_actividades`),
  CONSTRAINT `fk_Ninos_NinosAct`
    FOREIGN KEY (`id_ninos`)
    REFERENCES `guarderia`.`ninos` (`id_ninos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`ninos_has_usuario`
-- Antes `ninos_has_acudiente`. `id_acudiente` ahora referencia
-- a `usuario` (rol Acudiente).
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`ninos_has_usuario` (
  `id_ninos` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL DEFAULT 'Padre/Madre',
  PRIMARY KEY (`id_ninos`, `id_usuario`),
  INDEX `fk_Usuario_NinosUsuario` (`id_usuario` ASC),
  CONSTRAINT `fk_Usuario_NinosUsuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `guarderia`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_Ninos_NinosUsuario`
    FOREIGN KEY (`id_ninos`)
    REFERENCES `guarderia`.`ninos` (`id_ninos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`pagos` (
  `id_pago` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_pago` DATE NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `concepto` VARCHAR(100) NOT NULL,
  `estado_pago` VARCHAR(20) NOT NULL DEFAULT 'Pagado',
  `id_ninos` INT(11) NOT NULL,
  PRIMARY KEY (`id_pago`),
  INDEX `fk_Ninos_Pagos` (`id_ninos` ASC),
  CONSTRAINT `fk_Ninos_Pagos`
    FOREIGN KEY (`id_ninos`)
    REFERENCES `guarderia`.`ninos` (`id_ninos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `guarderia`.`registro_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guarderia`.`registro_medico` (
  `id_registro` INT(11) NOT NULL AUTO_INCREMENT,
  `observaciones` VARCHAR(200) NOT NULL DEFAULT 'Sin observaciones',
  `alergias` VARCHAR(100) NOT NULL DEFAULT 'Ninguna',
  `contacto_emergencia` VARCHAR(100) NOT NULL,
  `id_ninos` INT(11) NOT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE INDEX `id_ninos_UNIQUE` (`id_ninos` ASC),
  CONSTRAINT `fk_Ninos_RegMedico`
    FOREIGN KEY (`id_ninos`)
    REFERENCES `guarderia`.`ninos` (`id_ninos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Datos base de `roles`
-- -----------------------------------------------------
INSERT INTO `guarderia`.`roles` (`nombre_rol`) VALUES
  ('Docente'),
  ('Acudiente'),
  ('Administrador');

USE `guarderia` ;

-- -----------------------------------------------------
-- procedure sp_ListaInfoAula
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListaInfoAula`(IN p_idAula INT)
BEGIN
  SELECT
    a.numero_aula,
    a.capacidad,
    g.nombre_grupo,
    CONCAT(u.nombre, ' ', u.apellido) AS docente,
    COUNT(n.id_ninos)                  AS total_ninos_inscritos
  FROM aulas a
  LEFT JOIN grupos   g ON a.id_aulas   = g.id_aulas
  LEFT JOIN usuario  u ON g.id_usuario_docente = u.id_usuario
  LEFT JOIN ninos    n ON g.id_grupos   = n.id_grupos
  WHERE a.id_aulas = p_idAula
  GROUP BY a.id_aulas, a.numero_aula, a.capacidad,
           g.nombre_grupo, u.nombre, u.apellido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_ListarDocenteByDocumento
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarDocenteByDocumento`(IN p_documento VARCHAR(45))
BEGIN
  SELECT
    u.nombre,
    u.apellido,
    dd.profesion,
    u.telefono,
    t.descripcion_tipo
  FROM usuario u
  INNER JOIN tipo_documento t
    ON u.tipo_documento_id_tipo_documento = t.id_tipo_documento
  INNER JOIN roles r
    ON u.id_rol = r.id_rol
  LEFT JOIN docente_detalle dd
    ON u.id_usuario = dd.id_usuario
  WHERE u.numero_documento = p_documento
    AND r.nombre_rol = 'Docente';
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_ListarNinosByGrupo
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarNinosByGrupo`(IN p_idGrupo INT)
BEGIN
  SELECT
    n.nombre,
    n.apellido,
    n.fecha_nacimiento,
    n.codigo_unico,
    g.nombre_grupo,
    u.nombre   AS docente_nombre,
    u.apellido AS docente_apellido
  FROM ninos n
  INNER JOIN grupos  g ON n.id_grupos = g.id_grupos
  INNER JOIN usuario u ON g.id_usuario_docente = u.id_usuario
  WHERE n.id_grupos = p_idGrupo
  ORDER BY n.apellido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_ListarTodosNinos
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarTodosNinos`()
BEGIN
  SELECT
    n.id_ninos,
    n.nombre,
    n.apellido,
    n.fecha_nacimiento,
    n.codigo_unico,
    g.nombre_grupo
  FROM ninos n
  INNER JOIN grupos g ON n.id_grupos = g.id_grupos
  ORDER BY n.apellido, n.nombre;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_verDocentes
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verDocentes`()
BEGIN
    SELECT u.*, dd.profesion
    FROM usuario u
    INNER JOIN roles r ON u.id_rol = r.id_rol
    LEFT JOIN docente_detalle dd ON u.id_usuario = dd.id_usuario
    WHERE r.nombre_rol = 'Docente';
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_verAcudientes (nuevo, análogo a sp_verDocentes)
-- -----------------------------------------------------
DELIMITER $$
USE `guarderia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verAcudientes`()
BEGIN
    SELECT u.*
    FROM usuario u
    INNER JOIN roles r ON u.id_rol = r.id_rol
    WHERE r.nombre_rol = 'Acudiente';
END$$
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE usuario ADD contrasena VARCHAR(100);
ALTER TABLE usuario ADD estado BOOLEAN;
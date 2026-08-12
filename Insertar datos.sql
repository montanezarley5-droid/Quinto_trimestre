USE `guarderia`;

-- Desactivar llaves foráneas temporalmente para asegurar inserción fluida
SET FOREIGN_KEY_CHECKS = 0;

-- 1. TIPO_DOCUMENTO (3 registros)
INSERT INTO `tipo_documento` (`id_tipo_documento`, `descripcion_tipo`) VALUES
(1, 'Cedula de Ciudadania'),
(2, 'Tarjeta de Identidad'),
(3, 'Registro Civil');

-- ROLES ya cuenta con los 3 registros insertados por defecto en el script original (1: Docente, 2: Acudiente, 3: Administrador).

-- 2. ESTADO_ASISTENCIA (3 registros)
INSERT INTO `estado_asistencia` (`id_estado`, `descripcion`) VALUES
(1, 'Presente'),
(2, 'Ausente'),
(3, 'Excusado');

-- 3. AULAS (5 registros)
INSERT INTO `aulas` (`id_aulas`, `numero_aula`, `capacidad`) VALUES
(1, 101, 20),
(2, 102, 20),
(3, 103, 20),
(4, 104, 20),
(5, 105, 20);

-- 4. USUARIOS (20 registros: 5 Docentes, 15 Acudientes)
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `numero_documento`, `telefono`, `correo`, `tipo_documento_id_tipo_documento`, `id_rol`, `contrasena`, `estado`) VALUES
-- 5 Docentes (IDs 1 al 5 | rol_id = 1)
(1, 'Maria', 'Rodriguez', '10010001', '3001112233', 'maria.docente@guarderia.com', 1, 1, 'paswor', 1),
(2, 'Juan', 'Perez', '10010002', '3001112234', 'juan.docente@guarderia.com', 1, 1,'123142', 1),
(3, 'Ana', 'Gomez', '10010003', '3001112235', 'ana.docente@guarderia.com', 1, 1, 'asd124', 1),
(4, 'Carlos', 'Lopez', '10010004', '3001112236', 'carlos.docente@guarderia.com', 1, 1, '123asfd', 1),
(5, 'Laura', 'Martinez', '10010005', '3001112237', 'laura.docente@guarderia.com', 1, 1, '1243', 1),
-- 15 Acudientes (IDs 6 al 20 | rol_id = 2)
(6, 'Pedro', 'Sanchez', '10010006', '3101112201', 'pedro.acudiente@mail.com', 1, 2, 'fgds1432', 1),
(7, 'Sofia', 'Torres', '10010007', '3101112202', 'sofia.acudiente@mail.com', 1, 2, 'fwD3TE', 1),
(8, 'Diego', 'Ramirez', '10010008', '3101112203', 'diego.acudiente@mail.com', 1, 2, '5243sfghd', 1),
(9, 'Lucia', 'Flores', '10010009', '3101112204', 'lucia.acudiente@mail.com', 1, 2, 'jelou', 1),
(10, 'Gabriel', 'Morales', '10010010', '3101112205', 'gabriel.acudiente@mail.com', 1, 2, 'asdqawe', 1),
(11, 'Elena', 'Castro', '10010011', '3101112206', 'elena.acudiente@mail.com', 1, 2, '', 1),
(12, 'Fernando', 'Ortiz', '10010012', '3101112207', 'fernando.acudiente@mail.com', 1, 2 ,'uklijluh', 1),
(13, 'Patricia', 'Gutierrez', '10010013', '3101112208', 'patricia.acudiente@mail.com', 1, 2, 'ghfsdh', 1),
(14, 'Javier', 'Chavez', '10010014', '3101112209', 'javier.acudiente@mail.com', 1, 2, 'sthgrfg', 1),
(15, 'Camila', 'Rios', '10010015', '3101112210', 'camila.acudiente@mail.com', 1, 2,'5q34gfh', 1),
(16, 'Andres', 'Mendoza', '10010016', '3101112211', 'andres.acudiente@mail.com', 1, 2, 'SDQ3EWR', 1),
(17, 'Paula', 'Aguilar', '10010017', '3101112212', 'paula.acudiente@mail.com', 1, 2, 'khgs564ru', 1),
(18, 'Santiago', 'Vega', '10010018', '3101112213', 'santiago.acudiente@mail.com', 1, 2, '546kuirf', 1),
(19, 'Valeria', 'Silva', '10010019', '3101112214', 'valeria.acudiente@mail.com', 1, 2, '435eyre45g', 1),
(20, 'Mateo', 'Rojas', '10010020', '3101112215', 'mateo.acudiente@mail.com', 1, 2, '3e4rw2ujtryfgh', 1);

-- 5. DOCENTE_DETALLE (5 registros vinculados a los usuarios 1 al 5)
INSERT INTO `docente_detalle` (`id_usuario`, `profesion`) VALUES
(1, 'Licenciada en Pedagogia Infantil'),
(2, 'Educador Preescolar'),
(3, 'Licenciada en Educación Especial'),
(4, 'Psicopedagogo'),
(5, 'Licenciada en Artes y Educación');

-- 6. GRUPOS (5 registros vinculados a las 5 aulas y 5 docentes)
INSERT INTO `grupos` (`id_grupos`, `nombre_grupo`, `cantidad`, `id_usuario_docente`, `id_aulas`) VALUES
(1, 'Párvulos A', 4, 1, 1),
(2, 'Párvulos B', 4, 2, 2),
(3, 'Pre-Jardín', 4, 3, 3),
(4, 'Jardín A', 4, 4, 4),
(5, 'Jardín B', 4, 5, 5);

-- 7. ACTIVIDADES (10 registros)
INSERT INTO `actividades` (`id_actividades`, `descripcion_actividad`) VALUES
(1, 'Pintura y manualidades'),
(2, 'Lectura de cuentos'),
(3, 'Juegos al aire libre'),
(4, 'Música y canto'),
(5, 'Iniciación al baile'),
(6, 'Modelado con plastilina'),
(7, 'Ejercicios de psicomotricidad'),
(8, 'Taller de teatro guiado'),
(9, 'Juegos de bloques y construcción'),
(10, 'Actividad sensorial con agua');

-- 8. NINOS (20 registros)
INSERT INTO `ninos` (`id_ninos`, `nombre`, `apellido`, `fecha_nacimiento`, `codigo_unico`, `numero_documento`, `id_grupos`, `tipo_documento_id_tipo_documento`) VALUES
(1, 'Lucas', 'Sanchez', '2021-03-15', 2001, 'RC2001', 1, 3),
(2, 'Mia', 'Torres', '2021-05-20', 2002, 'RC2002', 1, 3),
(3, 'Leo', 'Ramirez', '2021-01-10', 2003, 'RC2003', 1, 3),
(4, 'Sofia', 'Flores', '2021-07-12', 2004, 'RC2004', 1, 3),
(5, 'Mateo', 'Morales', '2020-04-18', 2005, 'RC2005', 2, 3),
(6, 'Emma', 'Castro', '2020-08-22', 2006, 'RC2006', 2, 3),
(7, 'Daniel', 'Ortiz', '2020-02-14', 2007, 'RC2007', 2, 3),
(8, 'Isabella', 'Gutierrez', '2020-11-30', 2008, 'RC2008', 2, 3),
(9, 'Tomas', 'Chavez', '2019-06-05', 2009, 'RC2009', 3, 3),
(10, 'Camila', 'Rios', '2019-09-17', 2010, 'RC2010', 3, 3),
(11, 'Nicolas', 'Mendoza', '2019-12-01', 2011, 'RC2011', 3, 3),
(12, 'Lucia', 'Aguilar', '2019-03-25', 2012, 'RC2012', 3, 3),
(13, 'Samuel', 'Vega', '2018-05-14', 2013, 'RC2013', 4, 3),
(14, 'Victoria', 'Silva', '2018-08-09', 2014, 'RC2014', 4, 3),
(15, 'Joaquin', 'Rojas', '2018-10-21', 2015, 'RC2015', 4, 3),
(16, 'Martina', 'Sanchez', '2018-02-11', 2016, 'RC2016', 4, 3),
(17, 'Gabriel', 'Torres', '2017-04-03', 2017, 'TI2017', 5, 2),
(18, 'Valeria', 'Ramirez', '2017-07-29', 2018, 'TI2018', 5, 2),
(19, 'David', 'Flores', '2017-09-15', 2019, 'TI2019', 5, 2),
(20, 'Sara', 'Morales', '2017-12-19', 2020, 'TI2020', 5, 2);

-- 9. REGISTRO_MEDICO (20 registros, 1 por niño)
INSERT INTO `registro_medico` (`id_registro`, `observaciones`, `alergias`, `contacto_emergencia`, `id_ninos`) VALUES
(1, 'Sin observaciones', 'Ninguna', '3101112201', 1),
(2, 'Intolerancia a la lactosa', 'Lácteos', '3101112202', 2),
(3, 'Sin observaciones', 'Ninguna', '3101112203', 3),
(4, 'Usar bloqueador solar antes de salir', 'Ninguna', '3101112204', 4),
(5, 'Sin observaciones', 'Polen', '3101112205', 5),
(6, 'Asma leve, lleva inhalador', 'Polvo', '3101112206', 6),
(7, 'Sin observaciones', 'Ninguna', '3101112207', 7),
(8, 'Sensible a picaduras de abeja', 'Picadura de abeja', '3101112208', 8),
(9, 'Sin observaciones', 'Ninguna', '3101112209', 9),
(10, 'Alergia al maní', 'Maní y frutos secos', '3101112210', 10),
(11, 'Sin observaciones', 'Ninguna', '3101112211', 11),
(12, 'Usa gafas formuladas', 'Ninguna', '3101112212', 12),
(13, 'Sin observaciones', 'Mariscos', '3101112213', 13),
(14, 'Piel atópica', 'Jabones con perfume', '3101112214', 14),
(15, 'Sin observaciones', 'Ninguna', '3101112215', 15),
(16, 'Sin observaciones', 'Ninguna', '3101112201', 16),
(17, 'Celiaquía leve', 'Gluten', '3101112202', 17),
(18, 'Sin observaciones', 'Ninguna', '3101112203', 18),
(19, 'Sensible al frío', 'Ninguna', '3101112204', 19),
(20, 'Sin observaciones', 'Ninguna', '3101112205', 20);

-- 10. PAGOS (20 registros, 1 por niño)
INSERT INTO `pagos` (`id_pago`, `fecha_pago`, `monto`, `concepto`, `estado_pago`, `id_ninos`) VALUES
(1, '2026-08-01', 250000.00, 'Pensión Agosto', 'Pagado', 1),
(2, '2026-08-01', 250000.00, 'Pensión Agosto', 'Pagado', 2),
(3, '2026-08-01', 250000.00, 'Pensión Agosto', 'Pagado', 3),
(4, '2026-08-02', 250000.00, 'Pensión Agosto', 'Pagado', 4),
(5, '2026-08-02', 250000.00, 'Pensión Agosto', 'Pagado', 5),
(6, '2026-08-02', 250000.00, 'Pensión Agosto', 'Pagado', 6),
(7, '2026-08-03', 250000.00, 'Pensión Agosto', 'Pagado', 7),
(8, '2026-08-03', 250000.00, 'Pensión Agosto', 'Pagado', 8),
(9, '2026-08-03', 250000.00, 'Pensión Agosto', 'Pagado', 9),
(10, '2026-08-03', 250000.00, 'Pensión Agosto', 'Pagado', 10),
(11, '2026-08-04', 250000.00, 'Pensión Agosto', 'Pagado', 11),
(12, '2026-08-04', 250000.00, 'Pensión Agosto', 'Pagado', 12),
(13, '2026-08-04', 250000.00, 'Pensión Agosto', 'Pagado', 13),
(14, '2026-08-04', 250000.00, 'Pensión Agosto', 'Pagado', 14),
(15, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 15),
(16, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 16),
(17, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 17),
(18, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 18),
(19, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 19),
(20, '2026-08-05', 250000.00, 'Pensión Agosto', 'Pagado', 20);

-- 11. ASISTENCIA (40 registros: 2 días de toma de lista para los 20 niños)
INSERT INTO `asistencia` (`id_asistencia`, `fecha`, `id_ninos`, `id_estado`) VALUES
-- Día 1 (2026-08-04)
(1, '2026-08-04', 1, 1), (2, '2026-08-04', 2, 1), (3, '2026-08-04', 3, 1), (4, '2026-08-04', 4, 2),
(5, '2026-08-04', 5, 1), (6, '2026-08-04', 6, 1), (7, '2026-08-04', 7, 3), (8, '2026-08-04', 8, 1),
(9, '2026-08-04', 9, 1), (10, '2026-08-04', 10, 1), (11, '2026-08-04', 11, 1), (12, '2026-08-04', 12, 1),
(13, '2026-08-04', 13, 1), (14, '2026-08-04', 14, 2), (15, '2026-08-04', 15, 1), (16, '2026-08-04', 16, 1),
(17, '2026-08-04', 17, 1), (18, '2026-08-04', 18, 1), (19, '2026-08-04', 19, 1), (20, '2026-08-04', 20, 1),
-- Día 2 (2026-08-05)
(21, '2026-08-05', 1, 1), (22, '2026-08-05', 2, 1), (23, '2026-08-05', 3, 1), (24, '2026-08-05', 4, 1),
(25, '2026-08-05', 5, 1), (26, '2026-08-05', 6, 2), (27, '2026-08-05', 7, 1), (28, '2026-08-05', 8, 1),
(29, '2026-08-05', 9, 1), (30, '2026-08-05', 10, 1), (31, '2026-08-05', 11, 3), (32, '2026-08-05', 12, 1),
(33, '2026-08-05', 13, 1), (34, '2026-08-05', 14, 1), (35, '2026-08-05', 15, 1), (36, '2026-08-05', 16, 1),
(37, '2026-08-05', 17, 1), (38, '2026-08-05', 18, 2), (39, '2026-08-05', 19, 1), (40, '2026-08-05', 20, 1);

-- Reactivar validación de llaves foráneas
SET FOREIGN_KEY_CHECKS = 1;
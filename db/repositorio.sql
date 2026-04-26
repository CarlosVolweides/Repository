-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 15-01-2025 a las 16:44:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `repositorio`
--
CREATE DATABASE IF NOT EXISTS `repositorio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `repositorio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_conocimiento`
--

CREATE TABLE `area_conocimiento` (
  `area_id` smallint(5) NOT NULL,
  `area_nombre` varchar(100) NOT NULL,
  `carrera_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `area_conocimiento`
--

INSERT INTO `area_conocimiento` (`area_id`, `area_nombre`, `carrera_id`) VALUES
(1, 'Redes y Telematica', 2),
(2, 'Ingenieria del software', 2),
(3, 'Gerencia Informática', 2),
(4, 'Arquitectura del Computador', 2),
(5, 'Gerencia y Administración', 1),
(6, 'Pensamiento Sistémico', 1),
(7, 'Dirección de Operaciones', 1),
(8, 'Tecnologías de Sistemas y Comunicación', 1),
(9, 'Sistemas Eléctricos, Electrónicos y Control', 1),
(10, 'Diseño Estructural y Construcción', 3),
(11, 'Hidráulica y Ambiente', 3),
(12, 'Vías de Comunicación y Geotecnia', 3),
(13, 'Administración y Gestión de Obras', 3),
(14, 'Administración de Mantenimiento de\r\nSistemas Industriales', 4),
(15, 'Confiabilidad de Sistemas Industriales', 4),
(16, 'Mantenimiento de Activos', 4),
(17, 'Procesos de Fabricación y Materiales', 4),
(18, 'Práctica Forense', 7),
(19, 'Investigaciones Jurídicas', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `autor_id` int(10) NOT NULL,
  `sede_id` smallint(5) NOT NULL,
  `facultad_id` smallint(5) NOT NULL,
  `carrera_id` smallint(5) NOT NULL,
  `autor_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`autor_id`, `sede_id`, `facultad_id`, `carrera_id`, `autor_nombre`) VALUES
(8, 3, 1, 1, 'Carlos2'),
(9, 3, 1, 1, 'Carlos'),
(10, 3, 1, 1, 'Carlos Vol'),
(11, 3, 1, 1, 'Carlos Volwe'),
(12, 3, 1, 1, 'Carlos Volwei'),
(13, 3, 1, 3, 'Cesar Hernández'),
(14, 3, 1, 3, 'Ascanio Jesús'),
(15, 3, 1, 3, 'Jesús Rivas'),
(16, 3, 1, 3, 'José R. Mendoza'),
(17, 2, 1, 1, 'sasasas'),
(18, 2, 1, 1, 'sadasd asdasda'),
(19, 3, 1, 2, 'Carlos Volweides'),
(20, 3, 3, 7, 'Gustavo Enrique López Ramos'),
(21, 3, 3, 7, 'Kariannys de los Angeles Rodríguez Colmenares'),
(22, 3, 3, 7, 'Kariannys Rodríguez'),
(23, 3, 1, 3, 'Jesús Ascanio'),
(24, 3, 1, 3, 'José Mendoza'),
(25, 3, 1, 3, 'José Ángel Madrid'),
(26, 3, 3, 7, 'Rogelio Jesus Pinto Regnault'),
(27, 3, 1, 2, 'Leonardo Walls');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `carrera_id` smallint(5) NOT NULL,
  `carrera_nombre` varchar(50) NOT NULL,
  `facultad_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`carrera_id`, `carrera_nombre`, `facultad_id`) VALUES
(1, 'Ingenieria en sistemas', 1),
(2, 'Ingenieria en informatica', 1),
(3, 'Ingenieria en civil', 1),
(4, 'Ingenieria de mantenimiento', 1),
(5, 'Administracion de empresa', 2),
(6, 'Economia', 2),
(7, 'Derecho', 3),
(8, 'Odontologia', 4),
(9, 'Contaduria', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `facultad_id` smallint(5) NOT NULL,
  `facultad_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`facultad_id`, `facultad_nombre`) VALUES
(1, 'Ingenieria'),
(2, 'FACES'),
(3, 'Derecho'),
(4, 'Odontologia'),
(5, 'Psicologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_x_trabajo`
--

CREATE TABLE `lineas_x_trabajo` (
  `trabajo_id` int(10) DEFAULT NULL,
  `linea_id` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `lineas_x_trabajo`
--

INSERT INTO `lineas_x_trabajo` (`trabajo_id`, `linea_id`) VALUES
(21, 10),
(22, 10),
(23, 14),
(24, 13),
(25, 13),
(27, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_investigacion`
--

CREATE TABLE `linea_investigacion` (
  `linea_id` smallint(5) NOT NULL,
  `linea_nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `linea_investigacion`
--

INSERT INTO `linea_investigacion` (`linea_id`, `linea_nombre`) VALUES
(1, 'Diagnóstico, Selección e Implementación de las Tecnologías de la Información\r\ny Comunicación'),
(2, 'Modelación y Optimización de la Estructura y Procesos que Conforman el\r\nSistema Integral de Gestión de una Organización'),
(3, 'Administración, formulación, desarrollo y evaluación de proyectos de\r\ningeniería en sistemas orientadas a la gerencia y administración'),
(4, 'Sistemas de información de apoyo a la gestión de empresas comerciales y de\r\nservicios de pequeñas, medianas y gran envergadura'),
(5, 'Sistemas de información de apoyo a la gestión de empresas públicas y de\r\nservicios comunitarios'),
(6, 'Análisis, desarrollo y evaluación de métodos numéricos de ingeniería'),
(7, 'Análisis, desarrollo y evaluación de herramientas de computación gráfica'),
(8, 'Desarrollo de aplicaciones para ambientes de redes de computadoras'),
(9, 'Estructuras y Construcción'),
(10, 'Hidráulica, Geotécnia y Ambiente'),
(11, 'Vías de Comunicación'),
(12, 'Diagnóstico y Rehabilitación de Estructuras'),
(13, 'Caracterización de Nuevos Materiales'),
(14, 'Administración de la Construcción y Docencia'),
(15, 'Gestión de Activos'),
(16, 'Confiabilidad Industrial'),
(17, 'Termofluidos, electricidad e Instrumentación'),
(18, 'Mecánica y Materiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_x_area`
--

CREATE TABLE `linea_x_area` (
  `linea_id` smallint(5) NOT NULL,
  `area_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `linea_x_area`
--

INSERT INTO `linea_x_area` (`linea_id`, `area_id`) VALUES
(1, 8),
(1, 9),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 5),
(3, 6),
(4, 2),
(4, 3),
(4, 4),
(5, 2),
(5, 3),
(5, 4),
(8, 1),
(8, 4),
(6, 3),
(9, 10),
(12, 10),
(13, 10),
(10, 11),
(11, 12),
(12, 12),
(14, 13),
(15, 14),
(16, 15),
(15, 16),
(17, 16),
(18, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` tinyint(2) NOT NULL,
  `rol_nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `rol_nombre`) VALUES
(1, 'Administrador'),
(2, 'Coordinador de Ingenieria'),
(3, 'Coordinador de Derecho'),
(4, 'Coordinador de FACES'),
(5, 'Coordinador de Psicologia'),
(6, 'Coordinador de Odontologia'),
(7, 'Coordinador de Posgrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `sede_id` smallint(5) NOT NULL,
  `sede_nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`sede_id`, `sede_nombre`) VALUES
(1, 'Barcelona'),
(2, 'Ciudad Bolivar'),
(3, 'Puerto Ordaz'),
(4, 'Anaco'),
(5, 'El tigre'),
(6, 'Cumana'),
(7, 'Maturin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trabajo`
--

CREATE TABLE `tipo_trabajo` (
  `tipo_trabajo_id` int(10) NOT NULL,
  `tipo_trabajo_nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_trabajo`
--

INSERT INTO `tipo_trabajo` (`tipo_trabajo_id`, `tipo_trabajo_nombre`) VALUES
(1, 'Pregrado'),
(2, 'Pasantia'),
(3, 'Posgrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tutor`
--

CREATE TABLE `tipo_tutor` (
  `tipo_tutor_id` smallint(5) NOT NULL,
  `tipo_tutor_nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_tutor`
--

INSERT INTO `tipo_tutor` (`tipo_tutor_id`, `tipo_tutor_nombre`) VALUES
(1, 'Asesor académico'),
(2, 'Tutor industrial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `trabajo_id` int(10) NOT NULL,
  `trabajo_titulo` varchar(250) NOT NULL,
  `trabajo_resumen` text NOT NULL,
  `trabajo_año` year(4) NOT NULL,
  `trabajo_periodo` varchar(5) NOT NULL,
  `trabajo_nota_grado` varchar(200) NOT NULL,
  `trabajo_link` varchar(100) DEFAULT NULL,
  `autor_id` int(10) NOT NULL,
  `usuario_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`trabajo_id`, `trabajo_titulo`, `trabajo_resumen`, `trabajo_año`, `trabajo_periodo`, `trabajo_nota_grado`, `trabajo_link`, `autor_id`, `usuario_id`) VALUES
(18, 'EXPERIENCIAS JURÍDICAS REALIZADAS EN LA ASOCIACIÓN CIVIL MICROEMPRESA GRUPO DI SCIPIO & ASOCIADOS RELACIONADAS AL DIVORCIO POR DESAFECTO Y PARTICION Y LIQUIDACION DE LA COMUNIDAD CONYUGAL', 'En el Capítulo I, se observará la descripción de la institución en la cual se realizó la pasantía, su nombre, ubicación, misión, visión y valores y organigrama. El Capítulo II, contendrá la justificación señalando la importancia de la cátedra de Pasantías y el por qué constituye un requisito fundamental en el pensum de estudio. En el Capítulo III, se describirán detalladamente las actividades realizadas durante cada semana. El Capítulo IV, consistirá en el marco referencial, donde se realizará una breve reseña de dos casos concretos que se asistieron, señalando los fundamentos teóricos y jurídicos de cada uno. \r\n\r\nEn el Capítulo V, se observará el juicio valorativo, el cual consistirá en un análisis de la experiencia obtenida respecto a los dos casos estudiados y del desarrollo de las actividades realizadas en general, enfocándose en la enseñanza que esto le otorga a la pasante y su beneficio para desenvolverse en el futuro. Y finalmente, el Capítulo VI, estará compuesto por las conclusiones y recomendaciones, a fin de dar a conocer los resultados de la pasantía y aportar algunas sugerencias con el objeto de mejorar la experiencia para los futuros pasantes.', '2024', 'I', 'Informe para obtener el grado de Abodado', 'C:/xampp/htdocs/Repository/trabajos/3/7/2024-Gustavo Enrique López Ramos-678330215f9f0.pdf', 20, NULL),
(19, '1 UNIVERSIDAD NORORIENTAL PRIVADA “GRAN MARISCAL DE AYACUCHO” NÚCLEO CIUDAD GUAYANA FACULTAD DE DERECHO ESCUELA DE DERECHO COORDINACIÓN DE PASANTÍAS EL CONSUMO DE BEBIDAS ALCOHÓLICAS Y SUSTANCIAS PSICOTRÓPICAS COMO DETONANTE DE VIOLENCIA HACIA LA MUJ', 'El consumo de alcohol y sustancias psicotrópicas es un problema de salud pública que requiere acciones preventivas inmediatas y promoción de la salud. Además, está relacionado con la violencia contra la mujer.\r\nEl consumo de alcohol se asocia con un mayor riesgo de violencia sexual y\r\nViolencia de pareja. Las consecuencias de la violencia relacionada con el alcohol son graves para las mujeres. Estudios han demostrado que los hombres con\r\nproblemas de alcohol y/o sustancias psicotrópicas, son seis o siete veces más\r\npropensos a estar involucrados en violencia doméstica contra las mujeres que\r\notros individuos. A nivel global, aproximadamente 1 de cada 3 mujeres ha\r\nexperimentado violencia física y/o sexual por parte de su pareja o violencia sexual\r\nno relacionada con la pareja en algún momento de su vida.', '2024', 'I', 'Graduada', 'C:/xampp/htdocs/Repository/trabajos/3/7/2024-Kariannys de los Angeles Rodríguez Colmenares-6787ceeba', 21, NULL),
(20, 'EL CONSUMO DE BEBIDAS ALCOHÓLICAS Y SUSTANCIAS PSICOTRÓPICAS COMO DETONANTE DE VIOLENCIA HACIA LA MUJER', 'El consumo de alcohol y sustancias psicotrópicas es un problema de salud pública que requiere acciones preventivas inmediatas y promoción de la salud. Además, está relacionado con la violencia contra la mujer.\r\nEl consumo de alcohol se asocia con un mayor riesgo de violencia sexual y\r\nViolencia de pareja. Las consecuencias de la violencia relacionada con el alcohol son graves para las mujeres. Estudios han demostrado que los hombres con\r\nproblemas de alcohol y/o sustancias psicotrópicas, son seis o siete veces más\r\npropensos a estar involucrados en violencia doméstica contra las mujeres que\r\notros individuos. A nivel global, aproximadamente 1 de cada 3 mujeres ha\r\nexperimentado violencia física y/o sexual por parte de su pareja o violencia sexual\r\nno relacionada con la pareja en algún momento de su vida.', '2024', 'I', 'Graduada satisfactoriamente', 'C:/xampp/htdocs/Repository/trabajos/3/7/2024-Kariannys Rodríguez-6787cf6e147fc.pdf', 22, NULL),
(21, 'SISTEMA DE RED DE CLOACAS DE SAN MARTÍN DE TURUMBAMG, SECTOR ESEQUIBO, ESTADO BOLÍVAR', 'El presente estudio basado en el diseño de un sistema de acueducto (Aguas\r\nservidas), se realizó en la población San Martin de Turumbamg con un\r\nnúmero estimado de 40 familias que hacen vida en ese sector, bajo el\r\nauspicio de INVIOBRASBOLIVAR, es un estudio de tipo documental,\r\naplicada y de campo. se desarrollaron los fundamentos teóricos involucrados\r\nen el diseño, como lo son topografía, nivelación, bocas de visita, diámetros\r\nde las tuberías y caudal. Se Calcularon los diámetros de las tuberías\r\nbasados en las especificaciones técnicas de todos los accesorios que\r\nservirán para el desarrollo de toda la red de aguas servidas (red de cloacas)\r\nutilizando la norma N°5318 “Ministerio del ambiente y de los recursos\r\nnaturales renovables y del desarrollo urbano” Los estudios topográficos\r\nfueron suministrados por INVIOBRASBOLÍVAR, que son necesario para la\r\ninstalación de las tuberías. Se indican unos pasos a seguir para la instalación\r\nde una planta de tratamiento de aguas servidas, suministro de: planos,\r\ncómputos métricos y la red de cloacas, así como el análisis de precio unitario\r\npara el costo del diseño. Código UNESCO 3305-30.', '2024', 'II', 'Trabajo Especial de Grado presentado como requisito parcial para optar al título de Ingeniero en Civil', 'C:/xampp/htdocs/Repository/trabajos/1/3/2024-Cesar Hernández-6787d049190c4.pdf', 13, NULL),
(22, 'DISEÑO DE UN URBANO SISTEMA DE DRENAJE PLUVIAL SOSTENIBLE EN PUERTO ORDAZ, CIUDAD GUAYANA', 'Se realizó un diseño de un sistema de drenaje sostenible con pavimentos permeables y adoquines en puerto Ordaz, debido a que los drenajes tradicionales actuales presentan múltiples fallas, ocasionando inundaciones y obstrucciones en la distribución de alcantarillados, esto se debe a que son diseños anticuados, se desarrolló con el objetivo de implementar un diseño de un sistema de drenaje pluvial sostenible. Con el uso efectivo de las metodologías de unidad de análisis, técnicas para analizar los datos y el procedimiento para lograr cada uno de los objetivos. Primeramente, se llevó a cabo una investigación sobre las técnicas y tecnologías de drenajes sostenibles, seleccionando la del pavimento permeable y haciendo un diseño en AutoCAD aplicando esta técnica en un food park. Guiándose de las normas pertinentes como: COVENIN 2000-91 y las normas ASSHTO. Demostrando que se pueden implementar soluciones más', '2024', 'II', 'Trabajo especial de grado presentado como requisito parcial para optar al título de Ingeniero Civil', 'C:/xampp/htdocs/Repository/trabajos/1/3/2024-Jesús Ascanio-6787d0e0187f8.pdf', 23, NULL),
(23, 'EVALUACIÓN DE MATERIALES MODERNOS SOSTENIBLES EN EL ÁREA DE CONSTRUCCIÓN', 'Los estudios actuales indican que el sector de la construcción genera un 40 por ciento de la contaminación global, es por este motivo que se han desarrollados nuevos materiales modernos sostenibles que reducen estas cifras como son el ladrillo ecológico y hormigón translucido, con el objetivo de evaluar las características de resistencia, economía e impacto ambiental se desarrolla la siguiente investigación, para el análisis de resistencia en el caso del ladrillo ecológico se utilizó el método expuesto por la norma COVENIN 42-82 que mediante un caping de una mezcla especial se introduce a la máquina de compresión, y para el hormigón translucido se utilizó la norma UNIT - con ICS 91.100.30 donde se especifican los pasos para realizar el ensayo, para saber la cotización de mercado e impacto ambiental que generan estos materiales se compararon con su predecesores tradicionales. Se registraron datos de resistencia y economía muy similares a los materiales tradicionales y en el caso del impacto ambiental los materiales modernos proporcionaron un ahorro energético lo que hace que pueden destacar en el mercado. Código UNESCO: 3305-99 Nuevos Materiales.', '2024', 'II', 'Trabajo Especial de Grado presentado como requisito parcial para optar al grado de Ingeniero Civil', 'C:/xampp/htdocs/Repository/trabajos/1/3/2024-Jesús Rivas-6787d16c746b5.pdf', 15, NULL),
(24, 'COMPARACIÓN TÉCNICA ENTRE EL USO DEL C-CRETE Y EL CEMENTO PORTLAND PARA EL DESARROLLO DEL CONCRETO', 'La presente investigación se enfocó en comparar técnicamente el uso de C-Crete y cemento Portland en la elaboración de concreto, con la delimitación de analizar específicamente su resistencia, durabilidad y sostenibilidad. El propósito fue determinar cuál material resulta más efectivo en términos de desempeño estructural a corto y largo plazo. Se justificó esta investigación debido a la importancia de seleccionar el material más adecuado para garantizar la calidad y durabilidad de las estructuras de concreto. Se fundamentó teóricamente en estudios previos sobre las propiedades y comportamiento del C-Crete y el cemento Portland en aplicaciones de construcción civil. La metodología utilizada fue de tipo cuantitativo. Se estableció la validez y confiabilidad de los resultados mediante un análisis estadístico de los datos recolectados. Los resultados mostraron que el C-Crete presenta una resistencia inicial superior además de aportar grandes beneficios al ambiente, mientras que el cemento Portland exhibe mejor comportamiento a largo plazo en cuanto a durabilidad. Se recomienda considerar las características específicas de cada material al seleccionarlos para proyectos de construcción, priorizando la durabilidad y resistencia requeridas según las necesidades de cada obra. UNESCO 3305-05.', '2024', 'II', 'Trabajo Especial de Grado presentado como requisito parcial para optar al grado de Ingeniero Civil', 'C:/xampp/htdocs/Repository/trabajos/1/3/2024-José Mendoza-6787d23ec6ca2.pdf', 24, NULL),
(25, 'ESTUDIO DE MEJORAS EN TÉCNICAS DE CIMENTACIÓN PARA SUELOS PROBLEMÁTICOS', 'La Investigación se enmarco en el estudio de mejoras en técnicas de cimentación para suelos problemáticos, los suelos problemáticos presentan características que dificultan la construcción de cimentaciones seguras y estables. Estos suelos pueden generar asentamientos excesivos, fallas estructurales, y otros problemas que comprometen la integridad de las estructuras. Sé planteo como objetivo general estudiar las mejoras en técnicas de cimentación para suelos problemáticos como específicos. Caracterizar los tipos de suelos problemáticos, técnicas de cimentación actuales utilizadas en suelos problemáticos, proponer mejoras o nuevas técnicas de cimentación adaptadas a las características de estos suelos. La investigación fue de tipo documental, con un diseño bibliográfico. Como conclusión se tiene que las técnicas juegan un papel de suma importancia a la hora de realizar alguna cimentación, debido a que permiten conocer el comportamiento en seguridad, estabilidad de las estructuras en terrenos desafiantes. Como recomendación se tiene, que la solución única no existe para la diversidad de suelos problemáticos, pero si existe una manera de mitigar su mecanismo, a través de la realización de estudios geotécnicos minucioso, y trabajar con equipo de profesionales capacitados para generar soluciones especificas para cada problemática. Código UNESCO. 3305-10', '2024', 'II', 'Trabajo Especial de Grado presentado como requisito parcial para optar al grado de Ingeniero Civil', 'C:/xampp/htdocs/Repository/trabajos/1/3/2024-José Ángel Madrid-6787d2db7bcff.pdf', 25, NULL),
(26, 'ANALI SIS DE LA AUDIENCIA PRELIMINA R COMO ACTO FUNDAMENTAL EN EL PROCESO PENAL VENEZOLANO', 'La finalidad de esta investigación es Analizar\r\nla audiencia preliminar como acto fundamental en el proceso\r\npenal Venezolano , como fase intermedia previst o por e l Código Orgánic o Proce sal Penal tiene como objetivo\r\nprofundizar en una fase el fundamento y viabilidad de la etapa encaminada a depurar la acusaci ó n formulada por\r\nel Ministerio Público y la exigencia de realización de juicios orales y públicos. El papel que deben desempeñar\r\nlos jueces de control dentro del proceso penal h a sido un tema ampliamente discutido , por su alta relevancia . El\r\nobjetivo fue brindar un concepto global de la fase intermedia para ello se adoptó un tipo de investigación un\r\ndiseño de investigación bibliográfica o documental, centrándose en el análisis de la etapa intermedia establecid o\r\nen e l Código Orgánico Procesal Penal, a través de esta investigación se pretende llegar a la conclusión de que la\r\ndecisión del juez de control determina los objetivos del procedimiento, establece las calificaciones jurídi cas\r\nprovisionales y determina el tribunal responsable de los juicios orales y públicos e s recomendable para el\r\njuzgador que le corresponde conocer la fase intermedia del proceso que analice detalladamente los fundamentos\r\nde la acusación, por cuanto en la medida en que cumpla la función de depuración , se evitará la remisión a juicio\r\nde causas que irremediablemente en esa fase del proceso tendrán una con secuencia jurídica distinta, la\r\nabsolutoria', '2024', 'II', 'Graduado', 'C:/xampp/htdocs/Repository/trabajos/3/7/2024-Rogelio Jesus Pinto Regnault-6787d48401f26.pdf', 26, NULL),
(27, 'IMPLEMENTACIÓN DE UN SISTEMA DE CONTROL DE REGISTRO DE CLIENTES, PAGOS Y DEUDAS PARA LA EMPRESA RESIDENCIAS PUERTO ORDAZ - ESTADO BOLÍVAR', 'El proyecto realizado en la empresa Residencias Puerto Ordaz, se baso en la implementación de un sistema de información para el control de registro de clientes, pagos y deudas, permitiendo a la empresa incorporarse en la era digital que vivimos. El sistema permite registrar y modificar la información de los clientes de una manera sencilla, realiza de manera automática los aumentos en la deuda diaria de alquiler tomando en cuenta el tipo de apartamento y los cambios en el precio, y permite registrar con detalles los pagos realizados por los huéspedes. Para lograr el desarrollo del sistema fueron analizados el proceso de: registro de clientes, registro y control de pagos y deudas de los huéspedes usando el método de observación directa, lo cual permitió reflejar que los métodos actuales no eran eficientes. Posteriormente, fueron determinados los requerimientos funcionales y no funcionales y elaborados los diagramas de caso de uso, secuencias, clases. Una vez concluido esta fase fue diseñada la interfaz de usuario y la base de datos utilizando los siguientes softwares: Notepad++, XAMPP, el lenguaje de programación PHP y como gestor de base de datos Mysql. Finalmente, fue sometido a pruebas funcionales, de comunicación, rendimiento y seguridad por los especialistas.', '2021', 'I', 'Trabajo de pasantía de grado presentado como requisito parcial para optar al título de ingeniero en informática', 'C:/xampp/htdocs/Repository/trabajos/1/2/2021-Leonardo Walls-6787d6bd71e55.pdf', 27, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo_detalles`
--

CREATE TABLE `trabajo_detalles` (
  `trabajo_id` int(10) NOT NULL,
  `sede_id` smallint(5) NOT NULL,
  `facultad_id` smallint(5) NOT NULL,
  `carrera_id` smallint(5) NOT NULL,
  `area_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `trabajo_detalles`
--

INSERT INTO `trabajo_detalles` (`trabajo_id`, `sede_id`, `facultad_id`, `carrera_id`, `area_id`) VALUES
(18, 3, 3, 7, 18),
(20, 3, 3, 7, 19),
(21, 3, 1, 3, 11),
(22, 3, 1, 3, 11),
(23, 3, 1, 3, 13),
(24, 3, 1, 3, 10),
(25, 3, 1, 3, 10),
(26, 3, 3, 7, 19),
(27, 3, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo_x_tipo_trabajo`
--

CREATE TABLE `trabajo_x_tipo_trabajo` (
  `trabajo_id` int(10) NOT NULL,
  `tipo_trabajo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `trabajo_x_tipo_trabajo`
--

INSERT INTO `trabajo_x_tipo_trabajo` (`trabajo_id`, `tipo_trabajo_id`) VALUES
(18, 2),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 2),
(27, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `tutor_id` int(10) NOT NULL,
  `tutor_nombre` varchar(50) NOT NULL,
  `tipo_tutor_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`tutor_id`, `tutor_nombre`, `tipo_tutor_id`) VALUES
(1, 'Vivelib Rojas', 1),
(2, 'Adalides', 1),
(3, 'Mauricio', 2),
(4, 'Ing. Guillermo Rodríguez', 1),
(5, 'Ing. Rafael Angarita', 1),
(6, 'Zambrano Diego', 1),
(7, 'Diego Zambrano', 1),
(8, 'asasasas', 2),
(9, 'sadsadsa', 1),
(10, 'Abg. Antonio Briceño', 1),
(11, 'Noemy Sotillo', 1),
(12, 'Ing. Zambrano Diego', 1),
(13, 'Abog. Yaurimara Parra', 1),
(14, 'Ing. Elvis Vicent', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor_x_trabajo`
--

CREATE TABLE `tutor_x_trabajo` (
  `tutor_id` int(10) NOT NULL,
  `trabajo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tutor_x_trabajo`
--

INSERT INTO `tutor_x_trabajo` (`tutor_id`, `trabajo_id`) VALUES
(10, 18),
(11, 20),
(4, 21),
(5, 22),
(12, 23),
(7, 24),
(7, 25),
(13, 26),
(14, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(10) NOT NULL,
  `usuario_correo` varchar(50) NOT NULL,
  `usuario_contraseña` varchar(256) NOT NULL,
  `usuario_nombre` varchar(50) NOT NULL,
  `rol_id` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_correo`, `usuario_contraseña`, `usuario_nombre`, `rol_id`) VALUES
(16, 'Carlos4@gmail.com', '$2y$10$K1ECdTfUZIRnbjvDGMjxm.RfVXJCxHAljPz1l13henynTgmtR3Qyq', 'Carlos', 1),
(17, 'uno@gmail.com', '$2y$10$eFYCM70jLV6fng4BZtxp1OYLnl0KCzmrA3uwxECcxps0fKnQQzAY2', 'Moises', 2),
(18, 'nuevo@gmail.com', '$2y$10$k81QX3hzyPDxuDdqH9DQ4egd0jg6V/Bl3gSzjhOBtDBRjfqMsQFry', 'nuevo', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_conocimiento`
--
ALTER TABLE `area_conocimiento`
  ADD PRIMARY KEY (`area_id`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`autor_id`),
  ADD KEY `cede_id` (`sede_id`),
  ADD KEY `facultad_id` (`facultad_id`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`carrera_id`),
  ADD KEY `facultad_id` (`facultad_id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`facultad_id`);

--
-- Indices de la tabla `lineas_x_trabajo`
--
ALTER TABLE `lineas_x_trabajo`
  ADD KEY `trabajo_id` (`trabajo_id`),
  ADD KEY `linea_id` (`linea_id`);

--
-- Indices de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  ADD PRIMARY KEY (`linea_id`);

--
-- Indices de la tabla `linea_x_area`
--
ALTER TABLE `linea_x_area`
  ADD KEY `linea_id` (`linea_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`sede_id`);

--
-- Indices de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  ADD PRIMARY KEY (`tipo_trabajo_id`);

--
-- Indices de la tabla `tipo_tutor`
--
ALTER TABLE `tipo_tutor`
  ADD PRIMARY KEY (`tipo_tutor_id`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`trabajo_id`),
  ADD KEY `facultad_id` (`autor_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `trabajo_detalles`
--
ALTER TABLE `trabajo_detalles`
  ADD KEY `trabajo_id` (`trabajo_id`),
  ADD KEY `sede_id` (`sede_id`),
  ADD KEY `facultad_id` (`facultad_id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `trabajo_x_tipo_trabajo`
--
ALTER TABLE `trabajo_x_tipo_trabajo`
  ADD KEY `trabajo_id` (`trabajo_id`),
  ADD KEY `tipo_trabajo_id` (`tipo_trabajo_id`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`tutor_id`),
  ADD KEY `tipo_tutor_id` (`tipo_tutor_id`);

--
-- Indices de la tabla `tutor_x_trabajo`
--
ALTER TABLE `tutor_x_trabajo`
  ADD KEY `tutor_id` (`tutor_id`),
  ADD KEY `trabajo_id` (`trabajo_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_conocimiento`
--
ALTER TABLE `area_conocimiento`
  MODIFY `area_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `autor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `carrera_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `facultad_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  MODIFY `linea_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `sede_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_trabajo`
--
ALTER TABLE `tipo_trabajo`
  MODIFY `tipo_trabajo_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_tutor`
--
ALTER TABLE `tipo_tutor`
  MODIFY `tipo_tutor_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  MODIFY `trabajo_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `tutor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area_conocimiento`
--
ALTER TABLE `area_conocimiento`
  ADD CONSTRAINT `area_conocimiento_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`carrera_id`);

--
-- Filtros para la tabla `autor`
--
ALTER TABLE `autor`
  ADD CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`sede_id`) REFERENCES `sede` (`sede_id`),
  ADD CONSTRAINT `autor_ibfk_2` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`facultad_id`),
  ADD CONSTRAINT `autor_ibfk_3` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`carrera_id`);

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`facultad_id`);

--
-- Filtros para la tabla `lineas_x_trabajo`
--
ALTER TABLE `lineas_x_trabajo`
  ADD CONSTRAINT `lineas_x_trabajo_ibfk_1` FOREIGN KEY (`linea_id`) REFERENCES `linea_investigacion` (`linea_id`),
  ADD CONSTRAINT `lineas_x_trabajo_ibfk_2` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajo` (`trabajo_id`);

--
-- Filtros para la tabla `linea_x_area`
--
ALTER TABLE `linea_x_area`
  ADD CONSTRAINT `linea_x_area_ibfk_1` FOREIGN KEY (`linea_id`) REFERENCES `linea_investigacion` (`linea_id`),
  ADD CONSTRAINT `linea_x_area_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area_conocimiento` (`area_id`);

--
-- Filtros para la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD CONSTRAINT `trabajo_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `trabajo_ibfk_3` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`);

--
-- Filtros para la tabla `trabajo_detalles`
--
ALTER TABLE `trabajo_detalles`
  ADD CONSTRAINT `trabajo_detalles_ibfk_1` FOREIGN KEY (`sede_id`) REFERENCES `sede` (`sede_id`),
  ADD CONSTRAINT `trabajo_detalles_ibfk_2` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`facultad_id`),
  ADD CONSTRAINT `trabajo_detalles_ibfk_3` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`carrera_id`),
  ADD CONSTRAINT `trabajo_detalles_ibfk_4` FOREIGN KEY (`area_id`) REFERENCES `area_conocimiento` (`area_id`),
  ADD CONSTRAINT `trabajo_detalles_ibfk_6` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajo` (`trabajo_id`);

--
-- Filtros para la tabla `trabajo_x_tipo_trabajo`
--
ALTER TABLE `trabajo_x_tipo_trabajo`
  ADD CONSTRAINT `trabajo_x_tipo_trabajo_ibfk_1` FOREIGN KEY (`tipo_trabajo_id`) REFERENCES `tipo_trabajo` (`tipo_trabajo_id`),
  ADD CONSTRAINT `trabajo_x_tipo_trabajo_ibfk_2` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajo` (`trabajo_id`);

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`tipo_tutor_id`) REFERENCES `tipo_tutor` (`tipo_tutor_id`);

--
-- Filtros para la tabla `tutor_x_trabajo`
--
ALTER TABLE `tutor_x_trabajo`
  ADD CONSTRAINT `tutor_x_trabajo_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutor` (`tutor_id`),
  ADD CONSTRAINT `tutor_x_trabajo_ibfk_2` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajo` (`trabajo_id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

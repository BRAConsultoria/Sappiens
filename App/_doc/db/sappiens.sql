-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16-Jul-2015 às 15:31
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
--
-- Database: `sappiens`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `organograma`
--

CREATE TABLE IF NOT EXISTS `organograma` (
`organogramaCod` int(11) NOT NULL,
  `organogramaRefCod` int(11) DEFAULT NULL,
  `organogramaAncestral` varchar(100) DEFAULT NULL,
  `organogramaClasCod` tinyint(4) DEFAULT NULL,
  `organogramaOrdem` varchar(30) DEFAULT NULL,
  `organogramaNome` varchar(100) DEFAULT NULL,
  `organogramaOrdenavel` enum('A','I') DEFAULT 'A',
  `organogramaStatus` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `organograma`
--

INSERT INTO `organograma` (`organogramaCod`, `organogramaRefCod`, `organogramaAncestral`, `organogramaClasCod`, `organogramaOrdem`, `organogramaNome`, `organogramaOrdenavel`, `organogramaStatus`) VALUES
(1, 1, '|1|', NULL, NULL, 'root', 'A', 'A'),
(2, 1, '|2|1|', 5, NULL, 'Instituição', 'A', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `organograma_clas`
--

CREATE TABLE IF NOT EXISTS `organograma_clas` (
`organogramaClasCod` tinyint(4) NOT NULL,
  `organogramaClasRefCod` int(4) DEFAULT NULL,
  `organogramaClasAncestral` varchar(100) DEFAULT NULL,
  `organogramaClasTipoCod` tinyint(4) NOT NULL,
  `organogramaClasNome` varchar(30) NOT NULL,
  `organogramaClasOrdem` varchar(30) DEFAULT NULL,
  `organogramaClasReordenavel` enum('S','N') NOT NULL DEFAULT 'N',
  `organogramaClasStatus` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `organograma_clas`
--

INSERT INTO `organograma_clas` (`organogramaClasCod`, `organogramaClasRefCod`, `organogramaClasAncestral`, `organogramaClasTipoCod`, `organogramaClasNome`, `organogramaClasOrdem`, `organogramaClasReordenavel`, `organogramaClasStatus`) VALUES
(1, 1, '|1|', 1, 'Públicos', '1', 'S', 'A'),
(2, 1, '|2|1|', 1, 'Governo Federal', '1.1', 'S', 'A'),
(3, 1, '|3|1|', 1, 'Governo Estadual', '1.2', 'S', 'A'),
(4, 1, '|4|1|', 1, 'Governo Municipal', '1.3', 'S', 'A'),
(5, 5, '|5|', 2, 'Privados', '1', 'S', 'A'),
(6, 5, '|6|5|', 2, 'Empresa', '1.1', 'S', 'A'),
(7, 4, '|7|4|1|', 1, 'Poder Executivo', '1.3.1', 'S', 'A'),
(8, 7, '|8|7|4|1|', 1, 'Lotação', '1.3.1.1', 'S', 'A'),
(9, 4, '|9|4|1|', 1, 'Poder Legislativo', '1.3.2', 'S', 'A'),
(10, 9, '|10|9|4|1|', 1, 'Setor', '1.3.2.1', 'S', 'A'),
(11, 9, '|11|9|4|1|', 1, 'Departamento', '1.3.2.2', 'S', 'A'),
(12, 6, '|12|6|5|', 2, 'Setor', '1.1.1', 'S', 'A'),
(13, 8, '|13|8|7|4|1|', 1, 'Diretoria', '1.3.1.1.1', 'N', 'A'),
(14, 13, '|14|13|8|7|4|1|', 1, 'Supervisão', '1.3.1.1.1.1', 'N', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `organograma_clas_tipo`
--

CREATE TABLE IF NOT EXISTS `organograma_clas_tipo` (
`organogramaClasTipoCod` tinyint(4) NOT NULL,
  `organogramaClasTipoNome` varchar(30) NOT NULL,
  `organogramaClasTipoStatus` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `organograma_clas_tipo`
--

INSERT INTO `organograma_clas_tipo` (`organogramaClasTipoCod`, `organogramaClasTipoNome`, `organogramaClasTipoStatus`) VALUES
(1, 'Iniciativa Pública', 'A'),
(2, 'Iniciativa Privada', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `organograma_rel`
--

CREATE TABLE IF NOT EXISTS `organograma_rel` (
`organogramaRelCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `organogramaRefCod` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `organograma_rel`
--

INSERT INTO `organograma_rel` (`organogramaRelCod`, `organogramaCod`, `organogramaRefCod`) VALUES
(2, 3, 2),
(6, 7, 2),
(7, 8, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
`paisCod` tinyint(3) unsigned NOT NULL,
  `paisNome` varchar(50) NOT NULL,
  `paisName` varchar(50) NOT NULL,
  `paisStatus` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=254 ;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`paisCod`, `paisNome`, `paisName`, `paisStatus`) VALUES
(1, 'AFEGANISTÃO', 'AFGHANISTAN', 'A'),
(2, 'ACROTÍRI E DECELIA', 'AKROTIRI E DEKÉLIA', 'A'),
(3, 'ÁFRICA DO SUL', 'SOUTH AFRICA', 'A'),
(4, 'ALBÂNIA', 'ALBANIA', 'A'),
(5, 'ALEMANHA', 'GERMANY', 'A'),
(6, 'AMERICAN SAMOA', 'AMERICAN SAMOA', 'A'),
(7, 'ANDORRA', 'ANDORRA', 'A'),
(8, 'ANGOLA', 'ANGOLA', 'A'),
(9, 'ANGUILLA', 'ANGUILLA', 'A'),
(10, 'ANTÍGUA E BARBUDA', 'ANTIGUA AND BARBUDA', 'A'),
(11, 'ANTILHAS NEERLANDESAS', 'NETHERLANDS ANTILLES', 'A'),
(12, 'ARÁBIA SAUDITA', 'SAUDI ARABIA', 'A'),
(13, 'ARGÉLIA', 'ALGERIA', 'A'),
(14, 'ARGENTINA', 'ARGENTINA', 'A'),
(15, 'ARMÉNIA', 'ARMENIA', 'A'),
(16, 'ARUBA', 'ARUBA', 'A'),
(17, 'AUSTRÁLIA', 'AUSTRALIA', 'A'),
(18, 'ÁUSTRIA', 'AUSTRIA', 'A'),
(19, 'AZERBAIJÃO', 'AZERBAIJAN', 'A'),
(20, 'BAHAMAS', 'BAHAMAS, THE', 'A'),
(21, 'BANGLADECHE', 'BANGLADESH', 'A'),
(22, 'BARBADOS', 'BARBADOS', 'A'),
(23, 'BARÉM', 'BAHRAIN', 'A'),
(24, 'BASSAS DA ÍNDIA', 'BASSAS DA INDIA', 'A'),
(25, 'BÉLGICA', 'BELGIUM', 'A'),
(26, 'BELIZE', 'BELIZE', 'A'),
(27, 'BENIM', 'BENIN', 'A'),
(28, 'BERMUDAS', 'BERMUDA', 'A'),
(29, 'BIELORRÚSSIA', 'BELARUS', 'A'),
(30, 'BOLÍVIA', 'BOLIVIA', 'A'),
(31, 'BÓSNIA E HERZEGOVINA', 'BOSNIA AND HERZEGOVINA', 'A'),
(32, 'BOTSUANA', 'BOTSWANA', 'A'),
(33, 'BRASIL', 'BRAZIL', 'A'),
(34, 'BRUNEI DARUSSALAM', 'BRUNEI DARUSSALAM', 'A'),
(35, 'BULGÁRIA', 'BULGARIA', 'A'),
(36, 'BURQUINA FASO', 'BURKINA FASO', 'A'),
(37, 'BURUNDI', 'BURUNDI', 'A'),
(38, 'BUTÃO', 'BHUTAN', 'A'),
(39, 'CABO VERDE', 'CAPE VERDE', 'A'),
(40, 'CAMARÕES', 'CAMEROON', 'A'),
(41, 'CAMBOJA', 'CAMBODIA', 'A'),
(42, 'CANADÁ', 'CANADA', 'A'),
(43, 'CATAR', 'QATAR', 'A'),
(44, 'CAZAQUISTÃO', 'KAZAKHSTAN', 'A'),
(45, 'CENTRO-AFRICANA REPÚBLICA', 'CENTRAL AFRICAN REPUBLIC', 'A'),
(46, 'CHADE', 'CHAD', 'A'),
(47, 'CHILE', 'CHILE', 'A'),
(48, 'CHINA', 'CHINA', 'A'),
(49, 'CHIPRE', 'CYPRUS', 'A'),
(50, 'COLÔMBIA', 'COLOMBIA', 'A'),
(51, 'COMORES', 'COMOROS', 'A'),
(52, 'CONGO', 'CONGO', 'A'),
(53, 'CONGO REPÚBLICA DEMOCRÁTICA', 'CONGO DEMOCRATIC REPUBLIC', 'A'),
(54, 'COREIA DO NORTE', 'KOREA NORTH', 'A'),
(55, 'COREIA DO SUL', 'KOREA SOUTH', 'A'),
(56, 'COSTA DO MARFIM', 'IVORY COAST', 'A'),
(57, 'COSTA RICA', 'COSTA RICA', 'A'),
(58, 'CROÁCIA', 'CROATIA', 'A'),
(59, 'CUBA', 'CUBA', 'A'),
(60, 'DINAMARCA', 'DENMARK', 'A'),
(61, 'DOMÍNICA', 'DOMINICA', 'A'),
(62, 'EGIPTO', 'EGYPT', 'A'),
(63, 'EMIRADOS ÁRABES UNIDOS', 'UNITED ARAB EMIRATES', 'A'),
(64, 'EQUADOR', 'ECUADOR', 'A'),
(65, 'ERITREIA', 'ERITREA', 'A'),
(66, 'ESLOVÁQUIA', 'SLOVAKIA', 'A'),
(67, 'ESLOVÉNIA', 'SLOVENIA', 'A'),
(68, 'ESPANHA', 'SPAIN', 'A'),
(69, 'ESTADOS UNIDOS', 'UNITED STATES', 'A'),
(70, 'ESTÓNIA', 'ESTONIA', 'A'),
(71, 'ETIÓPIA', 'ETHIOPIA', 'A'),
(72, 'FAIXA DE GAZA', 'GAZA STRIP', 'A'),
(73, 'FIJI', 'FIJI', 'A'),
(74, 'FILIPINAS', 'PHILIPPINES', 'A'),
(75, 'FINLÂNDIA', 'FINLAND', 'A'),
(76, 'FRANÇA', 'FRANCE', 'A'),
(77, 'GABÃO', 'GABON', 'A'),
(78, 'GÂMBIA', 'GAMBIA', 'A'),
(79, 'GANA', 'GHANA', 'A'),
(80, 'GEÓRGIA', 'GEORGIA', 'A'),
(81, 'GIBRALTAR', 'GIBRALTAR', 'A'),
(82, 'GRANADA', 'GRENADA', 'A'),
(83, 'GRÉCIA', 'GREECE', 'A'),
(84, 'GRONELÂNDIA', 'GREENLAND', 'A'),
(85, 'GUADALUPE', 'GUADELOUPE', 'A'),
(86, 'GUAM', 'GUAM', 'A'),
(87, 'GUATEMALA', 'GUATEMALA', 'A'),
(88, 'GUERNSEY', 'GUERNSEY', 'A'),
(89, 'GUIANA', 'GUYANA', 'A'),
(90, 'GUIANA FRANCESA', 'FRENCH GUIANA', 'A'),
(91, 'GUINÉ', 'GUINEA', 'A'),
(92, 'GUINÉ EQUATORIAL', 'EQUATORIAL GUINEA', 'A'),
(93, 'GUINÉ-BISSAU', 'GUINEA-BISSAU', 'A'),
(94, 'HAITI', 'HAITI', 'A'),
(95, 'HONDURAS', 'HONDURAS', 'A'),
(96, 'HONG KONG', 'HONG KONG', 'A'),
(97, 'HUNGRIA', 'HUNGARY', 'A'),
(98, 'IÉMEN', 'YEMEN', 'A'),
(99, 'ILHA BOUVET', 'BOUVET ISLAND', 'A'),
(100, 'ILHA CHRISTMAS', 'CHRISTMAS ISLAND', 'A'),
(101, 'ILHA DE CLIPPERTON', 'CLIPPERTON ISLAND', 'A'),
(102, 'ILHA DE JOÃO DA NOVA', 'JUAN DE NOVA ISLAND', 'A'),
(103, 'ILHA DE MAN', 'ISLE OF MAN', 'A'),
(104, 'ILHA DE NAVASSA', 'NAVASSA ISLAND', 'A'),
(105, 'ILHA EUROPA', 'EUROPA ISLAND', 'A'),
(106, 'ILHA NORFOLK', 'NORFOLK ISLAND', 'A'),
(107, 'ILHA TROMELIN', 'TROMELIN ISLAND', 'A'),
(108, 'ILHAS ASHMORE E CARTIER', 'ASHMORE AND CARTIER ISLANDS', 'A'),
(109, 'ILHAS CAIMAN', 'CAYMAN ISLANDS', 'A'),
(110, 'ILHAS COCOS (KEELING)', 'COCOS (KEELING) ISLANDS', 'A'),
(111, 'ILHAS COOK', 'COOK ISLANDS', 'A'),
(112, 'ILHAS DO MAR DE CORAL', 'CORAL SEA ISLANDS', 'A'),
(113, 'ILHAS FALKLANDS (ILHAS MALVINAS)', 'FALKLAND ISLANDS (ISLAS MALVINAS)', 'A'),
(114, 'ILHAS FEROE', 'FAROE ISLANDS', 'A'),
(115, 'ILHAS GEÓRGIA DO SUL E SANDWICH DO SUL', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'A'),
(116, 'ILHAS MARIANAS DO NORTE', 'NORTHERN MARIANA ISLANDS', 'A'),
(117, 'ILHAS MARSHALL', 'MARSHALL ISLANDS', 'A'),
(118, 'ILHAS PARACEL', 'PARACEL ISLANDS', 'A'),
(119, 'ILHAS PITCAIRN', 'PITCAIRN ISLANDS', 'A'),
(120, 'ILHAS SALOMÃO', 'SOLOMON ISLANDS', 'A'),
(121, 'ILHAS SPRATLY', 'SPRATLY ISLANDS', 'A'),
(122, 'ILHAS VIRGENS AMERICANAS', 'UNITED STATES VIRGIN ISLANDS', 'A'),
(123, 'ILHAS VIRGENS BRITÂNICAS', 'BRITISH VIRGIN ISLANDS', 'A'),
(124, 'ÍNDIA', 'INDIA', 'A'),
(125, 'INDONÉSIA', 'INDONESIA', 'A'),
(126, 'IRÃO', 'IRAN', 'A'),
(127, 'IRAQUE', 'IRAQ', 'A'),
(128, 'IRLANDA', 'IRELAND', 'A'),
(129, 'ISLÂNDIA', 'ICELAND', 'A'),
(130, 'ISRAEL', 'ISRAEL', 'A'),
(131, 'ITÁLIA', 'ITALY', 'A'),
(132, 'JAMAICA', 'JAMAICA', 'A'),
(133, 'JAN MAYEN', 'JAN MAYEN', 'A'),
(134, 'JAPÃO', 'JAPAN', 'A'),
(135, 'JERSEY', 'JERSEY', 'A'),
(136, 'JIBUTI', 'DJIBOUTI', 'A'),
(137, 'JORDÂNIA', 'JORDAN', 'A'),
(138, 'KIRIBATI', 'KIRIBATI', 'A'),
(139, 'KOWEIT', 'KUWAIT', 'A'),
(140, 'LAOS', 'LAOS', 'A'),
(141, 'LESOTO', 'LESOTHO', 'A'),
(142, 'LETÓNIA', 'LATVIA', 'A'),
(143, 'LÍBANO', 'LEBANON', 'A'),
(144, 'LIBÉRIA', 'LIBERIA', 'A'),
(145, 'LÍBIA', 'LIBYAN ARAB JAMAHIRIYA', 'A'),
(146, 'LISTENSTAINE', 'LIECHTENSTEIN', 'A'),
(147, 'LITUÂNIA', 'LITHUANIA', 'A'),
(148, 'LUXEMBURGO', 'LUXEMBOURG', 'A'),
(149, 'MACAU', 'MACAO', 'A'),
(150, 'MACEDÓNIA', 'MACEDONIA', 'A'),
(151, 'MADAGÁSCAR', 'MADAGASCAR', 'A'),
(152, 'MALÁSIA', 'MALAYSIA', 'A'),
(153, 'MALAVI', 'MALAWI', 'A'),
(154, 'MALDIVAS', 'MALDIVES', 'A'),
(155, 'MALI', 'MALI', 'A'),
(156, 'MALTA', 'MALTA', 'A'),
(157, 'MARROCOS', 'MOROCCO', 'A'),
(158, 'MARTINICA', 'MARTINIQUE', 'A'),
(159, 'MAURÍCIA', 'MAURITIUS', 'A'),
(160, 'MAURITÂNIA', 'MAURITANIA', 'A'),
(161, 'MAYOTTE', 'MAYOTTE', 'A'),
(162, 'MÉXICO', 'MEXICO', 'A'),
(163, 'MIANMAR', 'MYANMAR BURMA', 'A'),
(164, 'MICRONÉSIA', 'MICRONESIA', 'A'),
(165, 'MOÇAMBIQUE', 'MOZAMBIQUE', 'A'),
(166, 'MOLDÁVIA', 'MOLDOVA', 'A'),
(167, 'MÓNACO', 'MONACO', 'A'),
(168, 'MONGÓLIA', 'MONGOLIA', 'A'),
(169, 'MONTENEGRO', 'MONTENEGRO', 'A'),
(170, 'MONTSERRAT', 'MONTSERRAT', 'A'),
(171, 'NAMÍBIA', 'NAMIBIA', 'A'),
(172, 'NAURU', 'NAURU', 'A'),
(173, 'NEPAL', 'NEPAL', 'A'),
(174, 'NICARÁGUA', 'NICARAGUA', 'A'),
(175, 'NÍGER', 'NIGER', 'A'),
(176, 'NIGÉRIA', 'NIGERIA', 'A'),
(177, 'NIUE', 'NIUE', 'A'),
(178, 'NORUEGA', 'NORWAY', 'A'),
(179, 'NOVA CALEDÓNIA', 'NEW CALEDONIA', 'A'),
(180, 'NOVA ZELÂNDIA', 'NEW ZEALAND', 'A'),
(181, 'OMÃ', 'OMAN', 'A'),
(182, 'PAÍSES BAIXOS', 'NETHERLANDS', 'A'),
(183, 'PALAU', 'PALAU', 'A'),
(184, 'PALESTINA', 'PALESTINE', 'A'),
(185, 'PANAMÁ', 'PANAMA', 'A'),
(186, 'PAPUÁSIA-NOVA GUINÉ', 'PAPUA NEW GUINEA', 'A'),
(187, 'PAQUISTÃO', 'PAKISTAN', 'A'),
(188, 'PARAGUAI', 'PARAGUAY', 'A'),
(189, 'PERU', 'PERU', 'A'),
(190, 'POLINÉSIA FRANCESA', 'FRENCH POLYNESIA', 'A'),
(191, 'POLÓNIA', 'POLAND', 'A'),
(192, 'PORTO RICO', 'PUERTO RICO', 'A'),
(193, 'PORTUGAL', 'PORTUGAL', 'A'),
(194, 'QUÉNIA', 'KENYA', 'A'),
(195, 'QUIRGUIZISTÃO', 'KYRGYZSTAN', 'A'),
(196, 'REINO UNIDO', 'UNITED KINGDOM', 'A'),
(197, 'REPÚBLICA CHECA', 'CZECH REPUBLIC', 'A'),
(198, 'REPÚBLICA DOMINICANA', 'DOMINICAN REPUBLIC', 'A'),
(199, 'ROMÉNIA', 'ROMANIA', 'A'),
(200, 'RUANDA', 'RWANDA', 'A'),
(201, 'RÚSSIA', 'RUSSIAN FEDERATION', 'A'),
(202, 'SAHARA OCCIDENTAL', 'WESTERN SAHARA', 'A'),
(203, 'SALVADOR', 'EL SALVADOR', 'A'),
(204, 'SAMOA', 'SAMOA', 'A'),
(205, 'SANTA HELENA', 'SAINT HELENA', 'A'),
(206, 'SANTA LÚCIA', 'SAINT LUCIA', 'A'),
(207, 'SANTA SÉ', 'HOLY SEE', 'A'),
(208, 'SÃO CRISTÓVÃO E NEVES', 'SAINT KITTS AND NEVIS', 'A'),
(209, 'SÃO MARINO', 'SAN MARINO', 'A'),
(210, 'SÃO PEDRO E MIQUELÃO', 'SAINT PIERRE AND MIQUELON', 'A'),
(211, 'SÃO TOMÉ E PRÍNCIPE', 'SAO TOME AND PRINCIPE', 'A'),
(212, 'SÃO VICENTE E GRANADINAS', 'SAINT VINCENT AND THE GRENADINES', 'A'),
(213, 'SEICHELES', 'SEYCHELLES', 'A'),
(214, 'SENEGAL', 'SENEGAL', 'A'),
(215, 'SERRA LEOA', 'SIERRA LEONE', 'A'),
(216, 'SÉRVIA', 'SERBIA', 'A'),
(217, 'SINGAPURA', 'SINGAPORE', 'A'),
(218, 'SÍRIA', 'SYRIA', 'A'),
(219, 'SOMÁLIA', 'SOMALIA', 'A'),
(220, 'SRI LANCA', 'SRI LANKA', 'A'),
(221, 'SUAZILÂNDIA', 'SWAZILAND', 'A'),
(222, 'SUDÃO', 'SUDAN', 'A'),
(223, 'SUÉCIA', 'SWEDEN', 'A'),
(224, 'SUÍÇA', 'SWITZERLAND', 'A'),
(225, 'SURINAME', 'SURINAME', 'A'),
(226, 'SVALBARD', 'SVALBARD', 'A'),
(227, 'TAILÂNDIA', 'THAILAND', 'A'),
(228, 'TAIWAN', 'TAIWAN', 'A'),
(229, 'TAJIQUISTÃO', 'TAJIKISTAN', 'A'),
(230, 'TANZÂNIA', 'TANZANIA', 'A'),
(231, 'TERRITÓRIO BRITÂNICO DO OCEANO ÍNDICO', 'BRITISH INDIAN OCEAN TERRITORY', 'A'),
(232, 'TERRITÓRIO DAS ILHAS HEARD E MCDONALD', 'HEARD ISLAND AND MCDONALD ISLANDS', 'A'),
(233, 'TIMOR-LESTE', 'TIMOR-LESTE', 'A'),
(234, 'TOGO', 'TOGO', 'A'),
(235, 'TOKELAU', 'TOKELAU', 'A'),
(236, 'TONGA', 'TONGA', 'A'),
(237, 'TRINDADE E TOBAGO', 'TRINIDAD AND TOBAGO', 'A'),
(238, 'TUNÍSIA', 'TUNISIA', 'A'),
(239, 'TURKS E CAICOS', 'TURKS AND CAICOS ISLANDS', 'A'),
(240, 'TURQUEMENISTÃO', 'TURKMENISTAN', 'A'),
(241, 'TURQUIA', 'TURKEY', 'A'),
(242, 'TUVALU', 'TUVALU', 'A'),
(243, 'UCRÂNIA', 'UKRAINE', 'A'),
(244, 'UGANDA', 'UGANDA', 'A'),
(245, 'URUGUAI', 'URUGUAY', 'A'),
(246, 'USBEQUISTÃO', 'UZBEKISTAN', 'A'),
(247, 'VANUATU', 'VANUATU', 'A'),
(248, 'VENEZUELA', 'VENEZUELA', 'A'),
(249, 'VIETNAME', 'VIETNAM', 'A'),
(250, 'WALLIS E FUTUNA', 'WALLIS AND FUTUNA', 'A'),
(251, 'ZÂMBIA', 'ZAMBIA', 'A'),
(252, 'ZIMBABUÉ', 'ZIMBABWE', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
`pessoaCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `usuarioCod` int(11) DEFAULT NULL,
  `pessoaTipo` enum('F','J') NOT NULL,
  `pessoaStatus` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoaCod`, `organogramaCod`, `usuarioCod`, `pessoaTipo`, `pessoaStatus`) VALUES
(1, 1, 1, 'F', 'A'),
(16, 1, NULL, 'F', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica`
--

CREATE TABLE IF NOT EXISTS `pessoa_fisica` (
`pessoaFisicaCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `pessoaCod` int(11) NOT NULL,
  `pessoaFisicaNome` varchar(30) NOT NULL,
  `pessoaFisicaCPF` varchar(14) NOT NULL,
  `pessoaFisicaDataNascimento` date DEFAULT NULL,
  `pessoaFisicaSexo` enum('M','F','O') DEFAULT NULL,
  `pessoaFisicaStatus` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Extraindo dados da tabela `pessoa_fisica`
--

INSERT INTO `pessoa_fisica` (`pessoaFisicaCod`, `organogramaCod`, `pessoaCod`, `pessoaFisicaNome`, `pessoaFisicaCPF`, `pessoaFisicaDataNascimento`, `pessoaFisicaSexo`, `pessoaFisicaStatus`) VALUES
(1, 1, 1, 'Usuário Sappiens Framework', '024.016.271-46', '1943-05-18', 'M', NULL),
(20, 1, 0, 'TESTE', '024.016.271-46', '2015-06-30', 'M', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ato_legal`
--

CREATE TABLE IF NOT EXISTS `tipo_ato_legal` (
`tipoAtoLegalCod` tinyint(4) NOT NULL,
  `tipoAtoLegalNome` varchar(30) NOT NULL,
  `tipoAtoLegalStatus` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `tipo_ato_legal`
--

INSERT INTO `tipo_ato_legal` (`tipoAtoLegalCod`, `tipoAtoLegalNome`, `tipoAtoLegalStatus`) VALUES
(1, 'CONSTITUIÇÃO FEDERAL', 'A'),
(2, 'DECRETO', 'A'),
(3, 'DECRETO LEGISLATIVO', 'A'),
(4, 'EMENDA', 'A'),
(5, 'LEI COMPLEMENTAR', 'A'),
(6, 'LEI ORDINÁRIA', 'A'),
(7, 'LEI DELEGADA', 'A'),
(8, 'LEI ORGÂNICA', 'A'),
(9, 'MEDIDA PROVISÓRIA', 'A'),
(10, 'PORTARIA', 'A'),
(11, 'RESOLUÇÃO', 'A'),
(12, 'PARECER', 'A'),
(13, 'ORIENTAÇÃO NORMATIVA', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_acao_modulo`
--

CREATE TABLE IF NOT EXISTS `_acao_modulo` (
`acaoModuloCod` int(7) NOT NULL,
  `acaoModuloRefCod` int(7) DEFAULT NULL,
  `moduloCod` int(7) NOT NULL,
  `acaoModuloPermissao` varchar(50) NOT NULL,
  `acaoModuloIdPermissao` varchar(30) NOT NULL,
  `acaoModuloClass` varchar(50) DEFAULT NULL,
  `acaoModuloIcon` varchar(50) DEFAULT NULL,
  `acaoModuloToolTipComPermissao` varchar(75) DEFAULT NULL,
  `acaoModuloToolTipeSemPermissao` varchar(75) DEFAULT NULL,
  `acaoModuloFuncao` varchar(50) DEFAULT NULL,
  `acaoModuloFuncaoJS` varchar(50) DEFAULT NULL,
  `acaoModuloPosicao` int(4) DEFAULT NULL,
  `acaoModuloApresentacao` enum('E','R','I','T') NOT NULL COMMENT 'E = Expandido, R = Recolhido, I = Acao invisivel, T = Tab',
  `acaoModuloVersao` varchar(6) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=759 ;

--
-- Extraindo dados da tabela `_acao_modulo`
--

INSERT INTO `_acao_modulo` (`acaoModuloCod`, `acaoModuloRefCod`, `moduloCod`, `acaoModuloPermissao`, `acaoModuloIdPermissao`, `acaoModuloClass`, `acaoModuloIcon`, `acaoModuloToolTipComPermissao`, `acaoModuloToolTipeSemPermissao`, `acaoModuloFuncao`, `acaoModuloFuncaoJS`, `acaoModuloPosicao`, `acaoModuloApresentacao`, `acaoModuloVersao`) VALUES
(17, NULL, 18, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(18, NULL, 18, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(19, NULL, 18, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(20, NULL, 18, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(21, NULL, 18, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(22, NULL, 18, 'Imprimir', 'prnt', '', 'fa fa-print', '', '', NULL, '', 1, 'R', NULL),
(23, NULL, 19, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(24, NULL, 19, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(25, NULL, 19, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(26, NULL, 19, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(27, NULL, 19, 'Imprimir', 'prnt', '', 'fa fa-print', '', '', NULL, '', 1, 'R', NULL),
(28, NULL, 19, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(29, NULL, 18, 'Personalizar organograma', 'chOrg', '', '', '', '', NULL, '', 1, 'I', NULL),
(30, NULL, 19, 'Alterar tipo de classificação ', 'chTipoClas', '', '', '', '', NULL, '', 1, 'I', NULL),
(31, NULL, 19, 'Permitir reordenar classificaç', 'chReorClas', '', '', '', '', NULL, '', 1, 'I', NULL),
(35, NULL, 22, 'Atualizar', 'filtrar', '', 'fa fa-repeat', NULL, NULL, NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(36, NULL, 22, 'Visualizar', 'visualizar', '', 'fa fa-search', NULL, NULL, NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(37, NULL, 22, 'Inserir', 'cadastrar', '', 'fa fa-plus', NULL, NULL, NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(38, NULL, 22, 'Alterar', 'alterar', '', 'fa fa-pencil', NULL, NULL, NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(39, NULL, 22, 'Remover', 'remover', '', 'fa fa-trash-o', NULL, NULL, NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(40, NULL, 22, 'Imprimir', 'imprimir', '', 'fa fa-print', NULL, NULL, NULL, 'sisImprimir()', 6, 'R', NULL),
(416, NULL, 75, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(417, NULL, 75, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(418, NULL, 75, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(419, NULL, 75, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(420, NULL, 75, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 1, 'R', NULL),
(421, NULL, 75, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(422, NULL, 76, 'Atualizar', 'filtrar', '', 'fa fa-repeat', NULL, NULL, NULL, 'sisFiltrarPadrao()', 1, 'R', NULL),
(423, NULL, 76, 'Visualizar', 'visualizar', '', 'fa fa-search', NULL, NULL, NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(424, NULL, 76, 'Inserir', 'cadastrar', '', 'fa fa-plus', NULL, NULL, NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(425, NULL, 76, 'Alterar', 'alterar', '', 'fa fa-pencil', NULL, NULL, NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(426, NULL, 76, 'Remover', 'remover', '', 'fa fa-trash-o', NULL, NULL, NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(427, NULL, 76, 'Imprimir', 'imprimir', '', 'fa fa-print', NULL, NULL, NULL, 'sisImprimir()', 1, 'R', NULL),
(428, NULL, 76, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', NULL, NULL, NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(429, NULL, 77, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(430, NULL, 77, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(431, NULL, 77, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(432, NULL, 77, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(433, NULL, 77, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(434, NULL, 77, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, '', 1, 'R', NULL),
(435, NULL, 77, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'imprimirPDF()', 1, 'R', NULL),
(436, NULL, 78, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(437, NULL, 78, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(438, NULL, 78, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(439, NULL, 78, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(440, NULL, 78, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(441, NULL, 78, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 1, 'R', NULL),
(442, NULL, 78, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(443, NULL, 79, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(444, NULL, 79, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(445, NULL, 79, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(446, NULL, 79, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(447, NULL, 79, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(448, NULL, 79, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, '', 1, 'R', NULL),
(449, NULL, 79, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'imprimirPDF()', 1, 'R', NULL),
(450, NULL, 80, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(451, NULL, 80, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(452, NULL, 80, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(453, NULL, 80, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(454, NULL, 80, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(455, NULL, 80, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 1, 'R', NULL),
(456, NULL, 80, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(457, NULL, 83, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(458, NULL, 83, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(459, NULL, 83, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(460, NULL, 83, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(461, NULL, 83, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(469, NULL, 82, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', NULL, NULL, NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(470, NULL, 82, 'Imprimir', 'imprimir', '', 'fa fa-print', NULL, NULL, NULL, 'sisImprimir()', 2, 'R', NULL),
(471, NULL, 82, 'Remover', 'remover', '', 'fa fa-trash-o', NULL, NULL, NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(472, NULL, 82, 'Alterar', 'alterar', '', 'fa fa-pencil', NULL, NULL, NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(473, NULL, 82, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', NULL, NULL, NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(474, NULL, 82, 'Visualizar', 'visualizar', '', 'fa fa-search', NULL, NULL, NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(475, NULL, 82, 'Atualizar', 'filtrar', '', 'fa fa-repeat', NULL, NULL, NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(476, NULL, 84, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(477, NULL, 84, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(478, NULL, 84, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(479, NULL, 84, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(480, NULL, 84, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(481, NULL, 84, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, '', 1, 'R', NULL),
(482, NULL, 84, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'imprimirPDF()', 1, 'R', NULL),
(487, NULL, 92, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(488, NULL, 92, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(489, NULL, 92, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(490, NULL, 92, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(491, NULL, 92, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(492, NULL, 92, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 1, 'R', NULL),
(493, NULL, 92, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(494, NULL, 93, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(495, NULL, 93, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(496, NULL, 93, 'Inserir', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(497, NULL, 93, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(498, NULL, 93, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(499, NULL, 93, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 1, 'R', NULL),
(500, NULL, 93, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(507, NULL, 96, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(508, NULL, 96, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(509, NULL, 96, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(510, NULL, 96, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(511, NULL, 96, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(512, NULL, 96, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 2, 'R', NULL),
(513, NULL, 96, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(514, NULL, 97, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(515, NULL, 97, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(516, NULL, 97, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(517, NULL, 97, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(518, NULL, 97, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(519, NULL, 97, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 2, 'R', NULL),
(520, NULL, 97, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(528, NULL, 99, 'Atualizar', 'filtrar', '', 'fa fa-repeat', NULL, NULL, NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(529, NULL, 99, 'Visualizar', 'visualizar', '', 'fa fa-search', NULL, NULL, NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(530, NULL, 99, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', NULL, NULL, NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(531, NULL, 99, 'Alterar', 'alterar', '', 'fa fa-pencil', NULL, NULL, NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(532, NULL, 99, 'Remover', 'remover', '', 'fa fa-trash-o', NULL, NULL, NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(533, NULL, 99, 'Imprimir', 'imprimir', '', 'fa fa-print', NULL, NULL, NULL, 'sisImprimir()', 2, 'R', NULL),
(534, NULL, 99, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', NULL, NULL, NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(535, NULL, 100, 'Atualizar', 'filtrar', '', 'fa fa-repeat', '', '', NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(536, NULL, 100, 'Visualizar', 'visualizar', '', 'fa fa-search', '', '', NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(537, NULL, 100, 'Cadastrar', 'cadastrar', '', 'fa fa-plus', '', '', NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(538, NULL, 100, 'Alterar', 'alterar', '', 'fa fa-pencil', '', '', NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(539, NULL, 100, 'Remover', 'remover', '', 'fa fa-trash-o', '', '', NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(540, NULL, 100, 'Imprimir', 'imprimir', '', 'fa fa-print', '', '', NULL, 'sisImprimir()', 2, 'R', NULL),
(541, NULL, 100, 'Salvar em arquivo PDF', 'salvarPDF', '', 'fa fa-file-pdf-o', '', '', NULL, 'sisSalvarPDF()', 1, 'R', NULL),
(542, NULL, 18, 'Reordenar organograma', 'chReorClas', '', '', '', '', NULL, '', 1, 'I', NULL),
(620, NULL, 10, 'Atualizar', 'filtrar', NULL, 'fa fa-repeat', NULL, NULL, NULL, 'sisFiltrarPadrao()', 1, 'E', NULL),
(621, NULL, 10, 'Visualizar', 'visualizar', NULL, 'fa fa-search', NULL, NULL, NULL, 'sisVisualizarPadrao()', 2, 'E', NULL),
(622, NULL, 10, 'Inserir', 'cadastrar', NULL, 'fa fa-plus', NULL, NULL, NULL, 'sisCadastrarLayoutPadrao()', 3, 'E', NULL),
(623, NULL, 10, 'Alterar', 'alterar', NULL, 'fa fa-pencil', NULL, NULL, NULL, 'sisAlterarLayoutPadrao()', 4, 'E', NULL),
(624, NULL, 10, 'Remover', 'remover', NULL, 'fa fa-trash-o', NULL, NULL, NULL, 'sisRemoverPadrao()', 5, 'E', NULL),
(625, NULL, 10, 'Imprimir', 'prnt', NULL, 'fa fa-print', NULL, NULL, NULL, 'sisImprimir()', 6, 'R', NULL),
(626, NULL, 10, 'Inicial', 'tabPJ1', NULL, 'fa fa-home', NULL, NULL, 'Inicial', NULL, 1, 'T', NULL),
(627, NULL, 10, 'Inserir/Alterar na tab Inicial de Pessoa Jurídica', 'inicialPJAlterar', NULL, NULL, NULL, NULL, NULL, NULL, 11, 'I', NULL),
(628, NULL, 10, 'Sócios e administradores', 'tabPJ2', NULL, 'fa fa-users', NULL, NULL, 'Socios', NULL, 2, 'T', NULL),
(629, NULL, 10, 'Alterar na tab Sócios e administradores de Pessoa ', 'sociosPJAlterar', NULL, NULL, NULL, NULL, NULL, NULL, 21, 'I', NULL),
(630, NULL, 10, 'Documentos', 'tabPJ3', NULL, 'fa fa-leanpub', NULL, NULL, 'Documentos', NULL, 3, 'T', NULL),
(631, NULL, 10, 'Alterar na tab Documentos de Pessoa Jurídica', 'documentosPJAlterar', NULL, NULL, NULL, NULL, NULL, NULL, 31, 'I', NULL),
(632, NULL, 10, 'Contatos', 'tabPJ4', NULL, 'fa fa-street-view', NULL, NULL, 'Contatos', NULL, 4, 'T', NULL),
(633, NULL, 10, 'Alterar na tab Contatos de Pessoa Jurídica', 'contatosPJAlterar', NULL, NULL, NULL, NULL, NULL, NULL, 41, 'I', NULL),
(758, NULL, 22, 'Salvar PDF', 'salvarPDF', NULL, 'fa fa-file-pdf-o', NULL, NULL, NULL, 'sisSalvarPDF()', 5, 'R', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `_grupo`
--

CREATE TABLE IF NOT EXISTS `_grupo` (
`grupoCod` tinyint(3) NOT NULL,
  `grupoNome` varchar(50) NOT NULL,
  `grupoPacote` varchar(50) NOT NULL,
  `grupoPosicao` tinyint(2) NOT NULL DEFAULT '0',
  `grupoClass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `_grupo`
--

INSERT INTO `_grupo` (`grupoCod`, `grupoNome`, `grupoPacote`, `grupoPosicao`, `grupoClass`) VALUES
(6, 'Gestão Administrativa', 'GA', 1, 'menu-icon fa fa-university'),
(7, 'Sistema', 'Sistema', 99, 'menu-icon fa fa-cogs');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_issue`
--

CREATE TABLE IF NOT EXISTS `_issue` (
`issueCod` int(11) unsigned NOT NULL,
  `usuarioCod` int(11) NOT NULL,
  `issueNum` int(6) unsigned zerofill DEFAULT NULL,
  `issueNome` varchar(50) NOT NULL,
  `issueDesc` text NOT NULL,
  `issueData` datetime NOT NULL,
  `issueStatus` enum('N','C','T','H') NOT NULL DEFAULT 'N' COMMENT 'N=Nova, C=Corrigindo, T=Testando, H=Homologado'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `_issue`
--

INSERT INTO `_issue` (`issueCod`, `usuarioCod`, `issueNum`, `issueNome`, `issueDesc`, `issueData`, `issueStatus`) VALUES
(1, 1, 000001, 'Deu problema na parada', 'A parada ficou parada!', '2015-01-27 00:00:00', 'T'),
(2, 1, 000002, 'Teste de função now() em PHP', 'Puxa que puxa!', '2015-01-27 13:29:35', 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_issue_int`
--

CREATE TABLE IF NOT EXISTS `_issue_int` (
`issueIntCod` int(11) unsigned NOT NULL,
  `issueCod` int(11) NOT NULL,
  `usuarioCod` int(11) NOT NULL,
  `issueIntNum` int(6) unsigned zerofill DEFAULT NULL,
  `issueIntDesc` text NOT NULL,
  `issueIntHist` varchar(30) NOT NULL,
  `issueIntData` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `_issue_int`
--

INSERT INTO `_issue_int` (`issueIntCod`, `issueCod`, `usuarioCod`, `issueIntNum`, `issueIntDesc`, `issueIntHist`, `issueIntData`) VALUES
(1, 2, 1, 000001, 'Puxa vida, que chato!', 'N => T', '2015-01-27 00:00:00'),
(2, 2, 2, 000002, 'LOL', 'N => T', '2015-02-15 00:00:00'),
(4, 2, 3, 000003, 'asdasdasd', 'N => T', '2015-02-26 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_log`
--

CREATE TABLE IF NOT EXISTS `_log` (
`logCod` int(11) NOT NULL,
  `usuarioCod` int(11) NOT NULL,
  `moduloCod` int(11) NOT NULL,
  `logHash` varchar(255) NOT NULL,
  `logId` int(11) DEFAULT NULL,
  `logAcao` varchar(100) NOT NULL,
  `logTab` varchar(50) DEFAULT NULL,
  `logSql` text NOT NULL,
  `logDataHora` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2288 ;

--
-- Extraindo dados da tabela `_log`
--

INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(1, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-14 21:49:27'),
(2, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-14 21:49:27'),
(3, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-14 21:49:27'),
(4, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-14 21:49:27'),
(5, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-14 21:49:27'),
(6, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-14 21:49:27'),
(7, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-14 21:49:27'),
(8, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-14 21:49:27'),
(9, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-14 21:49:27'),
(10, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-14 21:49:27'),
(11, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-14 21:49:27'),
(12, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-14 21:49:27'),
(13, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-14 21:49:27'),
(14, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-14 21:49:27'),
(15, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-14 21:49:27'),
(16, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-14 21:49:27'),
(17, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-14 21:49:27'),
(18, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-14 21:49:27'),
(19, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-14 21:49:27'),
(20, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-14 21:49:27'),
(21, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-14 21:49:27'),
(22, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-14 21:49:27'),
(23, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-14 21:49:27'),
(24, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-14 21:49:27'),
(25, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-14 21:49:27'),
(26, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-14 21:49:27'),
(27, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-14 21:49:27'),
(28, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-14 21:49:27'),
(29, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-14 21:49:27'),
(30, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-14 21:49:27'),
(31, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-14 21:49:27'),
(32, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-14 21:49:27'),
(33, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-14 21:49:27'),
(34, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-14 21:49:27'),
(35, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-14 21:49:27'),
(36, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-14 21:49:27'),
(37, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-14 21:49:27'),
(38, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-14 21:49:27'),
(39, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-14 21:49:27'),
(40, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-14 21:49:27'),
(41, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-14 21:49:27'),
(42, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-14 21:49:27'),
(43, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-14 21:49:27'),
(44, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-14 21:49:27'),
(45, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-14 21:49:27'),
(46, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-14 21:49:27'),
(47, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-14 21:49:27'),
(48, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-14 21:49:27'),
(49, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-14 21:49:27'),
(50, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-14 21:49:27'),
(51, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-14 21:49:27'),
(52, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-14 21:49:27'),
(53, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-14 21:49:27'),
(54, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-14 21:49:27'),
(55, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-14 21:49:27'),
(56, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-14 21:49:27'),
(57, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-14 21:49:27'),
(58, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-14 21:49:27'),
(59, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-14 21:49:27'),
(60, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-14 21:49:27'),
(61, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-14 21:49:27'),
(62, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-14 21:49:27'),
(63, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-14 21:49:27'),
(64, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-14 21:49:27'),
(65, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-14 21:49:27'),
(66, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-14 21:49:27'),
(67, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-14 21:49:27'),
(68, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-14 21:49:27'),
(69, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-14 21:49:27'),
(70, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-14 21:49:27'),
(71, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-14 21:49:27'),
(72, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-14 21:49:27'),
(73, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-14 21:49:27'),
(74, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-14 21:49:27'),
(75, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-14 21:49:27'),
(76, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-14 21:49:27'),
(77, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-14 21:49:27'),
(78, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-14 21:49:27'),
(79, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-14 21:49:27'),
(80, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-14 21:49:27'),
(81, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-14 21:49:27'),
(82, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-14 21:49:27'),
(83, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-14 21:49:27'),
(84, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-14 21:49:27'),
(85, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-14 21:49:27'),
(86, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-14 21:49:27'),
(87, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-14 21:49:27'),
(88, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-14 21:49:27'),
(89, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-14 21:49:27'),
(90, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-14 21:49:27'),
(91, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-14 21:49:27'),
(92, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-14 21:49:27'),
(93, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-14 21:49:27'),
(94, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-14 21:49:27'),
(95, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-14 21:49:27'),
(96, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-14 21:49:27'),
(97, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-14 21:49:27'),
(98, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-14 21:49:27'),
(99, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-14 21:49:27'),
(100, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-14 21:49:27'),
(101, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-14 21:49:27'),
(102, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-14 21:49:27'),
(103, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-14 21:49:27'),
(104, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-14 21:49:27'),
(105, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-14 21:49:27'),
(106, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-14 21:49:27'),
(107, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-14 21:49:27'),
(108, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-14 21:49:27'),
(109, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-14 21:49:27'),
(110, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-14 21:49:27'),
(111, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-14 21:49:27'),
(112, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-14 21:49:27'),
(113, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-14 21:49:27'),
(114, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-14 21:49:27'),
(115, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-14 21:49:27'),
(116, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-14 21:49:27'),
(117, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-14 21:49:27'),
(118, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-14 21:49:27'),
(119, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-14 21:49:27'),
(120, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-14 21:49:27'),
(121, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-14 21:49:27'),
(122, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-14 21:49:27'),
(123, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-14 21:49:27'),
(124, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-14 21:49:27'),
(125, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-14 21:49:27'),
(126, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-14 21:49:27'),
(127, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-14 21:49:27'),
(128, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-14 21:49:27'),
(129, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-14 21:49:27'),
(130, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-14 21:49:27'),
(131, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-14 21:49:27'),
(132, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-14 21:49:27'),
(133, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-14 21:49:27'),
(134, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-14 21:49:27'),
(135, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-14 21:49:27'),
(136, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-14 21:49:27'),
(137, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-14 21:49:27'),
(138, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-14 21:49:27'),
(139, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-14 21:49:27'),
(140, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-14 21:49:27'),
(141, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-14 21:49:27'),
(142, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-14 21:49:27'),
(143, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-14 21:49:27'),
(144, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-14 21:49:27'),
(145, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-14 21:49:27'),
(146, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-14 21:49:27'),
(147, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-14 21:49:27'),
(148, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-14 21:49:27'),
(149, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-14 21:49:27'),
(150, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-14 21:49:27'),
(151, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-14 21:49:27'),
(152, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-14 21:49:27'),
(153, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-14 21:49:27'),
(154, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-14 21:49:27'),
(155, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-14 21:49:27'),
(156, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-14 21:49:27'),
(157, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-14 21:49:27'),
(158, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-14 21:49:27'),
(159, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-14 21:49:27'),
(160, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-14 21:49:27'),
(161, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-14 21:49:27'),
(162, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-14 21:49:27'),
(163, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-14 21:49:27'),
(164, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-14 21:49:27'),
(165, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-14 21:49:27'),
(166, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-14 21:49:27'),
(167, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-14 21:49:27'),
(168, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-14 21:49:27'),
(169, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-14 21:49:27'),
(170, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-14 21:49:27'),
(171, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-14 21:49:27'),
(172, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-14 21:49:27'),
(173, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-14 21:49:27'),
(174, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-14 21:49:27'),
(175, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-14 21:49:27'),
(176, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-14 21:49:27'),
(177, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-14 21:49:27'),
(178, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-14 21:49:27'),
(179, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-14 21:49:27'),
(180, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-14 21:49:27'),
(181, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-14 21:49:27'),
(182, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-14 21:49:27'),
(183, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-14 21:49:27'),
(184, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-14 21:49:27'),
(185, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-14 21:49:27'),
(186, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-14 21:49:27'),
(187, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-14 21:49:27'),
(188, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-14 21:49:27'),
(189, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-14 21:49:27'),
(190, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-14 21:49:27'),
(191, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-14 21:49:27'),
(192, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-14 21:49:27'),
(193, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-14 21:49:27'),
(194, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-14 21:49:27'),
(195, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-14 21:49:27'),
(196, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-14 21:49:27'),
(197, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-14 21:49:27'),
(198, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-14 21:49:27'),
(199, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-14 21:49:27'),
(200, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-14 21:49:27'),
(201, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-14 21:49:27'),
(202, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-14 21:49:27'),
(203, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-14 21:49:27'),
(204, 1, 97, '7be312410df0c985b32c370fe4484a81e9cfe8c9ffbeb009fe', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-14 21:49:27'),
(205, 1, 22, '053e3a2455776d84a963b6ceed52ee4faed7801923547c53a2', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 2, pessoaFisicaEscolarNome = '''', pessoaFisicaEscolarDataDiplomacao = ''2000-01-01'' WHERE pessoafisicaescolarcod = 1', '2015-04-14 21:52:55'),
(206, 1, 22, '053e3a2455776d84a963b6ceed52ee4faed7801923547c53a2', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 4, pessoaFisicaEscolarNome = ''eça DE QUEIROZ'', pessoaFisicaEscolarDataDiplomacao = ''2007-01-01'' WHERE pessoafisicaescolarcod = 2', '2015-04-14 21:52:55'),
(207, 1, 22, '053e3a2455776d84a963b6ceed52ee4faed7801923547c53a2', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 6, pessoaFisicaEscolarNome = ''ICEC'', pessoaFisicaEscolarDataDiplomacao = ''2010-01-01'' WHERE pessoafisicaescolarcod = 6', '2015-04-14 21:52:55'),
(208, 1, 22, 'aa604863b8490455cf0e823ed12da92264da7bb8b76c00b594', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 2, pessoaFisicaEscolarNome = '''', pessoaFisicaEscolarDataDiplomacao = ''2000-01-01'' WHERE pessoafisicaescolarcod = 1', '2015-04-14 21:53:19'),
(209, 1, 22, 'aa604863b8490455cf0e823ed12da92264da7bb8b76c00b594', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 4, pessoaFisicaEscolarNome = ''eça DE QUEIROZ'', pessoaFisicaEscolarDataDiplomacao = ''2007-01-01'' WHERE pessoafisicaescolarcod = 2', '2015-04-14 21:53:19'),
(210, 1, 22, 'aa604863b8490455cf0e823ed12da92264da7bb8b76c00b594', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 6, pessoaFisicaEscolarNome = ''ICEC'', pessoaFisicaEscolarDataDiplomacao = ''2010-01-01'' WHERE pessoafisicaescolarcod = 6', '2015-04-14 21:53:19'),
(211, 1, 22, 'aa604863b8490455cf0e823ed12da92264da7bb8b76c00b594', 8, 'alterar', 'escolaridade', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(7, 22, 1, ''uploadPessoaFisicaEscolar1'', ''comp-end-pozzebon2 (2).pdf'', ''2015-04-14'', ''application/pdf'')', '2015-04-14 21:53:19'),
(212, 1, 22, 'aa604863b8490455cf0e823ed12da92264da7bb8b76c00b594', 8, 'alterar', 'escolaridade', 'UPDATE _upload SET uploadNomeFisico = ''87APhd9d1O1GI53hkvqXocFTx2217.pdf'' WHERE uploadCod = 217', '2015-04-14 21:53:19'),
(213, 1, 22, '3d13724404cdf5e82baefeb9a62b8f586760a4f60679ba7403', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-14 21:53:46'),
(214, 1, 22, '59f13042ee9df5b849ad20830c78cbef43f8de71d59f0e0131', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 3, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-14 21:53:57'),
(215, 1, 22, '046c70ae88346b9520047271b576b7f10c3d0822372a779251', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-14 21:54:02'),
(216, 1, 22, '83a6b2bbb1964fc90346d03ddf3f0783809edde8466fdc27d4', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en,es'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-14 21:56:16'),
(217, 1, 18, '96effb854fa159ef288891d7b705a9052450b34aaaa947e51a', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 7,"|")) > 0', '2015-04-14 21:59:05'),
(218, 1, 18, '387cf222673f74a23b2193f92f2c23e5b6dbc859e29e28a0e9', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 7,"|")) > 0', '2015-04-14 21:59:06'),
(219, 1, 96, '45873a7731ef5394e79c24052f0f28d3b88062908a079c9511', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:34'),
(220, 1, 96, '0cdeeddda4a733323f0ad3e686d6caee23d9e015b5fc8473c3', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:36'),
(221, 1, 96, 'c6d2cfa1a9b029db858b3f3f263a0a445a4271d761e1904fdc', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:38'),
(222, 1, 96, 'a3bded96b0e679491d03c89e0d8322642094d337a783b909c3', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:39'),
(223, 1, 96, '58aaa591a7a07b0db9d05bddf053e40bbbdcf5b1b0ec25bab2', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:43'),
(224, 1, 96, '024db407304402ef589ec8ca6dec7647e8d7b94dd53e5f02c8', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 7,''|'')) > 0', '2015-04-14 21:59:44'),
(225, 1, 18, '2e4c6abaa23b97c642d4b81fdbf69bb00f35bffadb64812053', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 21:59:58'),
(226, 1, 18, '2ed125c03002fa3b4f198aa80cf97259f772ad90a44fc2f7b7', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:00:00'),
(229, 1, 18, 'b871b6ff21dd175f3b5c7971904ccd2fb8d9e8b3931c056823', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:02:23'),
(230, 1, 96, 'c2def2cba27b67b39720b8dd41b73a3c0ce73df70f745fcada', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-14 22:02:28'),
(231, 1, 96, '80916f170869721d6551eae1cbf325f3f5ec8ad98352a07bcd', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-14 22:02:30'),
(232, 1, 18, 'e324d13de17063bc35b41f3ba7defbb7e6c108b63489c27880', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:02:51'),
(233, 1, 18, '42820fb120938369e7c86980f096e3569eff3108ff6df1b034', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:02:53'),
(234, 1, 18, 'a78aae826fb8d1824fff55aa2d712e39687f45c4f6b4d3813b', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE  (organogramaNome LIKE ''%amaral%'') ', '2015-04-14 22:02:59'),
(235, 1, 18, '60f46e9233c1ddb3e5386ece32fa02472405a07efdd2a45a9a', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:03:01'),
(236, 1, 18, '0d78f7a3e6afa8e8b79d844f7d9af5769f4686fee41327ee8e', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE  (organogramaNome LIKE ''%assistente%'') ', '2015-04-14 22:03:10'),
(237, 1, 18, '230339daaf5aefc9b85de4414b73bfac7f449e6cb8d2de5948', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:03:11'),
(238, 1, 18, 'ba1708ad1785e83dad55378abe4e9e51b4d36fcba890a1d0ae', 5, 'alterar', NULL, 'UPDATE organograma SET organogramaRefCod = 3, organogramaAncestral = ''|5|3|2|1|'', organogramaClasCod = 6, organogramaNome = ''GSPrev Assessoria Teste'', organogramaOrdem = 1.2, organogramaOrdenavel = ''A'', organogramaStatus = ''A'' WHERE organogramaCod = 5', '2015-04-14 22:03:38'),
(239, 1, 18, '494935f3d80c0f5c05b298ac92f4c3b2a5e8df7e470a1966e7', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:03:39'),
(240, 1, 18, 'ee8179844ef9378e75547e9cbbc51c091554d76df116767e11', 5, 'alterar', NULL, 'UPDATE organograma SET organogramaRefCod = 3, organogramaAncestral = ''|5|3|2|1|'', organogramaClasCod = 6, organogramaNome = ''GSPrev Assessoria'', organogramaOrdem = 1.2, organogramaOrdenavel = ''A'', organogramaStatus = ''A'' WHERE organogramaCod = 5', '2015-04-14 22:03:51'),
(241, 1, 18, 'ecc9bff147057691ccc8923d3b171d54d7c3613fd63323287f', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:03:51'),
(244, 1, 18, '213a1ac59f67704e9a29ed29bc72000e52c1211b5b47bfee40', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-14 22:04:27'),
(245, 1, 83, 'a29d1ec51ebdc3f2442e93157973671a93600e17a39e171fd4', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-14 22:50:07'),
(246, 1, 83, '3154da8b68208ad2c310cff17b52d47ce62285d1880f95d61f', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-14 22:50:09'),
(247, 1, 96, 'b086160e180ecf81b5c81410775e6a7a479ae2e4cd2d5cac99', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-14 22:50:32'),
(248, 1, 96, 'a49f5f4d545c8ec50606edcfdab0c22f411d7a13092652dbad', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-14 22:50:34'),
(249, 1, 97, '993d0b7f5b7b917aa65f3bd75ea886f1a7813610b4b0c507c1', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-14 22:50:41');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(250, 1, 97, '18929ec3cf684ff4887b9506d6c10e66bbc9d47586a4399c8d', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-14 22:50:42'),
(251, 1, 97, 'a5ab204eb31cb5bbb61dbc548430c924b4b9ea4779fcd55d99', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-14 22:50:47'),
(252, 1, 97, 'fc7f33ff36438b01e2f6ad501e9c8d402461359a77b6b0d8e3', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-14 22:50:49'),
(253, 1, 83, '2775fb289351d6510b3b649a7cbb6534aceea12e9ebe1b957e', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-14 22:50:50'),
(254, 1, 83, 'b8aeeaad12804602a6f8ca2e1f43cc6dd3bf0c387f3f105c8d', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-14 22:50:52'),
(255, 1, 22, '58fa25173ef966ea78ab8b912c346ffb1bc07ed8432e5fabbf', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Antonio Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en,es'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-15 07:51:22'),
(256, 1, 22, '08c92580fd0e5c2595d10be39f214e6c1729c5482ff2b16ca5', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 2, pessoaFisicaEscolarNome = '''', pessoaFisicaEscolarDataDiplomacao = ''2000-01-01'' WHERE pessoafisicaescolarcod = 1', '2015-04-15 08:02:49'),
(257, 1, 22, '08c92580fd0e5c2595d10be39f214e6c1729c5482ff2b16ca5', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 4, pessoaFisicaEscolarNome = ''eça DE QUEIROZ'', pessoaFisicaEscolarDataDiplomacao = ''2007-01-01'' WHERE pessoafisicaescolarcod = 2', '2015-04-15 08:02:49'),
(258, 1, 22, '08c92580fd0e5c2595d10be39f214e6c1729c5482ff2b16ca5', 8, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 6, pessoaFisicaEscolarNome = ''ICEC'', pessoaFisicaEscolarDataDiplomacao = ''2010-01-01'' WHERE pessoafisicaescolarcod = 6', '2015-04-15 08:02:49'),
(259, 1, 22, 'ff0d3e8354c58d433f7875c70f2ef1a90b3b667a3efcbe3dd0', 1, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Ane Carolina Leite'', pessoaFisicaDataNascimento = ''1992-02-04'', pessoaFisicaSexo = ''F'', pessoaFisicaIdiomas = ''pt-br,es'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 1', '2015-04-15 11:12:53'),
(260, 1, 83, '64025a7174695aa02086b2448198ee79a569b14fd596fc84c9', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-15 12:22:36'),
(261, 1, 83, '6631efc7a977086c95ce3cc1ed5aa20b082dd0479fd1a25634', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-15 12:22:38'),
(268, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_email SET pessoaFisicaEmail = ''carol@braconsultoria.com.br'', pessoaFisicaEmailStatus = ''A'' WHERE pessoafisicaemailcod = 9', '2015-04-17 01:32:42'),
(269, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_telefone SET pessoaFisicaTelefone = ''(81) 9777-6668'', pessoaFisicaTelefoneStatus = ''A'' WHERE pessoafisicatelefonecod = 2', '2015-04-17 01:32:42'),
(270, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_url SET pessoaFisicaUrlTipo = ''fa-facebook'', pessoaFisicaUrl = ''fb.me/cpozzebon'', pessoaFisicaUrlStatus = ''A'' WHERE pessoafisicaurlcod = 1', '2015-04-17 01:32:43'),
(271, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78045008, pessoaFisicaEnderecoNome = ''Avenida Presidente Joaquim Augusto da Costa Marque'', pessoaFisicaEnderecoNumero = 1195, pessoaFisicaEnderecoComplemento = ''Sala 208'', pessoaFisicaEnderecoBairro = ''Santa Helena'', ufCidadeCod = 0, pessoaFisicaEnderecoTipo = ''C'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 10', '2015-04-17 01:32:44'),
(272, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78060581, pessoaFisicaEnderecoNome = ''Avenida Jornalista Arquimedes Pereira Lima'', pessoaFisicaEnderecoNumero = 870, pessoaFisicaEnderecoComplemento = ''Torre 2'', pessoaFisicaEnderecoBairro = ''Jardim das Américas'', ufCidadeCod = 0, pessoaFisicaEnderecoTipo = ''R'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 11', '2015-04-17 01:32:44'),
(273, 1, 22, '79ae6e469224f664c5679f40aa0ad3562c09b07b60b75c6758', 1, 'alterar', 'contato', 'INSERT INTO pessoa_fisica_endereco (pessoaFisicaEnderecoCep, pessoaFisicaEnderecoNome, pessoaFisicaEnderecoNumero, pessoaFisicaEnderecoComplemento, pessoaFisicaEnderecoBairro, ufCidadeCod, pessoaFisicaEnderecoTipo, pessoaFisicaEnderecoStatus, pessoaFisicaCod) VALUES(78045008, ''Avenida Presidente Joaquim Augusto da Costa Marques'', 1195, ''Sala 208'', ''Santa Helena'', 4347, ''C'', ''A'', 1)', '2015-04-17 01:32:45'),
(274, 1, 22, '253c7c58a2b4bd3042fe2cea9c2fb64283bb51848b0b076150', 1, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Ane Carolina Leite'', pessoaFisicaDataNascimento = ''1992-02-04'', pessoaFisicaSexo = ''F'', pessoaFisicaIdiomas = ''pt-br'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 1', '2015-04-17 01:34:09'),
(275, 1, 22, '253c7c58a2b4bd3042fe2cea9c2fb64283bb51848b0b076150', 1, 'alterar', 'inicial', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 227)', '2015-04-17 01:34:11'),
(276, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_rg SET pessoaFisicaRGNumeros = 127798351, pessoaFisicaRGDataEmissao = ''2015-04-02'', entidadeClasseCod = 2, ufCod = 4 WHERE pessoafisicargcod = 9', '2015-04-17 01:37:27'),
(277, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cpf SET pessoaFisicaCPFNumeros = ''036.262.261-23'' WHERE pessoafisicacpfcod = 1', '2015-04-17 01:37:28'),
(278, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnh SET pessoaFisicaCNHRegistro = 02330352861, pessoaFisicaCNHDataPrimHab = ''2002-05-08'', pessoaFisicaCNHDataEmissao = ''2012-12-10'', pessoaFisicaCNHDataValidade = ''2017-11-25'', pessoaFisicaCNHCategoria = ''AB'', ufCidadeCod = 5362 WHERE pessoafisicacnhcod = 1', '2015-04-17 01:37:30'),
(279, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_tit_ele SET pessoaFisicaTitEleNumeros = 123123, ufCidadeCod = 5362, pessoaFisicaTitEleZona = 024, pessoaFisicaTitEleSecao = 011 WHERE pessoafisicatitelecod = 1', '2015-04-17 01:37:31'),
(280, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nit SET pessoaFisicaNITNumeros = ''123.45678.90-0'' WHERE pessoafisicanitcod = 1', '2015-04-17 01:37:32'),
(281, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nis SET pessoaFisicaNISNumeros = 12345678999 WHERE pessoafisicaniscod = 1', '2015-04-17 01:37:33'),
(282, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pis SET pessoaFisicaPISNumeros = 12312312123 WHERE pessoafisicapiscod = 1', '2015-04-17 01:37:34'),
(283, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pasep SET pessoaFisicaPASEPNumeros = 32132132132 WHERE pessoafisicapasepcod = 1', '2015-04-17 01:37:36'),
(284, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnis SET pessoaFisicaCNISNumeros = 01234567890 WHERE pessoafisicacniscod = 1', '2015-04-17 01:37:37'),
(285, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cei SET pessoaFisicaCEINumeros = 24242424242 WHERE pessoafisicaceicod = 1', '2015-04-17 01:37:38'),
(286, 1, 22, 'fbc52ef370605275d86fb1306cde9930e5167b7fd42288b31d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_ctps SET pessoaFisicaCTPSNumeros = 123456, pessoaFisicaCTPSSerie = 012, pessoaFisicaCTPSDataEmissao = ''2015-04-06'' WHERE pessoafisicactpscod = 1', '2015-04-17 01:37:39'),
(287, 1, 22, '69aa8e028467742f8ee17647cd1be53dbcdb1203c375fb3dec', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en,es'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-17 01:39:18'),
(288, 1, 22, '69aa8e028467742f8ee17647cd1be53dbcdb1203c375fb3dec', 8, 'alterar', 'inicial', 'DELETE FROM _upload WHERE (organogramaCod = 7) AND (uploadcodreferencia = 8) AND (uploadcod = 225)', '2015-04-17 01:39:19'),
(329, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_email SET pessoaFisicaEmail = ''carol@braconsultoria.com.br'', pessoaFisicaEmailStatus = ''A'' WHERE pessoafisicaemailcod = 9', '2015-04-17 16:57:31'),
(330, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_telefone SET pessoaFisicaTelefone = ''(81) 9777-6668'', pessoaFisicaTelefoneStatus = ''A'' WHERE pessoafisicatelefonecod = 2', '2015-04-17 16:57:31'),
(331, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_url SET pessoaFisicaUrlTipo = ''fa-facebook'', pessoaFisicaUrl = ''fb.me/cpozzebon'', pessoaFisicaUrlStatus = ''A'' WHERE pessoafisicaurlcod = 1', '2015-04-17 16:57:31'),
(332, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78045008, pessoaFisicaEnderecoNome = ''Avenida Presidente Joaquim Augusto da Costa Marques'', pessoaFisicaEnderecoNumero = 1195, pessoaFisicaEnderecoComplemento = ''Sala 208'', pessoaFisicaEnderecoBairro = ''Santa Helena'', ufCidadeCod = 4347, pessoaFisicaEnderecoTipo = ''C'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 22', '2015-04-17 16:57:31'),
(333, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'DELETE FROM pessoa_fisica_endereco WHERE pessoafisicaenderecocod = 10', '2015-04-17 16:57:31'),
(334, 1, 22, '36f3e3df8a41780365ae5ada801a02052e783648b9bfb6268e', 1, 'alterar', 'contato', 'DELETE FROM pessoa_fisica_endereco WHERE pessoafisicaenderecocod = 11', '2015-04-17 16:57:31'),
(335, 1, 22, '98e7d1156657fc052c54056a5acaf52e8046420c6b03ba7c54', 1, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Ane Carolina Leite'', pessoaFisicaDataNascimento = ''1992-02-04'', pessoaFisicaSexo = ''F'', pessoaFisicaIdiomas = ''pt-br'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 1', '2015-04-17 16:59:20'),
(336, 1, 22, '98e7d1156657fc052c54056a5acaf52e8046420c6b03ba7c54', 1, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 22, 1, ''uploadPessoaFisicaFoto'', ''10294509_694901777236538_8931922921231469227_n.jpg'', ''2015-04-17'', ''image/jpeg'')', '2015-04-17 16:59:20'),
(337, 1, 22, '98e7d1156657fc052c54056a5acaf52e8046420c6b03ba7c54', 1, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''77gpVwWebnHLs20vt8zvMrkkT6228.jpg'' WHERE uploadCod = 228', '2015-04-17 16:59:20'),
(338, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_rg SET pessoaFisicaRGNumeros = 127798351, pessoaFisicaRGDataEmissao = ''2015-04-02'', entidadeClasseCod = 2, ufCod = 4 WHERE pessoafisicargcod = 9', '2015-04-17 17:00:35'),
(339, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 9) AND (uploadcod = 192)', '2015-04-17 17:00:35'),
(340, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cpf SET pessoaFisicaCPFNumeros = ''036.262.261-23'' WHERE pessoafisicacpfcod = 1', '2015-04-17 17:00:35'),
(341, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnh SET pessoaFisicaCNHRegistro = 02330352861, pessoaFisicaCNHDataPrimHab = ''2002-05-08'', pessoaFisicaCNHDataEmissao = ''2012-12-10'', pessoaFisicaCNHDataValidade = ''2017-11-25'', pessoaFisicaCNHCategoria = ''AB'', ufCidadeCod = 5362 WHERE pessoafisicacnhcod = 1', '2015-04-17 17:00:35'),
(342, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_tit_ele SET pessoaFisicaTitEleNumeros = 123123, ufCidadeCod = 5362, pessoaFisicaTitEleZona = 024, pessoaFisicaTitEleSecao = 011 WHERE pessoafisicatitelecod = 1', '2015-04-17 17:00:35'),
(343, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nit SET pessoaFisicaNITNumeros = ''123.45678.90-0'' WHERE pessoafisicanitcod = 1', '2015-04-17 17:00:35'),
(344, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nis SET pessoaFisicaNISNumeros = 12345678999 WHERE pessoafisicaniscod = 1', '2015-04-17 17:00:35'),
(345, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pis SET pessoaFisicaPISNumeros = 12312312123 WHERE pessoafisicapiscod = 1', '2015-04-17 17:00:35'),
(346, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pasep SET pessoaFisicaPASEPNumeros = 32132132132 WHERE pessoafisicapasepcod = 1', '2015-04-17 17:00:35'),
(347, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnis SET pessoaFisicaCNISNumeros = 01234567890 WHERE pessoafisicacniscod = 1', '2015-04-17 17:00:35'),
(348, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cei SET pessoaFisicaCEINumeros = 24242424242 WHERE pessoafisicaceicod = 1', '2015-04-17 17:00:35'),
(349, 1, 22, '2f9dc40dd966fa18bc7c72afbe3ba538f779383b907be3ed2c', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_ctps SET pessoaFisicaCTPSNumeros = 123456, pessoaFisicaCTPSSerie = 012, pessoaFisicaCTPSDataEmissao = ''2015-04-06'' WHERE pessoafisicactpscod = 1', '2015-04-17 17:00:35'),
(350, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_rg SET pessoaFisicaRGNumeros = 127798351, pessoaFisicaRGDataEmissao = ''2015-04-02'', entidadeClasseCod = 2, ufCod = 4 WHERE pessoafisicargcod = 9', '2015-04-17 17:00:59'),
(351, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cpf SET pessoaFisicaCPFNumeros = ''036.262.261-23'' WHERE pessoafisicacpfcod = 1', '2015-04-17 17:00:59'),
(352, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 196)', '2015-04-17 17:00:59'),
(353, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnh SET pessoaFisicaCNHRegistro = 02330352861, pessoaFisicaCNHDataPrimHab = ''2002-05-08'', pessoaFisicaCNHDataEmissao = ''2012-12-10'', pessoaFisicaCNHDataValidade = ''2017-11-25'', pessoaFisicaCNHCategoria = ''AB'', ufCidadeCod = 5362 WHERE pessoafisicacnhcod = 1', '2015-04-17 17:00:59'),
(354, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_tit_ele SET pessoaFisicaTitEleNumeros = 123123, ufCidadeCod = 5362, pessoaFisicaTitEleZona = 024, pessoaFisicaTitEleSecao = 011 WHERE pessoafisicatitelecod = 1', '2015-04-17 17:00:59'),
(355, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nit SET pessoaFisicaNITNumeros = ''123.45678.90-0'' WHERE pessoafisicanitcod = 1', '2015-04-17 17:00:59'),
(356, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nis SET pessoaFisicaNISNumeros = 12345678999 WHERE pessoafisicaniscod = 1', '2015-04-17 17:00:59'),
(357, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pis SET pessoaFisicaPISNumeros = 12312312123 WHERE pessoafisicapiscod = 1', '2015-04-17 17:01:00'),
(358, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pasep SET pessoaFisicaPASEPNumeros = 32132132132 WHERE pessoafisicapasepcod = 1', '2015-04-17 17:01:00'),
(359, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnis SET pessoaFisicaCNISNumeros = 01234567890 WHERE pessoafisicacniscod = 1', '2015-04-17 17:01:00'),
(360, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cei SET pessoaFisicaCEINumeros = 24242424242 WHERE pessoafisicaceicod = 1', '2015-04-17 17:01:00'),
(361, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_ctps SET pessoaFisicaCTPSNumeros = 123456, pessoaFisicaCTPSSerie = 012, pessoaFisicaCTPSDataEmissao = ''2015-04-06'' WHERE pessoafisicactpscod = 1', '2015-04-17 17:01:00'),
(362, 1, 22, '17989160bfac772a25c0fdd906411f20f7ce9f8f9f3b7abdab', 1, 'alterar', 'documento', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 195)', '2015-04-17 17:01:00'),
(363, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_rg SET pessoaFisicaRGNumeros = 127798351, pessoaFisicaRGDataEmissao = ''2015-04-02'', entidadeClasseCod = 2, ufCod = 4 WHERE pessoafisicargcod = 9', '2015-04-17 17:01:50'),
(364, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 22, 9, ''uploadRG9'', ''cemat-11-2014-escritorio.pdf'', ''2015-04-17'', ''application/pdf'')', '2015-04-17 17:01:50'),
(365, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE _upload SET uploadNomeFisico = ''15AwEgcVZMjYE48oo1cIGS927U229.pdf'' WHERE uploadCod = 229', '2015-04-17 17:01:50'),
(366, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cpf SET pessoaFisicaCPFNumeros = ''036.262.261-23'' WHERE pessoafisicacpfcod = 1', '2015-04-17 17:01:50'),
(367, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnh SET pessoaFisicaCNHRegistro = 02330352861, pessoaFisicaCNHDataPrimHab = ''2002-05-08'', pessoaFisicaCNHDataEmissao = ''2012-12-10'', pessoaFisicaCNHDataValidade = ''2017-11-25'', pessoaFisicaCNHCategoria = ''AB'', ufCidadeCod = 5362 WHERE pessoafisicacnhcod = 1', '2015-04-17 17:01:50'),
(368, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_tit_ele SET pessoaFisicaTitEleNumeros = 123123, ufCidadeCod = 5362, pessoaFisicaTitEleZona = 024, pessoaFisicaTitEleSecao = 011 WHERE pessoafisicatitelecod = 1', '2015-04-17 17:01:50'),
(369, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nit SET pessoaFisicaNITNumeros = ''123.45678.90-0'' WHERE pessoafisicanitcod = 1', '2015-04-17 17:01:50'),
(370, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_nis SET pessoaFisicaNISNumeros = 12345678999 WHERE pessoafisicaniscod = 1', '2015-04-17 17:01:50'),
(371, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pis SET pessoaFisicaPISNumeros = 12312312123 WHERE pessoafisicapiscod = 1', '2015-04-17 17:01:50'),
(372, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_pasep SET pessoaFisicaPASEPNumeros = 32132132132 WHERE pessoafisicapasepcod = 1', '2015-04-17 17:01:50'),
(373, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cnis SET pessoaFisicaCNISNumeros = 01234567890 WHERE pessoafisicacniscod = 1', '2015-04-17 17:01:50'),
(374, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_cei SET pessoaFisicaCEINumeros = 24242424242 WHERE pessoafisicaceicod = 1', '2015-04-17 17:01:50'),
(375, 1, 22, '17a572420e705528c2fcbc00ab891ca1650cb9158709c00b6d', 1, 'alterar', 'documento', 'UPDATE pessoa_fisica_ctps SET pessoaFisicaCTPSNumeros = 123456, pessoaFisicaCTPSSerie = 012, pessoaFisicaCTPSDataEmissao = ''2015-04-06'' WHERE pessoafisicactpscod = 1', '2015-04-17 17:01:50'),
(396, 1, 22, 'b79911856e891d04d755177a0ad6021472291e2ccaeeb7fd2e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_email SET pessoaFisicaEmail = ''carol@braconsultoria.com.br'', pessoaFisicaEmailStatus = ''A'' WHERE pessoafisicaemailcod = 9', '2015-04-18 09:54:56'),
(397, 1, 22, 'b79911856e891d04d755177a0ad6021472291e2ccaeeb7fd2e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_telefone SET pessoaFisicaTelefone = ''(81) 9777-6668'', pessoaFisicaTelefoneStatus = ''A'' WHERE pessoafisicatelefonecod = 2', '2015-04-18 09:54:56'),
(398, 1, 22, 'b79911856e891d04d755177a0ad6021472291e2ccaeeb7fd2e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_url SET pessoaFisicaUrlTipo = ''fa-facebook'', pessoaFisicaUrl = ''fb.me/cpozzebon'', pessoaFisicaUrlStatus = ''A'' WHERE pessoafisicaurlcod = 1', '2015-04-18 09:54:56'),
(399, 1, 22, 'b79911856e891d04d755177a0ad6021472291e2ccaeeb7fd2e', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78045008, pessoaFisicaEnderecoNome = ''Avenida Presidente Joaquim Augusto da Costa Marques'', pessoaFisicaEnderecoNumero = 1195, pessoaFisicaEnderecoComplemento = ''Sala 208'', pessoaFisicaEnderecoBairro = ''Santa Helena'', ufCidadeCod = 4347, pessoaFisicaEnderecoTipo = ''C'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 22', '2015-04-18 09:54:56'),
(400, 1, 22, 'b79911856e891d04d755177a0ad6021472291e2ccaeeb7fd2e', 1, 'alterar', 'contato', 'INSERT INTO pessoa_fisica_endereco (pessoaFisicaEnderecoCep, pessoaFisicaEnderecoNome, pessoaFisicaEnderecoNumero, pessoaFisicaEnderecoComplemento, pessoaFisicaEnderecoBairro, ufCidadeCod, pessoaFisicaEnderecoTipo, pessoaFisicaEnderecoStatus, pessoaFisicaCod) VALUES(78060581, ''Avenida Jornalista Arquimedes Pereira Lima'', 870, ''Torre 2'', ''Jardim das Américas'', 4347, ''R'', ''A'', 1)', '2015-04-18 09:54:56'),
(401, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_email SET pessoaFisicaEmail = ''carol@braconsultoria.com.br'', pessoaFisicaEmailStatus = ''A'' WHERE pessoafisicaemailcod = 9', '2015-04-18 09:55:16'),
(402, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_telefone SET pessoaFisicaTelefone = ''(81) 9777-6668'', pessoaFisicaTelefoneStatus = ''A'' WHERE pessoafisicatelefonecod = 2', '2015-04-18 09:55:16'),
(403, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_url SET pessoaFisicaUrlTipo = ''fa-facebook'', pessoaFisicaUrl = ''fb.me/cpozzebon'', pessoaFisicaUrlStatus = ''A'' WHERE pessoafisicaurlcod = 1', '2015-04-18 09:55:16'),
(404, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78045008, pessoaFisicaEnderecoNome = ''Avenida Presidente Joaquim Augusto da Costa Marques'', pessoaFisicaEnderecoNumero = 1195, pessoaFisicaEnderecoComplemento = ''Sala 208'', pessoaFisicaEnderecoBairro = ''Santa Helena'', ufCidadeCod = 4347, pessoaFisicaEnderecoTipo = ''C'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 22', '2015-04-18 09:55:16'),
(405, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE pessoa_fisica_endereco SET pessoaFisicaEnderecoCep = 78060581, pessoaFisicaEnderecoNome = ''Avenida Jornalista Arquimedes Pereira Lima'', pessoaFisicaEnderecoNumero = 870, pessoaFisicaEnderecoComplemento = ''Torre 2'', pessoaFisicaEnderecoBairro = ''Jardim das Américas'', ufCidadeCod = 4347, pessoaFisicaEnderecoTipo = ''R'', pessoaFisicaEnderecoStatus = ''A'' WHERE pessoafisicaenderecocod = 27', '2015-04-18 09:55:16'),
(406, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 22, 27, ''uploadPessoaFisicaEndereco27'', ''cemat-11-2014-escritorio.pdf'', ''2015-04-18'', ''application/pdf'')', '2015-04-18 09:55:16'),
(407, 1, 22, '7107bde3bc1d766224b8c75899f03124e98243300e5dd2d8ff', 1, 'alterar', 'contato', 'UPDATE _upload SET uploadNomeFisico = ''39Ms1Hx59OX0229SmRM1Rs97Pg230.pdf'' WHERE uploadCod = 230', '2015-04-18 09:55:16'),
(408, 1, 22, '5042cd3125d0ac4cd715c373989c74cf300c878075d68d41ec', 8, 'alterar', 'inicial', 'UPDATE pessoa_fisica SET pessoaFisicaEstadoCivilCod = 2, pessoaFisicaRacaCod = 2, pessoaFisicaNome = ''Vinícius Pozzebon'', pessoaFisicaDataNascimento = ''1983-05-18'', pessoaFisicaSexo = ''M'', pessoaFisicaIdiomas = ''pt-br,en,es'', pessoaFisicaStatus = '''' WHERE pessoaFisicaCod = 8', '2015-04-18 10:06:57'),
(409, 1, 22, '5042cd3125d0ac4cd715c373989c74cf300c878075d68d41ec', 8, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(7, 22, 8, ''uploadPessoaFisicaFoto'', ''286d67f.jpg'', ''2015-04-18'', ''image/jpeg'')', '2015-04-18 10:06:57'),
(410, 1, 22, '5042cd3125d0ac4cd715c373989c74cf300c878075d68d41ec', 8, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''1408Rd2g3M1hc15incgOZIDcl2231.jpg'' WHERE uploadCod = 231', '2015-04-18 10:06:57'),
(411, 1, 18, '8d06668cd0f63894ba5450adc880499f1e83d3939b6fd086d7', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-18 10:18:10'),
(412, 1, 18, '0e449b3d3befbc89dca53589ebba7d90588d6e96dfb7e10848', NULL, 'filtrar', NULL, 'SELECT * FROM organograma a INNER JOIN organograma_clas b ON a.organogramaClasCod = b.organogramaClasCod WHERE INSTR(a.organogramaAncestral,CONCAT("|", 1,"|")) > 0', '2015-04-18 10:18:11'),
(413, 1, 22, '387a0fcde45b669326524b864812d789f40d71287b2306eb5f', 1, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 7, pessoaFisicaEscolarNome = ''FOCCA'', ufCidadeCod = 5362, pessoaFisicaEscolarDataDiplomacao = ''2015-04-18'' WHERE pessoafisicaescolarcod = 7', '2015-04-18 10:37:46'),
(414, 1, 22, '05a9c6ff2592775847e700f9c183d5a4dfb2f1d49aee42f349', 1, 'alterar', 'escolaridade', 'UPDATE pessoa_fisica_escolar SET pessoaFisicaEscolarTipo = 7, pessoaFisicaEscolarNome = ''FOCCA'', ufCidadeCod = 5362, pessoaFisicaEscolarDataDiplomacao = ''2015-04-18'' WHERE pessoafisicaescolarcod = 7', '2015-04-18 10:37:49'),
(415, 1, 97, 'f6647dee033d57d80e3eb65413fc2737d71a334767b24a35de', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-18 17:40:25'),
(416, 1, 97, '05ea6a9f2579f16b43b920c5198fa188720b1dd92a537ec3fb', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-18 17:40:27'),
(417, 1, 96, 'a702c3c7061f21a6a5fc7c37d17af9a6aadf7734b311b37609', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 17:44:07'),
(418, 1, 96, 'b67d6c6eca228a8c7dcc7f34aad899431ab9a8df566af639ef', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 17:44:09'),
(419, 1, 96, 'bed4e1a0cea8ec505f3b953480597ba1b68d3ba5c97e8f6b4a', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 17:47:59'),
(420, 1, 96, '52f4f73d05c1aa2bf19aa2be095f20fba80bd611e68009f88c', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 17:48:00'),
(421, 1, 96, '94509e785dc92fbae802185ebe7937bc19924f98ba8f34f743', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:05:36'),
(422, 1, 96, '944b77026ac159d9118b9c6057e98d1360592bf2e62363333c', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:05:40'),
(423, 1, 96, '02b461c44ceafafa09f9bc3c5e211c3414c46e95f1977fc11b', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:20:46'),
(424, 1, 96, '6b518cd00b0e1f2f090e247b44ff28ef8d09338f344113b810', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:20:48'),
(425, 1, 97, '15e3a0f969d6c46e6fd120246b0960730bb98ac281c1b49783', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-18 18:23:42'),
(426, 1, 97, 'a571436999cde72744f22db6c4bb864193d3756d2f088e5bc9', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-18 18:23:44'),
(427, 1, 97, 'ed45311544fe685c9b2767706292ca70b579fe49eedb435a1d', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(14, b.organogramaAncestral)', '2015-04-18 18:23:48'),
(428, 1, 97, '4991db8344437faf6564336051aac780a1cc2d39710438e312', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(14, b.organogramaAncestral)', '2015-04-18 18:23:49'),
(429, 1, 96, 'c56abe7e6e0b616a02949d8695a46f5aacd3869d890628a942', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 14,''|'')) > 0', '2015-04-18 18:23:56'),
(430, 1, 96, '9db22c27cef55c1b0f2d6d0a40343a62af98fbd3d8c002a1a7', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 14,''|'')) > 0', '2015-04-18 18:23:58'),
(431, 1, 96, '70b5168e0885df481ad2f7b4c2570590fc81a1054247302e1d', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:24:00'),
(432, 1, 96, 'd30d20ce07d73435dfca340426dfab9f4ac8890ccd93f118a4', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:24:00'),
(433, 1, 96, 'cbda2f6d853b88653e62dec69a1aab63f06b41d2634b443445', NULL, 'filtrar', NULL, 'SELECT a.usuarioCod, b.perfilNome, a.usuarioLogin, a.numeroAcessos, a.usuarioDataCadastro, a.usuarioUltimoAcesso FROM _usuario a INNER JOIN _perfil b ON a.perfilCod = b.perfilCod INNER JOIN organograma agng ON a.organogramaCod = agng.organogramaCod WHERE INSTR(agng.organogramaAncestral,CONCAT(''|'', 1,''|'')) > 0', '2015-04-18 18:24:02'),
(434, 1, 18, 'f48c10c84e74fcf6a611aeeefa28017f88303a34397bc1ebf3', NULL, 'cadastrar', NULL, 'INSERT INTO organograma (organogramaRefCod, organogramaAncestral, organogramaClasCod, organogramaNome, organogramaOrdem, organogramaOrdenavel, organogramaStatus) VALUES(3, '''', 6, ''CenterSis'', 1.4, ''A'', ''A'')', '2015-04-21 21:49:11'),
(435, 1, 18, 'f48c10c84e74fcf6a611aeeefa28017f88303a34397bc1ebf3', 15, 'cadastrar', NULL, 'UPDATE organograma SET organogramaAncestral = ''|15|3|2|1|'' WHERE organogramaCod = 15', '2015-04-21 21:49:11'),
(436, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-22 12:35:52'),
(437, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-22 12:35:53'),
(438, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-22 12:35:53'),
(439, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-22 12:35:54'),
(440, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-22 12:35:54'),
(441, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-22 12:35:55'),
(442, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-22 12:35:55'),
(443, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-22 12:35:55'),
(444, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-22 12:35:56'),
(445, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-22 12:35:56'),
(446, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-22 12:35:57'),
(447, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos humanos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-22 12:35:57'),
(448, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-22 12:35:58'),
(449, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-22 12:35:58'),
(450, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Educação'', acaoModuloIdPermissao = ''tab62'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 618', '2015-04-22 12:35:59'),
(451, 1, 82, '74cfc0f62d8f365a2c926db8b369b70429a8489cb9624fded7', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Previdência'', ''tab7'', ''fa fa-umbrella'', '''', '''', ''Previdencia'', '''', 7, ''T'', 22)', '2015-04-22 12:35:59'),
(452, 1, 97, 'f7aaf6793e766e68ccc6ca047824f64647296a8f7acc64a777', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:34:41'),
(453, 1, 97, 'dcbc5f88506d9cdf90da537e3372f97a2b767fcd0b6b281a00', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:34:41'),
(454, 1, 97, '634ac618c95403e02b73ee713099353d7fad9085ca87b25d69', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:35:17'),
(455, 1, 97, 'eba7109f93d46bde0c30a96cd6308763c3fa3458e23f9e5c16', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:35:18'),
(456, 1, 97, '5b71303385a0f843a861f434c14e1e40ab98e4117df713bc04', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:37:33'),
(457, 1, 97, '969560e9e11425394d70b8197d7c0816d510c2770b80095c7d', NULL, 'filtrar', NULL, 'SELECT a.perfilCod, a.perfilNome, a.perfilDescricao FROM _perfil a INNER JOIN organograma b ON a.organogramaCod = b.organogramaCod WHERE LOCATE(1, b.organogramaAncestral)', '2015-04-22 07:37:34'),
(458, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-22 07:54:37'),
(459, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-22 07:54:37'),
(460, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-22 07:54:37'),
(461, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-22 07:54:37'),
(462, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-22 07:54:37'),
(463, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-22 07:54:37'),
(464, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-22 07:54:37'),
(465, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-22 07:54:37'),
(466, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-22 07:54:37');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(467, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-22 07:54:37'),
(468, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-22 07:54:37'),
(469, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos humanos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-22 07:54:37'),
(470, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-22 07:54:37'),
(471, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-22 07:54:37'),
(472, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Educação'', acaoModuloIdPermissao = ''tab62'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 618', '2015-04-22 07:54:37'),
(473, 1, 82, '30842912f9c35913da9bbb56a349d5913caba897f76a4e1869', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-22 07:54:37'),
(474, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-22 07:59:48'),
(475, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-22 07:59:48'),
(476, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-22 07:59:48'),
(477, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-22 07:59:48'),
(478, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-22 07:59:48'),
(479, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-22 07:59:48'),
(480, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-22 07:59:48'),
(481, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-22 07:59:48'),
(482, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-22 07:59:48'),
(483, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-22 07:59:48'),
(484, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-22 07:59:48'),
(485, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos humanos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-22 07:59:48'),
(486, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-22 07:59:48'),
(487, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-22 07:59:48'),
(488, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-22 07:59:48'),
(489, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'DELETE FROM _permissao WHERE acaoModuloCod = 618', '2015-04-22 07:59:48'),
(490, 1, 82, '40bcfc162114e8837fe46344f8afc80ef15c2b38dc19d38e36', 22, 'alterar', NULL, 'DELETE FROM _acao_modulo WHERE acaomodulocod = 618', '2015-04-22 07:59:48'),
(491, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-22 08:01:12'),
(492, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-22 08:01:12'),
(493, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-22 08:01:12'),
(494, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-22 08:01:12'),
(495, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-22 08:01:12'),
(496, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-22 08:01:12'),
(497, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-22 08:01:12'),
(498, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-22 08:01:12'),
(499, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-22 08:01:12'),
(500, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-22 08:01:12'),
(501, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-22 08:01:12'),
(502, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos humanos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-22 08:01:12'),
(503, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-22 08:01:12'),
(504, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-22 08:01:12'),
(505, 1, 82, '202d47bea79190fd7cb5c0d950e5d826297effd2f120296707', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-22 08:01:12'),
(506, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-22 08:01:59'),
(507, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-22 08:01:59'),
(508, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-22 08:01:59'),
(509, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-22 08:01:59'),
(510, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-22 08:01:59'),
(511, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-22 08:01:59'),
(512, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-22 08:01:59'),
(513, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-22 08:01:59'),
(514, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-22 08:01:59'),
(515, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-22 08:01:59'),
(516, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-22 08:01:59'),
(517, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos Humanos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-22 08:01:59'),
(518, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-22 08:01:59'),
(519, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-22 08:01:59'),
(520, 1, 82, 'd54aa7c7b7053466a04a53c677b5d19650a333f436e7d066e5', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência Social'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-22 08:01:59'),
(521, 1, 83, 'd7a6c47b516a1f64c2b1c3aaaee573754f9904fb05107251a0', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 09:03:15'),
(522, 1, 83, 'ca95344d923904ca4d2f7084ca65c913e80a79b29527180136', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 09:03:16'),
(523, 1, 83, 'cea0aedf0d2b237b39ec97bd571ea1e5902101f79eefd7305a', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 09:54:42'),
(524, 1, 83, '94f2404e8901b5d0f2418986fc383b795fafbb28f5cb8dd568', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 09:54:43'),
(525, 1, 83, '60980980b3a13a82c912159c96cab3a4d156eefffb688ae72e', 6, 'alterar', NULL, 'UPDATE _grupo SET grupoNome = ''Gestão Administrativa'', grupoPacote = ''GA'', grupoPosicao = 1, grupoClass = ''menu-icon fa fa-university'' WHERE grupoCod = 6', '2015-04-22 09:55:25'),
(526, 1, 83, '3d5e31819b68ac9e8290a54845b11b0636fdc599300ef178c8', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 09:55:25'),
(527, 1, 83, '5304d4fac520a118bc7d547b0f193e4fd56fba8e9b7d88d3e0', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:05:54'),
(528, 1, 83, '3d3932467ceb4af393f27cb2d3df28c02cea32ba0ad31b99e7', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:05:56'),
(529, 1, 83, '7ea2fde006eb07364f97ddc6a7dbade819b2d0bff818d18ac5', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:06:57'),
(530, 1, 83, '5e84d673786388d1897f392c31cbbbf6704209091c981d2661', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:07:00'),
(531, 1, 83, '950f4b3d115faa5a7e1797acbb7df7ff185c5ea5b0237bd3e2', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:31:38'),
(532, 1, 83, 'd3361c5b92ea09811c3f550511c47efd65289bdcbbe169feaa', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:31:41'),
(533, 1, 83, '5bc2c22fbfdf8363229c460a8b216cde676c91bcaeac0b3926', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:31:43'),
(534, 1, 83, 'aec0411a9ee50e26475cf0a97df189325de02de9b81251548f', NULL, 'filtrar', NULL, 'SELECT grupoCod, grupoNome, grupoPacote, grupoPosicao, grupoClass FROM _grupo ', '2015-04-22 10:31:45'),
(535, 1, 82, '3396293fed609b3d8e4f9f77e43de6bcd7f4f81893a09dc6cc', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 11:09:27'),
(536, 1, 82, '3396293fed609b3d8e4f9f77e43de6bcd7f4f81893a09dc6cc', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Atualizar'', ''filtrar'', ''fa fa-repeat'', '''', '''', '''', ''sisFiltrarPadrao()'', 1, ''E'', 10)', '2015-04-22 11:09:27'),
(537, 1, 82, '2f3f6f74e7b3a3c138f9d6f06eb64f6498f5fa13b73359bd69', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 11:10:59'),
(538, 1, 82, '2f3f6f74e7b3a3c138f9d6f06eb64f6498f5fa13b73359bd69', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 11:10:59'),
(539, 1, 82, '2f3f6f74e7b3a3c138f9d6f06eb64f6498f5fa13b73359bd69', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Visualizar'', ''visualizar'', ''fa fa-search'', '''', '''', '''', ''sisVisualizarPadrao()'', 2, ''E'', 10)', '2015-04-22 11:10:59'),
(540, 1, 82, '2f3f6f74e7b3a3c138f9d6f06eb64f6498f5fa13b73359bd69', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Inserir'', ''cadastrar'', ''fa fa-plus'', '''', '''', '''', ''sisCadastrarLayoutPadrao()'', 3, ''E'', 10)', '2015-04-22 11:10:59'),
(541, 1, 82, '2f3f6f74e7b3a3c138f9d6f06eb64f6498f5fa13b73359bd69', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Alterar'', ''alterar'', ''fa fa-pencil'', '''', '''', '''', ''sisAlterarLayoutPadrao()'', 4, ''E'', 10)', '2015-04-22 11:10:59'),
(542, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 11:12:26'),
(543, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 11:12:26'),
(544, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 11:12:26'),
(545, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 11:12:26'),
(546, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 11:12:26'),
(547, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Remover'', ''remover'', ''fa fa-trash-o'', '''', '''', '''', ''sisRemoverPadrao()'', 5, ''E'', 10)', '2015-04-22 11:12:26'),
(548, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Imprimir'', ''prnt'', ''fa fa-print'', '''', '''', '''', ''sisImprimir()'', 6, ''R'', 10)', '2015-04-22 11:12:26'),
(549, 1, 82, 'a56ab5ffaea5ab418edae78017f33030b5cc98c1a88e4f2cdc', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Inicial'', ''tabPJ1'', ''fa fa-home'', '''', '''', ''Inicial'', '''', 1, ''T'', 10)', '2015-04-22 11:12:26'),
(550, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-22 11:12:58'),
(551, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-22 11:12:58'),
(552, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-22 11:12:58'),
(553, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-22 11:12:58'),
(554, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-22 11:12:58'),
(555, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-22 11:12:58'),
(556, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-22 11:12:58'),
(557, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-22 11:12:58'),
(558, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-22 11:12:58'),
(559, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-22 11:12:58'),
(560, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-22 11:12:58'),
(561, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-22 11:12:58'),
(562, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-22 11:12:58'),
(563, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-22 11:12:58'),
(564, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-22 11:12:58'),
(565, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-22 11:12:58'),
(566, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-22 11:12:58'),
(567, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-22 11:12:58'),
(568, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-22 11:12:58'),
(569, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-22 11:12:58'),
(570, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-22 11:12:58'),
(571, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-22 11:12:58'),
(572, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-22 11:12:58'),
(573, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-22 11:12:58'),
(574, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-22 11:12:58'),
(575, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-22 11:12:58'),
(576, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-22 11:12:58'),
(577, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-22 11:12:58'),
(578, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-22 11:12:58'),
(579, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-22 11:12:58'),
(580, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-22 11:12:58'),
(581, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-22 11:12:58'),
(582, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-22 11:12:58'),
(583, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-22 11:12:58'),
(584, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-22 11:12:58'),
(585, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-22 11:12:58'),
(586, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-22 11:12:58'),
(587, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-22 11:12:58'),
(588, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-22 11:12:58'),
(589, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-22 11:12:58'),
(590, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-22 11:12:58'),
(591, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-22 11:12:58'),
(592, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-22 11:12:58'),
(593, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-22 11:12:58'),
(594, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-22 11:12:58'),
(595, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-22 11:12:58'),
(596, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-22 11:12:58'),
(597, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-22 11:12:58'),
(598, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-22 11:12:58'),
(599, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-22 11:12:58'),
(600, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-22 11:12:58'),
(601, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-22 11:12:58'),
(602, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-22 11:12:58'),
(603, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-22 11:12:58'),
(604, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-22 11:12:58'),
(605, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-22 11:12:58'),
(606, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-22 11:12:58'),
(607, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-22 11:12:58'),
(608, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-22 11:12:58'),
(609, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-22 11:12:58'),
(610, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-22 11:12:58'),
(611, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-22 11:12:58'),
(612, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-22 11:12:58'),
(613, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-22 11:12:58'),
(614, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-22 11:12:58'),
(615, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-22 11:12:58'),
(616, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-22 11:12:58'),
(617, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-22 11:12:58'),
(618, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-22 11:12:58'),
(619, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-22 11:12:58'),
(620, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-22 11:12:58'),
(621, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-22 11:12:58'),
(622, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-22 11:12:58'),
(623, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-22 11:12:58'),
(624, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-22 11:12:58'),
(625, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-22 11:12:58'),
(626, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-22 11:12:58'),
(627, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-22 11:12:58'),
(628, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-22 11:12:58'),
(629, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-22 11:12:58'),
(630, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-22 11:12:58'),
(631, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-22 11:12:58'),
(632, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-22 11:12:58'),
(633, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-22 11:12:58'),
(634, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-22 11:12:58'),
(635, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-22 11:12:58'),
(636, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-22 11:12:58'),
(637, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-22 11:12:58');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(638, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-22 11:12:58'),
(639, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-22 11:12:58'),
(640, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-22 11:12:58'),
(641, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-22 11:12:58'),
(642, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-22 11:12:58'),
(643, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-22 11:12:58'),
(644, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-22 11:12:58'),
(645, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-22 11:12:58'),
(646, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-22 11:12:58'),
(647, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-22 11:12:58'),
(648, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-22 11:12:58'),
(649, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-22 11:12:58'),
(650, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-22 11:12:58'),
(651, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-22 11:12:58'),
(652, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-22 11:12:58'),
(653, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-22 11:12:58'),
(654, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-22 11:12:58'),
(655, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-22 11:12:58'),
(656, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-22 11:12:58'),
(657, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-22 11:12:58'),
(658, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-22 11:12:58'),
(659, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-22 11:12:58'),
(660, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-22 11:12:58'),
(661, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-22 11:12:58'),
(662, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-22 11:12:58'),
(663, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-22 11:12:58'),
(664, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-22 11:12:58'),
(665, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-22 11:12:58'),
(666, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-22 11:12:58'),
(667, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-22 11:12:58'),
(668, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-22 11:12:58'),
(669, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-22 11:12:58'),
(670, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-22 11:12:58'),
(671, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-22 11:12:58'),
(672, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-22 11:12:58'),
(673, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-22 11:12:58'),
(674, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-22 11:12:58'),
(675, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-22 11:12:58'),
(676, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-22 11:12:58'),
(677, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-22 11:12:58'),
(678, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-22 11:12:58'),
(679, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-22 11:12:58'),
(680, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-22 11:12:58'),
(681, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-22 11:12:58'),
(682, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-22 11:12:58'),
(683, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-22 11:12:58'),
(684, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-22 11:12:58'),
(685, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-22 11:12:58'),
(686, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-22 11:12:58'),
(687, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-22 11:12:58'),
(688, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-22 11:12:58'),
(689, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-22 11:12:58'),
(690, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-22 11:12:58'),
(691, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-22 11:12:58'),
(692, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-22 11:12:58'),
(693, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-22 11:12:58'),
(694, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-22 11:12:58'),
(695, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-22 11:12:58'),
(696, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-22 11:12:58'),
(697, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-22 11:12:58'),
(698, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-22 11:12:58'),
(699, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-22 11:12:58'),
(700, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-22 11:12:58'),
(701, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-22 11:12:58'),
(702, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-22 11:12:58'),
(703, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-22 11:12:58'),
(704, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-22 11:12:58'),
(705, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-22 11:12:58'),
(706, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-22 11:12:58'),
(707, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-22 11:12:58'),
(708, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-22 11:12:58'),
(709, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-22 11:12:58'),
(710, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-22 11:12:58'),
(711, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-22 11:12:58'),
(712, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-22 11:12:58'),
(713, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-22 11:12:58'),
(714, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-22 11:12:58'),
(715, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-22 11:12:58'),
(716, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-22 11:12:58'),
(717, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-22 11:12:58'),
(718, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-22 11:12:58'),
(719, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-22 11:12:58'),
(720, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-22 11:12:58'),
(721, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-22 11:12:58'),
(722, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-22 11:12:58'),
(723, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-22 11:12:58'),
(724, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-22 11:12:58'),
(725, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-22 11:12:58'),
(726, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-22 11:12:58'),
(727, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-22 11:12:58'),
(728, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-22 11:12:58'),
(729, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-22 11:12:58'),
(730, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-22 11:12:58'),
(731, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-22 11:12:58'),
(732, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-22 11:12:58'),
(733, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-22 11:12:58'),
(734, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-22 11:12:58'),
(735, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-22 11:12:58'),
(736, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-22 11:12:58'),
(737, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-22 11:12:58'),
(738, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-22 11:12:58'),
(739, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-22 11:12:58'),
(740, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-22 11:12:58'),
(741, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-22 11:12:58'),
(742, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-22 11:12:58'),
(743, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-22 11:12:58'),
(744, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-22 11:12:58'),
(745, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-22 11:12:58'),
(746, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-22 11:12:58'),
(747, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-22 11:12:58'),
(748, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-22 11:12:58'),
(749, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-22 11:12:58'),
(750, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-22 11:12:58'),
(751, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-22 11:12:58'),
(752, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-22 11:12:58'),
(753, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-22 11:12:58'),
(754, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-22 11:12:58'),
(755, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-22 11:12:58'),
(756, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-22 11:12:58'),
(757, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-22 11:12:58'),
(758, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-22 11:12:58'),
(759, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-22 11:12:58'),
(760, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-22 11:12:58'),
(761, 1, 97, '85a259786dd204dc73bca4965c6e5780121ca025c918380281', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-22 11:12:58'),
(762, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 16:55:48'),
(763, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 16:55:48'),
(764, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 16:55:48'),
(765, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 16:55:48'),
(766, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 16:55:48'),
(767, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-22 16:55:48'),
(768, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-22 16:55:48'),
(769, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-22 16:55:49'),
(770, 1, 82, '288d840a4d224f136e28a017a7ab7084125fa49666cbf81fea', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Sócios'', ''tabPJ2'', ''fa fa-users'', '''', '''', ''Socios'', '''', 2, ''T'', 10)', '2015-04-22 16:55:49'),
(771, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-22 16:56:07'),
(772, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-22 16:56:07'),
(773, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-22 16:56:07'),
(774, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-22 16:56:07'),
(775, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-22 16:56:07'),
(776, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-22 16:56:07'),
(777, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-22 16:56:07'),
(778, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-22 16:56:07'),
(779, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-22 16:56:07'),
(780, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-22 16:56:07'),
(781, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-22 16:56:07'),
(782, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-22 16:56:07'),
(783, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-22 16:56:07'),
(784, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-22 16:56:07'),
(785, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-22 16:56:07'),
(786, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-22 16:56:07'),
(787, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-22 16:56:07'),
(788, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-22 16:56:07'),
(789, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-22 16:56:07'),
(790, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-22 16:56:07'),
(791, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-22 16:56:07'),
(792, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-22 16:56:07'),
(793, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-22 16:56:07'),
(794, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-22 16:56:07'),
(795, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-22 16:56:07'),
(796, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-22 16:56:07'),
(797, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-22 16:56:07'),
(798, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-22 16:56:07'),
(799, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-22 16:56:07'),
(800, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-22 16:56:07'),
(801, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-22 16:56:07'),
(802, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-22 16:56:07'),
(803, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-22 16:56:07'),
(804, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-22 16:56:07'),
(805, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-22 16:56:07'),
(806, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-22 16:56:07'),
(807, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-22 16:56:07'),
(808, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-22 16:56:07'),
(809, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-22 16:56:07'),
(810, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-22 16:56:07'),
(811, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-22 16:56:07'),
(812, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-22 16:56:07'),
(813, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-22 16:56:07'),
(814, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-22 16:56:07'),
(815, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-22 16:56:07'),
(816, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-22 16:56:07'),
(817, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-22 16:56:07'),
(818, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-22 16:56:07'),
(819, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-22 16:56:07'),
(820, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-22 16:56:07'),
(821, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-22 16:56:07'),
(822, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-22 16:56:07'),
(823, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-22 16:56:07'),
(824, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-22 16:56:07'),
(825, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-22 16:56:07'),
(826, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-22 16:56:07'),
(827, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-22 16:56:07'),
(828, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-22 16:56:08'),
(829, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-22 16:56:08'),
(830, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-22 16:56:08'),
(831, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-22 16:56:08'),
(832, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-22 16:56:08'),
(833, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-22 16:56:08'),
(834, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-22 16:56:08'),
(835, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-22 16:56:08'),
(836, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-22 16:56:08'),
(837, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-22 16:56:08'),
(838, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-22 16:56:08'),
(839, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-22 16:56:08'),
(840, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-22 16:56:08'),
(841, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-22 16:56:08'),
(842, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-22 16:56:08'),
(843, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-22 16:56:08'),
(844, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-22 16:56:08'),
(845, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-22 16:56:08'),
(846, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-22 16:56:08'),
(847, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-22 16:56:08'),
(848, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-22 16:56:08'),
(849, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-22 16:56:08'),
(850, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-22 16:56:08'),
(851, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-22 16:56:08'),
(852, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-22 16:56:08'),
(853, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-22 16:56:08'),
(854, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-22 16:56:08'),
(855, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-22 16:56:08'),
(856, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-22 16:56:08'),
(857, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-22 16:56:08'),
(858, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-22 16:56:08'),
(859, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-22 16:56:08'),
(860, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-22 16:56:08'),
(861, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-22 16:56:08'),
(862, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-22 16:56:08'),
(863, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-22 16:56:08'),
(864, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-22 16:56:08'),
(865, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-22 16:56:08'),
(866, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-22 16:56:08'),
(867, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-22 16:56:08'),
(868, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-22 16:56:08'),
(869, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-22 16:56:08'),
(870, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-22 16:56:08'),
(871, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-22 16:56:08'),
(872, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-22 16:56:08'),
(873, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-22 16:56:08'),
(874, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-22 16:56:08'),
(875, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-22 16:56:08'),
(876, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-22 16:56:08'),
(877, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-22 16:56:08'),
(878, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-22 16:56:08'),
(879, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-22 16:56:08'),
(880, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-22 16:56:08'),
(881, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-22 16:56:08'),
(882, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-22 16:56:08'),
(883, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-22 16:56:08'),
(884, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-22 16:56:08'),
(885, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-22 16:56:08'),
(886, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-22 16:56:08'),
(887, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-22 16:56:08'),
(888, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-22 16:56:08'),
(889, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-22 16:56:08'),
(890, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-22 16:56:08'),
(891, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-22 16:56:08'),
(892, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-22 16:56:08'),
(893, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-22 16:56:08'),
(894, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-22 16:56:08'),
(895, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-22 16:56:08'),
(896, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-22 16:56:08'),
(897, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-22 16:56:08'),
(898, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-22 16:56:08'),
(899, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-22 16:56:08'),
(900, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-22 16:56:08'),
(901, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-22 16:56:08'),
(902, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-22 16:56:08'),
(903, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-22 16:56:08');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(904, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-22 16:56:08'),
(905, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-22 16:56:08'),
(906, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-22 16:56:08'),
(907, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-22 16:56:08'),
(908, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-22 16:56:08'),
(909, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-22 16:56:08'),
(910, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-22 16:56:08'),
(911, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-22 16:56:08'),
(912, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-22 16:56:08'),
(913, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-22 16:56:08'),
(914, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-22 16:56:08'),
(915, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-22 16:56:08'),
(916, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-22 16:56:08'),
(917, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-22 16:56:08'),
(918, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-22 16:56:08'),
(919, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-22 16:56:08'),
(920, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-22 16:56:08'),
(921, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-22 16:56:08'),
(922, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-22 16:56:08'),
(923, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-22 16:56:08'),
(924, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-22 16:56:08'),
(925, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-22 16:56:08'),
(926, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-22 16:56:08'),
(927, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-22 16:56:08'),
(928, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-22 16:56:08'),
(929, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-22 16:56:08'),
(930, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-22 16:56:08'),
(931, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-22 16:56:08'),
(932, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-22 16:56:08'),
(933, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-22 16:56:08'),
(934, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-22 16:56:08'),
(935, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-22 16:56:08'),
(936, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-22 16:56:08'),
(937, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-22 16:56:08'),
(938, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-22 16:56:08'),
(939, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-22 16:56:08'),
(940, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-22 16:56:08'),
(941, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-22 16:56:08'),
(942, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-22 16:56:08'),
(943, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-22 16:56:08'),
(944, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-22 16:56:08'),
(945, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-22 16:56:08'),
(946, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-22 16:56:08'),
(947, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-22 16:56:08'),
(948, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-22 16:56:08'),
(949, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-22 16:56:08'),
(950, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-22 16:56:08'),
(951, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-22 16:56:08'),
(952, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-22 16:56:08'),
(953, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-22 16:56:08'),
(954, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-22 16:56:08'),
(955, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-22 16:56:08'),
(956, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-22 16:56:08'),
(957, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-22 16:56:08'),
(958, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-22 16:56:08'),
(959, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-22 16:56:08'),
(960, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-22 16:56:08'),
(961, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-22 16:56:08'),
(962, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-22 16:56:08'),
(963, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-22 16:56:08'),
(964, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-22 16:56:08'),
(965, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-22 16:56:08'),
(966, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-22 16:56:08'),
(967, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-22 16:56:08'),
(968, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-22 16:56:08'),
(969, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-22 16:56:08'),
(970, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-22 16:56:08'),
(971, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-22 16:56:08'),
(972, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-22 16:56:08'),
(973, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-22 16:56:08'),
(974, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-22 16:56:08'),
(975, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-22 16:56:08'),
(976, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-22 16:56:08'),
(977, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-22 16:56:08'),
(978, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-22 16:56:08'),
(979, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-22 16:56:08'),
(980, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-22 16:56:08'),
(981, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-22 16:56:08'),
(982, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-22 16:56:08'),
(983, 1, 97, '47a23a7058eaeecae63962b05f2183b0b79ec57e7cbd465ca4', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-22 16:56:08'),
(984, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 17:11:55'),
(985, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 17:11:55'),
(986, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 17:11:55'),
(987, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 17:11:55'),
(988, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 17:11:55'),
(989, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-22 17:11:55'),
(990, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-22 17:11:55'),
(991, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-22 17:11:55'),
(992, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar tab inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-22 17:11:55'),
(993, 1, 82, '17e27a428a4efcbdfdc5840c420100ba905fe7c637c27251d8', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Sócios'', ''tabPJ2'', ''fa fa-users'', '''', '''', ''Socios'', '''', 2, ''T'', 10)', '2015-04-22 17:11:55'),
(994, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-22 17:12:08'),
(995, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-22 17:12:08'),
(996, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-22 17:12:08'),
(997, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-22 17:12:08'),
(998, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-22 17:12:08'),
(999, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-22 17:12:08'),
(1000, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-22 17:12:08'),
(1001, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-22 17:12:08'),
(1002, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-22 17:12:08'),
(1003, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-22 17:12:08'),
(1004, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-22 17:12:08'),
(1005, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-22 17:12:08'),
(1006, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-22 17:12:08'),
(1007, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-22 17:12:08'),
(1008, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-22 17:12:08'),
(1009, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-22 17:12:08'),
(1010, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-22 17:12:08'),
(1011, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-22 17:12:08'),
(1012, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-22 17:12:08'),
(1013, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-22 17:12:08'),
(1014, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-22 17:12:08'),
(1015, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-22 17:12:08'),
(1016, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-22 17:12:08'),
(1017, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-22 17:12:08'),
(1018, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-22 17:12:08'),
(1019, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-22 17:12:08'),
(1020, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-22 17:12:08'),
(1021, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-22 17:12:08'),
(1022, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-22 17:12:08'),
(1023, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-22 17:12:08'),
(1024, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-22 17:12:08'),
(1025, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-22 17:12:08'),
(1026, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-22 17:12:08'),
(1027, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-22 17:12:08'),
(1028, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-22 17:12:08'),
(1029, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(628, 1)', '2015-04-22 17:12:08'),
(1030, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-22 17:12:08'),
(1031, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-22 17:12:08'),
(1032, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-22 17:12:08'),
(1033, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-22 17:12:08'),
(1034, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-22 17:12:08'),
(1035, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-22 17:12:08'),
(1036, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-22 17:12:08'),
(1037, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-22 17:12:08'),
(1038, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-22 17:12:08'),
(1039, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-22 17:12:08'),
(1040, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-22 17:12:08'),
(1041, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-22 17:12:08'),
(1042, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-22 17:12:08'),
(1043, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-22 17:12:08'),
(1044, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-22 17:12:08'),
(1045, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-22 17:12:08'),
(1046, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-22 17:12:08'),
(1047, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-22 17:12:08'),
(1048, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-22 17:12:08'),
(1049, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-22 17:12:08'),
(1050, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-22 17:12:08'),
(1051, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-22 17:12:08'),
(1052, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-22 17:12:08'),
(1053, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-22 17:12:08'),
(1054, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-22 17:12:08'),
(1055, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-22 17:12:08'),
(1056, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-22 17:12:08'),
(1057, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-22 17:12:08'),
(1058, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-22 17:12:08'),
(1059, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-22 17:12:08'),
(1060, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-22 17:12:08'),
(1061, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-22 17:12:08'),
(1062, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-22 17:12:08'),
(1063, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-22 17:12:08'),
(1064, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-22 17:12:08'),
(1065, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-22 17:12:08'),
(1066, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-22 17:12:08'),
(1067, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-22 17:12:08'),
(1068, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-22 17:12:08'),
(1069, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-22 17:12:08'),
(1070, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-22 17:12:08'),
(1071, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-22 17:12:08'),
(1072, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-22 17:12:08'),
(1073, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-22 17:12:08'),
(1074, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-22 17:12:08'),
(1075, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-22 17:12:08'),
(1076, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-22 17:12:08'),
(1077, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-22 17:12:08'),
(1078, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-22 17:12:08'),
(1079, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-22 17:12:08'),
(1080, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-22 17:12:08'),
(1081, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-22 17:12:08'),
(1082, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-22 17:12:08'),
(1083, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-22 17:12:08'),
(1084, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-22 17:12:08'),
(1085, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-22 17:12:08'),
(1086, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-22 17:12:08'),
(1087, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-22 17:12:08'),
(1088, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-22 17:12:08'),
(1089, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-22 17:12:08'),
(1090, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-22 17:12:08'),
(1091, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-22 17:12:08'),
(1092, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-22 17:12:08'),
(1093, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-22 17:12:08'),
(1094, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-22 17:12:08'),
(1095, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-22 17:12:08'),
(1096, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-22 17:12:08'),
(1097, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-22 17:12:08'),
(1098, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-22 17:12:08'),
(1099, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-22 17:12:08'),
(1100, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-22 17:12:08'),
(1101, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-22 17:12:08'),
(1102, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-22 17:12:08'),
(1103, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-22 17:12:08'),
(1104, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-22 17:12:08'),
(1105, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-22 17:12:08'),
(1106, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-22 17:12:08'),
(1107, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-22 17:12:08'),
(1108, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-22 17:12:08'),
(1109, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-22 17:12:08'),
(1110, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-22 17:12:08'),
(1111, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-22 17:12:08'),
(1112, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-22 17:12:08'),
(1113, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-22 17:12:08'),
(1114, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-22 17:12:08'),
(1115, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-22 17:12:08'),
(1116, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-22 17:12:08'),
(1117, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-22 17:12:08'),
(1118, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-22 17:12:08'),
(1119, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-22 17:12:08'),
(1120, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-22 17:12:08'),
(1121, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-22 17:12:08'),
(1122, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-22 17:12:08'),
(1123, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-22 17:12:08'),
(1124, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-22 17:12:08'),
(1125, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-22 17:12:08'),
(1126, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-22 17:12:08'),
(1127, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-22 17:12:08'),
(1128, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-22 17:12:08'),
(1129, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-22 17:12:08'),
(1130, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-22 17:12:08'),
(1131, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-22 17:12:08'),
(1132, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-22 17:12:08'),
(1133, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-22 17:12:08'),
(1134, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-22 17:12:08'),
(1135, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-22 17:12:08'),
(1136, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-22 17:12:08'),
(1137, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-22 17:12:08'),
(1138, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-22 17:12:08'),
(1139, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-22 17:12:08'),
(1140, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-22 17:12:08'),
(1141, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-22 17:12:08'),
(1142, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-22 17:12:08'),
(1143, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-22 17:12:08'),
(1144, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-22 17:12:08'),
(1145, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-22 17:12:08'),
(1146, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-22 17:12:08'),
(1147, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-22 17:12:08'),
(1148, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-22 17:12:08'),
(1149, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-22 17:12:08'),
(1150, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-22 17:12:08'),
(1151, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-22 17:12:08'),
(1152, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-22 17:12:08'),
(1153, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-22 17:12:08'),
(1154, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-22 17:12:08'),
(1155, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-22 17:12:08'),
(1156, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-22 17:12:08'),
(1157, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-22 17:12:08'),
(1158, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-22 17:12:08'),
(1159, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-22 17:12:08'),
(1160, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-22 17:12:08'),
(1161, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-22 17:12:08'),
(1162, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-22 17:12:08'),
(1163, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-22 17:12:08'),
(1164, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-22 17:12:08'),
(1165, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-22 17:12:08'),
(1166, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-22 17:12:08'),
(1167, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-22 17:12:08');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(1168, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-22 17:12:08'),
(1169, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-22 17:12:08'),
(1170, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-22 17:12:08'),
(1171, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-22 17:12:08'),
(1172, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-22 17:12:08'),
(1173, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-22 17:12:08'),
(1174, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-22 17:12:08'),
(1175, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-22 17:12:08'),
(1176, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-22 17:12:08'),
(1177, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-22 17:12:08'),
(1178, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-22 17:12:08'),
(1179, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-22 17:12:08'),
(1180, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-22 17:12:08'),
(1181, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-22 17:12:08'),
(1182, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-22 17:12:08'),
(1183, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-22 17:12:08'),
(1184, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-22 17:12:08'),
(1185, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-22 17:12:08'),
(1186, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-22 17:12:08'),
(1187, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-22 17:12:08'),
(1188, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-22 17:12:08'),
(1189, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-22 17:12:08'),
(1190, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-22 17:12:08'),
(1191, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-22 17:12:08'),
(1192, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-22 17:12:08'),
(1193, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-22 17:12:08'),
(1194, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-22 17:12:08'),
(1195, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-22 17:12:08'),
(1196, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-22 17:12:08'),
(1197, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-22 17:12:08'),
(1198, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-22 17:12:08'),
(1199, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-22 17:12:08'),
(1200, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-22 17:12:08'),
(1201, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-22 17:12:08'),
(1202, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-22 17:12:08'),
(1203, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-22 17:12:08'),
(1204, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-22 17:12:08'),
(1205, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-22 17:12:08'),
(1206, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-22 17:12:08'),
(1207, 1, 97, '301455a99a17bcd9eef153910aae523a9dc76b2a059490e376', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-22 17:12:08'),
(1208, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 17:14:39'),
(1209, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 17:14:39'),
(1210, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 17:14:39'),
(1211, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 17:14:39'),
(1212, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 17:14:39'),
(1213, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-22 17:14:39'),
(1214, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-22 17:14:39'),
(1215, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-22 17:14:39'),
(1216, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-22 17:14:39'),
(1217, 1, 82, '6627eb6062867ce0b46280c9443db4463204575f75af360d2a', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Sócios'', acaoModuloIdPermissao = ''tabPJ2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Socios'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 628', '2015-04-22 17:14:39'),
(1218, 1, 10, '6b4941f45468caa6e4c0c51d5c035689e4c31686657c4ce102', NULL, 'cadastrar', 'inicial', 'INSERT INTO pessoa (pessoaCod, organogramaCod, pessoaTipo, pessoaStatus) VALUES('''', 1, ''J'', ''A'')', '2015-04-22 22:17:15'),
(1219, 1, 10, '6b4941f45468caa6e4c0c51d5c035689e4c31686657c4ce102', NULL, 'cadastrar', 'inicial', 'INSERT INTO pessoa_juridica (pessoaJuridicaCod, organogramaCod, pessoaCod, pessoaJuridicaNome, pessoaJuridicaRazao, pessoaJuridicaDataFundacao, pessoaJuridicaStatus) VALUES('''', 1, 9, ''BRA Consultoria'', ''VR Gestão Empresarial LTDA'', ''2007-12-26'', ''A'')', '2015-04-22 22:17:15'),
(1220, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 17:32:15'),
(1221, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 17:32:15'),
(1222, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 17:32:15'),
(1223, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 17:32:15'),
(1224, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 17:32:15'),
(1225, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-22 17:32:15'),
(1226, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-22 17:32:15'),
(1227, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-22 17:32:15'),
(1228, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-22 17:32:15'),
(1229, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Sócios'', acaoModuloIdPermissao = ''tabPJ2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Socios'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 628', '2015-04-22 17:32:15'),
(1230, 1, 82, 'e3358c383d5af256baf4132acca82bdb86a4ccc2f9412740f2', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Alterar na tab Sócios de Pessoa Jurídica'', ''sociosPJAlterar'', '''', '''', '''', '''', '''', 21, ''I'', 10)', '2015-04-22 17:32:15'),
(1231, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-22 17:32:51'),
(1232, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-22 17:32:51'),
(1233, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-22 17:32:51'),
(1234, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-22 17:32:51'),
(1235, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-22 17:32:51'),
(1236, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-22 17:32:51'),
(1237, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-22 17:32:51'),
(1238, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-22 17:32:51'),
(1239, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-22 17:32:51'),
(1240, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-22 17:32:51'),
(1241, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-22 17:32:51'),
(1242, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-22 17:32:51'),
(1243, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-22 17:32:51'),
(1244, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-22 17:32:51'),
(1245, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-22 17:32:51'),
(1246, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-22 17:32:51'),
(1247, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-22 17:32:51'),
(1248, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-22 17:32:51'),
(1249, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-22 17:32:51'),
(1250, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-22 17:32:51'),
(1251, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-22 17:32:51'),
(1252, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-22 17:32:51'),
(1253, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-22 17:32:51'),
(1254, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-22 17:32:51'),
(1255, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-22 17:32:51'),
(1256, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-22 17:32:51'),
(1257, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-22 17:32:51'),
(1258, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-22 17:32:51'),
(1259, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-22 17:32:51'),
(1260, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-22 17:32:51'),
(1261, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-22 17:32:51'),
(1262, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-22 17:32:51'),
(1263, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-22 17:32:51'),
(1264, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-22 17:32:51'),
(1265, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-22 17:32:51'),
(1266, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(628, 1)', '2015-04-22 17:32:51'),
(1267, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-22 17:32:51'),
(1268, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-22 17:32:51'),
(1269, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-22 17:32:51'),
(1270, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-22 17:32:51'),
(1271, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-22 17:32:51'),
(1272, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(629, 1)', '2015-04-22 17:32:51'),
(1273, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-22 17:32:51'),
(1274, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-22 17:32:51'),
(1275, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-22 17:32:51'),
(1276, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-22 17:32:51'),
(1277, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-22 17:32:51'),
(1278, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-22 17:32:51'),
(1279, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-22 17:32:51'),
(1280, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-22 17:32:51'),
(1281, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-22 17:32:51'),
(1282, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-22 17:32:51'),
(1283, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-22 17:32:51'),
(1284, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-22 17:32:51'),
(1285, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-22 17:32:51'),
(1286, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-22 17:32:51'),
(1287, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-22 17:32:51'),
(1288, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-22 17:32:51'),
(1289, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-22 17:32:51'),
(1290, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-22 17:32:51'),
(1291, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-22 17:32:51'),
(1292, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-22 17:32:51'),
(1293, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-22 17:32:51'),
(1294, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-22 17:32:51'),
(1295, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-22 17:32:51'),
(1296, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-22 17:32:51'),
(1297, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-22 17:32:51'),
(1298, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-22 17:32:51'),
(1299, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-22 17:32:51'),
(1300, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-22 17:32:51'),
(1301, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-22 17:32:51'),
(1302, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-22 17:32:51'),
(1303, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-22 17:32:51'),
(1304, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-22 17:32:51'),
(1305, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-22 17:32:51'),
(1306, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-22 17:32:51'),
(1307, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-22 17:32:51'),
(1308, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-22 17:32:51'),
(1309, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-22 17:32:51'),
(1310, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-22 17:32:51'),
(1311, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-22 17:32:51'),
(1312, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-22 17:32:51'),
(1313, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-22 17:32:51'),
(1314, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-22 17:32:51'),
(1315, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-22 17:32:51'),
(1316, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-22 17:32:51'),
(1317, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-22 17:32:51'),
(1318, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-22 17:32:51'),
(1319, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-22 17:32:51'),
(1320, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-22 17:32:51'),
(1321, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-22 17:32:51'),
(1322, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-22 17:32:51'),
(1323, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-22 17:32:51'),
(1324, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-22 17:32:51'),
(1325, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-22 17:32:51'),
(1326, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-22 17:32:51'),
(1327, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-22 17:32:51'),
(1328, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-22 17:32:51'),
(1329, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-22 17:32:51'),
(1330, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-22 17:32:51'),
(1331, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-22 17:32:51'),
(1332, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-22 17:32:51'),
(1333, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-22 17:32:51'),
(1334, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-22 17:32:51'),
(1335, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-22 17:32:51'),
(1336, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-22 17:32:51'),
(1337, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-22 17:32:51'),
(1338, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-22 17:32:51'),
(1339, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-22 17:32:51'),
(1340, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-22 17:32:51'),
(1341, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-22 17:32:51'),
(1342, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-22 17:32:51'),
(1343, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-22 17:32:51'),
(1344, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-22 17:32:51'),
(1345, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-22 17:32:51'),
(1346, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-22 17:32:51'),
(1347, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-22 17:32:51'),
(1348, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-22 17:32:51'),
(1349, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-22 17:32:51'),
(1350, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-22 17:32:51'),
(1351, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-22 17:32:51'),
(1352, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-22 17:32:51'),
(1353, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-22 17:32:51'),
(1354, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-22 17:32:51'),
(1355, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-22 17:32:51'),
(1356, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-22 17:32:51'),
(1357, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-22 17:32:51'),
(1358, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-22 17:32:51'),
(1359, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-22 17:32:51'),
(1360, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-22 17:32:51'),
(1361, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-22 17:32:51'),
(1362, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-22 17:32:51'),
(1363, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-22 17:32:51'),
(1364, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-22 17:32:51'),
(1365, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-22 17:32:51'),
(1366, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-22 17:32:51'),
(1367, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-22 17:32:51'),
(1368, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-22 17:32:51'),
(1369, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-22 17:32:51'),
(1370, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-22 17:32:51'),
(1371, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-22 17:32:51'),
(1372, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-22 17:32:51'),
(1373, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-22 17:32:51'),
(1374, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-22 17:32:51'),
(1375, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-22 17:32:51'),
(1376, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-22 17:32:51'),
(1377, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-22 17:32:51'),
(1378, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-22 17:32:51'),
(1379, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-22 17:32:51'),
(1380, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-22 17:32:51'),
(1381, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-22 17:32:51'),
(1382, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-22 17:32:51'),
(1383, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-22 17:32:51'),
(1384, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-22 17:32:51'),
(1385, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-22 17:32:51'),
(1386, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-22 17:32:51'),
(1387, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-22 17:32:51'),
(1388, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-22 17:32:51'),
(1389, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-22 17:32:51'),
(1390, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-22 17:32:51'),
(1391, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-22 17:32:51'),
(1392, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-22 17:32:51'),
(1393, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-22 17:32:51'),
(1394, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-22 17:32:51'),
(1395, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-22 17:32:51'),
(1396, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-22 17:32:51'),
(1397, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-22 17:32:51'),
(1398, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-22 17:32:51'),
(1399, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-22 17:32:51'),
(1400, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-22 17:32:51'),
(1401, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-22 17:32:51'),
(1402, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-22 17:32:51'),
(1403, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-22 17:32:51'),
(1404, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-22 17:32:51'),
(1405, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-22 17:32:51'),
(1406, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-22 17:32:51'),
(1407, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-22 17:32:51'),
(1408, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-22 17:32:51'),
(1409, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-22 17:32:51'),
(1410, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-22 17:32:51'),
(1411, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-22 17:32:51');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(1412, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-22 17:32:51'),
(1413, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-22 17:32:51'),
(1414, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-22 17:32:51'),
(1415, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-22 17:32:51'),
(1416, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-22 17:32:51'),
(1417, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-22 17:32:51'),
(1418, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-22 17:32:51'),
(1419, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-22 17:32:51'),
(1420, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-22 17:32:51'),
(1421, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-22 17:32:51'),
(1422, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-22 17:32:51'),
(1423, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-22 17:32:51'),
(1424, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-22 17:32:51'),
(1425, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-22 17:32:51'),
(1426, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-22 17:32:51'),
(1427, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-22 17:32:51'),
(1428, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-22 17:32:51'),
(1429, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-22 17:32:51'),
(1430, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-22 17:32:51'),
(1431, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-22 17:32:51'),
(1432, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-22 17:32:51'),
(1433, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-22 17:32:51'),
(1434, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-22 17:32:51'),
(1435, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-22 17:32:51'),
(1436, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-22 17:32:51'),
(1437, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-22 17:32:51'),
(1438, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-22 17:32:51'),
(1439, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-22 17:32:51'),
(1440, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-22 17:32:51'),
(1441, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-22 17:32:51'),
(1442, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-22 17:32:51'),
(1443, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-22 17:32:51'),
(1444, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-22 17:32:51'),
(1445, 1, 97, '64e7f3e1b89692ecd7b8e195ac16392c187dc82212fd891eb1', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-22 17:32:51'),
(1446, 1, 10, 'bdcce26f85f9f30b08b7e751f65e662165aca47c05703beb8a', 1, 'alterar', 'socios', 'INSERT INTO pessoa_juridica_fisica_socio (pessoaFisicaCod, pessoaRelacaoPessoaTipoCod, pessoaJuridicaFisicaSocioPercentual, pessoaJuridicaFisicaSocioIsolado, pessoaJuridicaFisicaSocioDataIngresso, pessoaJuridicaFisicaSocioDataEgresso, pessoaJuridicaCod) VALUES(8, 3, 50, ''S'', ''2007-12-26'', '''', 1)', '2015-04-22 22:36:41'),
(1447, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-22 17:42:24'),
(1448, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-22 17:42:24'),
(1449, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-22 17:42:24'),
(1450, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-22 17:42:24'),
(1451, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-22 17:42:24'),
(1452, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-22 17:42:24'),
(1453, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-22 17:42:24'),
(1454, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-22 17:42:25'),
(1455, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-22 17:42:25'),
(1456, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Sócios'', acaoModuloIdPermissao = ''tabPJ2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Socios'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 628', '2015-04-22 17:42:25'),
(1457, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Sócios de Pessoa Jurídica'', acaoModuloIdPermissao = ''sociosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 21, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 629', '2015-04-22 17:42:25'),
(1458, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Documentos'', ''tabPJ3'', ''fa fa-leanpub'', '''', '''', ''Documentos'', '''', 3, ''T'', 10)', '2015-04-22 17:42:25'),
(1459, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Alterar na tab Documentos de Pessoa Jurídica'', ''documentosPJAlterar'', '''', '''', '''', '''', '''', 31, ''I'', 10)', '2015-04-22 17:42:25'),
(1460, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Contatos'', ''tabPJ4'', ''fa fa-street-view'', '''', '''', ''Contatos'', '''', 4, ''T'', 10)', '2015-04-22 17:42:25'),
(1461, 1, 82, '275f76ae7916fb12ac8a662a6a2d71dd86caa4a1f6f9a5637b', 10, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Alterar na tab Contatos de Pessoa Jurídica'', ''contatosPJAlterar'', '''', '''', '''', '''', '''', 41, ''I'', 10)', '2015-04-22 17:42:25'),
(1462, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-22 17:42:40'),
(1463, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-22 17:42:40'),
(1464, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-22 17:42:40'),
(1465, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-22 17:42:40'),
(1466, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-22 17:42:40'),
(1467, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-22 17:42:40'),
(1468, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-22 17:42:40'),
(1469, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-22 17:42:40'),
(1470, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-22 17:42:40'),
(1471, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-22 17:42:40'),
(1472, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-22 17:42:40'),
(1473, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-22 17:42:40'),
(1474, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-22 17:42:40'),
(1475, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-22 17:42:40'),
(1476, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-22 17:42:40'),
(1477, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-22 17:42:40'),
(1478, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-22 17:42:40'),
(1479, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-22 17:42:40'),
(1480, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-22 17:42:40'),
(1481, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-22 17:42:41'),
(1482, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-22 17:42:41'),
(1483, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-22 17:42:41'),
(1484, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-22 17:42:41'),
(1485, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-22 17:42:41'),
(1486, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-22 17:42:41'),
(1487, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-22 17:42:41'),
(1488, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-22 17:42:41'),
(1489, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-22 17:42:41'),
(1490, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-22 17:42:41'),
(1491, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-22 17:42:41'),
(1492, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-22 17:42:41'),
(1493, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-22 17:42:41'),
(1494, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-22 17:42:41'),
(1495, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-22 17:42:41'),
(1496, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-22 17:42:41'),
(1497, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(628, 1)', '2015-04-22 17:42:41'),
(1498, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(630, 1)', '2015-04-22 17:42:41'),
(1499, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-22 17:42:41'),
(1500, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-22 17:42:41'),
(1501, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(632, 1)', '2015-04-22 17:42:41'),
(1502, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-22 17:42:41'),
(1503, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-22 17:42:41'),
(1504, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-22 17:42:41'),
(1505, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(629, 1)', '2015-04-22 17:42:41'),
(1506, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(631, 1)', '2015-04-22 17:42:41'),
(1507, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(633, 1)', '2015-04-22 17:42:41'),
(1508, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-22 17:42:41'),
(1509, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-22 17:42:41'),
(1510, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-22 17:42:41'),
(1511, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-22 17:42:41'),
(1512, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-22 17:42:41'),
(1513, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-22 17:42:41'),
(1514, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-22 17:42:41'),
(1515, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-22 17:42:41'),
(1516, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-22 17:42:41'),
(1517, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-22 17:42:41'),
(1518, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-22 17:42:41'),
(1519, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-22 17:42:41'),
(1520, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-22 17:42:41'),
(1521, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-22 17:42:41'),
(1522, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-22 17:42:41'),
(1523, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-22 17:42:41'),
(1524, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-22 17:42:41'),
(1525, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-22 17:42:41'),
(1526, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-22 17:42:41'),
(1527, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(535, 1)', '2015-04-22 17:42:41'),
(1528, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(541, 1)', '2015-04-22 17:42:41'),
(1529, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(536, 1)', '2015-04-22 17:42:41'),
(1530, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(540, 1)', '2015-04-22 17:42:41'),
(1531, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(537, 1)', '2015-04-22 17:42:41'),
(1532, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(538, 1)', '2015-04-22 17:42:41'),
(1533, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(539, 1)', '2015-04-22 17:42:41'),
(1534, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-22 17:42:41'),
(1535, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-22 17:42:41'),
(1536, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-22 17:42:41'),
(1537, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-22 17:42:41'),
(1538, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-22 17:42:41'),
(1539, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-22 17:42:41'),
(1540, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-22 17:42:41'),
(1541, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-22 17:42:41'),
(1542, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-22 17:42:41'),
(1543, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-22 17:42:41'),
(1544, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-22 17:42:41'),
(1545, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-22 17:42:41'),
(1546, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-22 17:42:41'),
(1547, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-22 17:42:41'),
(1548, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-22 17:42:41'),
(1549, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-22 17:42:41'),
(1550, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-22 17:42:41'),
(1551, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-22 17:42:41'),
(1552, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-22 17:42:41'),
(1553, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-22 17:42:41'),
(1554, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-22 17:42:41'),
(1555, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-22 17:42:41'),
(1556, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-22 17:42:41'),
(1557, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-22 17:42:41'),
(1558, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-22 17:42:41'),
(1559, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-22 17:42:41'),
(1560, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-22 17:42:41'),
(1561, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-22 17:42:41'),
(1562, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-22 17:42:41'),
(1563, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-22 17:42:41'),
(1564, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-22 17:42:41'),
(1565, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-22 17:42:41'),
(1566, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-22 17:42:41'),
(1567, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-22 17:42:41'),
(1568, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-22 17:42:41'),
(1569, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-22 17:42:41'),
(1570, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-22 17:42:41'),
(1571, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-22 17:42:41'),
(1572, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-22 17:42:41'),
(1573, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-22 17:42:41'),
(1574, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-22 17:42:41'),
(1575, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-22 17:42:41'),
(1576, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-22 17:42:41'),
(1577, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-22 17:42:41'),
(1578, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-22 17:42:41'),
(1579, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-22 17:42:41'),
(1580, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-22 17:42:41'),
(1581, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-22 17:42:41'),
(1582, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-22 17:42:41'),
(1583, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-22 17:42:41'),
(1584, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-22 17:42:41'),
(1585, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-22 17:42:41'),
(1586, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-22 17:42:41'),
(1587, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-22 17:42:41'),
(1588, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-22 17:42:41'),
(1589, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-22 17:42:41'),
(1590, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-22 17:42:41'),
(1591, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-22 17:42:41'),
(1592, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-22 17:42:41'),
(1593, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-22 17:42:41'),
(1594, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-22 17:42:41'),
(1595, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-22 17:42:41'),
(1596, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-22 17:42:41'),
(1597, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-22 17:42:41'),
(1598, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-22 17:42:41'),
(1599, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-22 17:42:41'),
(1600, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-22 17:42:41'),
(1601, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-22 17:42:41'),
(1602, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-22 17:42:41'),
(1603, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-22 17:42:41'),
(1604, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-22 17:42:41'),
(1605, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-22 17:42:41'),
(1606, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-22 17:42:41'),
(1607, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-22 17:42:41'),
(1608, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-22 17:42:41'),
(1609, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-22 17:42:41'),
(1610, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-22 17:42:41'),
(1611, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-22 17:42:41'),
(1612, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-22 17:42:41'),
(1613, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-22 17:42:41'),
(1614, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-22 17:42:41'),
(1615, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-22 17:42:41'),
(1616, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-22 17:42:41'),
(1617, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-22 17:42:41'),
(1618, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-22 17:42:41'),
(1619, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-22 17:42:41'),
(1620, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-22 17:42:41'),
(1621, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-22 17:42:41'),
(1622, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-22 17:42:41'),
(1623, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-22 17:42:41'),
(1624, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-22 17:42:41'),
(1625, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-22 17:42:41'),
(1626, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-22 17:42:41'),
(1627, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-22 17:42:41'),
(1628, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-22 17:42:41'),
(1629, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-22 17:42:41'),
(1630, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-22 17:42:41'),
(1631, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-22 17:42:41'),
(1632, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-22 17:42:41'),
(1633, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-22 17:42:41'),
(1634, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-22 17:42:41'),
(1635, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-22 17:42:41'),
(1636, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-22 17:42:41'),
(1637, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-22 17:42:41'),
(1638, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-22 17:42:41'),
(1639, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-22 17:42:41'),
(1640, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-22 17:42:41'),
(1641, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-22 17:42:41'),
(1642, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-22 17:42:41'),
(1643, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-22 17:42:41'),
(1644, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-22 17:42:41'),
(1645, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-22 17:42:41'),
(1646, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-22 17:42:41'),
(1647, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-22 17:42:41'),
(1648, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-22 17:42:41'),
(1649, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-22 17:42:41'),
(1650, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-22 17:42:41'),
(1651, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-22 17:42:41'),
(1652, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-22 17:42:41'),
(1653, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-22 17:42:41'),
(1654, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-22 17:42:41'),
(1655, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-22 17:42:41'),
(1656, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-22 17:42:41'),
(1657, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-22 17:42:41'),
(1658, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-22 17:42:41'),
(1659, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-22 17:42:41'),
(1660, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-22 17:42:41'),
(1661, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-22 17:42:41'),
(1662, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-22 17:42:41'),
(1663, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-22 17:42:41'),
(1664, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-22 17:42:41'),
(1665, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-22 17:42:41');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(1666, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-22 17:42:41'),
(1667, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-22 17:42:41'),
(1668, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-22 17:42:41'),
(1669, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-22 17:42:41'),
(1670, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-22 17:42:41'),
(1671, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-22 17:42:41'),
(1672, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-22 17:42:41'),
(1673, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-22 17:42:41'),
(1674, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-22 17:42:41'),
(1675, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-22 17:42:41'),
(1676, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-22 17:42:41'),
(1677, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-22 17:42:41'),
(1678, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-22 17:42:41'),
(1679, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-22 17:42:41'),
(1680, 1, 97, '6b24b7ee99dc0a729a9a79c1195713f7b61ef0e1748d724d0d', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-22 17:42:41'),
(1681, 1, 10, 'e499a59b8b6d8d02a219fe79ca1201f1062261e16d5940ec8f', 1, 'alterar', 'contato', 'INSERT INTO pessoa_juridica_email (pessoaJuridicaEmail, pessoaJuridicaEmailStatus, pessoaJuridicaCod) VALUES(''contato@braconsultoria.com.br'', ''A'', 1)', '2015-04-22 22:45:52'),
(1682, 1, 10, 'e499a59b8b6d8d02a219fe79ca1201f1062261e16d5940ec8f', 1, 'alterar', 'contato', 'INSERT INTO pessoa_juridica_telefone (pessoaJuridicaTelefone, pessoaJuridicaTelefoneStatus, pessoaJuridicaCod) VALUES(''(81) 3011-0702'', ''A'', 1)', '2015-04-22 22:45:52'),
(1683, 1, 10, 'e499a59b8b6d8d02a219fe79ca1201f1062261e16d5940ec8f', 1, 'alterar', 'contato', 'INSERT INTO pessoa_juridica_url (pessoaJuridicaUrlTipo, pessoaJuridicaUrl, pessoaJuridicaUrlStatus, pessoaJuridicaCod) VALUES(''fa-globe'', ''http://www.braconsultoria.com.br'', ''A'', 1)', '2015-04-22 22:45:53'),
(1684, 1, 10, '94b7c4a06a3738ef35970926369899b5d8cb5750204f85d4dd', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_email SET pessoaJuridicaEmail = ''contato@braconsultoria.com.br'', pessoaJuridicaEmailStatus = ''A'' WHERE pessoajuridicaemailcod = 1', '2015-04-22 22:46:31'),
(1685, 1, 10, '94b7c4a06a3738ef35970926369899b5d8cb5750204f85d4dd', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_telefone SET pessoaJuridicaTelefone = ''(81) 3011-0702'', pessoaJuridicaTelefoneStatus = ''A'' WHERE pessoajuridicatelefonecod = 1', '2015-04-22 22:46:32'),
(1686, 1, 10, '94b7c4a06a3738ef35970926369899b5d8cb5750204f85d4dd', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_url SET pessoaJuridicaUrlTipo = ''fa-globe'', pessoaJuridicaUrl = ''http://www.braconsultoria.com.br'', pessoaJuridicaUrlStatus = ''A'' WHERE pessoajuridicaurlcod = 1', '2015-04-22 22:46:33'),
(1687, 1, 10, '94b7c4a06a3738ef35970926369899b5d8cb5750204f85d4dd', 1, 'alterar', 'contato', 'INSERT INTO pessoa_juridica_endereco (pessoaJuridicaEnderecoCep, pessoaJuridicaEnderecoNome, pessoaJuridicaEnderecoNumero, pessoaJuridicaEnderecoComplemento, pessoaJuridicaEnderecoBairro, ufCidadeCod, pessoaJuridicaEnderecoTipo, pessoaJuridicaEnderecoStatus, pessoaJuridicaCod) VALUES(78060581, ''Avenida Jornalista Arquimedes Pereira Lima'', 870, ''Torre 2'', ''Jardim das Américas'', 4347, ''S'', ''A'', 1)', '2015-04-22 22:46:33'),
(1688, 1, 10, '554e9060addb0f626e63aa4895e72205e6eab80e51b3aa2d07', 1, 'alterar', 'documento', 'INSERT INTO pessoa_juridica_cnpj (pessoaJuridicaCNPJNumeros, pessoaJuridicaCNPJDataAbertura, pessoaJuridicaCod) VALUES(''10.582.517/0001-90'', ''2007-12-26'', 1)', '2015-04-23 17:06:56'),
(1689, 1, 10, '6fb90f1c261cfa523d8bc3c12893f00dc5537cba0c282fd744', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'' WHERE pessoajuridicacnpjcod = 1', '2015-04-23 17:11:21'),
(1690, 1, 10, '6fb90f1c261cfa523d8bc3c12893f00dc5537cba0c282fd744', 1, 'alterar', 'documento', 'INSERT INTO pessoa_juridica_cnpj_cnae (cnaeCod, pessoaJuridicaCod) VALUES(6201500, 1)', '2015-04-23 17:11:22'),
(1691, 1, 10, '6fb90f1c261cfa523d8bc3c12893f00dc5537cba0c282fd744', 1, 'alterar', 'documento', 'INSERT INTO pessoa_juridica_cnpj_cnae (cnaeCod, pessoaJuridicaCod) VALUES(6209100, 1)', '2015-04-23 17:11:22'),
(1692, 1, 10, '6fb90f1c261cfa523d8bc3c12893f00dc5537cba0c282fd744', 1, 'alterar', 'documento', 'INSERT INTO pessoa_juridica_cnpj_cnae (cnaeCod, pessoaJuridicaCod) VALUES(6202300, 1)', '2015-04-23 17:11:23'),
(1693, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-23 15:01:31'),
(1694, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-23 15:01:31'),
(1695, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-23 15:01:31'),
(1696, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-23 15:01:31'),
(1697, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-23 15:01:31'),
(1698, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-23 15:01:31'),
(1699, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-23 15:01:31'),
(1700, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-23 15:01:31'),
(1701, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-23 15:01:31'),
(1702, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-23 15:01:31'),
(1703, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-23 15:01:31'),
(1704, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-23 15:01:31'),
(1705, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-23 15:01:31'),
(1706, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-23 15:01:31'),
(1707, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-23 15:01:31'),
(1708, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-23 15:01:31'),
(1709, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-23 15:01:31'),
(1710, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-23 15:01:31'),
(1711, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-23 15:01:31'),
(1712, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-23 15:01:31'),
(1713, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-23 15:01:31'),
(1714, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-23 15:01:31'),
(1715, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-23 15:01:31'),
(1716, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-23 15:01:31'),
(1717, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-23 15:01:31'),
(1718, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-23 15:01:31'),
(1719, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-23 15:01:31'),
(1720, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-23 15:01:31'),
(1721, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-23 15:01:31'),
(1722, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-23 15:01:31'),
(1723, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-23 15:01:31'),
(1724, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-23 15:01:31'),
(1725, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-23 15:01:31'),
(1726, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-23 15:01:31'),
(1727, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-23 15:01:31'),
(1728, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(628, 1)', '2015-04-23 15:01:31'),
(1729, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(630, 1)', '2015-04-23 15:01:31'),
(1730, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-23 15:01:31'),
(1731, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-23 15:01:31'),
(1732, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(632, 1)', '2015-04-23 15:01:31'),
(1733, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-23 15:01:31'),
(1734, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-23 15:01:31'),
(1735, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-23 15:01:31'),
(1736, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(629, 1)', '2015-04-23 15:01:31'),
(1737, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(631, 1)', '2015-04-23 15:01:31'),
(1738, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(633, 1)', '2015-04-23 15:01:31'),
(1739, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-23 15:01:31'),
(1740, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-23 15:01:31'),
(1741, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-23 15:01:31'),
(1742, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-23 15:01:31'),
(1743, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-23 15:01:31'),
(1744, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-23 15:01:31'),
(1745, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-23 15:01:31'),
(1746, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-23 15:01:31'),
(1747, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-23 15:01:31'),
(1748, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-23 15:01:31'),
(1749, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-23 15:01:31'),
(1750, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-23 15:01:31'),
(1751, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-23 15:01:31'),
(1752, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-23 15:01:31'),
(1753, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-23 15:01:31'),
(1754, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-23 15:01:31'),
(1755, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-23 15:01:31'),
(1756, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-23 15:01:31'),
(1757, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-23 15:01:31'),
(1758, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-23 15:01:31'),
(1759, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-23 15:01:31'),
(1760, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-23 15:01:31'),
(1761, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-23 15:01:31'),
(1762, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-23 15:01:31'),
(1763, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-23 15:01:31'),
(1764, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-23 15:01:31'),
(1765, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-23 15:01:31'),
(1766, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-23 15:01:31'),
(1767, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-23 15:01:31'),
(1768, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-23 15:01:31'),
(1769, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-23 15:01:31'),
(1770, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-23 15:01:31'),
(1771, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-23 15:01:31'),
(1772, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-23 15:01:31'),
(1773, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-23 15:01:31'),
(1774, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-23 15:01:31'),
(1775, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-23 15:01:31'),
(1776, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-23 15:01:31'),
(1777, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-23 15:01:31'),
(1778, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-23 15:01:31'),
(1779, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-23 15:01:31'),
(1780, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-23 15:01:31'),
(1781, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-23 15:01:31'),
(1782, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-23 15:01:31'),
(1783, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-23 15:01:31'),
(1784, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-23 15:01:31'),
(1785, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-23 15:01:31'),
(1786, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-23 15:01:31'),
(1787, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-23 15:01:31'),
(1788, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-23 15:01:31'),
(1789, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-23 15:01:31'),
(1790, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-23 15:01:31'),
(1791, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-23 15:01:31'),
(1792, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-23 15:01:31'),
(1793, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-23 15:01:31'),
(1794, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-23 15:01:31'),
(1795, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-23 15:01:31'),
(1796, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-23 15:01:31'),
(1797, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-23 15:01:31'),
(1798, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-23 15:01:31'),
(1799, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-23 15:01:31'),
(1800, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-23 15:01:31'),
(1801, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-23 15:01:31'),
(1802, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-23 15:01:31'),
(1803, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-23 15:01:31'),
(1804, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-23 15:01:31'),
(1805, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-23 15:01:31'),
(1806, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-23 15:01:31'),
(1807, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-23 15:01:31'),
(1808, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-23 15:01:31'),
(1809, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-23 15:01:31'),
(1810, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-23 15:01:31'),
(1811, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-23 15:01:31'),
(1812, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-23 15:01:31'),
(1813, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-23 15:01:31'),
(1814, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-23 15:01:31'),
(1815, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-23 15:01:31'),
(1816, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-23 15:01:31'),
(1817, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-23 15:01:31'),
(1818, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-23 15:01:31'),
(1819, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-23 15:01:31'),
(1820, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-23 15:01:31'),
(1821, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-23 15:01:31'),
(1822, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-23 15:01:31'),
(1823, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-23 15:01:31'),
(1824, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-23 15:01:31'),
(1825, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-23 15:01:31'),
(1826, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-23 15:01:31'),
(1827, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-23 15:01:31'),
(1828, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-23 15:01:31'),
(1829, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-23 15:01:31'),
(1830, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-23 15:01:31'),
(1831, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-23 15:01:31'),
(1832, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-23 15:01:31'),
(1833, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-23 15:01:31'),
(1834, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-23 15:01:31'),
(1835, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-23 15:01:31'),
(1836, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-23 15:01:31'),
(1837, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-23 15:01:31'),
(1838, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-23 15:01:31'),
(1839, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-23 15:01:31'),
(1840, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-23 15:01:31'),
(1841, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-23 15:01:31'),
(1842, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-23 15:01:31'),
(1843, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-23 15:01:31'),
(1844, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-23 15:01:31'),
(1845, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-23 15:01:31'),
(1846, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-23 15:01:31'),
(1847, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-23 15:01:31'),
(1848, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-23 15:01:31'),
(1849, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-23 15:01:31'),
(1850, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-23 15:01:31'),
(1851, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-23 15:01:31'),
(1852, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-23 15:01:31'),
(1853, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-23 15:01:31'),
(1854, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-23 15:01:31'),
(1855, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-23 15:01:31'),
(1856, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-23 15:01:31'),
(1857, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-23 15:01:31'),
(1858, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-23 15:01:31'),
(1859, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-23 15:01:31'),
(1860, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-23 15:01:31'),
(1861, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-23 15:01:31'),
(1862, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-23 15:01:31'),
(1863, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-23 15:01:31'),
(1864, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-23 15:01:31'),
(1865, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-23 15:01:31'),
(1866, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-23 15:01:31'),
(1867, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-23 15:01:31'),
(1868, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-23 15:01:31'),
(1869, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-23 15:01:31'),
(1870, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-23 15:01:31'),
(1871, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-23 15:01:31'),
(1872, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-23 15:01:31'),
(1873, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-23 15:01:31'),
(1874, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-23 15:01:31'),
(1875, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-23 15:01:31'),
(1876, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-23 15:01:31'),
(1877, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-23 15:01:31'),
(1878, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-23 15:01:31'),
(1879, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-23 15:01:31'),
(1880, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-23 15:01:31'),
(1881, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-23 15:01:31'),
(1882, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-23 15:01:31'),
(1883, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-23 15:01:31'),
(1884, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-23 15:01:31'),
(1885, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-23 15:01:31'),
(1886, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-23 15:01:31'),
(1887, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-23 15:01:31'),
(1888, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-23 15:01:31'),
(1889, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-23 15:01:31'),
(1890, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-23 15:01:31'),
(1891, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-23 15:01:31'),
(1892, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-23 15:01:31'),
(1893, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-23 15:01:31'),
(1894, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-23 15:01:31'),
(1895, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-23 15:01:31'),
(1896, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-23 15:01:31'),
(1897, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-23 15:01:31'),
(1898, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-23 15:01:31'),
(1899, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-23 15:01:31'),
(1900, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-23 15:01:31'),
(1901, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-23 15:01:31'),
(1902, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-23 15:01:31'),
(1903, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-23 15:01:31'),
(1904, 1, 97, 'ab38c6945394d5a2da63bff64c71541eb90eb051cb498d2675', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-23 15:01:31'),
(1905, 1, 10, '7e156aa39e97dba1c88d06eec9b05334a787631f602ef0e7e3', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_email SET pessoaJuridicaEmail = ''contato@braconsultoria.com.br'', pessoaJuridicaEmailStatus = ''A'' WHERE pessoajuridicaemailcod = 1', '2015-04-23 20:56:58'),
(1906, 1, 10, '7e156aa39e97dba1c88d06eec9b05334a787631f602ef0e7e3', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_telefone SET pessoaJuridicaTelefone = ''(81) 3011-0702'', pessoaJuridicaTelefoneStatus = ''A'' WHERE pessoajuridicatelefonecod = 1', '2015-04-23 20:56:58'),
(1907, 1, 10, '7e156aa39e97dba1c88d06eec9b05334a787631f602ef0e7e3', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_url SET pessoaJuridicaUrlTipo = ''fa-globe'', pessoaJuridicaUrl = ''http://www.braconsultoria.com.br'', pessoaJuridicaUrlStatus = ''A'' WHERE pessoajuridicaurlcod = 1', '2015-04-23 20:56:59'),
(1908, 1, 10, '7e156aa39e97dba1c88d06eec9b05334a787631f602ef0e7e3', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_endereco SET pessoaJuridicaEnderecoCep = 78060581, pessoaJuridicaEnderecoNome = ''Avenida Jornalista Arquimedes Pereira Lima'', pessoaJuridicaEnderecoNumero = 870, pessoaJuridicaEnderecoComplemento = ''Torre 2'', pessoaJuridicaEnderecoBairro = ''Jardim das Américas'', ufCidadeCod = 4347, pessoaJuridicaEnderecoTipo = ''CNPJ'', pessoaJuridicaEnderecoStatus = ''A'' WHERE pessoajuridicaenderecocod = 1', '2015-04-23 20:57:00'),
(1909, 1, 10, '12eb47d730778ba76ee8907d5ae2b55cd3b87af4eaae5a41ab', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'', pessoaJuridicaCNPJSitCad = ''A'', pessoaJuridicaCNPJSitCadData = ''0000-00-00'' WHERE pessoajuridicacnpjcod = 1', '2015-04-23 20:58:01'),
(1910, 1, 10, '12eb47d730778ba76ee8907d5ae2b55cd3b87af4eaae5a41ab', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6201500 WHERE pessoajuridicacnpjcnaecod = 1', '2015-04-23 20:58:02'),
(1911, 1, 10, '12eb47d730778ba76ee8907d5ae2b55cd3b87af4eaae5a41ab', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6209100 WHERE pessoajuridicacnpjcnaecod = 2', '2015-04-23 20:58:03'),
(1912, 1, 10, '12eb47d730778ba76ee8907d5ae2b55cd3b87af4eaae5a41ab', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6202300 WHERE pessoajuridicacnpjcnaecod = 3', '2015-04-23 20:58:03'),
(1913, 1, 10, '12eb47d730778ba76ee8907d5ae2b55cd3b87af4eaae5a41ab', 1, 'alterar', 'documento', 'INSERT INTO pessoa_juridica_cnpj_cnjur (cnjurCod, pessoaJuridicaCod) VALUES(''206-2'', 1)', '2015-04-23 20:58:04'),
(1914, 1, 10, 'f21389c8f49c28cb58a14332a396193f218adb773380dfaabd', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'', pessoaJuridicaCNPJSitCad = ''A'', pessoaJuridicaCNPJSitCadData = ''0000-00-00'' WHERE pessoajuridicacnpjcod = 1', '2015-04-23 21:00:24'),
(1915, 1, 10, 'f21389c8f49c28cb58a14332a396193f218adb773380dfaabd', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6201500 WHERE pessoajuridicacnpjcnaecod = 1', '2015-04-23 21:00:25'),
(1916, 1, 10, 'f21389c8f49c28cb58a14332a396193f218adb773380dfaabd', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6209100 WHERE pessoajuridicacnpjcnaecod = 2', '2015-04-23 21:00:25'),
(1917, 1, 10, 'f21389c8f49c28cb58a14332a396193f218adb773380dfaabd', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6202300 WHERE pessoajuridicacnpjcnaecod = 3', '2015-04-23 21:00:26'),
(1918, 1, 10, 'f21389c8f49c28cb58a14332a396193f218adb773380dfaabd', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnjur SET cnjurCod = 2062 WHERE pessoajuridicacnpjcnjurcod = 1', '2015-04-23 21:00:26'),
(1919, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'', pessoaJuridicaCNPJSitCad = ''A'', pessoaJuridicaCNPJSitCadData = ''0000-00-00'', pessoaJuridicaCNPJCapital = 0 WHERE pessoajuridicacnpjcod = 1', '2015-04-23 21:08:44'),
(1920, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaCNPJ1'', ''CNPJ-VR.pdf'', ''2015-04-23'', ''application/pdf'')', '2015-04-23 21:08:45'),
(1921, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE _upload SET uploadNomeFisico = ''187vvXyaYyDhE23RIPvhKXWDwo232.pdf'' WHERE uploadCod = 232', '2015-04-23 21:08:45'),
(1922, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6201500 WHERE pessoajuridicacnpjcnaecod = 1', '2015-04-23 21:08:46'),
(1923, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6209100 WHERE pessoajuridicacnpjcnaecod = 2', '2015-04-23 21:08:46'),
(1924, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6202300 WHERE pessoajuridicacnpjcnaecod = 3', '2015-04-23 21:08:48'),
(1925, 1, 10, '575c6787186f7afb0882373142244c5c99c04ced960b31219d', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnjur SET cnjurCod = 2062 WHERE pessoajuridicacnpjcnjurcod = 1', '2015-04-23 21:08:49');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(1926, 1, 10, '45a0bfcc8fadef75c1b122fa7d0fce017164703bb7d7ef3f74', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'', pessoaJuridicaCNPJSitCad = ''A'', pessoaJuridicaCNPJSitCadData = ''0000-00-00'', pessoaJuridicaCNPJCapital = 1500000 WHERE pessoajuridicacnpjcod = 1', '2015-04-23 21:34:24'),
(1927, 1, 10, '45a0bfcc8fadef75c1b122fa7d0fce017164703bb7d7ef3f74', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6201500 WHERE pessoajuridicacnpjcnaecod = 1', '2015-04-23 21:34:25'),
(1928, 1, 10, '45a0bfcc8fadef75c1b122fa7d0fce017164703bb7d7ef3f74', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6209100 WHERE pessoajuridicacnpjcnaecod = 2', '2015-04-23 21:34:25'),
(1929, 1, 10, '45a0bfcc8fadef75c1b122fa7d0fce017164703bb7d7ef3f74', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6202300 WHERE pessoajuridicacnpjcnaecod = 3', '2015-04-23 21:34:26'),
(1930, 1, 10, '45a0bfcc8fadef75c1b122fa7d0fce017164703bb7d7ef3f74', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnjur SET cnjurCod = 2062 WHERE pessoajuridicacnpjcnjurcod = 1', '2015-04-23 21:34:26'),
(1931, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-23 16:41:39'),
(1932, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-23 16:41:39'),
(1933, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-23 16:41:39'),
(1934, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-23 16:41:39'),
(1935, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-23 16:41:39'),
(1936, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-23 16:41:39'),
(1937, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-23 16:41:39'),
(1938, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-23 16:41:39'),
(1939, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-23 16:41:39'),
(1940, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Representantes'', acaoModuloIdPermissao = ''tabPJ2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Socios'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 628', '2015-04-23 16:41:39'),
(1941, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Representantes de Pessoa Jurídica'', acaoModuloIdPermissao = ''sociosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 21, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 629', '2015-04-23 16:41:40'),
(1942, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tabPJ3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 630', '2015-04-23 16:41:40'),
(1943, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Documentos de Pessoa Jurídica'', acaoModuloIdPermissao = ''documentosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 31, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 631', '2015-04-23 16:41:40'),
(1944, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tabPJ4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 632', '2015-04-23 16:41:40'),
(1945, 1, 82, '8858bc9c21aae36652b0de055947c46561223fb110019ecc7f', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Contatos de Pessoa Jurídica'', acaoModuloIdPermissao = ''contatosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 41, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 633', '2015-04-23 16:41:40'),
(1946, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaJuridica'', moduloNomeMenu = ''Pessoa jurídica'', moduloTabelaBase = '''', moduloDesc = ''Pessoa jurídica'', moduloVisivelMenu = ''S'', moduloPosicao = 2, moduloBase = '''', moduloClass = ''menu-icon fa fa-briefcase'' WHERE moduloCod = 10', '2015-04-23 16:46:56'),
(1947, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 620', '2015-04-23 16:46:56'),
(1948, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 621', '2015-04-23 16:46:56'),
(1949, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 622', '2015-04-23 16:46:56'),
(1950, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 623', '2015-04-23 16:46:56'),
(1951, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 624', '2015-04-23 16:46:56'),
(1952, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 625', '2015-04-23 16:46:56'),
(1953, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tabPJ1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 626', '2015-04-23 16:46:56'),
(1954, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial de Pessoa Jurídica'', acaoModuloIdPermissao = ''inicialPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 11, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 627', '2015-04-23 16:46:56'),
(1955, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Sócios e administradores'', acaoModuloIdPermissao = ''tabPJ2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Socios'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 628', '2015-04-23 16:46:56'),
(1956, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Sócios e administradores de Pessoa Jurídica'', acaoModuloIdPermissao = ''sociosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 21, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 629', '2015-04-23 16:46:56'),
(1957, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tabPJ3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 630', '2015-04-23 16:46:56'),
(1958, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Documentos de Pessoa Jurídica'', acaoModuloIdPermissao = ''documentosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 31, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 631', '2015-04-23 16:46:56'),
(1959, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tabPJ4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 632', '2015-04-23 16:46:56'),
(1960, 1, 82, 'b8679c442269d884b536a04234dbb865e923a923d00f68da9d', 10, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar na tab Contatos de Pessoa Jurídica'', acaoModuloIdPermissao = ''contatosPJAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 41, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 633', '2015-04-23 16:46:56'),
(1961, 1, 10, 'c6f55b27934cb414fa7361232ec851c8d2d121b7607397e7c6', NULL, 'cadastrar', 'inicial', 'INSERT INTO pessoa (pessoaCod, organogramaCod, pessoaTipo, pessoaStatus) VALUES('''', 7, ''J'', ''A'')', '2015-04-23 21:50:31'),
(1962, 1, 10, 'c6f55b27934cb414fa7361232ec851c8d2d121b7607397e7c6', NULL, 'cadastrar', 'inicial', 'INSERT INTO pessoa_juridica (pessoaJuridicaCod, organogramaCod, pessoaCod, pessoaJuridicaNome, pessoaJuridicaRazao, pessoaJuridicaDataFundacao, pessoaJuridicaStatus) VALUES('''', 7, 10, ''Prefeitura Municipal de Tangará'', ''Prefeitura Municipal de Tangará'', ''2001-01-01'', ''A'')', '2015-04-23 21:50:32'),
(1963, 1, 10, '6c0041bca6253cf4a5b307b1397366f9bbc9874b301b6ba4b7', 1, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaFoto'', ''logo-bra1.png'', ''2015-04-24'', ''image/png'')', '2015-04-24 16:22:44'),
(1964, 1, 10, '6c0041bca6253cf4a5b307b1397366f9bbc9874b301b6ba4b7', 1, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''52iutUZGruSO220CG1qfiM9u0Y233.png'' WHERE uploadCod = 233', '2015-04-24 16:22:44'),
(1965, 1, 10, '938906f14a1dddb8f8d9960828514c45dcfe17fe6dba6e2686', 1, 'alterar', 'inicial', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 233)', '2015-04-24 11:29:14'),
(1966, 1, 10, '938906f14a1dddb8f8d9960828514c45dcfe17fe6dba6e2686', 1, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaFoto'', ''logo-bra1.png'', ''2015-04-24'', ''image/png'')', '2015-04-24 11:29:14'),
(1967, 1, 10, '938906f14a1dddb8f8d9960828514c45dcfe17fe6dba6e2686', 1, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''13xnC8Dlc4YEM12Mo93CD9xeC2234.png'' WHERE uploadCod = 234', '2015-04-24 11:29:14'),
(1972, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj SET pessoaJuridicaCNPJNumeros = ''10.582.517/0001-90'', pessoaJuridicaCNPJDataAbertura = ''2007-12-26'', pessoaJuridicaCNPJSitCad = ''A'', pessoaJuridicaCNPJSitCadData = ''0000-00-00'', pessoaJuridicaCNPJCapital = 1500000 WHERE pessoajuridicacnpjcod = 1', '2015-04-24 11:42:11'),
(1973, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 232)', '2015-04-24 11:42:11'),
(1974, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaCNPJ1'', ''CNPJ-VR.pdf'', ''2015-04-24'', ''application/pdf'')', '2015-04-24 11:42:11'),
(1975, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE _upload SET uploadNomeFisico = ''78fVG0cC6JMzY68fSIJlDtHZrs236.pdf'' WHERE uploadCod = 236', '2015-04-24 11:42:11'),
(1976, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6201500 WHERE pessoajuridicacnpjcnaecod = 1', '2015-04-24 11:42:11'),
(1977, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6209100 WHERE pessoajuridicacnpjcnaecod = 2', '2015-04-24 11:42:11'),
(1978, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnae SET cnaeCod = 6202300 WHERE pessoajuridicacnpjcnaecod = 3', '2015-04-24 11:42:11'),
(1979, 1, 10, 'd47b04463cb7d3a3fef6fb270135e963a9fa5ba0c6351243a6', 1, 'alterar', 'documento', 'UPDATE pessoa_juridica_cnpj_cnjur SET cnjurCod = 2062 WHERE pessoajuridicacnpjcnjurcod = 1', '2015-04-24 11:42:11'),
(1980, 1, 10, 'a2a7ea18988c442d57138118a6865fa64f1689946b6a113039', 1, 'alterar', 'inicial', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 234)', '2015-04-24 11:42:38'),
(1981, 1, 10, 'a2a7ea18988c442d57138118a6865fa64f1689946b6a113039', 1, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaFoto'', ''logo-bra1.png'', ''2015-04-24'', ''image/png'')', '2015-04-24 11:42:38'),
(1982, 1, 10, 'a2a7ea18988c442d57138118a6865fa64f1689946b6a113039', 1, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''174i9bleNDP8962rlB2khnuWFs237.png'' WHERE uploadCod = 237', '2015-04-24 11:42:38'),
(1983, 1, 10, '5eed3925239c049de863c244f87b49ea9e7245eee07687dd4c', 1, 'alterar', 'inicial', 'DELETE FROM _upload WHERE (organogramaCod = 1) AND (uploadcodreferencia = 1) AND (uploadcod = 237)', '2015-04-24 11:43:31'),
(1984, 1, 10, 'f9c18c5803b4758f2abebe4cf2e2f6ba0a01060689d8415852', 1, 'alterar', 'inicial', 'INSERT INTO _upload (organogramaCod, moduloCod, uploadCodReferencia, uploadNomeCampo, uploadNomeOriginal, uploadDataCadastro, uploadMime) VALUES(1, 10, 1, ''uploadPessoaJuridicaFoto'', ''logo-bra1.png'', ''2015-04-24'', ''image/png'')', '2015-04-24 11:47:20'),
(1985, 1, 10, 'f9c18c5803b4758f2abebe4cf2e2f6ba0a01060689d8415852', 1, 'alterar', 'inicial', 'UPDATE _upload SET uploadNomeFisico = ''12YhBQczT1POw20DZo2RullToM238.png'' WHERE uploadCod = 238', '2015-04-24 11:47:20'),
(1986, 1, 10, 'b86307696c31fa628cb10033c248c30b5e118d981c8c95a8bf', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_email SET pessoaJuridicaEmail = ''contato@braconsultoria.com.br'', pessoaJuridicaEmailStatus = ''A'' WHERE pessoajuridicaemailcod = 1', '2015-04-24 11:49:50'),
(1987, 1, 10, 'b86307696c31fa628cb10033c248c30b5e118d981c8c95a8bf', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_telefone SET pessoaJuridicaTelefone = ''(81) 3011-0702'', pessoaJuridicaTelefoneStatus = ''A'' WHERE pessoajuridicatelefonecod = 1', '2015-04-24 11:49:50'),
(1988, 1, 10, 'b86307696c31fa628cb10033c248c30b5e118d981c8c95a8bf', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_url SET pessoaJuridicaUrlTipo = ''fa-globe'', pessoaJuridicaUrl = ''http://www.braconsultoria.com.br'', pessoaJuridicaUrlStatus = ''A'' WHERE pessoajuridicaurlcod = 1', '2015-04-24 11:49:50'),
(1989, 1, 10, 'b86307696c31fa628cb10033c248c30b5e118d981c8c95a8bf', 1, 'alterar', 'contato', 'UPDATE pessoa_juridica_endereco SET pessoaJuridicaEnderecoCep = 78060581, pessoaJuridicaEnderecoNome = ''Avenida Jornalista Arquimedes Pereira Lima'', pessoaJuridicaEnderecoNumero = 870, pessoaJuridicaEnderecoComplemento = ''Torre 2'', pessoaJuridicaEnderecoBairro = ''Jardim das Américas'', ufCidadeCod = 4347, pessoaJuridicaEnderecoTipo = ''CNPJ'', pessoaJuridicaEnderecoStatus = ''A'' WHERE pessoajuridicaenderecocod = 1', '2015-04-24 11:49:50'),
(1990, 1, 10, 'b86307696c31fa628cb10033c248c30b5e118d981c8c95a8bf', 1, 'alterar', 'contato', 'INSERT INTO pessoa_juridica_endereco (pessoaJuridicaEnderecoCep, pessoaJuridicaEnderecoNome, pessoaJuridicaEnderecoNumero, pessoaJuridicaEnderecoComplemento, pessoaJuridicaEnderecoBairro, ufCidadeCod, pessoaJuridicaEnderecoTipo, pessoaJuridicaEnderecoStatus, pessoaJuridicaCod) VALUES(53030020, ''Rua Professor José Cândido Pessoa'', 1620, ''Andar Superior'', ''Bairro Novo'', 5362, ''CNPJ'', ''A'', 1)', '2015-04-24 11:49:50'),
(1991, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _perfil (organogramaCod, perfilNome, perfilDescricao) VALUES(14, ''Administrador'', ''Administrador da Fundação'')', '2015-04-24 12:10:10'),
(1992, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 5)', '2015-04-24 12:10:10'),
(1993, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 5)', '2015-04-24 12:10:10'),
(1994, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 5)', '2015-04-24 12:10:10'),
(1995, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 5)', '2015-04-24 12:10:10'),
(1996, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 5)', '2015-04-24 12:10:10'),
(1997, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 5)', '2015-04-24 12:10:10'),
(1998, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 5)', '2015-04-24 12:10:10'),
(1999, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 5)', '2015-04-24 12:10:10'),
(2000, 1, 97, 'f5349df9adde2201bc1ed704ed2b6d2a413105989709cd6698', NULL, 'cadastrar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 5)', '2015-04-24 12:10:10'),
(2001, 1, 96, '3c87aabc415f0c5aea097790300e615d957a5fc5d781fa4dd8', NULL, 'cadastrar', NULL, 'INSERT INTO _usuario (organogramaCod, perfilCod, usuarioLogin, usuarioSenha) VALUES(14, 5, ''teste@braconsultoria.com.br'', ''91hBP1Z6Pi8ZU'')', '2015-04-24 12:26:54'),
(2002, 10, 96, '72ecf6ed0ccf0a4571dfda297f890d739e73ca038d6d3a394c', 10, 'alterar', NULL, 'UPDATE _usuario SET organogramaCod = 14, perfilCod = 5, usuarioLogin = ''teste@braconsultoria.com.br'', usuarioSenha = ''91Ypftx7AaOfk'' WHERE usuarioCod = 10', '2015-04-24 12:27:54'),
(2003, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'UPDATE _perfil SET organogramaCod = 14, perfilNome = ''Administrador'', perfilDescricao = ''Administrador da Fundação'' WHERE perfilCod = 5', '2015-04-24 12:31:52'),
(2004, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 5', '2015-04-24 12:31:52'),
(2005, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 5)', '2015-04-24 12:31:52'),
(2006, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 5)', '2015-04-24 12:31:52'),
(2007, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 5)', '2015-04-24 12:31:52'),
(2008, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 5)', '2015-04-24 12:31:52'),
(2009, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 5)', '2015-04-24 12:31:52'),
(2010, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 5)', '2015-04-24 12:31:52'),
(2011, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 5)', '2015-04-24 12:31:52'),
(2012, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 5)', '2015-04-24 12:31:52'),
(2013, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 5)', '2015-04-24 12:31:52'),
(2014, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 5)', '2015-04-24 12:31:52'),
(2015, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 5)', '2015-04-24 12:31:52'),
(2016, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 5)', '2015-04-24 12:31:52'),
(2017, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 5)', '2015-04-24 12:31:52'),
(2018, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 5)', '2015-04-24 12:31:52'),
(2019, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 5)', '2015-04-24 12:31:52'),
(2020, 1, 97, '99b2637b0a68d463b598b090930c12d95ff34a62ae27dcef1e', 5, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 5)', '2015-04-24 12:31:52'),
(2021, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-24 12:39:57'),
(2022, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-24 12:39:57'),
(2023, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-24 12:39:57'),
(2024, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-24 12:39:57'),
(2025, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-24 12:39:57'),
(2026, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-24 12:39:57'),
(2027, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-24 12:39:57'),
(2028, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-24 12:39:57'),
(2029, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-24 12:39:57'),
(2030, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-24 12:39:57'),
(2031, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-24 12:39:57'),
(2032, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos Humanos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-24 12:39:57'),
(2033, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-24 12:39:57'),
(2034, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-24 12:39:57'),
(2035, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência Social'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-24 12:39:57'),
(2036, 1, 82, 'f7511d1730f9c9c03334ddea2d92f940bd774ecf92b0e764d0', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Inserir/Alterar na tab Inicial'', ''inicialPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:39:57'),
(2037, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'UPDATE _perfil SET perfilNome = ''Administrador'', perfilDescricao = ''Acesso irrestrito a todos os módulos do sistema'' WHERE perfilCod = 1', '2015-04-24 12:40:11'),
(2038, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'DELETE FROM _permissao WHERE perfilCod = 1', '2015-04-24 12:40:11'),
(2039, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(1, 1)', '2015-04-24 12:40:11'),
(2040, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(12, 1)', '2015-04-24 12:40:11'),
(2041, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(13, 1)', '2015-04-24 12:40:11'),
(2042, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(14, 1)', '2015-04-24 12:40:11'),
(2043, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(15, 1)', '2015-04-24 12:40:11'),
(2044, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(2, 1)', '2015-04-24 12:40:11'),
(2045, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(9, 1)', '2015-04-24 12:40:11'),
(2046, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(10, 1)', '2015-04-24 12:40:11'),
(2047, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(11, 1)', '2015-04-24 12:40:11'),
(2048, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(528, 1)', '2015-04-24 12:40:11'),
(2049, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(534, 1)', '2015-04-24 12:40:11'),
(2050, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(529, 1)', '2015-04-24 12:40:11'),
(2051, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(533, 1)', '2015-04-24 12:40:11'),
(2052, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(530, 1)', '2015-04-24 12:40:11'),
(2053, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(531, 1)', '2015-04-24 12:40:11'),
(2054, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(532, 1)', '2015-04-24 12:40:11'),
(2055, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(35, 1)', '2015-04-24 12:40:11'),
(2056, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(611, 1)', '2015-04-24 12:40:11'),
(2057, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(612, 1)', '2015-04-24 12:40:11'),
(2058, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(36, 1)', '2015-04-24 12:40:11'),
(2059, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(613, 1)', '2015-04-24 12:40:11'),
(2060, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(37, 1)', '2015-04-24 12:40:11'),
(2061, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(38, 1)', '2015-04-24 12:40:11'),
(2062, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(614, 1)', '2015-04-24 12:40:11'),
(2063, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(39, 1)', '2015-04-24 12:40:11'),
(2064, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(615, 1)', '2015-04-24 12:40:11'),
(2065, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(40, 1)', '2015-04-24 12:40:11'),
(2066, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(619, 1)', '2015-04-24 12:40:11'),
(2067, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(617, 1)', '2015-04-24 12:40:11'),
(2068, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(616, 1)', '2015-04-24 12:40:11'),
(2069, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(634, 1)', '2015-04-24 12:40:11'),
(2070, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(620, 1)', '2015-04-24 12:40:11'),
(2071, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(626, 1)', '2015-04-24 12:40:11'),
(2072, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(621, 1)', '2015-04-24 12:40:11'),
(2073, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(628, 1)', '2015-04-24 12:40:11'),
(2074, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(630, 1)', '2015-04-24 12:40:11'),
(2075, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(622, 1)', '2015-04-24 12:40:11'),
(2076, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(623, 1)', '2015-04-24 12:40:11'),
(2077, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(632, 1)', '2015-04-24 12:40:11'),
(2078, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(624, 1)', '2015-04-24 12:40:11'),
(2079, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(625, 1)', '2015-04-24 12:40:11'),
(2080, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(627, 1)', '2015-04-24 12:40:11'),
(2081, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(629, 1)', '2015-04-24 12:40:11'),
(2082, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(631, 1)', '2015-04-24 12:40:11'),
(2083, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(633, 1)', '2015-04-24 12:40:11'),
(2084, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(410, 1)', '2015-04-24 12:40:11'),
(2085, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(414, 1)', '2015-04-24 12:40:11'),
(2086, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(415, 1)', '2015-04-24 12:40:11'),
(2087, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(411, 1)', '2015-04-24 12:40:11'),
(2088, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(412, 1)', '2015-04-24 12:40:11'),
(2089, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(413, 1)', '2015-04-24 12:40:11'),
(2090, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(416, 1)', '2015-04-24 12:40:11'),
(2091, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(420, 1)', '2015-04-24 12:40:11'),
(2092, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(421, 1)', '2015-04-24 12:40:11'),
(2093, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(417, 1)', '2015-04-24 12:40:11'),
(2094, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(418, 1)', '2015-04-24 12:40:11'),
(2095, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(419, 1)', '2015-04-24 12:40:11'),
(2096, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(429, 1)', '2015-04-24 12:40:11'),
(2097, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(434, 1)', '2015-04-24 12:40:11'),
(2098, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(435, 1)', '2015-04-24 12:40:11'),
(2099, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(430, 1)', '2015-04-24 12:40:11'),
(2100, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(431, 1)', '2015-04-24 12:40:11'),
(2101, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(432, 1)', '2015-04-24 12:40:11'),
(2102, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(433, 1)', '2015-04-24 12:40:11'),
(2103, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(543, 1)', '2015-04-24 12:40:12'),
(2104, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(549, 1)', '2015-04-24 12:40:12'),
(2105, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(544, 1)', '2015-04-24 12:40:12'),
(2106, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(548, 1)', '2015-04-24 12:40:12'),
(2107, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(545, 1)', '2015-04-24 12:40:12'),
(2108, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(546, 1)', '2015-04-24 12:40:12'),
(2109, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(547, 1)', '2015-04-24 12:40:12'),
(2110, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(436, 1)', '2015-04-24 12:40:12'),
(2111, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(441, 1)', '2015-04-24 12:40:12'),
(2112, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(442, 1)', '2015-04-24 12:40:12');
INSERT INTO `_log` (`logCod`, `usuarioCod`, `moduloCod`, `logHash`, `logId`, `logAcao`, `logTab`, `logSql`, `logDataHora`) VALUES
(2113, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(437, 1)', '2015-04-24 12:40:12'),
(2114, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(438, 1)', '2015-04-24 12:40:12'),
(2115, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(439, 1)', '2015-04-24 12:40:12'),
(2116, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(440, 1)', '2015-04-24 12:40:12'),
(2117, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(443, 1)', '2015-04-24 12:40:12'),
(2118, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(448, 1)', '2015-04-24 12:40:12'),
(2119, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(449, 1)', '2015-04-24 12:40:12'),
(2120, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(444, 1)', '2015-04-24 12:40:12'),
(2121, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(445, 1)', '2015-04-24 12:40:12'),
(2122, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(446, 1)', '2015-04-24 12:40:12'),
(2123, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(447, 1)', '2015-04-24 12:40:12'),
(2124, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(450, 1)', '2015-04-24 12:40:12'),
(2125, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(455, 1)', '2015-04-24 12:40:12'),
(2126, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(456, 1)', '2015-04-24 12:40:12'),
(2127, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(451, 1)', '2015-04-24 12:40:12'),
(2128, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(452, 1)', '2015-04-24 12:40:12'),
(2129, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(453, 1)', '2015-04-24 12:40:12'),
(2130, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(454, 1)', '2015-04-24 12:40:12'),
(2131, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(487, 1)', '2015-04-24 12:40:12'),
(2132, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(492, 1)', '2015-04-24 12:40:12'),
(2133, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(493, 1)', '2015-04-24 12:40:12'),
(2134, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(488, 1)', '2015-04-24 12:40:12'),
(2135, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(489, 1)', '2015-04-24 12:40:12'),
(2136, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(490, 1)', '2015-04-24 12:40:12'),
(2137, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(491, 1)', '2015-04-24 12:40:12'),
(2138, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(494, 1)', '2015-04-24 12:40:12'),
(2139, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(499, 1)', '2015-04-24 12:40:12'),
(2140, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(500, 1)', '2015-04-24 12:40:12'),
(2141, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(495, 1)', '2015-04-24 12:40:12'),
(2142, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(496, 1)', '2015-04-24 12:40:12'),
(2143, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(497, 1)', '2015-04-24 12:40:12'),
(2144, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(498, 1)', '2015-04-24 12:40:12'),
(2145, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(422, 1)', '2015-04-24 12:40:12'),
(2146, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(427, 1)', '2015-04-24 12:40:12'),
(2147, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(428, 1)', '2015-04-24 12:40:12'),
(2148, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(423, 1)', '2015-04-24 12:40:12'),
(2149, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(424, 1)', '2015-04-24 12:40:12'),
(2150, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(425, 1)', '2015-04-24 12:40:12'),
(2151, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(426, 1)', '2015-04-24 12:40:12'),
(2152, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(557, 1)', '2015-04-24 12:40:12'),
(2153, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(568, 1)', '2015-04-24 12:40:12'),
(2154, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(558, 1)', '2015-04-24 12:40:12'),
(2155, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(567, 1)', '2015-04-24 12:40:12'),
(2156, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(564, 1)', '2015-04-24 12:40:12'),
(2157, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(565, 1)', '2015-04-24 12:40:12'),
(2158, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(566, 1)', '2015-04-24 12:40:12'),
(2159, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(576, 1)', '2015-04-24 12:40:12'),
(2160, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(582, 1)', '2015-04-24 12:40:12'),
(2161, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(577, 1)', '2015-04-24 12:40:12'),
(2162, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(581, 1)', '2015-04-24 12:40:12'),
(2163, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(578, 1)', '2015-04-24 12:40:12'),
(2164, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(579, 1)', '2015-04-24 12:40:12'),
(2165, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(580, 1)', '2015-04-24 12:40:12'),
(2166, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(569, 1)', '2015-04-24 12:40:12'),
(2167, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(575, 1)', '2015-04-24 12:40:12'),
(2168, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(570, 1)', '2015-04-24 12:40:12'),
(2169, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(574, 1)', '2015-04-24 12:40:12'),
(2170, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(571, 1)', '2015-04-24 12:40:12'),
(2171, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(572, 1)', '2015-04-24 12:40:12'),
(2172, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(573, 1)', '2015-04-24 12:40:12'),
(2173, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(597, 1)', '2015-04-24 12:40:12'),
(2174, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(603, 1)', '2015-04-24 12:40:12'),
(2175, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(598, 1)', '2015-04-24 12:40:12'),
(2176, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(602, 1)', '2015-04-24 12:40:12'),
(2177, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(599, 1)', '2015-04-24 12:40:12'),
(2178, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(600, 1)', '2015-04-24 12:40:12'),
(2179, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(601, 1)', '2015-04-24 12:40:12'),
(2180, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(583, 1)', '2015-04-24 12:40:12'),
(2181, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(589, 1)', '2015-04-24 12:40:12'),
(2182, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(584, 1)', '2015-04-24 12:40:12'),
(2183, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(588, 1)', '2015-04-24 12:40:12'),
(2184, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(585, 1)', '2015-04-24 12:40:12'),
(2185, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(586, 1)', '2015-04-24 12:40:12'),
(2186, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(587, 1)', '2015-04-24 12:40:12'),
(2187, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(604, 1)', '2015-04-24 12:40:12'),
(2188, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(610, 1)', '2015-04-24 12:40:12'),
(2189, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(605, 1)', '2015-04-24 12:40:12'),
(2190, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(609, 1)', '2015-04-24 12:40:12'),
(2191, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(606, 1)', '2015-04-24 12:40:12'),
(2192, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(607, 1)', '2015-04-24 12:40:12'),
(2193, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(608, 1)', '2015-04-24 12:40:12'),
(2194, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(590, 1)', '2015-04-24 12:40:12'),
(2195, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(596, 1)', '2015-04-24 12:40:12'),
(2196, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(591, 1)', '2015-04-24 12:40:12'),
(2197, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(595, 1)', '2015-04-24 12:40:12'),
(2198, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(592, 1)', '2015-04-24 12:40:12'),
(2199, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(593, 1)', '2015-04-24 12:40:12'),
(2200, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(594, 1)', '2015-04-24 12:40:12'),
(2201, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(17, 1)', '2015-04-24 12:40:12'),
(2202, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(22, 1)', '2015-04-24 12:40:12'),
(2203, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(29, 1)', '2015-04-24 12:40:12'),
(2204, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(542, 1)', '2015-04-24 12:40:12'),
(2205, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(18, 1)', '2015-04-24 12:40:12'),
(2206, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(19, 1)', '2015-04-24 12:40:12'),
(2207, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(20, 1)', '2015-04-24 12:40:12'),
(2208, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(21, 1)', '2015-04-24 12:40:12'),
(2209, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(23, 1)', '2015-04-24 12:40:12'),
(2210, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(27, 1)', '2015-04-24 12:40:12'),
(2211, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(30, 1)', '2015-04-24 12:40:12'),
(2212, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(31, 1)', '2015-04-24 12:40:12'),
(2213, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(24, 1)', '2015-04-24 12:40:12'),
(2214, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(25, 1)', '2015-04-24 12:40:12'),
(2215, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(26, 1)', '2015-04-24 12:40:12'),
(2216, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(28, 1)', '2015-04-24 12:40:12'),
(2217, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(461, 1)', '2015-04-24 12:40:12'),
(2218, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(460, 1)', '2015-04-24 12:40:12'),
(2219, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(459, 1)', '2015-04-24 12:40:12'),
(2220, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(458, 1)', '2015-04-24 12:40:12'),
(2221, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(457, 1)', '2015-04-24 12:40:12'),
(2222, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(469, 1)', '2015-04-24 12:40:12'),
(2223, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(475, 1)', '2015-04-24 12:40:12'),
(2224, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(470, 1)', '2015-04-24 12:40:12'),
(2225, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(474, 1)', '2015-04-24 12:40:12'),
(2226, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(473, 1)', '2015-04-24 12:40:12'),
(2227, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(472, 1)', '2015-04-24 12:40:12'),
(2228, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(471, 1)', '2015-04-24 12:40:12'),
(2229, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(507, 1)', '2015-04-24 12:40:12'),
(2230, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(513, 1)', '2015-04-24 12:40:12'),
(2231, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(508, 1)', '2015-04-24 12:40:12'),
(2232, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(512, 1)', '2015-04-24 12:40:12'),
(2233, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(509, 1)', '2015-04-24 12:40:12'),
(2234, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(510, 1)', '2015-04-24 12:40:12'),
(2235, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(511, 1)', '2015-04-24 12:40:12'),
(2236, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(514, 1)', '2015-04-24 12:40:12'),
(2237, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(520, 1)', '2015-04-24 12:40:12'),
(2238, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(515, 1)', '2015-04-24 12:40:12'),
(2239, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(519, 1)', '2015-04-24 12:40:12'),
(2240, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(516, 1)', '2015-04-24 12:40:12'),
(2241, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(517, 1)', '2015-04-24 12:40:12'),
(2242, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(518, 1)', '2015-04-24 12:40:12'),
(2243, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(476, 1)', '2015-04-24 12:40:12'),
(2244, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(481, 1)', '2015-04-24 12:40:12'),
(2245, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(482, 1)', '2015-04-24 12:40:12'),
(2246, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(477, 1)', '2015-04-24 12:40:12'),
(2247, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(478, 1)', '2015-04-24 12:40:12'),
(2248, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(479, 1)', '2015-04-24 12:40:12'),
(2249, 1, 97, 'a7119625e52c14d4099eca1848578f9d9fcc8aaaf3098a588e', 1, 'alterar', NULL, 'INSERT INTO _permissao (acaoModuloCod, perfilCod) VALUES(480, 1)', '2015-04-24 12:40:12'),
(2250, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-24 12:41:11'),
(2251, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-24 12:41:11'),
(2252, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-24 12:41:11'),
(2253, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-24 12:41:11'),
(2254, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-24 12:41:11'),
(2255, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-24 12:41:11'),
(2256, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-24 12:41:11'),
(2257, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-24 12:41:11'),
(2258, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-24 12:41:11'),
(2259, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-24 12:41:11'),
(2260, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-24 12:41:11'),
(2261, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos Humanos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-24 12:41:11'),
(2262, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-24 12:41:11'),
(2263, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-24 12:41:11'),
(2264, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência Social'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-24 12:41:11'),
(2265, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir/Alterar na tab Inicial'', acaoModuloIdPermissao = ''inicialPFAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 9, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 634', '2015-04-24 12:41:11'),
(2266, 1, 82, '89ddb5685c39b56c4b240924bb27dd4c2564d65fb8bdc3fd5e', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Alterar na tab Contatos'', ''contatosPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:41:11'),
(2267, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _modulo SET grupoCod = 6, moduloCodReferente = '''', moduloNome = ''PessoaFisica'', moduloNomeMenu = ''Pessoa física'', moduloTabelaBase = '''', moduloDesc = ''Pessoa física'', moduloVisivelMenu = ''S'', moduloPosicao = 1, moduloBase = '''', moduloClass = ''menu-icon fa fa-user'' WHERE moduloCod = 22', '2015-04-24 12:44:26'),
(2268, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Atualizar'', acaoModuloIdPermissao = ''filtrar'', acaoModuloIcon = ''fa fa-repeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisFiltrarPadrao()'', acaoModuloPosicao = 1, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 35', '2015-04-24 12:44:26'),
(2269, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Visualizar'', acaoModuloIdPermissao = ''visualizar'', acaoModuloIcon = ''fa fa-search'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisVisualizarPadrao()'', acaoModuloPosicao = 2, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 36', '2015-04-24 12:44:26'),
(2270, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inserir'', acaoModuloIdPermissao = ''cadastrar'', acaoModuloIcon = ''fa fa-plus'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisCadastrarLayoutPadrao()'', acaoModuloPosicao = 3, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 37', '2015-04-24 12:44:26'),
(2271, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Alterar'', acaoModuloIdPermissao = ''alterar'', acaoModuloIcon = ''fa fa-pencil'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisAlterarLayoutPadrao()'', acaoModuloPosicao = 4, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 38', '2015-04-24 12:44:26'),
(2272, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Remover'', acaoModuloIdPermissao = ''remover'', acaoModuloIcon = ''fa fa-trash-o'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisRemoverPadrao()'', acaoModuloPosicao = 5, acaoModuloApresentacao = ''E'' WHERE acaomodulocod = 39', '2015-04-24 12:44:26'),
(2273, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Imprimir'', acaoModuloIdPermissao = ''prnt'', acaoModuloIcon = ''fa fa-print'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = ''sisImprimir()'', acaoModuloPosicao = 6, acaoModuloApresentacao = ''R'' WHERE acaomodulocod = 40', '2015-04-24 12:44:26'),
(2274, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Inicial'', acaoModuloIdPermissao = ''tab1'', acaoModuloIcon = ''fa fa-home'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Inicial'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 1, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 611', '2015-04-24 12:44:26'),
(2275, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Família'', acaoModuloIdPermissao = ''tab2'', acaoModuloIcon = ''fa fa-users'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Dependentes'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 2, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 612', '2015-04-24 12:44:26'),
(2276, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Documentos'', acaoModuloIdPermissao = ''tab3'', acaoModuloIcon = ''fa fa-leanpub'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Documentos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 3, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 613', '2015-04-24 12:44:26'),
(2277, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Contatos'', acaoModuloIdPermissao = ''tab4'', acaoModuloIcon = ''fa fa-street-view'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Contatos'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 4, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 614', '2015-04-24 12:44:26'),
(2278, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Recursos Humanos'', acaoModuloIdPermissao = ''tab5'', acaoModuloIcon = ''fa fa-puzzle-piece'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Servidor'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 5, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 615', '2015-04-24 12:44:26'),
(2279, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Saúde'', acaoModuloIdPermissao = ''tab8'', acaoModuloIcon = ''fa fa-heartbeat'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Saude'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 8, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 616', '2015-04-24 12:44:26'),
(2280, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Escolaridade'', acaoModuloIdPermissao = ''tab7'', acaoModuloIcon = ''fa fa-graduation-cap'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Escolar'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 7, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 617', '2015-04-24 12:44:26'),
(2281, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Previdência Social'', acaoModuloIdPermissao = ''tab6'', acaoModuloIcon = ''fa fa-umbrella'', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = ''Previdencia'', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 6, acaoModuloApresentacao = ''T'' WHERE acaomodulocod = 619', '2015-04-24 12:44:26'),
(2282, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Salvar na tab Inicial'', acaoModuloIdPermissao = ''inicialPFAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 9, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 634', '2015-04-24 12:44:26'),
(2283, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'UPDATE _acao_modulo SET acaoModuloPermissao = ''Salvar na tab Contatos'', acaoModuloIdPermissao = ''contatosPFAlterar'', acaoModuloIcon = '''', acaoModuloToolTipComPermissao = '''', acaoModuloToolTipeSemPermissao = '''', acaoModuloFuncao = '''', acaoModuloFuncaoJS = '''', acaoModuloPosicao = 9, acaoModuloApresentacao = ''I'' WHERE acaomodulocod = 635', '2015-04-24 12:44:26'),
(2284, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Salvar na tab Família'', ''dependentesPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:44:26'),
(2285, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Salvar na tab Documentos'', ''documentosPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:44:26'),
(2286, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Salvar na tab Escolaridade'', ''escolarPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:44:26'),
(2287, 1, 82, '2a56b0d19a4cdbcf606c461949f96f0b4e8d74093bd1a000c0', 22, 'alterar', NULL, 'INSERT INTO _acao_modulo (acaoModuloPermissao, acaoModuloIdPermissao, acaoModuloIcon, acaoModuloToolTipComPermissao, acaoModuloToolTipeSemPermissao, acaoModuloFuncao, acaoModuloFuncaoJS, acaoModuloPosicao, acaoModuloApresentacao, moduloCod) VALUES(''Salvar na tab Previdência'', ''previdenciaPFAlterar'', '''', '''', '''', '''', '''', 9, ''I'', 22)', '2015-04-24 12:44:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_modulo`
--

CREATE TABLE IF NOT EXISTS `_modulo` (
`moduloCod` int(7) NOT NULL,
  `grupoCod` tinyint(3) NOT NULL,
  `moduloCodReferente` int(7) DEFAULT NULL,
  `moduloNome` varchar(70) NOT NULL,
  `moduloNomeMenu` varchar(50) NOT NULL,
  `moduloTabelaBase` varchar(100) DEFAULT NULL,
  `moduloDesc` varchar(250) NOT NULL,
  `moduloVisivelMenu` enum('S','N') NOT NULL DEFAULT 'S',
  `moduloPosicao` tinyint(2) NOT NULL DEFAULT '0',
  `moduloBase` enum('Sistema') DEFAULT NULL,
  `moduloClass` varchar(30) DEFAULT NULL,
  `moduloOrigem` enum('E','S') NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Extraindo dados da tabela `_modulo`
--

INSERT INTO `_modulo` (`moduloCod`, `grupoCod`, `moduloCodReferente`, `moduloNome`, `moduloNomeMenu`, `moduloTabelaBase`, `moduloDesc`, `moduloVisivelMenu`, `moduloPosicao`, `moduloBase`, `moduloClass`, `moduloOrigem`) VALUES
(18, 7, 102, 'Organograma', 'Organograma', NULL, ' Configuração de organograma ', 'S', 1, 'Sistema', 'menu-icon fa fa-sitemap', 'S'),
(19, 7, 102, 'OrganogramaClassificacao', 'Classificação de níveis', NULL, ' Classificação do organograma ', 'S', 1, 'Sistema', 'menu-icon fa fa-yelp', 'S'),
(22, 6, NULL, 'PessoaFisica', 'Pessoa física', NULL, 'Pessoa física', 'S', 1, NULL, 'menu-icon fa fa-user', 'S'),
(82, 7, NULL, 'Modulo', 'Módulos', NULL, ' Gerenciar Módulos ', 'S', 3, 'Sistema', 'menu-icon fa fa-puzzle-piece', 'E'),
(83, 7, NULL, 'Grupo', 'Grupos', '_grupo', ' Gerenciar Grupos ', 'S', 2, 'Sistema', 'menu-icon fa fa-users', 'E'),
(96, 7, NULL, 'Usuario', 'Usuários', '_usuario', ' Gerenciar Usuários do Sistema ', 'S', 4, 'Sistema', 'menu-icon fa fa-user', 'S'),
(97, 7, NULL, 'Perfil', 'Perfis', '_perfil', ' Gerenciar Perfis do Sistema ', 'S', 5, 'Sistema', 'menu-icon fa fa-users', 'S'),
(118, 7, NULL, 'Dashboard', 'Dashboard', NULL, 'Dashboard', 'N', 99, 'Sistema', 'menu-icon fa fa-dashboard', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_modulo_tab`
--

CREATE TABLE IF NOT EXISTS `_modulo_tab` (
`moduloTabCod` int(7) NOT NULL,
  `moduloCod` int(7) DEFAULT NULL,
  `moduloTabNome` varchar(70) DEFAULT NULL,
  `moduloTabNomeMenu` varchar(50) NOT NULL,
  `moduloTabDesc` varchar(250) NOT NULL,
  `moduloTabPosicao` tinyint(2) NOT NULL DEFAULT '1',
  `moduloTabClass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_modulo_tab`
--

INSERT INTO `_modulo_tab` (`moduloTabCod`, `moduloCod`, `moduloTabNome`, `moduloTabNomeMenu`, `moduloTabDesc`, `moduloTabPosicao`, `moduloTabClass`) VALUES
(1, 22, 'Inicial', 'Inicial', 'Dados iniciais da pessoa física', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `_notificacao`
--

CREATE TABLE IF NOT EXISTS `_notificacao` (
`notificacaoCod` int(11) NOT NULL,
  `usuarioCod` int(11) NOT NULL COMMENT 'Remetente',
  `notificacaoTitulo` varchar(255) NOT NULL,
  `notificacaoUsuarioCod` int(11) NOT NULL COMMENT 'Destinatário',
  `notificacaoDesc` text NOT NULL,
  `notificacaoWarnLevel` varchar(20) NOT NULL,
  `notificacaoDataHora` datetime NOT NULL,
  `notificacaoLida` enum('S','N') NOT NULL DEFAULT 'N',
  `notificacaoLidaDataHora` datetime DEFAULT NULL,
  `notificacaoLink` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_notificacao`
--

INSERT INTO `_notificacao` (`notificacaoCod`, `usuarioCod`, `notificacaoTitulo`, `notificacaoUsuarioCod`, `notificacaoDesc`, `notificacaoWarnLevel`, `notificacaoDataHora`, `notificacaoLida`, `notificacaoLidaDataHora`, `notificacaoLink`) VALUES
(1, 2, 'Novo registro em Pessoa Física', 1, 'Um novo registro foi inserido no módulo de Pessoa Física.', 'danger', '2015-06-30 00:00:00', 'S', '2015-06-30 14:02:26', 'http://localhost/Sappiens/App/GA/PessoaFisica/?sisRedir=true&id=1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_perfil`
--

CREATE TABLE IF NOT EXISTS `_perfil` (
`perfilCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `perfilNome` varchar(100) NOT NULL,
  `perfilDescricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_perfil`
--

INSERT INTO `_perfil` (`perfilCod`, `organogramaCod`, `perfilNome`, `perfilDescricao`) VALUES
(1, 1, 'Administrador', 'Acesso irrestrito a todos os módulos do sistema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_permissao`
--

CREATE TABLE IF NOT EXISTS `_permissao` (
`permissaoCod` int(7) NOT NULL,
  `acaoModuloCod` int(7) NOT NULL,
  `perfilCod` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29559 ;

--
-- Extraindo dados da tabela `_permissao`
--

INSERT INTO `_permissao` (`permissaoCod`, `acaoModuloCod`, `perfilCod`) VALUES
(29510, 35, 1),
(29511, 36, 1),
(29512, 37, 1),
(29513, 38, 1),
(29514, 39, 1),
(29515, 758, 1),
(29516, 40, 1),
(29517, 17, 1),
(29518, 22, 1),
(29519, 29, 1),
(29520, 542, 1),
(29521, 18, 1),
(29522, 19, 1),
(29523, 20, 1),
(29524, 21, 1),
(29525, 23, 1),
(29526, 27, 1),
(29527, 30, 1),
(29528, 31, 1),
(29529, 24, 1),
(29530, 25, 1),
(29531, 26, 1),
(29532, 28, 1),
(29533, 461, 1),
(29534, 460, 1),
(29535, 459, 1),
(29536, 458, 1),
(29537, 457, 1),
(29538, 469, 1),
(29539, 475, 1),
(29540, 470, 1),
(29541, 474, 1),
(29542, 473, 1),
(29543, 472, 1),
(29544, 471, 1),
(29545, 513, 1),
(29546, 507, 1),
(29547, 512, 1),
(29548, 508, 1),
(29549, 509, 1),
(29550, 510, 1),
(29551, 511, 1),
(29552, 514, 1),
(29553, 520, 1),
(29554, 515, 1),
(29555, 519, 1),
(29556, 516, 1),
(29557, 517, 1),
(29558, 518, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `_upload`
--

CREATE TABLE IF NOT EXISTS `_upload` (
`uploadCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `moduloCod` int(11) NOT NULL,
  `uploadCodReferencia` int(11) NOT NULL,
  `uploadNomeCampo` varchar(100) NOT NULL,
  `uploadNomeFisico` varchar(100) DEFAULT NULL,
  `uploadNomeOriginal` varchar(200) NOT NULL,
  `uploadDataCadastro` date NOT NULL,
  `uploadMime` varchar(50) NOT NULL,
  `uploadDownloads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_upload`
--

INSERT INTO `_upload` (`uploadCod`, `organogramaCod`, `moduloCod`, `uploadCodReferencia`, `uploadNomeCampo`, `uploadNomeFisico`, `uploadNomeOriginal`, `uploadDataCadastro`, `uploadMime`, `uploadDownloads`) VALUES
(1, 1, 22, 1, 'uploadPessoaFisicaFoto', '86P7JAm55ii6o15ize1IwehbpE1.jpg', '2.jpg', '2015-06-30', 'image/jpeg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario`
--

CREATE TABLE IF NOT EXISTS `_usuario` (
`usuarioCod` int(10) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `perfilCod` int(11) NOT NULL,
  `usuarioLogin` varchar(200) NOT NULL,
  `usuarioSenha` varchar(30) DEFAULT NULL,
  `numeroAcessos` int(7) DEFAULT NULL,
  `usuarioDataCadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioUltimoAcesso` datetime DEFAULT NULL,
  `usuarioStatus` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_usuario`
--

INSERT INTO `_usuario` (`usuarioCod`, `organogramaCod`, `perfilCod`, `usuarioLogin`, `usuarioSenha`, `numeroAcessos`, `usuarioDataCadastro`, `usuarioUltimoAcesso`, `usuarioStatus`) VALUES
(1, 1, 1, 'team@sappiens.com.br', '91hBP1Z6Pi8ZU', 586, '2015-07-01 15:32:57', '2015-07-01 12:32:57', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario_filtro`
--

CREATE TABLE IF NOT EXISTS `_usuario_filtro` (
`usuarioFiltroCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `usuarioCod` int(10) NOT NULL,
  `moduloCod` int(7) NOT NULL,
  `usuarioFiltroNome` varchar(100) NOT NULL,
  `usuarioFiltroNomeRelatorio` varchar(500) DEFAULT NULL,
  `usuarioFiltroColunas` varchar(1000) NOT NULL,
  `usuarioFiltroQueryString` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `_usuario_filtro`
--

INSERT INTO `_usuario_filtro` (`usuarioFiltroCod`, `organogramaCod`, `usuarioCod`, `moduloCod`, `usuarioFiltroNome`, `usuarioFiltroNomeRelatorio`, `usuarioFiltroColunas`, `usuarioFiltroQueryString`) VALUES
(3, 1, 1, 22, 'TESTE', 'Relatório de teste', 'pessoafisicacpf,pessoafisicanome,pessoafisicadatanascimento,pessoafisicasexo', 'npessoaFisicaNome=TESTE&shonpessoaFisicaNome==&shanpessoaFisicaNome=texto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario_grid`
--

CREATE TABLE IF NOT EXISTS `_usuario_grid` (
`usuarioGridCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `usuarioCod` int(10) NOT NULL,
  `moduloCod` int(7) NOT NULL,
  `usuarioGridColunas` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `_usuario_grid`
--

INSERT INTO `_usuario_grid` (`usuarioGridCod`, `organogramaCod`, `usuarioCod`, `moduloCod`, `usuarioGridColunas`) VALUES
(1, 1, 1, 22, 'pessoafisicacpf,pessoafisicanome,pessoafisicadatanascimento,pessoafisicasexo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario_paginacao`
--

CREATE TABLE IF NOT EXISTS `_usuario_paginacao` (
`usuarioPaginacaoCod` int(11) NOT NULL,
  `organogramaCod` int(11) NOT NULL,
  `usuarioCod` int(10) NOT NULL,
  `moduloCod` int(7) NOT NULL,
  `usuarioPaginacaoTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario_recovery`
--

CREATE TABLE IF NOT EXISTS `_usuario_recovery` (
`usuarioRecoveryCod` int(11) NOT NULL,
  `usuarioCod` int(11) NOT NULL,
  `usuarioRecoveryHash` varchar(50) NOT NULL,
  `usuarioRecoveryDataHora` datetime NOT NULL,
  `usuarioRecoveryStatus` enum('A','I') NOT NULL DEFAULT 'I'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `organograma`
--
ALTER TABLE `organograma`
 ADD PRIMARY KEY (`organogramaCod`);

--
-- Indexes for table `organograma_clas`
--
ALTER TABLE `organograma_clas`
 ADD PRIMARY KEY (`organogramaClasCod`);

--
-- Indexes for table `organograma_clas_tipo`
--
ALTER TABLE `organograma_clas_tipo`
 ADD PRIMARY KEY (`organogramaClasTipoCod`);

--
-- Indexes for table `organograma_rel`
--
ALTER TABLE `organograma_rel`
 ADD PRIMARY KEY (`organogramaRelCod`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`paisCod`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
 ADD PRIMARY KEY (`pessoaCod`), ADD KEY `usuarioCod` (`usuarioCod`), ADD KEY `organogramaCod` (`organogramaCod`);

--
-- Indexes for table `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
 ADD PRIMARY KEY (`pessoaFisicaCod`);

--
-- Indexes for table `tipo_ato_legal`
--
ALTER TABLE `tipo_ato_legal`
 ADD PRIMARY KEY (`tipoAtoLegalCod`);

--
-- Indexes for table `_acao_modulo`
--
ALTER TABLE `_acao_modulo`
 ADD PRIMARY KEY (`acaoModuloCod`), ADD KEY `fk__acao_modulo__modulo1_idx` (`moduloCod`);

--
-- Indexes for table `_grupo`
--
ALTER TABLE `_grupo`
 ADD PRIMARY KEY (`grupoCod`);

--
-- Indexes for table `_issue`
--
ALTER TABLE `_issue`
 ADD PRIMARY KEY (`issueCod`);

--
-- Indexes for table `_issue_int`
--
ALTER TABLE `_issue_int`
 ADD PRIMARY KEY (`issueIntCod`);

--
-- Indexes for table `_log`
--
ALTER TABLE `_log`
 ADD PRIMARY KEY (`logCod`);

--
-- Indexes for table `_modulo`
--
ALTER TABLE `_modulo`
 ADD PRIMARY KEY (`moduloCod`), ADD UNIQUE KEY `ModuloNome` (`moduloNome`), ADD KEY `fk__modulo__grupo_modulo_idx` (`grupoCod`), ADD KEY `fk__modulo__modulo1_idx` (`moduloCodReferente`);

--
-- Indexes for table `_modulo_tab`
--
ALTER TABLE `_modulo_tab`
 ADD PRIMARY KEY (`moduloTabCod`);

--
-- Indexes for table `_notificacao`
--
ALTER TABLE `_notificacao`
 ADD PRIMARY KEY (`notificacaoCod`);

--
-- Indexes for table `_perfil`
--
ALTER TABLE `_perfil`
 ADD PRIMARY KEY (`perfilCod`), ADD KEY `fk__perfil_organograma1_idx` (`organogramaCod`);

--
-- Indexes for table `_permissao`
--
ALTER TABLE `_permissao`
 ADD PRIMARY KEY (`permissaoCod`), ADD KEY `fk__permissao__acao_modulo1_idx` (`acaoModuloCod`), ADD KEY `fk__permissao__perfil1_idx` (`perfilCod`);

--
-- Indexes for table `_upload`
--
ALTER TABLE `_upload`
 ADD PRIMARY KEY (`uploadCod`), ADD KEY `uploadCod` (`uploadCod`), ADD KEY `fk__upload__modulo` (`moduloCod`), ADD KEY `fk__upload_organograma1_idx` (`organogramaCod`);

--
-- Indexes for table `_usuario`
--
ALTER TABLE `_usuario`
 ADD PRIMARY KEY (`usuarioCod`), ADD KEY `fk__usuario__perfil1_idx` (`perfilCod`), ADD KEY `fk__usuario_organograma1_idx` (`organogramaCod`);

--
-- Indexes for table `_usuario_filtro`
--
ALTER TABLE `_usuario_filtro`
 ADD PRIMARY KEY (`usuarioFiltroCod`), ADD KEY `fk__usuario_filtro_organograma1_idx` (`organogramaCod`), ADD KEY `fk__usuario_filtro__usuario1_idx` (`usuarioCod`), ADD KEY `fk__usuario_filtro__modulo1_idx` (`moduloCod`);

--
-- Indexes for table `_usuario_grid`
--
ALTER TABLE `_usuario_grid`
 ADD PRIMARY KEY (`usuarioGridCod`), ADD KEY `fk__usuarioGrid__usuario1_idx` (`usuarioCod`), ADD KEY `fk__usuarioGrid_organograma1_idx` (`organogramaCod`), ADD KEY `fk__usuarioGrid__modulo1_idx` (`moduloCod`);

--
-- Indexes for table `_usuario_paginacao`
--
ALTER TABLE `_usuario_paginacao`
 ADD PRIMARY KEY (`usuarioPaginacaoCod`), ADD KEY `fk__usuario_paginacao__usuario1_idx` (`usuarioCod`), ADD KEY `fk__usuario_paginacao_organograma1_idx` (`organogramaCod`), ADD KEY `fk__usuario_paginacao__modulo1_idx` (`moduloCod`);

--
-- Indexes for table `_usuario_recovery`
--
ALTER TABLE `_usuario_recovery`
 ADD PRIMARY KEY (`usuarioRecoveryCod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `organograma`
--
ALTER TABLE `organograma`
MODIFY `organogramaCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organograma_clas`
--
ALTER TABLE `organograma_clas`
MODIFY `organogramaClasCod` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `organograma_clas_tipo`
--
ALTER TABLE `organograma_clas_tipo`
MODIFY `organogramaClasTipoCod` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organograma_rel`
--
ALTER TABLE `organograma_rel`
MODIFY `organogramaRelCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
MODIFY `paisCod` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
MODIFY `pessoaCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
MODIFY `pessoaFisicaCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tipo_ato_legal`
--
ALTER TABLE `tipo_ato_legal`
MODIFY `tipoAtoLegalCod` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `_acao_modulo`
--
ALTER TABLE `_acao_modulo`
MODIFY `acaoModuloCod` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=759;
--
-- AUTO_INCREMENT for table `_grupo`
--
ALTER TABLE `_grupo`
MODIFY `grupoCod` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `_issue`
--
ALTER TABLE `_issue`
MODIFY `issueCod` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `_issue_int`
--
ALTER TABLE `_issue_int`
MODIFY `issueIntCod` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `_log`
--
ALTER TABLE `_log`
MODIFY `logCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2288;
--
-- AUTO_INCREMENT for table `_modulo`
--
ALTER TABLE `_modulo`
MODIFY `moduloCod` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `_modulo_tab`
--
ALTER TABLE `_modulo_tab`
MODIFY `moduloTabCod` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_notificacao`
--
ALTER TABLE `_notificacao`
MODIFY `notificacaoCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_perfil`
--
ALTER TABLE `_perfil`
MODIFY `perfilCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_permissao`
--
ALTER TABLE `_permissao`
MODIFY `permissaoCod` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29559;
--
-- AUTO_INCREMENT for table `_upload`
--
ALTER TABLE `_upload`
MODIFY `uploadCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_usuario`
--
ALTER TABLE `_usuario`
MODIFY `usuarioCod` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_usuario_filtro`
--
ALTER TABLE `_usuario_filtro`
MODIFY `usuarioFiltroCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `_usuario_grid`
--
ALTER TABLE `_usuario_grid`
MODIFY `usuarioGridCod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `_usuario_paginacao`
--
ALTER TABLE `_usuario_paginacao`
MODIFY `usuarioPaginacaoCod` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_usuario_recovery`
--
ALTER TABLE `_usuario_recovery`
MODIFY `usuarioRecoveryCod` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `_acao_modulo`
--
ALTER TABLE `_acao_modulo`
ADD CONSTRAINT `_acao_modulo_ibfk_1` FOREIGN KEY (`moduloCod`) REFERENCES `_modulo` (`moduloCod`),
ADD CONSTRAINT `fk__acao_modulo__modulo1` FOREIGN KEY (`moduloCod`) REFERENCES `_modulo` (`moduloCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `_modulo`
--
ALTER TABLE `_modulo`
ADD CONSTRAINT `fk__modulo__grupo_modulo` FOREIGN KEY (`grupoCod`) REFERENCES `_grupo` (`grupoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk__modulo__modulo1` FOREIGN KEY (`moduloCodReferente`) REFERENCES `_modulo` (`moduloCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `_perfil`
--
ALTER TABLE `_perfil`
ADD CONSTRAINT `fk__perfil_organograma1` FOREIGN KEY (`organogramaCod`) REFERENCES `organograma` (`organogramaCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `_permissao`
--
ALTER TABLE `_permissao`
ADD CONSTRAINT `_permissao_ibfk_1` FOREIGN KEY (`acaoModuloCod`) REFERENCES `_acao_modulo` (`acaoModuloCod`),
ADD CONSTRAINT `fk__permissao__acao_modulo1` FOREIGN KEY (`acaoModuloCod`) REFERENCES `_acao_modulo` (`acaoModuloCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk__permissao__perfil1` FOREIGN KEY (`perfilCod`) REFERENCES `_perfil` (`perfilCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

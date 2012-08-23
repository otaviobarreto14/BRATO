/*
SQLyog Ultimate v9.20 
MySQL - 5.5.21 : Database - brato
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`brato` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `brato`;

/*Table structure for table `avaria` */

DROP TABLE IF EXISTS `avaria`;

CREATE TABLE `avaria` (
  `ID_VEICULO` int(11) unsigned NOT NULL COMMENT 'Identificador do Veículo',
  `ID_AVARIA` int(11) unsigned NOT NULL COMMENT 'Identificador da Avaria',
  PRIMARY KEY (`ID_VEICULO`,`ID_AVARIA`),
  KEY `FK_AVARIA_VEICULO` (`ID_VEICULO`),
  CONSTRAINT `FK_AVARIA_VEICULO` FOREIGN KEY (`ID_VEICULO`) REFERENCES `veiculo` (`ID_VEICULO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `avaria` */

insert  into `avaria`(`ID_VEICULO`,`ID_AVARIA`) values (1,0),(1,1),(1,2),(1,3),(2,0),(2,2),(4,3),(5,0);

/*Table structure for table `bairro` */

DROP TABLE IF EXISTS `bairro`;

CREATE TABLE `bairro` (
  `ID_BAIRRO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Bairro',
  `DESCRICAO` varchar(50) NOT NULL COMMENT 'Nome do Bairro ',
  `ID_MUNICIPIO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Município',
  PRIMARY KEY (`ID_BAIRRO`),
  KEY `FK_BAIRRO_MUNICIPIO` (`ID_MUNICIPIO`),
  CONSTRAINT `FK_BAIRRO_MUNICIPIO` FOREIGN KEY (`ID_MUNICIPIO`) REFERENCES `municipio` (`ID_MUNICIPIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bairro` */

insert  into `bairro`(`ID_BAIRRO`,`DESCRICAO`,`ID_MUNICIPIO`) values (1,'CENTRO',1),(2,'REALENGO',1),(3,'BANGU',1),(4,'VILA SÃO LUIZ',2);

/*Table structure for table `brat` */

DROP TABLE IF EXISTS `brat`;

CREATE TABLE `brat` (
  `ID_BRAT` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador do BRAT',
  `NUM_BRAT` int(10) unsigned NOT NULL COMMENT 'Número do BRAT',
  `DATA_ACIDENTE` date NOT NULL COMMENT 'Data do Acidente',
  `HORA_ACIDENTE` time NOT NULL COMMENT 'Hora do Acidente',
  `COND_TEMPO` smallint(6) unsigned NOT NULL COMMENT 'Condição do Tempo no momento do Acidente [Bom, Nublado, Chuvoso]',
  `TIPO_SINALIZACAO` smallint(6) unsigned NOT NULL COMMENT 'Sinalização da via [Boa, Deficiente, Sem Sinalização]',
  `TIPO_ACIDENTE` smallint(6) unsigned NOT NULL COMMENT 'Tipo de Acidente [[Atropelamento, Abalroamento, Capotamento, Tombamento, Choque, Colisão]',
  `CIRCUNSTANCIA` smallint(6) unsigned NOT NULL COMMENT 'Circunstância do Acidente [Sem Vitima, Com Vitima(s)]',
  `DESCRICAO` text NOT NULL COMMENT 'Descrição do Acidente',
  `FOTO_ACIDENTE` tinyint(1) DEFAULT NULL COMMENT 'Indicação da existencia de Foto do Acidente',
  `CROQUI` blob NOT NULL COMMENT 'Descrição gráfica do Acidente',
  `MATRICULA` varchar(15) NOT NULL COMMENT 'Matricula do Policial que registrou o Acidente',
  `ID_ENDERECO` smallint(6) unsigned NOT NULL COMMENT 'Identeificador do Endereço',
  PRIMARY KEY (`ID_BRAT`),
  UNIQUE KEY `UN_BRAT_NUM_BRAT` (`NUM_BRAT`),
  KEY `FK_BRAT_ENDERECO` (`ID_ENDERECO`),
  KEY `FK_BRAT_POLICIAL` (`MATRICULA`),
  CONSTRAINT `FK_BRAT_ENDERECO` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `endereco` (`ID_ENDERECO`),
  CONSTRAINT `FK_BRAT_POLICIAL` FOREIGN KEY (`MATRICULA`) REFERENCES `policial` (`MATRICULA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `brat` */

insert  into `brat`(`ID_BRAT`,`NUM_BRAT`,`DATA_ACIDENTE`,`HORA_ACIDENTE`,`COND_TEMPO`,`TIPO_SINALIZACAO`,`TIPO_ACIDENTE`,`CIRCUNSTANCIA`,`DESCRICAO`,`FOTO_ACIDENTE`,`CROQUI`,`MATRICULA`,`ID_ENDERECO`) values (1,1,'2012-08-10','23:30:00',0,1,2,3,'FECHADA NA ESQUINA',0,'../IMAGES/BRAT/000001/CROQUI','4235556',1),(2,2,'2012-08-15','13:30:00',1,0,1,0,'BATIDA DE FRENTE',0,'../IMAGES/BRAT/000002/CROQUI','4235556',3),(3,3,'2012-09-15','09:30:00',2,2,0,2,'BATIDA DE FRENTE',0,'../IMAGES/BRAT/000003/CROQUI','4235556',5);

/*Table structure for table `complemento` */

DROP TABLE IF EXISTS `complemento`;

CREATE TABLE `complemento` (
  `ID_COMPLEMENTO` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador do Complemento do Endereço',
  `DESCRICAO` varchar(50) NOT NULL COMMENT 'Descrição do Complemento',
  PRIMARY KEY (`ID_COMPLEMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `complemento` */

/*Table structure for table `endereco` */

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `ID_ENDERECO` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador do Endereço',
  `ID_LOGRADOURO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Logradouro',
  `NUMERO` varchar(7) DEFAULT 'S/N' COMMENT 'Número do Logradouro {S/N}',
  `ID_COMPLEMENTO` smallint(6) unsigned DEFAULT NULL COMMENT 'Identificador do Complemento do Endereço',
  PRIMARY KEY (`ID_ENDERECO`),
  KEY `ID_LOGRADOURO` (`ID_LOGRADOURO`),
  KEY `ID_COMPLEMENTO` (`ID_COMPLEMENTO`),
  CONSTRAINT `FK_ENDERECO_COMPLEMENTO` FOREIGN KEY (`ID_COMPLEMENTO`) REFERENCES `complemento` (`ID_COMPLEMENTO`),
  CONSTRAINT `FK_ENDERECO_LOGRADOURO` FOREIGN KEY (`ID_LOGRADOURO`) REFERENCES `logradouro` (`ID_LOGRADOURO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `endereco` */

insert  into `endereco`(`ID_ENDERECO`,`ID_LOGRADOURO`,`NUMERO`,`ID_COMPLEMENTO`) values (1,1,'S/N',NULL),(2,2,'S/N',NULL),(3,2,'S/N',NULL),(4,5,'S/N',NULL),(5,3,'S/N',NULL),(6,4,'S/N',NULL),(7,4,'S/N',NULL);

/*Table structure for table `funcao` */

DROP TABLE IF EXISTS `funcao`;

CREATE TABLE `funcao` (
  `ID_FUNCAO` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador da Função',
  `DESCRICAO` varchar(30) NOT NULL COMMENT 'Descrição da Função no BRATO',
  PRIMARY KEY (`ID_FUNCAO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `funcao` */

insert  into `funcao`(`ID_FUNCAO`,`DESCRICAO`) values (1,'CADASTRAR USUARIO'),(2,'RELATORIO GERENCIAL'),(3,'CADASTRAR BRAT'),(4,'CONSULTAR BRAT');

/*Table structure for table `impacto` */

DROP TABLE IF EXISTS `impacto`;

CREATE TABLE `impacto` (
  `ID_VEICULO` int(11) unsigned NOT NULL COMMENT 'Identificador do Veículo',
  `ID_IMPACTO` int(11) unsigned NOT NULL COMMENT 'Identificador do Impacto',
  PRIMARY KEY (`ID_VEICULO`,`ID_IMPACTO`),
  KEY `ID_VEICULO` (`ID_VEICULO`),
  CONSTRAINT `FK_IMPACTO_VEICULO` FOREIGN KEY (`ID_VEICULO`) REFERENCES `veiculo` (`ID_VEICULO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `impacto` */

insert  into `impacto`(`ID_VEICULO`,`ID_IMPACTO`) values (2,2),(2,3),(4,0),(4,3),(5,2);

/*Table structure for table `logradouro` */

DROP TABLE IF EXISTS `logradouro`;

CREATE TABLE `logradouro` (
  `ID_LOGRADOURO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Logradouro',
  `DESCRICAO` varchar(50) NOT NULL COMMENT 'Nome do Logradouro',
  `ID_BAIRRO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Bairro',
  PRIMARY KEY (`ID_LOGRADOURO`),
  KEY `ID_BAIRRO` (`ID_BAIRRO`),
  CONSTRAINT `FK_LOGRADOURO_BAIRRO` FOREIGN KEY (`ID_BAIRRO`) REFERENCES `bairro` (`ID_BAIRRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logradouro` */

insert  into `logradouro`(`ID_LOGRADOURO`,`DESCRICAO`,`ID_BAIRRO`) values (1,'AVENIDA RIO BRANCO',1),(2,'AVENIDA SANTA CRUZ',2),(3,'RUA PIRAQUARA',2),(4,'AVENIDA MINISTRO ARY FRANCO',3),(5,'AVENIDA 14 DE JULHO',4);

/*Table structure for table `motorista` */

DROP TABLE IF EXISTS `motorista`;

CREATE TABLE `motorista` (
  `ID_BRAT` int(11) unsigned NOT NULL COMMENT 'Identificador do BRAT',
  `ID_MOTORISTA` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador do Motorista',
  `DATA_NASC` date NOT NULL COMMENT 'Data de Nascimento do Motorista',
  `ESTADO_CIVIL` smallint(6) unsigned NOT NULL COMMENT 'Estado Civil do Motorista [Solteiro, Casado, Separado, Divorciado, Viúvo]',
  `CNH` varchar(16) NOT NULL COMMENT 'Número de CNH do Motorista',
  `CATEGORIA_CNH` int(11) unsigned NOT NULL COMMENT 'Categoria do CNH do Motorista [A, B, C, D, E, AB, AC, AD, AE]',
  `UF_EXPEDICAO_CNH` char(2) NOT NULL COMMENT 'UF de Expedição do CNH do Motorista',
  `PRONTUARIO_CNH` varchar(16) NOT NULL COMMENT 'Número do Prontuário do CNH do Motorista',
  `VALIDADE_EXAME_CHN` date NOT NULL COMMENT 'Validade do Exame Médico do CNH do Motorista',
  `ID_PESSOA` int(11) unsigned NOT NULL COMMENT 'Identificador da Pessoa',
  PRIMARY KEY (`ID_MOTORISTA`,`ID_BRAT`),
  KEY `ID_PESSOA` (`ID_PESSOA`),
  KEY `ID_BRAT` (`ID_BRAT`),
  CONSTRAINT `FK_MOTORISTA_BRAT` FOREIGN KEY (`ID_BRAT`) REFERENCES `brat` (`ID_BRAT`),
  CONSTRAINT `FK_MOTORISTA_PESSOA` FOREIGN KEY (`ID_PESSOA`) REFERENCES `pessoa` (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `motorista` */

insert  into `motorista`(`ID_BRAT`,`ID_MOTORISTA`,`DATA_NASC`,`ESTADO_CIVIL`,`CNH`,`CATEGORIA_CNH`,`UF_EXPEDICAO_CNH`,`PRONTUARIO_CNH`,`VALIDADE_EXAME_CHN`,`ID_PESSOA`) values (1,1,'1971-03-04',1,'931293813',0,'RJ','708787','2009-08-14',1),(1,2,'1980-05-12',0,'8741298712',2,'RJ','412124','2010-10-10',2),(2,3,'1985-11-30',3,'412435454',1,'RJ','5235111','2009-11-27',4);

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `ID_MUNICIPIO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Município',
  `DESCRICAO` varchar(50) NOT NULL COMMENT 'Nome do Município',
  `UF` char(2) NOT NULL COMMENT 'Identificador da UF',
  PRIMARY KEY (`ID_MUNICIPIO`),
  KEY `UF` (`UF`),
  CONSTRAINT `FK_MUNICIPIO_UF` FOREIGN KEY (`UF`) REFERENCES `uf` (`UF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `municipio` */

insert  into `municipio`(`ID_MUNICIPIO`,`DESCRICAO`,`UF`) values (1,'RIO DE JANEIRO','RJ'),(2,'DUQUE DE CAXIAS','RJ');

/*Table structure for table `perfil` */

DROP TABLE IF EXISTS `perfil`;

CREATE TABLE `perfil` (
  `ID_PERFIL` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Perfil',
  `DESCRICAO` varchar(20) NOT NULL COMMENT 'Nome do Perfil [Administrador, Policial]',
  PRIMARY KEY (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `perfil` */

insert  into `perfil`(`ID_PERFIL`,`DESCRICAO`) values (0,'ADMINISTRADOR'),(1,'POLICIAL');

/*Table structure for table `pessoa` */

DROP TABLE IF EXISTS `pessoa`;

CREATE TABLE `pessoa` (
  `ID_PESSOA` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador da Pessoa',
  `NOME` varchar(50) NOT NULL COMMENT 'Nome da Pessoa',
  `CPF` varchar(11) DEFAULT NULL COMMENT 'CPF da Pessoa',
  `SEXO` char(1) NOT NULL COMMENT 'Sexo da Pessoa [Masculino, Feminino]',
  `ID_ENDERECO` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Endereço',
  PRIMARY KEY (`ID_PESSOA`),
  KEY `ID_ENDERECO` (`ID_ENDERECO`),
  CONSTRAINT `FK_PESSOA_ENDERECO` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `endereco` (`ID_ENDERECO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `pessoa` */

insert  into `pessoa`(`ID_PESSOA`,`NOME`,`CPF`,`SEXO`,`ID_ENDERECO`) values (1,'OTAVIO BARRETO DE MELO','09443431718','0',6),(2,'MARCELO MACEDO','12345678913','0',1),(3,'LEANDRO CESAR','12345678925','0',3),(4,'PALOMA GUEDES','46346989481','1',6),(5,'BIANCA GUEDES','49178812412','1',2),(6,'FERNANDA BARRETO','49184901284','1',5),(7,'LUIZA FERNANDES',NULL,'1',4);

/*Table structure for table `policial` */

DROP TABLE IF EXISTS `policial`;

CREATE TABLE `policial` (
  `MATRICULA` varchar(15) NOT NULL COMMENT 'Identificador do Policial',
  `NOME` varchar(60) NOT NULL COMMENT 'Nome do Policial',
  `BATALHAO` smallint(6) unsigned NOT NULL COMMENT 'Batalhão do Policial [1º Batalhão, 2º Batalhão, 3º Batalhão e etc.]',
  `SENHA` varchar(8) NOT NULL COMMENT 'Senha de Acesso ao BRATO',
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'Status do Policial [A = Ativo, I = Inativo]',
  `ID_PERFIL` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Perfil',
  PRIMARY KEY (`MATRICULA`),
  KEY `ID_PERFIL` (`ID_PERFIL`),
  CONSTRAINT `FK_POLICIAL_PERFIL` FOREIGN KEY (`ID_PERFIL`) REFERENCES `perfil` (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `policial` */

insert  into `policial`(`MATRICULA`,`NOME`,`BATALHAO`,`SENHA`,`STATUS`,`ID_PERFIL`) values ('0983734','PEDRO IGOR',3,'12345','A',1),('4235556','ROBERTO RUFINO',21,'40032','A',1),('5652262','ANDRE MACHADO',9,'45778','A',0);

/*Table structure for table `rl_perfil_funcao` */

DROP TABLE IF EXISTS `rl_perfil_funcao`;

CREATE TABLE `rl_perfil_funcao` (
  `ID_PERFIL` smallint(6) unsigned NOT NULL COMMENT 'Identificador do Perfil',
  `ID_FUNCAO` smallint(6) unsigned NOT NULL COMMENT 'Identificador da Função no BRATO',
  PRIMARY KEY (`ID_PERFIL`,`ID_FUNCAO`),
  KEY `ID_FUNCAO` (`ID_FUNCAO`),
  CONSTRAINT `FK_RL_FUNCAO` FOREIGN KEY (`ID_FUNCAO`) REFERENCES `funcao` (`ID_FUNCAO`),
  CONSTRAINT `FK_RL_PERFIL` FOREIGN KEY (`ID_PERFIL`) REFERENCES `perfil` (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rl_perfil_funcao` */

insert  into `rl_perfil_funcao`(`ID_PERFIL`,`ID_FUNCAO`) values (0,1),(0,2),(0,3),(1,3),(0,4);

/*Table structure for table `testemunha` */

DROP TABLE IF EXISTS `testemunha`;

CREATE TABLE `testemunha` (
  `ID_BRAT` int(11) unsigned NOT NULL COMMENT 'Identificador do BRAT',
  `ID_TESTEMUNHA` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador da Testemunha',
  `ID_PESSOA` int(11) unsigned NOT NULL COMMENT 'Identificador da Pessoa',
  PRIMARY KEY (`ID_TESTEMUNHA`,`ID_BRAT`),
  KEY `ID_PESSOA` (`ID_PESSOA`),
  KEY `ID_BRAT` (`ID_BRAT`),
  CONSTRAINT `FK_TESTEMUNHA_BRAT` FOREIGN KEY (`ID_BRAT`) REFERENCES `brat` (`ID_BRAT`),
  CONSTRAINT `FK_TESTEMUNHA_PESSOA` FOREIGN KEY (`ID_PESSOA`) REFERENCES `pessoa` (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `testemunha` */

insert  into `testemunha`(`ID_BRAT`,`ID_TESTEMUNHA`,`ID_PESSOA`) values (2,3,1),(2,4,2),(3,6,2),(3,5,3),(1,1,5),(1,2,6);

/*Table structure for table `uf` */

DROP TABLE IF EXISTS `uf`;

CREATE TABLE `uf` (
  `UF` char(2) NOT NULL COMMENT 'Identificador da UF',
  PRIMARY KEY (`UF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `uf` */

insert  into `uf`(`UF`) values ('RJ');

/*Table structure for table `veiculo` */

DROP TABLE IF EXISTS `veiculo`;

CREATE TABLE `veiculo` (
  `ID_BRAT` int(11) unsigned NOT NULL COMMENT 'Identificador do BRAT',
  `ID_VEICULO` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Veículo',
  `NOME_PROPRIETARIO` varchar(50) NOT NULL COMMENT 'Nome do Proprietário do Veículo',
  `TIPO_VEICULO` smallint(6) unsigned NOT NULL COMMENT 'Tipo de Veículo [Carro, Motocicleta, Caminhão, Ônibus]',
  `PLACA` varchar(7) NOT NULL COMMENT 'Placa do Veículo',
  `FABRICANTE` smallint(6) unsigned NOT NULL COMMENT 'Fabricante do Veículo [Chevrolet, Fiat, Ford, Honda e etc.]',
  `MODELO` smallint(6) unsigned NOT NULL COMMENT 'Modelo do Veículo [Corsa, Uno, Fiesta, City e etc.]',
  `ANO` year(4) NOT NULL COMMENT 'Ano do Veículo',
  `COR` smallint(6) NOT NULL COMMENT 'Cor do Veículo [Preto, Branco, Cinza, Prata e etc.]',
  PRIMARY KEY (`ID_VEICULO`,`ID_BRAT`),
  KEY `ID_BRAT` (`ID_BRAT`),
  CONSTRAINT `FK_VEICULO_BRAT` FOREIGN KEY (`ID_BRAT`) REFERENCES `brat` (`ID_BRAT`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `veiculo` */

insert  into `veiculo`(`ID_BRAT`,`ID_VEICULO`,`NOME_PROPRIETARIO`,`TIPO_VEICULO`,`PLACA`,`FABRICANTE`,`MODELO`,`ANO`,`COR`) values (1,1,'OTAVIO BARRETO',0,'ABC1345',1,2,2000,0),(1,2,'MARCELO MACEDO',0,'TER0987',3,10,2009,1),(2,3,'LEANDRO CESAR',2,'SSC4598',12,11,2007,7),(2,4,'FABRICIO',1,'AZS2344',5,3,2005,5),(3,5,'PALOMA GUEDES',3,'MKL4566',2,4,2012,4);

/*Table structure for table `vitima` */

DROP TABLE IF EXISTS `vitima`;

CREATE TABLE `vitima` (
  `ID_BRAT` int(11) unsigned NOT NULL COMMENT 'Identificador do BRAT',
  `ID_VITIMA` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador da Vítima',
  `DATA_NASC` date NOT NULL COMMENT 'Data de Nascimento da Vítima',
  `TIPO_FERIMENTO` smallint(6) unsigned NOT NULL COMMENT 'Tipo de Ferimento [Leve(s), Grave(s), Fatal]',
  `REMOCAO` varchar(50) DEFAULT NULL COMMENT 'Local de Remoção da Vítima',
  `ID_PESSOA` int(11) unsigned NOT NULL COMMENT 'Identificador da Pessoa',
  PRIMARY KEY (`ID_VITIMA`,`ID_BRAT`),
  KEY `ID_PESSOA` (`ID_PESSOA`),
  KEY `ID_BRAT` (`ID_BRAT`),
  CONSTRAINT `FK_VITIMA_BRAT` FOREIGN KEY (`ID_BRAT`) REFERENCES `brat` (`ID_BRAT`),
  CONSTRAINT `FK_VITIMA_PESSOA` FOREIGN KEY (`ID_PESSOA`) REFERENCES `pessoa` (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vitima` */

insert  into `vitima`(`ID_BRAT`,`ID_VITIMA`,`DATA_NASC`,`TIPO_FERIMENTO`,`REMOCAO`,`ID_PESSOA`) values (3,1,'1999-01-11',0,'HOSPITAL ROCHA FARIA',7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

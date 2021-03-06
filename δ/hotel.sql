-- MySQL Script generated by MySQL Workbench
-- 06/02/15 11:36:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ksenodoxio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ksenodoxio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ksenodoxio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ksenodoxio` ;

-- -----------------------------------------------------
-- Table `ksenodoxio`.`Pelatis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Pelatis` (
  `Id_Pelath` INT NOT NULL,
  `AFM_Pelath` VARCHAR(9) NOT NULL,
  `Onoma_Pelath` VARCHAR(20) NOT NULL,
  `Epwnumo_Pelath` VARCHAR(25) NOT NULL,
  `Fylo_Pelath` VARCHAR(1) NOT NULL,
  `Hm_Gennhshs_Pelath` DATE NOT NULL,
  `Dieuthunsi_Pelath` VARCHAR(45) NOT NULL,
  `Tilephwno_Pelath` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Id_Pelath`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Ypallillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Ypallillos` (
  `Id_Ypallilou` INT NOT NULL,
  `Onoma_Ypallilou` VARCHAR(20) NOT NULL,
  `Epwnumo_Ypallilou` VARCHAR(25) NOT NULL,
  `Eidikotita_Ypallilou` VARCHAR(25) NOT NULL,
  `Dieuthunsi_Ypallilou` VARCHAR(45) NOT NULL,
  `Thlephwno_Ypallilou` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Id_Ypallilou`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Dwmatio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Dwmatio` (
  `Arithmos_Dwmatiou` INT NOT NULL,
  `Xwritikothta_Dwmatiou` TINYINT NOT NULL,
  `Katigoria_Dwmatiou` TINYINT NOT NULL,
  PRIMARY KEY (`Arithmos_Dwmatiou`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Dianomi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Dianomi` (
  `Id_Dianomis` INT NOT NULL,
  `Arithmos_Dwmatiou` INT NOT NULL,
  `Hmeromhnia_Enarksis` DATE NOT NULL,
  `Hmeromhnia_Lhkshs` DATE NOT NULL,
  `Askia_Dianomis` INT NOT NULL,
  PRIMARY KEY (`Id_Dianomis`, `Arithmos_Dwmatiou`),
  INDEX `fk_Dianomi_Dwmatio_idx` (`Arithmos_Dwmatiou` ASC),
  CONSTRAINT `fk_Dianomi_Dwmatio`
    FOREIGN KEY (`Arithmos_Dwmatiou`)
    REFERENCES `ksenodoxio`.`Dwmatio` (`Arithmos_Dwmatiou`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Pelates_Dianomis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Pelatis_Dianomh` (
  `Id_Dianomis` INT NOT NULL,
  `Id_Pelath` INT NOT NULL,
  PRIMARY KEY (`Id_Dianomis`, `Id_Pelath`),
  INDEX `fk_Pelatis_has_Dianomi_Dianomi1_idx` (`Id_Dianomis` ASC),
  INDEX `fk_Pelatis_has_Dianomi_Pelatis1_idx` (`Id_Pelath` ASC),
  CONSTRAINT `fk_Pelatis_has_Dianomi_Pelatis1`
    FOREIGN KEY (`Id_Pelath`)
    REFERENCES `ksenodoxio`.`Pelatis` (`Id_Pelath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pelatis_has_Dianomi_Dianomi1`
    FOREIGN KEY (`Id_Dianomis`)
    REFERENCES `ksenodoxio`.`Dianomi` (`Id_Dianomis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Proionta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Proion` (
  `Id_Proiontos` INT NOT NULL,
  `Onoma_Proiontos` VARCHAR(45) NOT NULL,
  `Aksia_Monadas_Proiontos` INT NOT NULL,
  PRIMARY KEY (`Id_Proiontos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Xrewseis_Pelatwn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Xrewseis_Pelatwn` (
  `Id_Pelath` INT NOT NULL,
  `Id_Proiontos` INT NOT NULL,
  `Hmeromhnia_Xrewshs` DATE NOT NULL,
  `Id_Ypallilou` INT NOT NULL,
  `Posotita_Proiontos` INT NOT NULL,
  PRIMARY KEY (`Id_Pelath`, `Id_Proiontos`, `Hmeromhnia_Xrewshs`),
  INDEX `fk_Xrewseis_Pelatwn_Pelatis1_idx` (`Id_Pelath` ASC),
  INDEX `fk_Xrewseis_Pelatwn_Proionta1_idx` (`Id_Proiontos` ASC),
  INDEX `fk_Xrewseis_Pelatwn_Ypallillos1_idx` (`Id_Ypallilou` ASC),
  CONSTRAINT `fk_Xrewseis_Pelatwn_Pelatis1`
    FOREIGN KEY (`Id_Pelath`)
    REFERENCES `ksenodoxio`.`Pelatis` (`Id_Pelath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Xrewseis_Pelatwn_Proionta1`
    FOREIGN KEY (`Id_Proiontos`)
    REFERENCES `ksenodoxio`.`Proionta` (`Id_Proiontos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Xrewseis_Pelatwn_Ypallillos1`
    FOREIGN KEY (`Id_Ypallilou`)
    REFERENCES `ksenodoxio`.`Ypallillos` (`Id_Ypallilou`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksenodoxio`.`Diathesimotita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksenodoxio`.`Diathesimotita` (
  `Id_Eggrafhs` INT AUTO_INCREMENT NOT NULL,
  `Sunolikos_Arithmos_Dwmatiwn` INT NOT NULL,
  `Diathesimos_Arithmos_Dwmatiwn` INT NOT NULL,
  `Plhrothta` FLOAT NOT NULL,
  PRIMARY KEY (`Id_Eggrafhs`))
ENGINE = InnoDB;


INSERT INTO Pelatis VALUES(1,654837459,'Vasilis','Karaitsakis','m', '1985/03/09','Papakuriazh 10','698547120');
INSERT INTO Pelatis VALUES(2,156987452,'Giorgos','Petrou','m', '1971/08/22','Swthriou 21','6987489620');
INSERT INTO Pelatis VALUES(3,365789452,'Maria','Iwannou','f', '1991/10/01','Venizelou 1','6947851203');
INSERT INTO Pelatis VALUES(4,458789632,'Dimitris','Patelis','m', '1983/07/19','Voulgaroktonou 121','6932145698');
INSERT INTO Pelatis VALUES(5,520147896,'Kostas','Drimousis','m', '1992/07/29','Alamanas 2','6941023698');
INSERT INTO Pelatis VALUES(6,520321478,'Petros','Kuriakopoulos','m', '1975/04/02','Larisis 9','6987796210');
INSERT INTO Pelatis VALUES(7,963581002,'Georgia','Papadopoulou','f', '1970/11/14','Pithmonos 11','6987456210');
INSERT INTO Pelatis VALUES(8,854720065,'Fwtini','Iordanou','f', '1988/03/08','Venizelou 1','6943029874');
INSERT INTO Pelatis VALUES(9,420102875,'Giannis','Papapetrou','m', '1985/12/24','Galinou 7','6932102458');
INSERT INTO Pelatis VALUES(10,126987450,'Valantis','Koziakis','m', '1968/10/10','Athanasiou Diakou 5','6941502697');
INSERT INTO Pelatis VALUES(11,321789654,'Pavlos','Athanasidis','m', '1993/08/10','Rousvelt 3','6985478520');
INSERT INTO Pelatis VALUES(12,741025896,'Thanasis','Keramas','m', '1989/03/05','Giannari 11','6984938271');
INSERT INTO Pelatis VALUES(13,963587412,'Swthris','Papanikolaou','m', '1986/06/11','Aristotelous 3','6933928456');
INSERT INTO Pelatis VALUES(14,159756842,'Stamatis','Zamanis','m', '1980/09/17','Papaswtiriou 111','6982829314');
INSERT INTO Pelatis VALUES(15,357841258,'Serafim','Makris','m', '1977/05/09','Iatridou 6','6947615932');
INSERT INTO Pelatis VALUES(16,741965821,'Xristina','Zegka','f', '1969/03/10','Farmakidou 4','6935715962');
INSERT INTO Pelatis VALUES(17,852478512,'Xrhstos','Dhmitriou','m', '1986/02/15','Giannakouli 10','6988775203');
INSERT INTO Pelatis VALUES(18,965214785,'Aggeliki','Pirka','f', '1987/04/09','Tziolas 25','6983654471');
INSERT INTO Pelatis VALUES(19,718293546,'Antonis','Savvas','m', '1990/10/27','Kamvouniwn 50','6933365874');
INSERT INTO Pelatis VALUES(20,889745633,'Nikoleta','Stanonikopoulou','f', '1985/11/30','Papakuriazh 74','6934569871');

INSERT INTO Ypallillos VALUES(1,'Theodora','Nikolaou','Reception','Triantafullou 13', '6985214563');
INSERT INTO Ypallillos VALUES(2,'Giannis','Asimakopoulos','Reception','Sarantaporou 1', '698223657');
INSERT INTO Ypallillos VALUES(3,'Vasilis','Thanailakis','Katharistis Spa','Venizelou 13', '6941236589');
INSERT INTO Ypallillos VALUES(4,'Marios','Patsos','Katharistis Saounas','Gerasimou 3', '6932010025');
INSERT INTO Ypallillos VALUES(5,'Xristos','Patsiouras','Security','Klathmonos 123', '6985463210');
INSERT INTO Ypallillos VALUES(6,'Rena','Milili','Kamariera','Germanou 3', '6975212365');
INSERT INTO Ypallillos VALUES(7,'Fwtis','Gkentzoglou','Katharistis Saounas','Sarantaporou 45', '6902365478');
INSERT INTO Ypallillos VALUES(8,'Georgia','Gkarani','Kamariera','Aristotelous 13', '6985201236');
INSERT INTO Ypallillos VALUES(9,'Hlias','Theodorou','Security','Plathmonos 8', '6932021445');
INSERT INTO Ypallillos VALUES(10,'Maria','Strankou','Katharistria Jacuzzi','Triantafullou 20', '6932123698');
INSERT INTO Ypallillos VALUES(11,'Vasiliki','Koutrompilia','Reception','Triantafullou 13', '6932587452');
INSERT INTO Ypallillos VALUES(12,'Nikos','Eksarxiou','Reception','Pavlou 3', '6975485221');
INSERT INTO Ypallillos VALUES(13,'Kostas','Kammenos','Katharistis Jacuzzi','Koumoundourou 125', '6982564125');
INSERT INTO Ypallillos VALUES(14,'Fwtini','Gersimou','Katharistria','Fwtinis 1', '6945698712');
INSERT INTO Ypallillos VALUES(15,'Efthimis','Lampadas','Mageiras','Serafim 13', '6983698521');
INSERT INTO Ypallillos VALUES(16,'Eleni','Kechagia','Mageirisa','Giannou 6', '6975412369');
INSERT INTO Ypallillos VALUES(17,'Vaggelis','Pappos','Servitoros','Keramikou 5', '6975236985');
INSERT INTO Ypallillos VALUES(18,'Anastasia','Kakarantza','Servitoros','Spanou 19', '6982321456');

INSERT INTO Dwmatio VALUES(1,1,3);
INSERT INTO Dwmatio VALUES(2,1,2);
INSERT INTO Dwmatio VALUES(3,1,2);
INSERT INTO Dwmatio VALUES(4,1,1);
INSERT INTO Dwmatio VALUES(5,1,2);
INSERT INTO Dwmatio VALUES(6,1,3);
INSERT INTO Dwmatio VALUES(7,1,1);
INSERT INTO Dwmatio VALUES(8,1,2);
INSERT INTO Dwmatio VALUES(9,1,3);
INSERT INTO Dwmatio VALUES(10,1,1);
INSERT INTO Dwmatio VALUES(11,2,1);
INSERT INTO Dwmatio VALUES(12,2,3);
INSERT INTO Dwmatio VALUES(13,2,2);
INSERT INTO Dwmatio VALUES(14,2,2);
INSERT INTO Dwmatio VALUES(15,2,2);
INSERT INTO Dwmatio VALUES(16,2,3);
INSERT INTO Dwmatio VALUES(17,2,1);
INSERT INTO Dwmatio VALUES(18,2,3);
INSERT INTO Dwmatio VALUES(19,2,1);
INSERT INTO Dwmatio VALUES(20,2,3);
INSERT INTO Dwmatio VALUES(21,3,3);
INSERT INTO Dwmatio VALUES(22,3,2);
INSERT INTO Dwmatio VALUES(23,3,3);
INSERT INTO Dwmatio VALUES(24,3,1);
INSERT INTO Dwmatio VALUES(25,3,3);
INSERT INTO Dwmatio VALUES(26,3,1);
INSERT INTO Dwmatio VALUES(27,3,3);
INSERT INTO Dwmatio VALUES(28,3,3);
INSERT INTO Dwmatio VALUES(29,3,2);
INSERT INTO Dwmatio VALUES(30,3,3);

INSERT INTO Dianomi VALUES(1,1,'2014/07/15','2014/07/25',0);
INSERT INTO Dianomi VALUES(2,3,'2014/07/16','2014/07/23',0);
INSERT INTO Dianomi VALUES(3,4,'2014/07/08','2014/07/15',0);
INSERT INTO Dianomi VALUES(4,10,'2014/06/10','2014/06/18',0);
INSERT INTO Dianomi VALUES(5,12,'2014/08/13','2014/08/19',0);
INSERT INTO Dianomi VALUES(6,13,'2014/08/15','2014/08/26',0);
INSERT INTO Dianomi VALUES(7,5,'2014/07/02','2014/07/09',0);
INSERT INTO Dianomi VALUES(8,6,'2014/07/01','2014/07/07',0);
INSERT INTO Dianomi VALUES(9,22,'2014/06/05','2014/06/11',0);
INSERT INTO Dianomi VALUES(10,25,'2014/07/12','2014/07/20',0);
INSERT INTO Dianomi VALUES(11,9,'2014/07/22','2014/07/28',0);
INSERT INTO Dianomi VALUES(12,18,'2014/07/25','2014/08/01',0);
INSERT INTO Dianomi VALUES(13,20,'2014/06/10','2014/06/16',0);
INSERT INTO Dianomi VALUES(14,30,'2014/06/28','2014/07/05',0);
INSERT INTO Dianomi VALUES(15,2,'2014/06/05','2014/06/12',0);
INSERT INTO Dianomi VALUES(16,7,'2014/07/3','2014/07/10',0);
INSERT INTO Dianomi VALUES(17,14,'2014/08/15','2014/08/25',0);
INSERT INTO Dianomi VALUES(18,19,'2014/08/10','2014/08/15',0);
INSERT INTO Dianomi VALUES(19,23,'2014/07/17','2014/07/25',0);
INSERT INTO Dianomi VALUES(20,28,'2014/06/19','2014/07/01',0);

INSERT INTO Pelatis_Dianomh VALUES(1,1);
INSERT INTO Pelatis_Dianomh VALUES(2,2);
INSERT INTO Pelatis_Dianomh VALUES(3,3);
INSERT INTO Pelatis_Dianomh VALUES(4,4);
INSERT INTO Pelatis_Dianomh VALUES(5,5);
INSERT INTO Pelatis_Dianomh VALUES(6,6);
INSERT INTO Pelatis_Dianomh VALUES(7,7);
INSERT INTO Pelatis_Dianomh VALUES(8,8);
INSERT INTO Pelatis_Dianomh VALUES(9,9);
INSERT INTO Pelatis_Dianomh VALUES(10,10);
INSERT INTO Pelatis_Dianomh VALUES(11,11);
INSERT INTO Pelatis_Dianomh VALUES(12,12);
INSERT INTO Pelatis_Dianomh VALUES(12,1);
INSERT INTO Pelatis_Dianomh VALUES(13,13);
INSERT INTO Pelatis_Dianomh VALUES(14,14);
INSERT INTO Pelatis_Dianomh VALUES(15,15);
INSERT INTO Pelatis_Dianomh VALUES(16,16);
INSERT INTO Pelatis_Dianomh VALUES(17,17);
INSERT INTO Pelatis_Dianomh VALUES(18,18);
INSERT INTO Pelatis_Dianomh VALUES(19,19);
INSERT INTO Pelatis_Dianomh VALUES(20,20);

INSERT INTO Proion VALUES(1,'Spa',20);
INSERT INTO Proion VALUES(2,'Jacuzzi',30);
INSERT INTO Proion VALUES(3,'Saouna',50);
INSERT INTO Proion VALUES(4,'Estiatorio',25);

INSERT INTO Xrewseis_Pelatwn VALUES(1,1,'2014/07/16',3,2);
INSERT INTO Xrewseis_Pelatwn VALUES(2,2,'2014/07/17',10,1);
INSERT INTO Xrewseis_Pelatwn VALUES(1,2,'2014/07/18',13,1);
INSERT INTO Xrewseis_Pelatwn VALUES(3,4,'2014/07/08',17,1);
INSERT INTO Xrewseis_Pelatwn VALUES(4,4,'2014/06/11',18,1);
INSERT INTO Xrewseis_Pelatwn VALUES(5,2,'2014/08/14',10,1);
INSERT INTO Xrewseis_Pelatwn VALUES(5,3,'2014/08/15',4,1);
INSERT INTO Xrewseis_Pelatwn VALUES(6,1,'2014/08/15',3,2);
INSERT INTO Xrewseis_Pelatwn VALUES(7,3,'2014/07/03',4,1);
INSERT INTO Xrewseis_Pelatwn VALUES(8,3,'2014/07/05',4,2);
INSERT INTO Xrewseis_Pelatwn VALUES(9,3,'2014/06/08',4,4);
INSERT INTO Xrewseis_Pelatwn VALUES(10,4,'2014/07/13',17,1);
INSERT INTO Xrewseis_Pelatwn VALUES(15,1,'2014/06/06',3,1);
INSERT INTO Xrewseis_Pelatwn VALUES(3,2,'2014/07/10',13,3);
INSERT INTO Xrewseis_Pelatwn VALUES(20,1,'2014/06/22',3,1);
INSERT INTO Xrewseis_Pelatwn VALUES(17,4,'2014/08/16',17,2);
INSERT INTO Xrewseis_Pelatwn VALUES(18,1,'2014/08/11',3,2);
INSERT INTO Xrewseis_Pelatwn VALUES(20,2,'2014/06/20',13,2);
INSERT INTO Xrewseis_Pelatwn VALUES(14,2,'2014/06/29',13,2);

INSERT INTO Diathesimotita (Sunolikos_Arithmos_Dwmatiwn,Diathesimos_Arithmos_Dwmatiwn,Plhrothta) VALUES(30,20,66.6);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



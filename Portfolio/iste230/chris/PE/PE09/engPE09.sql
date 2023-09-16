-- Chris Eng
-- PE09
-- 11/14/2022

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema modpack
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modpack
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS modpack DEFAULT CHARACTER SET utf8 ;
USE modpack ;

-- -----------------------------------------------------
-- Table `modpack`.`Mod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS modpack.Mod (
  GameID INT(10) NOT NULL AUTO_INCREMENT,
  ModName VARCHAR(15) NULL,
  ModVersion DECIMAL(3,2) NULL,
  PRIMARY KEY (GameID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modpack`.`Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS modpack.Game (
  GameID INT(10) NOT NULL AUTO_INCREMENT,
  CompanyName MEDIUMTEXT NULL,
  Launcher VARCHAR(10) NULL,
  ReleaseDate DATE NULL,
  Mod_GameID INT NOT NULL,
  PRIMARY KEY (GameID, Mod_GameID),
  INDEX fk_Game_Mod_idx (Mod_GameID ASC) VISIBLE,
  CONSTRAINT fk_Game_Mod
    FOREIGN KEY (Mod_GameID)
    REFERENCES modpack.Mod (GameID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- DATA Added
INSERT INTO Game ( CompanyName, Launcher, ReleaseDate) VALUES ( 'Re-logic','STEAM', 2011-05-16);
INSERT INTO Game ( CompanyName, Launcher, ReleaseDate) VALUES ( 'Bathesda','Bathesda',2015-10-10);
INSERT INTO Game ( CompanyName, Launcher, ReleaseDate) VALUES ( 'CD-Projekt-RED','STEAM', 2020-12-10);
INSERT INTO Game ( CompanyName, Launcher, ReleaseDate) VALUES ( 'Valve','STEAM', 2004-10-16);
INSERT INTO Game ( CompanyName, Launcher, ReleaseDate) VALUES ( 'Mojang','Microsoft', 2011-10-18);

INSERT INTO Mod ( ModName, ModVersion) VALUES ( 'xtreme-Texturepack', 2.33);
INSERT INTO Mod ( ModName, ModVersion) VALUES ( 'realistic-light', 1.53);
INSERT INTO Mod ( ModName, ModVersion) VALUES ( 'shaders', 4.88);
INSERT INTO Mod ( ModName, ModVersion) VALUES ( 'pvp', 6.33);
INSERT INTO Mod ( ModName, ModVersion) VALUES ( 'npc-voiceline', 1.02);

-- Select statments
SELECT * FROM Game;
SELECT * FROM Mod;
SELECT CompanyName, Launcher, ReleaseDate 
FROM Game
JOIN Mod USING(GameID) ORDER BY Game.ReleaseDate;
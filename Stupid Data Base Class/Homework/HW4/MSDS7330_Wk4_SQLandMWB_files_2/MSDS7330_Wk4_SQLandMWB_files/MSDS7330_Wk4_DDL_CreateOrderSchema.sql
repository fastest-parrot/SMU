-- MySQL Script generated by MySQL Workbench
-- Fri May 25 12:18:46 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
use EcommerceDBSp19;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema EcommerceDB
-- ------------------------------------------------------- 
-- CREATE DATABASE EcommerceDB;
-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Address` (
  `AddressID` INT NOT NULL,
  `HouseNumber` INT NULL,
  `StreetName` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(2) NULL,
  `Zip` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CustomerTable` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `Address_AddressID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `fk_CustomerTable_Address1_idx` (`Address_AddressID` ASC),
  CONSTRAINT `fk_CustomerTable_Address1`
    FOREIGN KEY (`Address_AddressID`)
    REFERENCES `Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OrderHeader`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrderHeader` (
  `OrderNumber` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `CustomerTable_CustomerID` INT NOT NULL,
  `OrderType` VARCHAR(45) NULL,
  `Address_AddressID` INT NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  INDEX `fk_OrderHeader_CustomerTable1_idx` (`CustomerTable_CustomerID` ASC),
  INDEX `fk_OrderHeader_Address1_idx` (`Address_AddressID` ASC),
  CONSTRAINT `fk_OrderHeader_CustomerTable1`
    FOREIGN KEY (`CustomerTable_CustomerID`)
    REFERENCES `CustomerTable` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderHeader_Address1`
    FOREIGN KEY (`Address_AddressID`)
    REFERENCES `Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Item` (
  `ItemNumber` INT NOT NULL,
  `ItemDescription` VARCHAR(45) NULL,
  `ItemWeight` VARCHAR(45) NULL,
  `CountryOfOrigin` VARCHAR(10) NULL,
  `CostPrice` INT NULL,
  `ItemCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`ItemNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OrderLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrderLine` (
  `OrderLineNumber` INT NOT NULL,
  `OrderHeader_OrderNumber` INT NOT NULL,
  `Quantity` INT NULL,
  `PricePerQty` VARCHAR(45) NULL,
  `Item_ItemNumber` INT NOT NULL,
  PRIMARY KEY (`OrderHeader_OrderNumber`, `OrderLineNumber`),
  INDEX `fk_OrderLine_OrderHeader_idx` (`OrderHeader_OrderNumber` ASC),
  INDEX `fk_OrderLine_Item1_idx` (`Item_ItemNumber` ASC),
  CONSTRAINT `fk_OrderLine_OrderHeader`
    FOREIGN KEY (`OrderHeader_OrderNumber`)
    REFERENCES `OrderHeader` (`OrderNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderLine_Item1`
    FOREIGN KEY (`Item_ItemNumber`)
    REFERENCES `Item` (`ItemNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OrderPayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrderPayment` (
  `PaymentId` INT NOT NULL,
  `PaymentType` VARCHAR(45) NOT NULL,
  `CardNumber` VARCHAR(20) NOT NULL,
  `AmountCharged` INT NOT NULL,
  `OrderHeader_OrderNumber` INT NOT NULL,
  PRIMARY KEY (`PaymentId`, `OrderHeader_OrderNumber`),
  INDEX `fk_OrderPayment_OrderHeader1_idx` (`OrderHeader_OrderNumber` ASC),
  CONSTRAINT `fk_OrderPayment_OrderHeader1`
    FOREIGN KEY (`OrderHeader_OrderNumber`)
    REFERENCES `OrderHeader` (`OrderNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ItemPrice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ItemPrice` (
  `PriceId` INT NOT NULL,
  `SalePrice` INT NULL,
  `Country` VARCHAR(45) NULL,
  `Item_ItemNumber` INT NOT NULL,
  PRIMARY KEY (`PriceId`, `Item_ItemNumber`),
  INDEX `fk_ItemPricd_Item1_idx` (`Item_ItemNumber` ASC),
  CONSTRAINT `fk_ItemPricd_Item1`
    FOREIGN KEY (`Item_ItemNumber`)
    REFERENCES `Item` (`ItemNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

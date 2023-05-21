/* 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 
   ___________________________________________________________________________________________________
*/

CREATE DATABASE IF NOT EXISTS homework1;
USE homework1;

CREATE TABLE IF NOT EXISTS `homework1`.`telephon` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `ProductCount` DOUBLE NULL,
  `Price` DOUBLE NULL,
  PRIMARY KEY (`Id`));
  
INSERT telephon(ProductName, Manufacturer, ProductCount, Price) 
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

/* 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
   ___________________________________________________________________________________________________
*/

SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2; 

/* 3. Выведите весь ассортимент товаров марки "Samsung"
   ___________________________________________________________________________________________________
*/

SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';

/* 4.1*** Товары, в которых есть упоминание "Iphone"    
   ___________________________________________________________________________________________________
*/

SELECT *
FROM telephon
WHERE ProductName LIKE '%Iphone%';

/* 4.2*** Товары, в которых есть упоминание "Samsung"
   ___________________________________________________________________________________________________
*/

SELECT *
FROM telephon
WHERE ProductName LIKE '%Samsung%';

/* 4.3*** Товары, в которых есть ЦИФРА "8"  
   ___________________________________________________________________________________________________
*/

SELECT *
FROM telephon
WHERE ProductName RLIKE '8';
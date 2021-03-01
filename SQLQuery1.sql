CREATE DATABASE Animals1;
USE Animals1;
CREATE TABLE AnimalInfo
(
  AnimalType varchar(10),
  AnimalName varchar(10),
  Age int,
  Origin varchar(10),
);

DROP DATABASE Animals;
DROP DATABASE Flowers;

ALTER TABLE AnimalInfo ADD Ownername varchar(10);

ALTER TABLE AnimalInfo DROP COLUMN Ownername;

ALTER TABLE AnimalInfo ADD DOB DATE;

ALTER TABLE AnimalInfo ALTER COLUMN DOB datetime;
ALTER TABLE AnimalInfo DROP COLUMN DOB;
INSERT INTO AnimalInfo VALUES('Cat','Penny','12','USA');
truncate table animalinfo;
sp_rename 'AnimalInfo','animalinfo';
DROP TABLE AnimalInfo;
-------------------------------------------------
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) NOT NULL,
  Age int,
  Origin varchar(10),
);

INSERT INTO animalinfo VALUES(NULL,'Penny','12','USA');
ALTER TABLE animalinfo ALTER COLUMN Age int NOT NULL;
INSERT INTO animalinfo VALUES ('Dog','Salem',NULL,'USA');
DROP TABLE animalinfo;
-----------------------------------
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) UNIQUE NOT NULL,
  Age int,
  Origin varchar(10),
  PRIMARY KEY (AnimalName),
);
INSERT INTO animalinfo VALUES ('Dog','Salem','6','USA');
INSERT INTO animalinfo VALUES ('Dog','Salem','6','USA');
DROP TABLE animalinfo;
-----------------------------------
DROP TABLE animalinfo
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) UNIQUE NOT NULL,
  Age int,
  Origin varchar(10),
  CONSTRAINT ABCAnimal_clinic2 UNIQUE(AnimalName,Age)
);
DROP TABLE animalinfo
--------------
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) UNIQUE NOT NULL,
  Age int,
  Origin varchar(10),
  CONSTRAINT ABCAnimal_clinic2 UNIQUE(AnimalName,Age)
);
ALTER TABLE animalinfo
DROP CONSTRAINT ABCAnimal_clinic2;
DROP TABLE animalinfo;
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) UNIQUE NOT NULL,
  Age int,
  Origin varchar(10) DEFAULT 'India'
);
INSERT INTO animalinfo VALUES ('Cat','Simon',12,'India');

ALTER TABLE animalinfo 
ADD CHECK (Origin='India');


ALTER TABLE animalinfo
ADD CONSTRAINT CHECKCONSTRAINTNAME CHECK (Origin='India');

CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) UNIQUE NOT NULL,
  Age int,
  Origin varchar(10) DEFAULT 'India'
);
ALTER TABLE animalinfo
ADD CONSTRAINT default_Animalname
DEFAULT 'Annie' FOR AnimalName;

CREATE INDEX idex_AnimalName
ON animalinfo(AnimalName)
DROP INDEX animalinfo.idex_AnimalName;

DROP TABLE animalinfo
CREATE TABLE animalinfo
(
  AnimalType varchar(10) NOT NULL,
  AnimalName varchar(10) NOT NULL,
  Age int,
  Origin varchar(10),
);

INSERT INTO animalinfo VALUES ('Cat','Simon',12,'India');
INSERT INTO animalinfo VALUES ('Dog','Salem',6,'USA');
INSERT INTO animalinfo VALUES ('Cat','Penny',12,'USA');
INSERT INTO animalinfo VALUES ('Cat','Annie',10,'USA');
DELETE FROM animalinfo WHERE AnimalName='Annie' AND Origin='Germany';
SELECT * FROM animalinfo

UPDATE animalinfo SET AnimalType='Cat',Origin='USA'
WHERE Age=10;
DELETE FROM animalinfo WHERE AnimalName='Annie';

----------------------------------
CREATE TABLE AnimalResource
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
CREATE TABLE AnimalTarget
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
INSERT INTO AnimalResource VALUES('Penny',1,'Gloria');
INSERT INTO AnimalResource VALUES('Salem',2,'Andrei');
INSERT INTO AnimalResource VALUES('Puff',3,'Michelle');

INSERT INTO AnimalTarget VALUES('Penny',1,'Gloria');
INSERT INTO AnimalTarget VALUES('Salem',2,'Andrei');
INSERT INTO AnimalTarget VALUES('Simon',3,'Michelle');

DROP TABLE AnimalResource
DROP TABLE AnimalTarget

--------------------------------
CREATE TABLE AnimalResource
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
CREATE TABLE AnimalTarget
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
INSERT INTO AnimalResource VALUES('Penny',1,'Gloria');
INSERT INTO AnimalResource VALUES('Salem',2,'Andrei');
INSERT INTO AnimalResource VALUES('Puff',3,'Michelle');

INSERT INTO AnimalTarget VALUES('Penny',1,'Gloria');
INSERT INTO AnimalTarget VALUES('Salem',2,'Andrei');
INSERT INTO AnimalTarget VALUES('Simon',3,'Michelle');

MERGE AnimalTarget TARGET USING AnimalResource SOURCE ON(TARGET.AnimalID=SOURCE.AnimalID) 
WHEN MATCHED AND TARGET.AnimalName<>SOURCE.AnimalName OR TARGET.OwnerName<>SOURCE.OwnerName
THEN
UPDATE SET TARGET.AnimalName=SOURCE.AnimalName,TARGET.OwnerName=SOURCE.OwnerName
WHEN NOT MATCHED BY TARGET THEN
INSERT(AnimalID,AnimalName,OwnerName) VALUES (SOURCE.AnimalID,SOURCE.AnimalName,SOURCE.OwnerName)
WHEN NOT MATCHED BY SOURCE THEN
DELETE;

SELECT * FROM AnimalResource
SELECT * FROM AnimalTarget
DROP TABLE AnimalResource
DROP TABLE AnimalTarget

-----------------------
CREATE TABLE AnimalResource
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
CREATE TABLE AnimalTarget
(
  AnimalName varchar(10),
  AnimalID int,
  OwnerName varchar(10),
);
INSERT INTO AnimalResource VALUES('Penny',1,'Gloria');
INSERT INTO AnimalResource VALUES('Salem',2,'Andrei');
INSERT INTO AnimalResource VALUES('Puff',3,'Michelle');

INSERT INTO AnimalTarget VALUES('Penny',1,'Gloria');
INSERT INTO AnimalTarget VALUES('Salem',2,'Andrei');
INSERT INTO AnimalTarget VALUES('Simon',3,'Michael');

MERGE AnimalTarget TARGET USING AnimalResource SOURCE ON(TARGET.AnimalID=SOURCE.AnimalID) 
WHEN MATCHED AND TARGET.AnimalName<>SOURCE.AnimalName OR TARGET.OwnerName<>SOURCE.OwnerName
THEN
UPDATE SET TARGET.AnimalName=SOURCE.AnimalName,TARGET.OwnerName=SOURCE.OwnerName
WHEN NOT MATCHED BY TARGET THEN
INSERT(AnimalID,AnimalName,OwnerName) VALUES (SOURCE.AnimalID,SOURCE.AnimalName,SOURCE.OwnerName)
WHEN NOT MATCHED BY SOURCE THEN
DELETE;
SELECT * FROM AnimalResource

------------------------------
SELECT AnimalType,AnimalName FROM animalinfo
SELECT TOP 2 * FROM animalinfo 

SELECT DISTINCT Origin FROM animalinfo;
SELECT * FROM animalinfo ORDER BY AnimalName DESC;
SELECT * FROM animalinfo ORDER BY AnimalName ;
SELECT * FROM animalinfo ORDER BY AnimalName,AnimalType;
SELECT * FROM animalinfo ORDER BY AnimalName ASC,AnimalType;
SELECT * FROM animalinfo ORDER BY AnimalName ASC,AnimalType DESC;
SELECT * FROM animalinfo ORDER BY AnimalType DESC,AnimalName ASC;



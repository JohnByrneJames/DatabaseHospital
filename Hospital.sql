DROP SEQUENCE Pkpe;
DROP SEQUENCE PKpa;
DROP SEQUENCE PKdc;
DROP SEQUENCE PKns;
DROP SEQUENCE PKtr;
DROP SEQUENCE PKl;
DROP SEQUENCE PKwd;
DROP SEQUENCE PKof;
DROP SEQUENCE PKop;
DROP SEQUENCE PKe;
DROP SEQUENCE PKc;
DROP SEQUENCE PKpc;
DROP SEQUENCE PKeqc;
DROP SEQUENCE PKcl;

DROP TABLE person;
DROP TABLE patient;
DROP TABLE doctor;
DROP TABLE nurse;
DROP TABLE trainee;
DROP TABLE location;
DROP TABLE ward;
DROP TABLE office;
DROP TABLE optheatre;
DROP TABLE equipment;
DROP TABLE chip;
DROP TABLE personchip;
DROP TABLE equipmentchip;
DROP TABLE chiplocation;

CREATE TABLE person (
  personID NUMBER,
  firstname VARCHAR2(30 CHAR),
  lastname VARCHAR2(30 CHAR),
  telephone VARCHAR2(30 CHAR),
  wristbandissue NUMBER,
  CONSTRAINT person_pk PRIMARY KEY(personID)
);
COMMIT;

CREATE TABLE patient (
  personID NUMBER,
  admission DATE,
  CONSTRAINT patient_pk PRIMARY KEY(personID)
);
COMMIT;

CREATE TABLE doctor (
  personID NUMBER,
  CONSTRAINT doctor_pk PRIMARY KEY(personID)
);
COMMIT;

CREATE TABLE nurse (
  personID NUMBER,
  CONSTRAINT nurse_pk PRIMARY KEY(personID)
);
COMMIT;

CREATE TABLE trainee (
  personID NUMBER,
  CONSTRAINT trainee_pk PRIMARY KEY(personID)
);
COMMIT;

CREATE TABLE location (
  locationID NUMBER,
  location VARCHAR2(70 CHAR),
  CONSTRAINT location_pk PRIMARY KEY(locationID)
);
COMMIT;

CREATE TABLE ward (
  locationID NUMBER,
  name VARCHAR2(35 CHAR),
  CONSTRAINT ward_pk PRIMARY KEY(locationID)
);
COMMIT;

CREATE TABLE office (
  locationID NUMBER,
  officeno NUMBER,
  CONSTRAINT office_pk PRIMARY KEY(locationID)
);
COMMIT;

CREATE TABLE optheatre (
  locationID NUMBER,
  theatreno NUMBER,
  CONSTRAINT optheatre_pk PRIMARY KEY(locationID)
);
COMMIT;

CREATE TABLE equipment (
  equipmentID NUMBER,
  availability VARCHAR2(100 CHAR),
  equipment VARCHAR2(100 CHAR),
  CONSTRAINT equipment_pk PRIMARY KEY(equipmentID)
);
COMMIT;

CREATE TABLE chip (
  chipID NUMBER,
  serialno NUMBER,
  CONSTRAINT chip_pk PRIMARY KEY(chipID)
);
COMMIT;

CREATE TABLE personchip (
  personchipID NUMBER,
  personID NUMBER,
  chipID NUMBER,
  CONSTRAINT personchip_pk PRIMARY KEY(personchipID),
  CONSTRAINT person_personchip_fk FOREIGN KEY (personID) REFERENCES person(personID),
  CONSTRAINT chip_personchip_fk FOREIGN KEY (chipID) REFERENCES chip(chipID)
);
COMMIT;

CREATE TABLE equipmentchip (
  equipmentchipID NUMBER,
  equipmentID NUMBER,
  chipID NUMBER,
  CONSTRAINT equipmentchip_pk PRIMARY KEY(equipmentchipID),
  CONSTRAINT equipment_equipmentchip_fk FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID),
  CONSTRAINT chip_equipmentchip_fk FOREIGN KEY (chipID) REFERENCES chip(chipID)
);
COMMIT;

CREATE TABLE chiplocation (
  chiplocationID NUMBER,
  locationID NUMBER,
  chipID NUMBER,
  CONSTRAINT chiplocation_pk PRIMARY KEY (chiplocationID),
  CONSTRAINT location_chiplocation_fk FOREIGN KEY (locationID) REFERENCES location(locationID),
  CONSTRAINT chip_chiplocation_fk FOREIGN KEY (chipID) REFERENCES chip(chipID)
);
COMMIT;

CREATE SEQUENCE Pkpe START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKpa START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKdc START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKns START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKtr START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKl START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKwd START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKof START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKop START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKe START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKc START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKpc START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKeqc START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PKcl START WITH 1 INCREMENT BY 1;

COMMIT;
-- f1db - Formula 1 Database
-- Jackson Terrill and Brady Hobson
-- Creates the f1db schema and its tables, and inserts values into the database

DROP DATABASE IF EXISTS f1db;
CREATE DATABASE IF NOT EXISTS f1db;
USE f1db;

DROP TABLE IF EXISTS driver;
CREATE TABLE driver (
	driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(64) NOT NULL,
    racing_number INT NOT NULL,
    nationality VARCHAR(64) NOT NULL,
    birthday DATE,
    CONSTRAINT driver_fk_nation
		FOREIGN KEY (nationality)
		REFERENCES nation (nation_id)
);

DROP TABLE IF EXISTS team;
CREATE TABLE team (
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS employs;
CREATE TABLE employs (
	driver_id INT,
	team_id INT,
    season DATE,
    CONSTRAINT employs_pk
		PRIMARY KEY (driver_id, team_id, season),
	CONSTRAINT employs_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id),
	CONSTRAINT employs_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

DROP TABLE IF EXISTS company;
CREATE TABLE company (
	company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS sponsors;
CREATE TABLE sponsors (
	company_id INT,
    team_id INT,
    season DATE,
    CONSTRAINT sponsors_pk
		PRIMARY KEY (company_id, team_id, season),
	CONSTRAINT sponsors_fk_company
		FOREIGN KEY (company_id)
		REFERENCES company (company_id),
	CONSTRAINT sponsors_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

DROP TABLE IF EXISTS principal;
CREATE TABLE principal (
	principal_id INT PRIMARY KEY AUTO_INCREMENT,
    principal_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS manages;
CREATE TABLE manages (
	principal_id INT,
    team_id INT,
    season DATE,
    CONSTRAINT manages_pk
		PRIMARY KEY (principal_id, team_id, season),
	CONSTRAINT manages_fk_principal
		FOREIGN KEY (principal_id)
		REFERENCES principal (principal_id),
	CONSTRAINT manages_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

DROP TABLE IF EXISTS grand_prix;
CREATE TABLE grand_prix (
	grand_prix_id INT PRIMARY KEY AUTO_INCREMENT,
    grand_prix_name VARCHAR(64) NOT NULL,
    race_date DATE NOT NULL,
    circuit_id INT NOT NULL,
    CONSTRAINT grand_prix_fk_circuit
		FOREIGN KEY (circuit_id)
		REFERENCES circuit (circuit_id)
);

DROP TABLE IF EXISTS nation;
CREATE TABLE nation (
	nation_id INT PRIMARY KEY AUTO_INCREMENT,
    abbreviation VARCHAR(2) NOT NULL,
    nation_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS circuit;
CREATE TABLE circuit (
	circuit_id INT PRIMARY KEY AUTO_INCREMENT,
    circuit_name VARCHAR(64) NOT NULL,
    distance DOUBLE NOT NULL,
    laps INT NOT NULL,
    nation_id INT NOT NULL,
    CONSTRAINT circuit_fk_nation
		FOREIGN KEY (nation_id)
		REFERENCES nation (nation_id)
);
    
DROP TABLE IF EXISTS drives;
CREATE TABLE drives (
	driver_id INT,
    grand_prix_id INT,
    season DATE,
    dnf BOOLEAN,
    position INT,
    points INT,
    CONSTRAINT drives_pk
		PRIMARY KEY (driver_id, grand_prix_id, season),
	CONSTRAINT drives_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id),
	CONSTRAINT drives_fk_grand_prix
		FOREIGN KEY (grand_prix_id)
		REFERENCES grand_prix (grand_prix_id)
);
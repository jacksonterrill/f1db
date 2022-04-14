-- f1db - Formula 1 Database
-- Jackson Terrill and Brady Hobson
-- Creates the f1db schema and its tables, and inserts values into the database

DROP DATABASE IF EXISTS f1db;
CREATE DATABASE IF NOT EXISTS f1db;
USE f1db;

DROP TABLE IF EXISTS nation;
CREATE TABLE nation (
	nation_id INT PRIMARY KEY AUTO_INCREMENT,
    nation_name VARCHAR(64) NOT NULL,
    nation_abbreviation VARCHAR(2) NOT NULL
);

INSERT INTO nation (nation_name, nation_abbreviation) VALUES
("Argentina", "AR"), ("Australia", "AU"), ("Austria", "AT"), ("Azerbaijan", "AZ"), ("Bahrain", "BH"),
("Belgium", "BE"), ("Brazil", "BR"), ("Canada", "CA"), ("China", "CN"), ("Finland", "FI"),
("France", "FR"), ("Germany", "DE"), ("Hungary", "HU"), ("India", "IN"), ("Italy", "IT"),
("Japan", "JP"), ("Malaysia", "MY"), ("Mexico", "MX"), ("Monaco", "MC"), ("Morocco", "MA"),
("Netherlands", "NL"), ("Portugal", "PT"), ("Qatar", "QA"), ("Russia", "RU"), ("Saudi Arabia", "SA"),
("Singapore", "SG"), ("South Africa", "ZA"), ("South Korea", "KR"), ("Spain", "ES"), ("Sweden", "SE"),
("Switzerland", "CH"), ("Turkey", "TR"), ("United Arab Emirates", "AE"), 
("United Kingdom of Great Britain and Northern Ireland", "UK"), ("United States of America", "US");

DROP TABLE IF EXISTS driver;
CREATE TABLE driver (
	driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(64) NOT NULL,
    driver_abbreviation VARCHAR(3) NOT NULL,
    racing_number INT NOT NULL,
    nationality INT NOT NULL,
    birthday DATE NOT NULL,
    CONSTRAINT driver_fk_nation
		FOREIGN KEY (nationality)
		REFERENCES nation (nation_id)
);

INSERT INTO driver (driver_name, driver_abbreviation, racing_number, nationality, birthday) VALUES 
("Lewis Hamilton", "HAM", 44, 34, "1985-01-07"), ("Valtteri Bottas", "BOT", 77, 10, "1989-08-28"),
("Sergio Perez", "PER", 11, 18, "1990-01-26"), ("Max Verstappen", "VER", 33, 21, "1997-09-30"),
("Daniel Ricciardo", "RIC", 3, 2, "1989-07-01"), ("Lando Norris", "NOR", 4, 34, "1999-11-13"),
("Sebastian Vettel", "VET", 5, 12, "1987-01-03"), ("Lance Stroll", "STR", 18, 8, "1998-10-29"),
("Fernando Alonso", "ALO", 14, 29, "1981-07-29"), ("Esteban Ocon", "OCO", 31, 11, "1996-09-17"),
("Charles Leclerc", "LEC", 16, 19, "1997-10-16"), ("Carlos Sainz", "SAI", 55, 29, "1994-09-01"),
("Pierre Gasly", "GAS", 10, 11, "1996-02-07"), ("Yuki Tsunoda", "TSU", 22, 16, "2000-05-11"),
("Kimi Raikkonen", "RAI", 7, 10, "1979-10-17"), ("Antonio Giovinazzi", "GIO", 99, 15, "1993-12-14"),
("Nikita Mazepin", "MAZ", 9, 24, "1999-03-02"), ("Mick Schumacher", "MSC", 47, 12, "1999-03-22"),
("Nicholas Latifi", "LAT", 6, 8, "1995-06-29"), ("George Russell", "RUS", 63, 34, "1998-02-15");

DROP TABLE IF EXISTS team;
CREATE TABLE team (
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(64) NOT NULL
);

INSERT INTO team (team_name) VALUES 
("Mercedes-AMG Petronas Formula One Team"), ("Red Bull Racing"),
("McLaren F1 Team"), ("Aston Martin Cognizant Formula One Team"),
("Alpine F1 Team"), ("Scuderia Ferrari Mission Winnow"),
("Scuderia AlphaTauri Honda"), ("Alfa Romeo Racing ORLEN"),
("Uralkali Haas F1 Team"), ("Williams Racing");

DROP TABLE IF EXISTS employs;
CREATE TABLE employs (
	team_id INT,
    driver_id INT,
    season YEAR,
    CONSTRAINT employs_pk
		PRIMARY KEY (team_id, driver_id, season),
	CONSTRAINT employs_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id),
    CONSTRAINT employs_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id)
);

INSERT INTO employs VALUES
(1, 1, "2021"), (1, 2, "2021"),
(2, 3, "2021"), (2, 4, "2021"),
(3, 5, "2021"), (3, 6, "2021"),
(4, 7, "2021"), (4, 8, "2021"),
(5, 9, "2021"), (5, 10, "2021"),
(6, 11, "2021"), (6, 12, "2021"),
(7, 13, "2021"), (7, 14, "2021"),
(8, 15, "2021"), (8, 16, "2021"),
(9, 17, "2021"), (9, 18, "2021"),
(10, 19, "2021"), (10, 20, "2021");

DROP TABLE IF EXISTS constructs;
CREATE TABLE constructs (
	team_id INT,
    season YEAR,
    car_make VARCHAR(64) NOT NULL,
    car_engine VARCHAR(64) NOT NULL,
    CONSTRAINT constructs_pk
		PRIMARY KEY (team_id, season),
	CONSTRAINT constructs_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

INSERT INTO constructs VALUES
(1, "2021", "Mercedes F1 W12 E Performance", "Mercedes F1 M12 E Performance"),
(2, "2021", "Red Bull RB16B", "Honda RA621H"),
(3, "2021", "McLaren MCL35M", "Mercedes F1 M12 E Performance"),
(4, "2021", "Aston Martin AMR21", "Mercedes F1 M12 E Performance"),
(5, "2021", "Alpine A521", "Renault E-Tech 20B"),
(6, "2021", "Ferrari SF21", "Ferrari 065/6"),
(7, "2021", "AlphaTauri AT02", "Honda RA621H"),
(8, "2021", "Alfa Romeo C41", "Ferrari 065/6"),
(9, "2021", "Haas VF-21", "Ferrari 065/6"),
(10, "2021", "Williams FW43B", "Mercedes F1 M12 E Performance");

DROP TABLE IF EXISTS company;
CREATE TABLE company (
	company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(64) NOT NULL
);

INSERT INTO company (company_name) VALUES
("Pirelli"),
("Petronas"), ("Epson"), ("Bose"), ("Hewlett Packard"), ("Monster Energy"),
("Rauch"), ("Honda"), ("Mobil 1 Esso"), ("Tag Heuer"),
("Dell"), ("Coca Cola"), ("CNBC"), ("Cisco Webex"), ("Alienware"),
("Crypto.com"), ("Oakley"),
("Castrol"), ("Dupont"), ("Microsoft"), ("Boeing"), ("Siemens"), 
("Ray-Ban"), ("UPS"), ("Experis"), ("Shell"), ("Giorgio Armani"),
("PKN Orlen"), ("Iveco"), ("Mitsubishi Electric"),
("1&1"), ("Under Armour"),
("Sofina"), ("Symantec"), ("Umbro");

DROP TABLE IF EXISTS sponsors;
CREATE TABLE sponsors (
	company_id INT,
    team_id INT,
    season YEAR,
    CONSTRAINT sponsors_pk
		PRIMARY KEY (company_id, team_id, season),
	CONSTRAINT sponsors_fk_company
		FOREIGN KEY (company_id)
		REFERENCES company (company_id),
	CONSTRAINT sponsors_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

INSERT INTO sponsors VALUES
(1, 1, "2021"), (1, 2, "2021"), (1, 3, "2021"), (1, 4, "2021"), (1, 5, "2021"),
(1, 6, "2021"), (1, 7, "2021"), (1, 8, "2021"), (1, 9, "2021"), (1, 10, "2021"),
(2, 1, "2021"), (3, 1, "2021"), (4, 1, "2021"), (5, 1, "2021"), (6, 1, "2021"),
(7, 2, "2021"), (8, 2, "2021"), (8, 6, "2021"), (9, 2, "2021"), (10, 2, "2021"),
(11, 3, "2021"), (12, 3, "2021"), (13, 3, "2021"), (14, 3, "2021"), (15, 3, "2021"),
(16, 4, "2021"), (17, 4, "2021"), (18, 5, "2021"), (19, 5, "2021"), (20, 5, "2021"),
(21, 5, "2021"), (22, 2, "2021"), (22, 5, "2021"), (22, 6, "2021"), (23, 7, "2021"),
(24, 7, "2021"), (25, 7, "2021"), (26, 7, "2021"), (27, 7, "2021"), (28, 8, "2021"),
(29, 8, "2021"), (30, 8, "2021"), (31, 9, "2021"), (32, 9, "2021"), (33, 10, "2021"),
(34, 10, "2021"), (35, 10, "2021");

DROP TABLE IF EXISTS principal;
CREATE TABLE principal (
	principal_id INT PRIMARY KEY AUTO_INCREMENT,
    principal_name VARCHAR(64) NOT NULL
);

INSERT INTO principal (principal_name) VALUES
("Toto Wolff"), ("Christian Horner"), ("Andreas Seidl"), ("Otmar Szafnauer"), ("Laurent Rossi"),
("Franz Tost"), ("Mattia Binotto"), ("Frederic Vasseur"), ("Guenther Steiner"), ("Jost Capito");

DROP TABLE IF EXISTS manages;
CREATE TABLE manages (
	principal_id INT,
    team_id INT,
    season YEAR,
    CONSTRAINT manages_pk
		PRIMARY KEY (principal_id, team_id, season),
	CONSTRAINT manages_fk_principal
		FOREIGN KEY (principal_id)
		REFERENCES principal (principal_id),
	CONSTRAINT manages_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
);

INSERT INTO manages VALUES
(1, 1, "2021"), (2, 2, "2021"), (3, 3, "2021"), (4, 4, "2021"), (5, 5, "2021"),
(6, 6, "2021"), (7, 7, "2021"), (8, 8, "2021"), (9, 9, "2021"), (10, 10, "2021");

DROP TABLE IF EXISTS circuit;
CREATE TABLE circuit (
	circuit_id INT PRIMARY KEY AUTO_INCREMENT,
    circuit_name VARCHAR(64) NOT NULL,
    distance DOUBLE NOT NULL,
    laps INT NOT NULL,
    city VARCHAR(64) NOT NULL,
    nation_id INT NOT NULL,
    CONSTRAINT circuit_fk_nation
		FOREIGN KEY (nation_id)
		REFERENCES nation (nation_id)
);

INSERT INTO circuit (circuit_name, distance, laps, city, nation_id) VALUES
("Bahrain International Circuit", 302.826, 56, "Sakhir", 5),
("Autodromo Enzo e Dino Ferrari", 309.049, 63, "Imola", 15),
("Algarve Motor Park", 306.826, 66, "Portimao", 22),
("Circuit de Catalunya", 307.104, 66, "Barcelona", 29),
("Circuit de Monaco", 260.286, 78, "Monte Carlo", 19),
("Baku City Circuit", 306.049, 51, "Baku", 4),
("Circuit Gilles Villeneuve", 305.270, 70, "Montreal", 8),
("Circuit Paul Ricard", 309.690, 53, "Le Castellet", 11),
("Red Bull Ring", 306.452, 71, "Spielberg", 3),
("Silverstone Circuit", 306.198, 52, "Silverstone", 34),
("Hungaroring", 306.630, 70, "Budapest", 13),
("Circuit National de Francorchamps", 308.052, 44, "Spa", 6),
("Circuit Park Zandvoort", 302.389, 71, "Zandvoort", 21),
("Autodromo Nazionale di Monza", 306.720, 53, "Monza", 15),
("Sochi Autodrom", 309.745, 53, "Sochi", 24),
("Marina Bay Street Circuit", 308.706, 61, "Singapore City", 26),
("Suzuka International Racing Course", 307.471, 53, "Suzuka", 16),
("Circuit of the Americas", 308.405, 56, "Austin", 35),
("Autodromo Hermanos Rodriguez", 305.354, 71, "Mexico City", 18),
("Autodromo Jose Carlos Pace", 305.879, 71, "Sao Paulo", 7),
("Albert Park Circuit", 307.574, 58, "Melbourne", 2),
("Jeddah Street Circuit", 308.750, 50, "Dschidda", 25),
("Yas Marina Circuit", 305.355, 55, "Abu Dhabi", 33);

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

INSERT INTO grand_prix (grand_prix_name, race_date, circuit_id) VALUES
("Gulf Air Bahrain Grand Prix", "2021-03-28", 1),
("Pirelli Gran Premio del Made in Italy e dell'Emilia-Romagna", "2021-04-18", 2),
("Heineken Grande Premio de Portugal", "2021-05-02", 3),
("Gran Premio de España Emirates", "2021-05-09", 4),
("Grand Prix de Monaco", "2021-05-23", 5),
("Azerbaijan Grand Prix", "2021-06-06", 6),
("Heineken Grand Prix du Canada", "2021-06-13", 7),
("Pirelli Grand Prix de France", "2021-06-27", 8),
("Eyetime Großer Preis von Österreich", "2021-07-04", 9),
("Rolex British Grand Prix", "2021-07-18", 10),
("Magyar Nagydij", "2021-08-01", 11),
("Belgian Grand Prix", "2021-08-29", 12),
("Dutch Grand Prix", "2021-09-05", 13),
("Gran Premio Heineken d'Italia", "2021-09-12", 14),
("VTB Russian Grand Prix", "2021-09-26", 15),
("Singapore Grand Prix", "2021-10-03", 16),
("Japanese Grand Prix", "2021-10-10", 17),
("United States Grand Prix", "2021-10-24", 18),
("Gran Premio de Mexico", "2021-10-31", 19),
("Grande Premio do Sao Paulo", "2021-11-07", 20),
("Rolex Australian Grand Prix", "2021-11-21", 21),
("Saudi Arabia", "2021-12-05", 22),
("Etihad Airways Abu Dhabi Grand Prix", "2021-12-12", 23);
    
DROP TABLE IF EXISTS drives;
CREATE TABLE drives (
	driver_id INT,
    grand_prix_id INT,
    season YEAR,
    position INT,
    points INT NOT NULL,
    CONSTRAINT drives_pk
		PRIMARY KEY (driver_id, grand_prix_id, season),
	CONSTRAINT drives_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id),
	CONSTRAINT drives_fk_grand_prix
		FOREIGN KEY (grand_prix_id)
		REFERENCES grand_prix (grand_prix_id)
);

INSERT INTO drives VALUES
(1, 1, "2021", 1, 25), (2, 1, "2021", 3, 16), (3, 1, "2021", 5, 10), (4, 1, "2021", 2, 18), (5, 1, "2021", 7, 6),
(6, 1, "2021", 4, 12), (7, 1, "2021", 15, 0), (8, 1, "2021", 10, 1), (9, 1, "2021", NULL, 0), (10, 1, "2021", 13, 0),
(11, 1, "2021", 6, 8), (12, 1, "2021", 8, 4), (13, 1, "2021", 17, 0), (14, 1, "2021", 9, 2), (15, 1, "2021", 11, 0),
(16, 1, "2021", 12, 0), (17, 1, "2021", NULL, 0), (18, 1, "2021", 16, 0), (19, 1, "2021", 18, 0), (20, 1, "2021", 14, 0),

(1, 2, "2021", 2, 19), (2, 2, "2021", NULL, 0), (3, 2, "2021", 12, 0), (4, 2, "2021", 1, 25), (5, 2, "2021", 6, 8),
(6, 2, "2021", 3, 15), (7, 2, "2021", 15, 0), (8, 2, "2021", 7, 6), (9, 2, "2021", 11, 0), (10, 2, "2021", 10, 1),
(11, 2, "2021", 4, 12), (12, 2, "2021", 5, 10), (13, 2, "2021", 8, 4), (14, 2, "2021", 13, 0), (15, 2, "2021", 9, 2),
(16, 2, "2021", 14, 0), (17, 2, "2021", 17, 0), (18, 2, "2021", 16, 0), (19, 2, "2021", NULL, 0), (20, 2, "2021", NULL, 0),

(1, 3, "2021", 1, 25), (2, 3, "2021", 3, 16), (3, 3, "2021", 4, 12), (4, 3, "2021", 2, 18), (5, 3, "2021", 9, 2),
(6, 3, "2021", 5, 10), (7, 3, "2021", 13, 0), (8, 3, "2021", 14, 0), (9, 3, "2021", 8, 4), (10, 3, "2021", 7, 6),
(11, 3, "2021", 6, 8), (12, 3, "2021", 11, 0), (13, 3, "2021", 10, 1), (14, 3, "2021", 15, 0), (15, 3, "2021", NULL, 0),
(16, 3, "2021", 12, 0), (17, 3, "2021", 19, 0), (18, 3, "2021", 17, 0), (19, 3, "2021", 18, 0), (20, 3, "2021", 16, 0);
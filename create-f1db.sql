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
    nationality INT,
    birthday DATE NOT NULL,
    CONSTRAINT driver_fk_nation
		FOREIGN KEY (nationality)
		REFERENCES nation (nation_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO driver (driver_name, driver_abbreviation, racing_number, nationality, birthday) VALUES 
("Lewis Hamilton", "HAM", 44, 34, "1985-01-07"), ("Valtteri Bottas", "BOT", 77, 10, "1989-08-28"),
("Sergio Perez", "PER", 11, 18, "1990-01-26"), ("Max Verstappen", "VER", 33, 21, "1997-09-30"),
("Daniel Ricciardo", "RIC", 3, 2, "1989-07-01"), ("Lando Norris", "NOR", 4, 34, "1999-11-13"),
("Sebastian Vettel", "VET", 5, 12, "1987-01-03"), ("Lance Stroll", "STR", 18, 8, "1998-10-29"),
("Fernando Alonso", "ALO", 14, 29, "1981-07-29"), ("Esteban Ocon", "OCO", 31, 11, "1996-09-17"),
("Charles Leclerc", "LEC", 16, 19, "1997-10-16"), ("Carlos Sainz Jr.", "SAI", 55, 29, "1994-09-01"),
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
		REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT employs_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id)
        ON UPDATE CASCADE ON DELETE CASCADE
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
        ON UPDATE CASCADE ON DELETE CASCADE
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
		REFERENCES company (company_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT sponsors_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE
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
		REFERENCES principal (principal_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT manages_fk_team
		FOREIGN KEY (team_id)
		REFERENCES team (team_id)
        ON UPDATE CASCADE ON DELETE CASCADE
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
        ON UPDATE CASCADE ON DELETE CASCADE
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
("Hungaroring", 306.630, 70, "Mogyoród", 13),
("Circuit National de Francorchamps", 308.052, 44, "Stavelot", 6),
("Circuit Park Zandvoort", 302.389, 71, "Zandvoort", 21),
("Autodromo Nazionale di Monza", 306.720, 53, "Monza", 15),
("Sochi Autodrom", 309.745, 53, "Sochi", 24),
("Marina Bay Street Circuit", 308.706, 61, "Singapore City", 26),
("Suzuka International Racing Course", 307.471, 53, "Suzuka", 16),
("Circuit of the Americas", 308.405, 56, "Austin", 35),
("Autodromo Hermanos Rodriguez", 305.354, 71, "Mexico City", 18),
("Autodromo Jose Carlos Pace", 305.879, 71, "São Paulo", 7),
("Albert Park Circuit", 307.574, 58, "Melbourne", 2),
("Jeddah Street Circuit", 308.750, 50, "Jeddah", 25),
("Yas Marina Circuit", 305.355, 55, "Abu Dhabi", 33),
("Istanbul Park Circuit", 309.396, 58, "Tuzla", 32),
("Losail International Circuit", 306.660, 57, "Lusail", 23);

DROP TABLE IF EXISTS grand_prix;
CREATE TABLE grand_prix (
	grand_prix_id INT PRIMARY KEY AUTO_INCREMENT,
    grand_prix_name VARCHAR(64) NOT NULL,
    race_date DATE NOT NULL,
    circuit_id INT NOT NULL,
    CONSTRAINT grand_prix_fk_circuit
		FOREIGN KEY (circuit_id)
		REFERENCES circuit (circuit_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO grand_prix (grand_prix_name, race_date, circuit_id) VALUES
("Gulf Air Bahrain Grand Prix", "2021-03-28", 1),
("Pirelli Gran Premio del Made in Italy e dell'Emilia-Romagna", "2021-04-18", 2),
("Heineken Grande Premio de Portugal", "2021-05-02", 3),
("Gran Premio de España Emirates", "2021-05-09", 4),
("Grand Prix de Monaco", "2021-05-23", 5),
("Azerbaijan Grand Prix", "2021-06-06", 6),
("Pirelli Grand Prix de France", "2021-06-27", 8),
("Styrian Grand Prix", "2021-06-27", 9),
("Eyetime Großer Preis von Österreich", "2021-07-04", 9),
("Rolex British Grand Prix", "2021-07-18", 10),
("Magyar Nagydij", "2021-08-01", 11),
("Belgian Grand Prix", "2021-08-29", 12),
("Dutch Grand Prix", "2021-09-05", 13),
("Gran Premio Heineken d'Italia", "2021-09-12", 14),
("VTB Russian Grand Prix", "2021-09-26", 15),
("Türkiye Grand Prix", "2021-10-10", 23),
("United States Grand Prix", "2021-10-24", 18),
("Gran Premio de Mexico", "2021-10-31", 19),
("Grande Premio do Sao Paulo", "2021-11-07", 20),
("Qatar Grand Prix", "2021-11-21", 25),
("Saudi Arabia", "2021-12-05", 22),
("Etihad Airways Abu Dhabi Grand Prix", "2021-12-12", 23);
    
DROP TABLE IF EXISTS drives;
CREATE TABLE drives (
	driver_id INT,
    grand_prix_id INT,
    position INT,
    points DOUBLE NOT NULL,
    CONSTRAINT drives_pk
		PRIMARY KEY (driver_id, grand_prix_id),
	CONSTRAINT drives_fk_driver
		FOREIGN KEY (driver_id)
		REFERENCES driver (driver_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT drives_fk_grand_prix
		FOREIGN KEY (grand_prix_id)
		REFERENCES grand_prix (grand_prix_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO drives VALUES
-- Race 1
(1, 1, 1, 25), (2, 1, 3, 16), (3, 1, 5, 10), (4, 1, 2, 18), (5, 1, 7, 6),
(6, 1, 4, 12), (7, 1, 15, 0), (8, 1, 10, 1), (9, 1, NULL, 0), (10, 1, 13, 0),
(11, 1, 6, 8), (12, 1, 8, 4), (13, 1, 17, 0), (14, 1, 9, 2), (15, 1, 11, 0),
(16, 1, 12, 0), (17, 1, NULL, 0), (18, 1, 16, 0), (19, 1, 18, 0), (20, 1, 14, 0),
-- Race 2
(1, 2, 2, 19), (2, 2, NULL, 0), (3, 2, 11, 0), (4, 2, 1, 25), (5, 2, 6, 8),
(6, 2, 3, 15), (7, 2, 15, 0), (8, 2, 8, 4), (9, 2, 10, 1), (10, 2, 9, 2),
(11, 2, 4, 12), (12, 2, 5, 10), (13, 2, 7, 6), (14, 2, 12, 0), (15, 2, 13, 0),
(16, 2, 14, 0), (17, 2, 17, 0), (18, 2, 16, 0), (19, 2, NULL, 0), (20, 2, NULL, 0),
-- Race 3
(1, 3, 1, 25), (2, 3, 3, 16), (3, 3, 4, 12), (4, 3, 2, 18), (5, 3, 9, 2),
(6, 3, 5, 10), (7, 3, 13, 0), (8, 3, 14, 0), (9, 3, 8, 4), (10, 3, 7, 6),
(11, 3, 6, 8), (12, 3, 11, 0), (13, 3, 10, 1), (14, 3, 15, 0), (15, 3, NULL, 0),
(16, 3, 12, 0), (17, 3, 19, 0), (18, 3, 17, 0), (19, 3, 18, 0), (20, 3, 16, 0),
-- Race 4
(1, 4, 1, 25), (2, 4, 3, 15), (3, 4, 5, 10), (4, 4, 2, 19), (5, 4, 6, 8),
(6, 4, 8, 4), (7, 4, 13, 0), (8, 4, 11, 0), (9, 4, 17, 0), (10, 4, 9, 2),
(11, 4, 4, 12), (12, 4, 7, 6), (13, 4, 10, 1), (14, 4, NULL, 0), (15, 4, 12, 0),
(16, 4, 15, 0), (17, 4, 19, 0), (18, 4, 18, 0), (19, 4, 16, 0), (20, 4, 14, 0),
-- Race 5
(1, 5, 7, 7), (2, 5, NULL, 0), (3, 5, 4, 12), (4, 5, 1, 25), (5, 5, 12, 0),
(6, 5, 3, 15), (7, 5, 5, 10), (8, 5, 8, 4), (9, 5, 13, 0), (10, 5, 9, 2),
(11, 5, NULL, 0), (12, 5, 2, 18), (13, 5, 6, 8), (14, 5, 16, 0), (15, 5, 11, 0),
(16, 5, 10, 1), (17, 5, 17, 0), (18, 5, 18, 0), (19, 5, 15, 0), (20, 5, 14, 0),
-- Race 6
(1, 6, 15, 0), (2, 6, 12, 0), (3, 6, 1, 25), (4, 6, 18, 0), (5, 6, 9, 2),
(6, 6, 5, 10), (7, 6, 2, 18), (8, 6, NULL, 0), (9, 6, 6, 8), (10, 6, NULL, 0),
(11, 6, 4, 12), (12, 6, 8, 4), (13, 6, 3, 15), (14, 6, 7, 6), (15, 6, 10, 1),
(16, 6, 11, 0), (17, 6, 14, 0), (18, 6, 13, 0), (19, 6, 16, 0), (20, 6, 17, 0),
-- Race 7
(1, 7, 2, 18), (2, 7, 4, 12), (3, 7, 3, 15), (4, 7, 1, 26), (5, 7, 6, 8),
(6, 7, 5, 10), (7, 7, 9, 2), (8, 7, 10, 1), (9, 7, 8, 4), (10, 7, 14, 0),
(11, 7, 16, 0), (12, 7, 11, 0), (13, 7, 7, 6), (14, 7, 13, 0), (15, 7, 17, 0),
(16, 7, 15, 0), (17, 7, 20, 0), (18, 7, 19, 0), (19, 7, 18, 0), (20, 7, 12, 0),
-- Race 8
(1, 8, 2, 19), (2, 8, 3, 15), (3, 8, 4, 12), (4, 8, 1, 25), (5, 8, 13, 0),
(6, 8, 5, 10), (7, 8, 12, 0), (8, 8, 8, 4), (9, 8, 9, 2), (10, 8, 14, 0),
(11, 8, 7, 6), (12, 8, 6, 8), (13, 8, NULL, 0), (14, 8, 10, 1), (15, 8, 11, 0),
(16, 8, 15, 0), (17, 8, 18, 0), (18, 8, 16, 0), (19, 8, 17, 0), (20, 8, NULL, 0),
-- Race 9
(1, 9, 4, 12), (2, 9, 2, 18), (3, 9, 6, 8), (4, 9, 1, 26), (5, 9, 7, 6),
(6, 9, 3, 15), (7, 9, NULL, 0), (8, 9, 13, 0), (9, 9, 10, 1), (10, 9, NULL, 0),
(11, 9, 8, 4), (12, 9, 5, 10), (13, 9, 9, 2), (14, 9, 12, 0), (15, 9, 15, 0),
(16, 9, 14, 0), (17, 9, NULL, 0), (18, 9, NULL, 0), (19, 9, 16, 0), (20, 9, 11, 0),
-- Race 10
(1, 10, 1, 27), (2, 10, 3, 16), (3, 10, 16, 0), (4, 10, NULL, 3), (5, 10, 5, 10),
(6, 10, 4, 12), (7, 10, NULL, 0), (8, 10, 8, 4), (9, 10, 7, 6), (10, 10, 9, 2),
(11, 10, 2, 18), (12, 10, 6, 8), (13, 10, 11, 0), (14, 10, 10, 1), (15, 10, 15, 0),
(16, 10, 13, 0), (17, 10, 17, 0), (18, 10, 18, 0), (19, 10, 14, 0), (20, 10, 12, 0),
-- Race 11
(1, 11, 2, 18), (2, 11, NULL, 0), (3, 11, NULL, 0), (4, 11, 9, 2), (5, 11, 11, 0),
(6, 11, 15, 0), (7, 11, NULL, 0), (8, 11, NULL, 0), (9, 11, 4, 12), (10, 11, 1, 25),
(11, 11, NULL, 0), (12, 11, 3, 15), (13, 11, 5, 11), (14, 11, 6, 8), (15, 11, 10, 1),
(16, 11, 13, 0), (17, 11, NULL, 0), (18, 11, 12, 0), (19, 11, 7, 6), (20, 11, 8, 4),
-- Race 12
(1, 12, 3, 7.5), (2, 12, 12, 0), (3, 12, 19, 0), (4, 12, 1, 12.5), (5, 12, 4, 6),
(6, 12, 14, 0), (7, 12, 5, 5), (8, 12, 20, 0), (9, 12, 11, 0), (10, 12, 7, 3),
(11, 12, 8, 2), (12, 12, 10, .5), (13, 12, 6, 4), (14, 12, 15, 0), (15, 12, 18, 0),
(16, 12, 13, 0), (17, 12, 17, 0), (18, 12, 16, 0), (19, 12, 9, 1), (20, 12, 2, 9),
-- Race 13
(1, 13, 2, 19), (2, 13, 3, 15), (3, 13, 8, 4), (4, 13, 1, 25), (5, 13, 11, 0),
(6, 13, 10, 1), (7, 13, 13, 0), (8, 13, 12, 0), (9, 13, 6, 8), (10, 13, 9, 2),
(11, 13, 5, 10), (12, 13, 7, 6), (13, 13, 4, 12), (14, 13, NULL, 0),
(16, 13, 14, 0), (17, 13, NULL, 0), (18, 13, NULL, 0), (19, 13, 16, 0), (20, 13, NULL, 0),
-- Race 14
(1, 14, NULL, 0), (2, 14, 3, 18), (3, 14, 5, 10), (4, 14, NULL, 2), (5, 14, 1, 27),
(6, 14, 2, 18), (7, 14, 12, 0), (8, 14, 7, 6), (9, 14, 8, 4), (10, 14, 10, 1),
(11, 14, 4, 12), (12, 14, 6, 8), (13, 14, NULL, 0), (14, 14, NULL, 0),
(16, 14, 13, 0), (17, 14, NULL, 0), (18, 14, 15, 0), (19, 14, 11, 0), (20, 14, 9, 2),
-- Race 15
(1, 15, 1, 25), (2, 15, 5, 10), (3, 15, 9, 2), (4, 15, 2, 18), (5, 15, 4, 12),
(6, 15, 7, 7), (7, 15, 12, 0), (8, 15, 11, 0), (9, 15, 6, 8), (10, 15, 14, 0),
(11, 15, 15, 0), (12, 15, 3, 15), (13, 15, 13, 0), (14, 15, 17, 0), (15, 15, 8, 4),
(16, 15, 16, 0), (17, 15, 18, 0), (18, 15, NULL, 0), (19, 15, NULL, 0), (20, 15, 10, 1),
-- TODO: Grand Prix 16-22 for 2021
-- Race 16
(1, 16, 5, 10), (2, 16, 1, 26), (3, 16, 3, 15), (4, 16, 2, 18), (5, 16, 13, 0),
(6, 16, 7, 6), (7, 16, 18, 0), (8, 16, 9, 2), (9, 16, 16, 0), (10, 16, 10, 1),
(11, 16, 4, 12), (12, 16, 8, 4), (13, 16, 6, 8), (14, 16, 14, 0), (15, 16, 12, 0),
(16, 16, 11, 0), (17, 16, 20, 0), (18, 16, 19, 0), (19, 16, 17, 0), (20, 16, 15, 0),
-- Race 17
(1, 17, 2, 19), (2, 17, 6, 8), (3, 17, 3, 15), (4, 17, 1, 25), (5, 17, 5, 10),
(6, 17, 8, 4), (7, 17, 10, 1), (8, 17, 12, 0), (9, 17, NULL, 0), (10, 17, NULL, 0),
(11, 17, 4, 12), (12, 17, 7, 6), (13, 17, NULL, 0), (14, 17, 9, 2), (15, 17, 13, 0),
(16, 17, 11, 0), (17, 17, 17, 0), (18, 17, 16, 0), (19, 17, 15, 0), (20, 17, 14, 0),
-- Race 18
(1, 18, 2, 18), (2, 18, 15, 0), (3, 18, 3, 15), (4, 18, 1, 25), (5, 18, 12, 0),
(6, 18, 10, 1), (7, 18, 7, 6), (8, 18, 14, 0), (9, 18, 9, 2), (10, 18, 13, 0),
(11, 18, 5, 10), (12, 18, 6, 8), (13, 18, 4, 12), (14, 18, NULL, 0), (15, 18, 8, 4),
(16, 18, 11, 0), (17, 18, 18, 0), (18, 18, NULL, 0), (19, 18, 17, 0), (20, 18, 16, 0),
-- Race 19
(1, 19, 1, 25), (2, 19, 3, 18), (3, 19, 4, 13), (4, 19, 2, 20), (5, 19, NULL, 0),
(6, 19, 10, 1), (7, 19, 11, 0), (8, 19, NULL, 0), (9, 19, 9, 2), (10, 19, 8, 4),
(11, 19, 5, 10), (12, 19, 6, 9), (13, 19, 7, 6), (14, 19, 15, 0), (15, 19, 12, 0),
(16, 19, 14, 0), (17, 19, 17, 0), (18, 19, 18, 0), (19, 19, 16, 0), (20, 19, 13, 0),
-- Race 20
(1, 20, 1, 25), (2, 20, NULL, 0), (3, 20, 4, 12), (4, 20, 2, 19), (5, 20, 12, 0),
(6, 20, 9, 2), (7, 20, 10, 1), (8, 20, 6, 8), (9, 20, 3, 15), (10, 20, 5, 10),
(11, 20, 8, 4), (12, 20, 7, 6), (13, 20, 11, 0), (14, 20, 13, 0), (15, 20, 14, 0),
(16, 20, 15, 0), (17, 20, 18, 0), (18, 20, 16, 0), (19, 20, NULL, 0), (20, 20, 17, 0),
-- Race 21
(1, 21, 1, 26), (2, 21, 3, 15), (3, 21, NULL, 0), (4, 21, 2, 18), (5, 21, 5, 10),
(6, 21, 10, 1), (7, 21, NULL, 0), (8, 21, 11, 0), (9, 21, 13, 0), (10, 21, 4, 12),
(11, 21, 7, 6), (12, 21, 8, 4), (13, 21, 6, 8), (14, 21, 14, 0), (15, 21, 15, 0),
(16, 21, 9, 2), (17, 21, NULL, 0), (18, 21, NULL, 0), (19, 21, 12, 0), (20, 21, NULL, 0),
-- Race 22
(1, 22, 2, 18), (2, 22, 6, 8), (3, 22, NULL, 0), (4, 22, 1, 26), (5, 22, 12, 0),
(6, 22, 7, 6), (7, 22, 11, 0), (8, 22, 13, 0), (9, 22, 8, 4), (10, 22, 9, 2),
(11, 22, 10, 1), (12, 22, 3, 15), (13, 22, 5, 10), (14, 22, 4, 12), (15, 22, NULL, 0),
(16, 22, NULL, 0), (18, 22, 14, 0), (19, 22, NULL, 0), (20, 22, NULL, 0);

DROP PROCEDURE IF EXISTS driver_standings;
DELIMITER $$
CREATE PROCEDURE driver_standings(season YEAR)
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY points DESC) AS position, driver_name, team_name, points 
		FROM (SELECT driver_id, SUM(points) AS points FROM drives JOIN grand_prix USING (grand_prix_id) WHERE YEAR(race_date) = season GROUP BY driver_id ORDER BY points DESC) AS total_points
        JOIN (SELECT * FROM employs JOIN driver USING (driver_id) JOIN team USING (team_id)) AS driver_team USING (driver_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS team_standings;
DELIMITER $$
CREATE PROCEDURE team_standings(season YEAR)
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY SUM(points) DESC) AS position, team_name, SUM(points) AS points
		FROM (SELECT * FROM employs JOIN driver USING (driver_id) JOIN team USING (team_id)) AS driver_team
        JOIN (SELECT * FROM drives JOIN grand_prix USING (grand_prix_id) WHERE YEAR(race_date) = season) AS races USING (driver_id) GROUP BY team_id ORDER BY SUM(points) DESC;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS count_wins;
DELIMITER $$
CREATE FUNCTION count_wins(chosen_driver_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE count INT;
	SELECT COUNT(*) INTO count FROM drives WHERE position = 1 AND driver_id = chosen_driver_id;
    RETURN count;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS count_podiums;
DELIMITER $$
CREATE FUNCTION count_podiums(chosen_driver_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE count INT;
	SELECT COUNT(*) INTO count FROM drives WHERE position <= 3 AND driver_id = chosen_driver_id;
    RETURN count;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS driver_profiles;
DELIMITER $$
CREATE PROCEDURE driver_profiles()
BEGIN
	SELECT racing_number, driver_name, YEAR(NOW()) - YEAR(birthday) AS age, nation_name AS nationality, points, count_wins(driver_id) AS wins, count_podiums(driver_id) AS podiums
    FROM (SELECT driver_id, SUM(points) AS points FROM drives JOIN grand_prix USING (grand_prix_id) GROUP BY driver_id) AS total_points
    JOIN driver USING (driver_id) JOIN nation ON nationality = nation_id ORDER BY racing_number;
END $$
DELIMITER ;
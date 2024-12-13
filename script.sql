DROP TABLE IF EXISTS shop_can CASCADE;
DROP TABLE IF EXISTS student_can_shop CASCADE;
DROP TABLE IF EXISTS shop CASCADE;
DROP TABLE IF EXISTS can CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS address CASCADE;

CREATE TABLE can (
	id          SERIAL,
	name        VARCHAR(64)  NOT NULL,
	capacity_cl INT          NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE address (
	id          SERIAL,
	number      INTEGER       NOT NULL,
	street      VARCHAR(64)   NOT NULL,
	city        VARCHAR(64)   NOT NULL,
	zip_code    VARCHAR(5)    NOT NULL,
	country     VARCHAR(64)   NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE student (
	login       VARCHAR(8),
	firstname   VARCHAR(64),
	lastname    VARCHAR(64),
	male        BOOLEAN      NOT NULL,
	address_id  INTEGER,
	PRIMARY KEY (login),
	FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE shop (
	id          SERIAL,
	name        VARCHAR(64) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE TABLE shop_can (
	shop_id         SERIAL,
	can_id          SERIAL,
	price           REAL    NOT NULL,
	PRIMARY KEY (shop_id, can_id),
	FOREIGN KEY (shop_id) REFERENCES shop(id),
	FOREIGN KEY (can_id) REFERENCES can(id)
);


CREATE TABLE student_can_shop (
	id              SERIAL,
	login           VARCHAR(8),
	can_id          SERIAL,
	shop_id         SERIAL,
	purchase_time   TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (login) REFERENCES student(login),
	FOREIGN KEY (can_id) REFERENCES can(id),
	FOREIGN KEY (shop_id) REFERENCES shop(id)
);


------------------------------------------------------------------------------
------------------------------- INSERTIONS -----------------------------------
------------------------------------------------------------------------------

-- Cans
INSERT INTO can VALUES (DEFAULT, 'Coke', 25),			-- 1
	(DEFAULT, 'Oasis', 25),			-- 2
	(DEFAULT, 'Diet Coke', 25),		-- 3
	(DEFAULT, 'Orangina', 25),		-- 4
	(DEFAULT, 'Sprite', 25),			-- 5
	(DEFAULT, 'Pepsi', 25),			-- 6
	(DEFAULT, 'Ice Tea', 25),		-- 7
	(DEFAULT, 'Water', 50),			-- 8
	(DEFAULT, 'Fanta', 25),			-- 9
	(DEFAULT, 'Orange Juice', 33);	-- 10


-- Addresses
INSERT INTO address VALUES (DEFAULT, 12, 'rue de la Paix', 'Paris', '75002', 'FRANCE'),			-- 1
	(DEFAULT, 1, 'rue de la Paix', 'Paris', '75002', 'FRANCE'),				-- 2
	(DEFAULT, 115, 'Bld de Belleville', 'paris', '75011', 'France'),		-- 3
	(DEFAULT, 103, 'Bld de Belleville', 'paris', '75011', 'France'),		-- 4
	(DEFAULT, 3, 'Bld de la Villette', 'Paris', '75011', 'France'),			-- 5
	(DEFAULT, 4, 'Bld de la Villette', 'Paris', '75011', 'France'),			-- 6
	(DEFAULT, 5, 'Avenue de Neuilly', 'Paris', '75017', 'france'),			-- 7
	(DEFAULT, 18, 'Place Pigalle', 'PARIS', '75009', 'france'),				-- 8
	(DEFAULT, 1, 'Alexanderstrasse', 'Berlin', '10178', 'Deutschland'),		-- 9
	(DEFAULT, 3, 'Eagle Road', 'Greenhithe', 'DA99Q', 'United Kingdom'),	--10
	(DEFAULT, 15, 'Place de la Bourse', 'PARIS', '75002', 'france'),		--11
	(DEFAULT, 5, 'Avenue Matignon', 'PARIS', '75008', 'France'),			--12
	(DEFAULT, 48, 'Avenue Foch', 'Paris', '75116', 'France'),				--13
	(DEFAULT, 50, 'Boulevard Malesherbes', 'Paris', '75008', 'France'),		--14
	(DEFAULT, 3, 'Boulevard Malesherbes', 'Paris', '75008', 'France');		--15

-- Students
INSERT INTO student VALUES ('barray_n', 'Nicolas', 'Barray', TRUE, 1),
	('bekhta_w', 'Walid', 'Bekhtaoui', TRUE, 2),
	('billon_r', 'Rémi', 'Billon', TRUE, 3),
	('bitar_a', 'Alex', 'Bitar', TRUE, 4),
	('brauge_c', 'Corentin', 'Brauge', TRUE, 5),
	('coelho_q', 'Quentin', 'Coelho', TRUE, 6),
	('d-avra_a', 'Arthur', 'D''Avray', TRUE,7),
	('dagues_p', 'Pierre-Louis', 'Dagues', TRUE, 8),
	('donnet_j', 'Jean-Baptiste', 'Donnette', TRUE, 9),
	('gailla_d', 'Arnaud', 'Gaillard', TRUE, 10),
	('gozlan_r', 'Rafael', 'Gozlan', TRUE, 11),
	('groux_l', 'Louis', 'Groux', TRUE, 12),
	('guiho_a', 'Alexis', 'Guiho', TRUE, 13),
	('l-hour_q', 'Quentin', 'L''Hours', TRUE, 14),
	('layet_n', 'Nils', 'Layet', TRUE, 15),
	('lubran_l', 'Luc-Junior', 'Lubrano-Lavadera', TRUE, 1),
	('maurer_h', 'Hugo', 'Maurer', TRUE, 2),
	('ou_a', 'Arnaud', 'Ou', TRUE, 3),
	('piat_s', 'Sébastien', 'Piat', TRUE, 4),
	('situm_t', 'Tania', 'Situm', FALSE, 5),
	('taing_a', 'Anais', 'Taing', FALSE, 6),
	('teixei_f', 'Brian', 'Teixeira', TRUE, 2),
	('thepau_g', 'Guillaume', 'Thepaut', TRUE, 8),
	('toubia_a', 'Adrien', 'Toubiana', TRUE, 9),
	('tresar_c', 'Côme', 'Tresarrieu', TRUE, 10),
	('veyry_p', 'Pierre-Alexandre', 'Veyry', TRUE, 11),
	('visoiu_f', 'Francis', 'Visoiu', TRUE, 12),
	('login_x', NULL, NULL, TRUE, NULL);

-- Shops
INSERT INTO shop VALUES (DEFAULT, 'Lab Yaka'),	-- 1
	(DEFAULT, 'Crocus'),	-- 2
	(DEFAULT, 'Dispenser');	-- 3

INSERT INTO shop_can VALUES (1, 1, 0.70),
	(1, 2, 0.70),
	(1, 4, 0.70),
	(1, 5, 0.70),
	(1, 7, 0.70),
	(1, 8, 0.40),

	(2, 1, 1.20),
	(2, 2, 1.20),
	(2, 3, 1.20),
	(2, 4, 1.20),
	(2, 5, 1.20),
	(2, 6, 1.20),
	(2, 7, 1.20),
	(2, 8, 1.20),
	(2, 9, 1.20),
	(2, 10, 1.20),

	(3, 1, 1.00),
	(3, 2, 1.00),
	(3, 3, 1.00),
	(3, 4, 1.00),
	(3, 5, 1.00),
	(3, 6, 1.00),
	(3, 7, 1.00),
	(3, 8, 1.00),
	(3, 9, 1.00),
	(3, 10, 1.00);

INSERT INTO student_can_shop VALUES (DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-15 10:04:00'),
	(DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-16 11:18:00'),
	(DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-16 20:07:00'),
	(DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-17 11:30:00'),
	(DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-20 14:00:00'),
	(DEFAULT, 'brauge_c', 2, 1, TIMESTAMP '2016-01-20 15:03:00'),
	(DEFAULT, 'brauge_c', 1, 1, TIMESTAMP '2016-01-21 23:02:00'),
	(DEFAULT, 'brauge_c', 1, 1, TIMESTAMP '2016-01-22 11:46:00'),
	(DEFAULT, 'brauge_c', 1, 1, TIMESTAMP '2016-01-26 13:53:00'),
	(DEFAULT, 'brauge_c', 7, 1, TIMESTAMP '2016-01-28 12:04:00'),
	(DEFAULT, 'brauge_c', 7, 2, TIMESTAMP '2016-01-29 16:15:00'),
	(DEFAULT, 'brauge_c', 7, 3, TIMESTAMP '2016-02-01 16:20:00'),
	(DEFAULT, 'brauge_c', 8, 1, TIMESTAMP '2016-02-02 17:40:00'),
	(DEFAULT, 'brauge_c', 8, 1, TIMESTAMP '2016-02-03 18:32:00'),

	(DEFAULT, 'piat_s', 7, 1, TIMESTAMP '2016-01-28 17:03:00'),
	(DEFAULT, 'piat_s', 7, 1, TIMESTAMP '2016-02-01 17:30:00'),
	(DEFAULT, 'piat_s', 7, 1, TIMESTAMP '2016-02-05 18:15:00'),
	(DEFAULT, 'piat_s', 7, 1, TIMESTAMP '2016-02-08 12:45:00'),

	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-10 17:03:00'),
	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-11 18:14:00'),
	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-12 19:39:00'),
	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-15 10:20:00'),
	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-23 11:19:00'),
	(DEFAULT, 'gozlan_r', 9, 1, TIMESTAMP '2016-01-25 12:29:00'),
	(DEFAULT, 'gozlan_r', 7, 1, TIMESTAMP '2016-02-01 00:38:00'),
	(DEFAULT, 'gozlan_r', 7, 1, TIMESTAMP '2016-02-08 23:46:00'),

	(DEFAULT, 'ou_a', 1, 1, TIMESTAMP '2016-01-28 09:20:00'),
	(DEFAULT, 'ou_a', 1, 1, TIMESTAMP '2016-01-29 14:56:00'),
	(DEFAULT, 'ou_a', 1, 3, TIMESTAMP '2016-01-30 21:48:00'),

	(DEFAULT, 'thepau_g', 7, 1, TIMESTAMP '2016-02-02 16:46:00'),
	(DEFAULT, 'thepau_g', 7, 1, TIMESTAMP '2016-02-01 13:24:00'),

	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-01-21 16:23:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-01-23 17:42:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-02-02 00:37:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-02-03 19:11:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-02-05 04:13:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-02-07 17:09:00'),
	(DEFAULT, 'guiho_a', 10, 2, TIMESTAMP '2016-02-08 19:24:00'),

	(DEFAULT, 'visoiu_f', 8, 1, TIMESTAMP '2016-02-09 12:13:00'),
	(DEFAULT, 'visoiu_f', 8, 1, TIMESTAMP '2016-02-13 12:24:00'),
	(DEFAULT, 'visoiu_f', 3, 1, TIMESTAMP '2016-03-01 12:24:00');

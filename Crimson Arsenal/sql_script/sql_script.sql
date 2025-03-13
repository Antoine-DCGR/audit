-- Script réalisé principalement par Djibryl Guillauby et Kavusikan Thurairajasingam avec la collaboration de Fulya Rizaoglu pour les anecdotes et Hani Houmimid pour le son des armes et Sofiane SALMI pour la relecture.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE if EXISTS Admin CASCADE;
DROP TABLE if EXISTS Weapon CASCADE;
DROP TABLE if EXISTS Type CASCADE;
DROP TABLE if EXISTS Game CASCADE;
DROP TABLE if EXISTS Category CASCADE;
DROP Table if EXISTS Keyword CASCADE;



CREATE TABLE Game (
    idGame SERIAL PRIMARY KEY,
    gameName VARCHAR(255) NOT NULL
);

CREATE TABLE Admin (
    idUser INT PRIMARY KEY,
    passwordUser VARCHAR(255) NOT NULL

);

CREATE TABLE Category (
	idCategory SERIAL PRIMARY KEY,
	categoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Type (
    idType SERIAL PRIMARY KEY,
    typeName VARCHAR(50) NOT NULL,
	idCategory INT REFERENCES Category(idCategory)
);

CREATE TABLE Weapon (
    idWeapon SERIAL PRIMARY KEY,
    range_w INT,
    imagePath VARCHAR(255),
    Weaponname VARCHAR(50) NOT NULL,
    damage INT NOT NULL,
    mobility INT NOT NULL,
    fire_rate INT NOT NULL,
    control INT NOT NULL,
    accuracy INT NOT NULL,
    sound VARCHAR(255),
    description TEXT,
    anecdote TEXT,
    idGame INT REFERENCES Game(idGame),
    idType INT REFERENCES type(idType)
);

CREATE TABLE Keyword (
    idKeyword SERIAL PRIMARY KEY,
    keywordName VARCHAR(255) NOT NULL,
    idWeapon INT REFERENCES Weapon(idWeapon)
);

CREATE INDEX idx_keyword_name ON Keyword (keywordName);
CREATE INDEX idx_keyword_weapon ON Keyword (idWeapon);

INSERT INTO admin
VALUES 
(1111, ENCODE(digest('crimson', 'sha1'), 'hex'));

INSERT INTO Game (gameName) 
VALUES 
('Call Of Duty Black Ops 1'),
('Call Of Duty Black Ops 2'),
('Call Of Duty Black Ops 3'),
('Call Of Duty Black Ops 4'),
('Call Of Duty Black Ops 5'),
('Call Of Duty Black Ops 6'),
('Valorant');

INSERT INTO Category (CategoryName)
VALUES
('Fusil_d''assault'),
('Mitraillette'),
('Fusil_à_pompe'),
('Mitrailleuse'),
('Fusil_tactique'),
('Fusil_de_precision'),
('Pistolets'),
('Lanceurs'),
('Armes_de_melee'),
('Equipement_mortel'),
('Equipement_tactique'),
('Arme_speciale');

INSERT INTO Type (typeName,idCategory)
VALUES 
('Arme Principale',1),
('Arme Principale',2),
('Arme Principale',3),
('Arme Principale',4),
('Arme Principale',5),
('Arme Principale',6),
('Arme Secondaire',7),
('Arme Secondaire',8),
('Arme Secondaire',9),
('Arme Secondaire',10),
('Arme Secondaire',11),
('Arme Secondaire',12);


INSERT INTO Weapon (range_w, imagePath, Weaponname, damage, mobility, fire_rate, control, accuracy, sound, description, anecdote, idGame, idType)
VALUES

-- Ajout des armes de Call of Duty: Black Ops 1

-- Fusils d'assaut

(50, 'Contenu\img\weapon\BO1\Fusil_d''assault\commando.png', 'Commando', 40, 75, 70, 65, 80, NULL, 'Fusil d''assaut polyvalent avec une bonne précision.', NULL, 1, 1),
(55, 'Contenu\img\weapon\BO1\Fusil_d''assault\galil.png', 'Galil', 45, 70, 65, 60, 75, NULL, 'Fusil puissant mais légèrement lourd.', NULL, 1, 1),
(60, 'Contenu\img\weapon\BO1\Fusil_d''assault\AUG.png', 'AUG', 42, 70, 75, 68, 78, NULL, 'Fusil avec une cadence de tir élevée.', NULL, 1, 1),
(65, 'Contenu\img\weapon\BO1\Fusil_d''assault\Famas.png', 'FAMAS', 35, 80, 90, 55, 85, NULL, 'Fusil d''assaut avec une cadence de tir très élevée.', NULL, 1, 1),
(70, 'Contenu\img\weapon\BO1\Fusil_d''assault\AK47.png', 'AK-47', 42, 75, 70, 68, 60, NULL, 'Fusil d''assaut classique et puissant, apprécié pour sa robustesse.', NULL, 1, 1),
(60, 'Contenu\img\weapon\BO1\Fusil_d''assault\M16.png', 'M16', 45, 70, 80, 80, 75, NULL, 'Fusil d''assaut en rafales, connu pour sa précision.', NULL, 1, 1),
(80, 'Contenu\img\weapon\BO1\Fusil_d''assault\G11.png', 'G11', 35, 74, 90, 75, 70, NULL, 'Fusil expérimental avec une cadence de tir rapide.', NULL, 1, 1),


-- Mitraillettes
(40, 'Contenu\img\weapon\BO1\Mitraillette\MP5K.png', 'MP5K', 35, 80, 85, 60, 70, NULL, 'Mitraillette rapide et mobile.', NULL, 1, 2),
(45, 'Contenu\img\weapon\BO1\Mitraillette\AK-74u.png', 'AK-74u', 38, 78, 80, 65, 75, NULL, 'Mitraillette puissante et stable.', NULL, 1, 2),
(42, 'Contenu\img\weapon\BO1\Mitraillette\PM63.png', 'PM63', 33, 82, 88, 58, 68, NULL, 'Légère mais efficace à courte portée.', NULL, 1, 2),
(40, 'Contenu\img\weapon\BO1\Mitraillette\MPL.png', 'MPL', 32, 85, 88, 60, 72, NULL, 'Mitraillette avec une grande maniabilité.', NULL, 1, 2),
(50, 'Contenu\img\weapon\BO1\Mitraillette\Uzi.png', 'Uzi', 25, 95, 95, 60, 40, NULL, 'Mitraillette compacte avec une cadence rapide.', NULL, 1, 2),
(55, 'Contenu\img\weapon\BO1\Mitraillette\Spectre.png', 'Spectre', 32, 88, 95, 66, 48, NULL, 'Mitraillette précise avec une excellente maniabilité.', NULL, 1, 2),
(45, 'Contenu\img\weapon\BO1\Mitraillette\Kiparis.png', 'Kiparis', 28, 93, 95, 63, 46, NULL, 'Mitraillette dotée d''une cadence élevée et d''un faible recul.', NULL, 1, 2),


-- Fusils à pompe
(30, 'Contenu\img\weapon\BO1\Fusil_à_pompe\SPAS-12.png', 'SPAS-12', 90, 60, 40, 70, 50, NULL, 'Fusil à pompe puissant à courte portée.', NULL, 1, 3),
(35, 'Contenu\img\weapon\BO1\Fusil_à_pompe\Olympia.png', 'Olympia', 95, 65, 35, 68, 48, NULL, 'Fusil à double canon avec une grande puissance.', NULL, 1, 3),
(40, 'Contenu\img\weapon\BO1\Fusil_à_pompe\Stakeout.png', 'Stakeout', 85, 60, 45, 72, 52, NULL, 'Fusil à pompe précis pour les combats rapprochés.', NULL, 1, 3),
(30, 'Contenu\img\weapon\BO1\Fusil_à_pompe\HS-10.png', 'HS10', 80, 68, 70, 58, 48, NULL, 'Fusil à pompe performant en combat rapproché.', NULL, 1, 3),


-- Mitrailleuses
(65, 'Contenu\img\weapon\BO1\Mitrailleuse\M60.png', 'M60', 50, 50, 55, 60, 70, NULL, 'Mitrailleuse lourde avec de gros dégâts.', NULL, 1, 4),
(60, 'Contenu\img\weapon\BO1\Mitrailleuse\HK21.png', 'HK21', 48, 55, 60, 65, 72, NULL, 'Mitrailleuse polyvalente et précise.', NULL, 1, 4),
(70, 'Contenu\img\weapon\BO1\Mitrailleuse\RPK.png', 'RPK', 52, 58, 58, 63, 74, NULL, 'Mitrailleuse légère avec une bonne précision.', NULL, 1, 4),

-- Fusils tactiques
(75, 'Contenu\img\weapon\BO1\Fusil_tactique\M14.png', 'M14', 48, 65, 55, 80, 82, NULL, 'Fusil tactique semi-automatique précis.', NULL, 1, 5),
(72, 'Contenu\img\weapon\BO1\Fusil_tactique\FNFAL.png', 'FN FAL', 50, 68, 58, 82, 84, NULL, 'Fusil tactique puissant et précis.', NULL, 1, 5),

-- Fusils de précision
(90, 'Contenu\img\weapon\BO1\Fusil_de_precision\l96a1.png', 'L96A1', 95, 50, 40, 70, 95, NULL, 'Fusil de précision avec une grande portée.', NULL, 1, 6),
(85, 'Contenu\img\weapon\BO1\Fusil_de_precision\Dragunov.png', 'Dragunov', 80, 55, 45, 68, 88, NULL, 'Fusil semi-automatique pour les longues distances.', NULL, 1, 6),
(88, 'Contenu\img\weapon\BO1\Fusil_de_precision\WA2000.png', 'WA2000', 85, 53, 48, 66, 90, NULL, 'Fusil semi-automatique compact.', NULL, 1, 6),

-- Pistolets
(25, 'Contenu\img\weapon\BO1\Pistolets\m1911.png', 'M1911', 35, 90, 75, 80, 65, NULL, 'Pistolet classique avec une bonne maniabilité.', NULL, 1, 7),
(30, 'Contenu\img\weapon\BO1\Pistolets\Python.png', 'Python', 50, 85, 60, 75, 70, NULL, 'Revolver puissant mais avec un recul élevé.', NULL, 1, 7),
(28, 'Contenu\img\weapon\BO1\Pistolets\cz-75.png', 'CZ75', 32, 88, 78, 82, 68, NULL, 'Pistolet semi-automatique polyvalent.', NULL, 1, 7),

-- Lanceurs
(70, 'Contenu\img\weapon\BO1\Lanceurs\RPG-7.png', 'RPG-7', 100, 40, 20, 50, 30, NULL, 'Lance-roquettes avec une grande puissance.', NULL, 1, 8),
(65, 'Contenu\img\weapon\BO1\Lanceurs\China_Lake.png', 'China Lake', 90, 45, 25, 55, 35, NULL, 'Lance-grenades avec un recul important.', NULL, 1, 8),

-- Armes de mêlée
(10, 'Contenu\img\weapon\BO1\Armes_de_melee\couteau-balistique.png', 'Couteau', 75, 100, 100, 95, 50, NULL, 'Couteau utilisé pour les attaques rapprochées.', NULL, 1, 9),

-- Équipement mortel
(20, 'Contenu\img\weapon\BO1\Equipement_mortel\Grenade.png', 'Grenade', 85, 95, 0, 50, 70, NULL, 'Grenade classique avec un large rayon dexplosion.', NULL, 1, 10),
(25, 'Contenu\img\weapon\BO1\Equipement_mortel\Semtex.png', 'Semtex', 90, 90, 0, 45, 65, NULL, 'Grenade collante qui explose après un court délai.', NULL, 1, 10),
(22, 'Contenu\img\weapon\BO1\Equipement_mortel\Claymore.png', 'Claymore', 80, 80, 0, 40, 68, NULL, 'Mine antipersonnelle activée par mouvement.', NULL, 1, 10),
(23, 'Contenu\img\weapon\BO1\Equipement_mortel\C4.png', 'C4', 95, 70, 0, 35, 60, NULL, 'Explosif télécommandé polyvalent.', NULL, 1, 10),

-- Équipement tactique
(10, 'Contenu\img\weapon\BO1\Equipement_tactique\Flashbang.png', 'Grenade assourdissante', 0, 90, 0, 30, 75, NULL, 'Éblouit temporairement les ennemis et désoriente.', NULL, 1, 11),
(12, 'Contenu\img\weapon\BO1\Equipement_tactique\grenade-paralysante.png', 'Grenade paralysante', 0, 85, 0, 35, 70, NULL, 'Ralentit et perturbe les ennemis.', NULL, 1, 11),
(8, 'Contenu\img\weapon\BO1\Equipement_tactique\Smoke_grenade.png', 'Grenade fumigène', 0, 88, 0, 25, 68, NULL, 'Crée un écran de fumée pour masquer les mouvements.', NULL, 1, 11),
(11, 'Contenu\img\weapon\BO1\Equipement_tactique\Nova_Gas.png', 'Gaz nova', 5, 80, 0, 20, 65, NULL, 'Diffuse un gaz toxique qui endommage les ennemis.', NULL, 1, 11),

-- Armes spéciales
(30, 'Contenu\img\weapon\BO1\Arme_speciale\Crossbow.png', 'Crossbow', 75, 60, 30, 65, 55, NULL, 'Arbalète avec des flèches explosives.', NULL, 1, 12),
(20, 'Contenu\img\weapon\BO1\Arme_speciale\Ballistic_Knife.png', 'Ballistic Knife', 50, 85, 90, 70, 60, NULL, 'Couteau balistique tirant des lames à distance.', NULL, 1, 12),

-- Ajout des armes de Call of Duty: Black Ops 2 

-- Fusils d'assaut
(60, 'Contenu\img\weapon\BO2\Fusil_d''assault\AN-94.png', 'AN-94', 45, 75, 60, 70, 85, NULL, 'Fusil d''assaut automatique avec de gros dégâts.', NULL, 2, 1),
(50, 'Contenu\img\weapon\BO2\Fusil_d''assault\Type_25.png', 'Type 25', 40, 70, 75, 65, 75, NULL, 'Fusil rapide mais avec un léger recul.', NULL, 2, 1),
(55, 'Contenu\img\weapon\BO2\Fusil_d''assault\SCAR-H.png', 'SCAR-H', 45, 70, 65, 60, 80, NULL, 'Puissant fusil avec un recul modéré.', NULL, 2, 1),
(50, 'Contenu\img\weapon\BO2\Fusil_d''assault\M8A1.png', 'M8A1', 40, 75, 80, 65, 85, NULL, 'Fusil d''assaut à rafale précis.', NULL, 2, 1),
(60, 'Contenu\img\weapon\BO2\Fusil_d''assault\FAL_OSW.png', 'FAL OSW', 55, 70, 50, 60, 80, NULL, 'Fusil semi-auto avec de très gros dégâts.', NULL, 2, 1),
(55, 'Contenu\img\weapon\BO2\Fusil_d''assault\SMR.png', 'SMR', 50, 70, 50, 60, 85, NULL, 'Fusil semi-auto avec une grande puissance.', NULL, 2, 1),

-- Mitraillettes
(40, 'Contenu\img\weapon\BO2\Mitraillette\MP7.png', 'MP7', 35, 90, 90, 70, 65, NULL, 'Mitraillette légère et rapide.', NULL, 2, 2),
(30, 'Contenu\img\weapon\BO2\Mitraillette\MSMC.png', 'MSMC', 40, 85, 85, 75, 70, NULL, 'Bon équilibre entre puissance et mobilité.', NULL, 2, 2),
(35, 'Contenu\img\weapon\BO2\Mitraillette\PDW-57.png', 'PDW-57', 35, 85, 80, 70, 60, NULL, 'Grand chargeur et dégâts modérés.', NULL, 2, 2),
(30, 'Contenu\img\weapon\BO2\Mitraillette\Vector_K10.png', 'Vector K10', 32, 90, 95, 75, 65, NULL, 'Mitraillette rapide et maniable.', NULL, 2, 2),
(30, 'Contenu\img\weapon\BO2\Mitraillette\Chicom_CQB.png', 'Chicom CQB', 35, 85, 90, 75, 70, NULL, 'Mitraillette à rafale rapide.', NULL, 2, 2),

-- Fusils à pompe
(25, 'Contenu\img\weapon\BO2\Fusil_à_pompe\R-870_MCS.png', 'Remington 870 MCS', 80, 70, 40, 50, 40, NULL, 'Fusil à pompe puissant au corps à corps.', NULL, 2, 3),
(20, 'Contenu\img\weapon\BO2\Fusil_à_pompe\S12.png', 'S12', 70, 65, 50, 55, 35, NULL, 'Fusil à pompe semi-automatique.', NULL, 2, 3),
(30, 'Contenu\img\weapon\BO2\Fusil_à_pompe\KSG.png', 'KSG', 85, 60, 30, 40, 60, NULL, 'Fusil à pompe précis à longue distance.', NULL, 2, 3),
(15, 'Contenu\img\weapon\BO2\Fusil_à_pompe\M1216.png', 'M1216', 75, 65, 55, 50, 45, NULL, 'Fusil à pompe automatique.', NULL, 2, 3),

-- Mitrailleuses légères
(70, 'Contenu\img\weapon\BO2\Mitrailleuse\LSAT.png', 'LSAT', 60, 50, 80, 60, 70, NULL, 'Mitrailleuse avec une bonne précision.', NULL, 2, 4),
(60, 'Contenu\img\weapon\BO2\Mitrailleuse\QBB_LSW.png', 'QBB LSW', 55, 50, 85, 55, 65, NULL, 'Mitrailleuse légère rapide.', NULL, 2, 4),
(75, 'Contenu\img\weapon\BO2\Mitrailleuse\Mk_48.png', 'MK 48', 65, 45, 75, 60, 75, NULL, 'Mitrailleuse lourde avec de gros dégâts.', NULL, 2, 4),
(65, 'Contenu\img\weapon\BO2\Mitrailleuse\HAMR.png', 'HAMR', 60, 55, 80, 65, 70, NULL, 'Mitrailleuse avec cadence variable.', NULL, 2, 4),

-- Fusils de précision
(100, 'Contenu\img\weapon\BO2\Fusil_de_precision\DSR_50.png', 'DSR-50', 95, 50, 30, 40, 90, NULL, 'Fusil de précision avec de gros dégâts.', NULL, 2, 6),
(95, 'Contenu\img\weapon\BO2\Fusil_de_precision\Ballista.png', 'Ballista', 90, 55, 35, 45, 85, NULL, 'Fusil de précision précis et rapide.', NULL, 2, 6),
(90, 'Contenu\img\weapon\BO2\Fusil_de_precision\XPR-50.png', 'XPR-50', 85, 50, 40, 45, 80, NULL, 'Fusil semi-auto avec une grande puissance.', NULL, 2, 6),
(80, 'Contenu\img\weapon\BO2\Fusil_de_precision\SVU-AS.png', 'SVU-AS', 75, 60, 50, 50, 85, NULL, 'Fusil semi-auto avec une cadence rapide.', NULL, 2, 6),

-- Pistolets
(20, 'Contenu\img\weapon\BO2\Pistolets\Five-seven.png', 'Five-Seven', 30, 95, 65, 85, 75, NULL, 'Pistolet léger et précis.', NULL, 2, 7),
(15, 'Contenu\img\weapon\BO2\Pistolets\Tac-45.png', 'Tac-45', 35, 90, 60, 80, 70, NULL, 'Pistolet semi-auto puissant.', NULL, 2, 7),
(10, 'Contenu\img\weapon\BO2\Pistolets\Executioner.png', 'Executioner', 50, 80, 40, 60, 50, NULL, 'Pistolet revolver à dégâts élevés.', NULL, 2, 7),
(25, 'Contenu\img\weapon\BO2\Pistolets\B23R.png', 'B23R', 35, 85, 85, 70, 65, NULL, 'Pistolet rafale rapide et maniable.', NULL, 2, 7),

-- Lanceurs
(10, 'Contenu\img\weapon\BO2\Lanceurs\RPG.png', 'RPG', 95, 40, 25, 30, 30, NULL, 'Lance-roquettes avec de gros dégâts.', NULL, 2, 8),
(10, 'Contenu\img\weapon\BO2\Lanceurs\FHJ-18_AA.png', 'FHJ-18 AA', 90, 35, 20, 40, 25, NULL, 'Lanceur anti-aérien efficace.', NULL, 2, 8),
(15, 'Contenu\img\weapon\BO2\Lanceurs\SMAW.png', 'SMAW', 90, 35, 25, 35, 30, NULL, 'Lance-roquettes polyvalent.', NULL, 2, 8),

-- Armes de mêlée
(10, 'Contenu\img\weapon\BO2\Armes_de_melee\COUTEAU.png', 'Couteau', 75, 100, 100, 95, 50, NULL, 'Couteau conçu pour des éliminations rapides en combat rapproché.', NULL, 2, 9),

-- Équipement mortel
(20, 'Contenu\img\weapon\BO2\Equipement_mortel\GRENADE.png', 'Grenade', 85, 95, 0, 50, 70, NULL, 'Grenade classique avec un large rayon d''explosion.', NULL, 2, 10),
(25, 'Contenu\img\weapon\BO2\Equipement_mortel\SEMTEX.png', 'Semtex', 90, 90, 0, 45, 65, NULL, 'Grenade collante qui explose après un court délai.', NULL, 2, 10),
(22, 'Contenu\img\weapon\BO2\Equipement_mortel\Claymore.png', 'Claymore', 80, 80, 0, 40, 68, NULL, 'Mine antipersonnelle activée par mouvement.', NULL, 2, 10),
(23, 'Contenu\img\weapon\BO2\Equipement_mortel\C4.png', 'C4', 95, 70, 0, 35, 60, NULL, 'Explosif télécommandé polyvalent.', NULL, 2, 10),
(15, 'Contenu\img\weapon\BO2\Equipement_mortel\HACHE_DE_COMBAT.png', 'Hache de combat', 70, 100, 0, 60, 50, NULL, 'Hachette jetable pour des éliminations instantanées.', NULL, 2, 10),

-- Équipement tactique
(10, 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_FLASH.png', 'Grenade assourdissante', 0, 90, 0, 30, 75, NULL, 'Éblouit temporairement les ennemis et les désoriente.', NULL, 2, 11),
(12, 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_PARALYSANTE.png', 'Grenade paralysante', 0, 85, 0, 35, 70, NULL, 'Ralentit et perturbe les ennemis.', NULL, 2, 11),
(8, 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_FUMIGENE.png', 'Grenade fumigène', 0, 88, 0, 25, 68, NULL, 'Crée un écran de fumée pour masquer les mouvements.', NULL, 2, 11),
(11, 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_IEM.png', 'Grenade IEM', 0, 80, 0, 20, 65, NULL, 'Désactive temporairement l''électronique ennemie.', NULL, 2, 11),
(9, 'Contenu\img\weapon\BO2\Equipement_tactique\CHARGE_ELECTRIQUE.png', 'Charge électrique', 0, 82, 0, 22, 67, NULL, 'Détecte les mouvements ennemis dans une zone.', NULL, 2, 11),

-- Armes spéciales
(30, 'Contenu\img\weapon\BO2\Arme_speciale\ARBALETE.png', 'Arbalète', 75, 60, 30, 65, 55, NULL, 'Arbalète avec des carreaux explosifs.', NULL, 2, 12),
(20, 'Contenu\img\weapon\BO2\Arme_speciale\COUTEAU_BALISTIQUE.png', 'Couteau balistique', 50, 85, 90, 70, 60, NULL, 'Couteau tirant des lames à distance.', NULL, 2, 12),

-- Ajout des armes de Call of Duty: Black Ops 3

-- Fusils d'assaut
(55, 'Contenu\img\weapon\BO3\Fusil_d''assault\KN-44.png', 'KN-44', 40, 75, 70, 65, 80, NULL, 'Fusil d''assaut équilibré avec une bonne cadence de tir.', NULL, 3, 1),
(60, 'Contenu\img\weapon\BO3\Fusil_d''assault\HVK-30.png', 'HVK-30', 38, 80, 85, 60, 78, NULL, 'Fusil d''assaut avec une cadence de tir très rapide.', NULL, 3, 1),
(65, 'Contenu\img\weapon\BO3\Fusil_d''assault\ICR-1.png', 'ICR-1', 35, 78, 78, 70, 85, NULL, 'Fusil extrêmement précis.', NULL, 3, 1),
(70, 'Contenu\img\weapon\BO3\Fusil_d''assault\MAN-O-WAR.png', 'Man-O-War', 50, 70, 60, 68, 75, NULL, 'Fusil puissant mais avec une cadence de tir lente.', NULL, 3, 1),

-- Mitraillettes
(45, 'Contenu\img\weapon\BO3\Mitraillette\VMP.png', 'VMP', 30, 85, 90, 55, 70, NULL, 'Mitraillette avec une cadence de tir très élevée.', NULL, 3, 2),
(50, 'Contenu\img\weapon\BO3\Mitraillette\KUDA.png', 'Kuda', 35, 82, 80, 65, 75, NULL, 'Mitraillette polyvalente et stable.', NULL, 3, 2),
(48, 'Contenu\img\weapon\BO3\Mitraillette\WEEVIL.png', 'Weevil', 32, 80, 85, 60, 68, NULL, 'Mitraillette avec une grande capacité de chargeur.', NULL, 3, 2),
(42, 'Contenu\img\weapon\BO3\Mitraillette\PHARO.png', 'Pharo', 36, 88, 78, 62, 72, NULL, 'Mitraillette en rafales avec une grande précision.', NULL, 3, 2),
(45, 'Contenu\img\weapon\BO3\Mitraillette\VESPER.png', 'Vesper', 25, 95, 120, 50, 45, NULL, 'Mitraillette à cadence extrêmement rapide, idéale pour le combat rapproché.', NULL, 3, 2),
(60, 'Contenu\img\weapon\BO3\Mitraillette\RAZORBACK.png', 'Razorback', 32, 90, 62, 80, 75, NULL, 'Mitraillette stable avec une excellente portée.', NULL, 3, 2),

-- Fusils à pompe
(35, 'Contenu\img\weapon\BO3\Fusil_à_pompe\KRM-262.png', 'KRM-262', 90, 60, 45, 70, 50, NULL, 'Fusil à pompe puissant à courte portée.', NULL, 3, 3),
(38, 'Contenu\img\weapon\BO3\Fusil_à_pompe\ARGUS.png', 'Argus', 95, 65, 40, 72, 55, NULL, 'Fusil à pompe avec une grande précision.', NULL, 3, 3),
(40, 'Contenu\img\weapon\BO3\Fusil_à_pompe\HAYMAKER_12.png', 'Haymaker 12', 80, 68, 70, 60, 50, NULL, 'Fusil à pompe semi-automatique rapide.', NULL, 3, 3),
(30, 'Contenu\img\weapon\BO3\Fusil_à_pompe\BRECCI.png', 'Brecci', 85, 66, 65, 65, 52, NULL, 'Fusil à pompe semi-automatique polyvalent.', NULL, 3, 3),

-- Mitrailleuses
(65, 'Contenu\img\weapon\BO3\Mitrailleuse\BRM.png', 'BRM', 50, 50, 55, 65, 70, NULL, 'Mitrailleuse lourde avec une bonne précision.', NULL, 3, 4),
(60, 'Contenu\img\weapon\BO3\Mitrailleuse\DINGO.png', 'Dingo', 45, 55, 75, 68, 72, NULL, 'Mitrailleuse légère avec une cadence de tir élevée.', NULL, 3, 4),
(70, 'Contenu\img\weapon\BO3\Mitrailleuse\GORGON.png', 'Gorgon', 60, 48, 40, 70, 74, NULL, 'Mitrailleuse puissante mais lente.', NULL, 3, 4),
(68, 'Contenu\img\weapon\BO3\Mitrailleuse\48_DREDGE.png', '48 Dredge', 55, 53, 65, 67, 71, NULL, 'Mitrailleuse en rafales.', NULL, 3, 4),

-- Fusils tactiques
(75, 'Contenu\img\weapon\BO3\Fusil_tactique\M8A7.png', 'M8A7', 45, 70, 60, 85, 88, NULL, 'Fusil tactique en rafales précis et puissant.', NULL, 3, 5),
(72, 'Contenu\img\weapon\BO3\Fusil_tactique\SHEIVA.png', 'Sheiva', 55, 65, 40, 82, 90, NULL, 'Fusil tactique semi-automatique puissant.', NULL, 3, 5),

-- Fusils de précision
(95, 'Contenu\img\weapon\BO3\Fusil_de_precision\LOCUS.png', 'Locus', 90, 50, 40, 75, 95, NULL, 'Fusil de précision avec une grande portée.', NULL, 3, 6),
(85, 'Contenu\img\weapon\BO3\Fusil_de_precision\SVG-100.png', 'SVG-100', 95, 45, 35, 72, 88, NULL, 'Fusil de précision lourd et puissant.', NULL, 3, 6),
(88, 'Contenu\img\weapon\BO3\Fusil_de_precision\DRAKON.png', 'Drakon', 85, 55, 60, 65, 85, NULL, 'Fusil semi-automatique avec une cadence rapide.', NULL, 3, 6),
(90, 'Contenu\img\weapon\BO3\Fusil_de_precision\P-06.png', 'P-06', 90, 55, 30, 75, 75, NULL, 'Fusil de précision à tir chargé, parfait pour des éliminations rapides.', NULL, 3, 6),

-- Pistolets
(25, 'Contenu\img\weapon\BO3\Pistolets\MR6.png', 'MR6', 35, 90, 75, 80, 65, NULL, 'Pistolet de base avec une bonne maniabilité.', NULL, 3, 7),
(30, 'Contenu\img\weapon\BO3\Pistolets\RK5.png', 'RK5', 38, 88, 80, 78, 68, NULL, 'Pistolet en rafales précis.', NULL, 3, 7),
(28, 'Contenu\img\weapon\BO3\Pistolets\L-CAR9.png', 'L-CAR 9', 32, 85, 85, 70, 70, NULL, 'Pistolet automatique polyvalent.', NULL, 3, 7),

-- Lanceurs
(75, 'Contenu\img\weapon\BO3\Lanceurs\XM-53.png', 'XM-53', 100, 40, 20, 55, 35, NULL, 'Lance-roquettes avec une grande puissance.', NULL, 3, 8),
(70, 'Contenu\img\weapon\BO3\Lanceurs\BLACKCELL.png', 'Blackcell', 95, 42, 25, 50, 30, NULL, 'Lance-roquettes verrouillable.', NULL, 3, 8),

-- Armes de mêlée
(10, 'Contenu\img\weapon\BO3\Armes_de_melee\COUTEAU.png', 'Couteau de combat', 75, 100, 100, 95, 50, NULL, 'Couteau utilisé pour les attaques rapprochées.', NULL, 3, 9),

-- Équipement mortel
(20, 'Contenu\img\weapon\BO3\Equipement_mortel\GRENADE.png', 'Frag Grenade', 85, 90, 0, 50, 65, NULL, 'Grenade explosive classique', NULL, 3, 10),
(18, 'Contenu\img\weapon\BO3\Equipement_mortel\Semtex.png', 'Semtex', 90, 88, 0, 48, 70, NULL, 'Grenade collante qui explose après un court délai', NULL, 3, 10),
(22, 'Contenu\img\weapon\BO3\Equipement_mortel\MINE_TERRESTRE.png', 'Mine Terrestre', 95, 75, 0, 52, 60, NULL, 'Mine qui explose lorsqu’elle est déclenchée', NULL, 3, 10),

-- Équipement tactique
(17, 'Contenu\img\weapon\BO3\Equipement_tactique\GRENADE_FLASH.png', 'Grenade assourdissante', 0, 82, 0, 42, 68, NULL, 'Éblouit et désoriente les ennemis', NULL, 3, 11),
(15, 'Contenu\img\weapon\BO3\Equipement_tactique\GRENADE_FUMIGENE.png', 'Grenade fumigène', 0, 85, 0, 38, 75, NULL, 'Crée un écran de fumée pour dissimuler les mouvements', NULL, 3, 11),
(16, 'Contenu\img\weapon\BO3\Equipement_tactique\GRENADE_CONCUSSION.png', 'Grenade à concussion', 0, 83, 0, 40, 72, NULL, 'Ralentit et désoriente les ennemis', NULL, 3, 11),

-- Armes spéciales
(20, 'Contenu\img\weapon\BO3\Arme_speciale\NX_SHADOWCLAW.png', 'NX ShadowClaw', 50, 85, 90, 70, 60, NULL, 'Couteau balistique tirant des lames à distance.', NULL, 3, 12),

-- Ajout des armes de Call of Duty: Black Ops 4

-- Fusils d'assaut
(65, 'Contenu\img\weapon\BO4\Fusil_d''assault\MADDOX_RFB.png', 'Maddox RFB', 6, 70, 14, 60, 8, NULL, 'Fusil d’assaut automatique rapide avec un recul notable.', NULL, 4, 1),
(60, 'Contenu\img\weapon\BO4\Fusil_d''assault\KN-57.png', 'KN-57', 9, 65, 10, 55, 9, NULL, 'Puissant à courte portée avec un recul modéré.', NULL, 4, 1),
(70, 'Contenu\img\weapon\BO4\Fusil_d''assault\ICR-7.png', 'ICR-7', 6, 75, 12, 80, 10, NULL, 'Fusil facile à contrôler mais avec une cadence moyenne.', NULL, 4, 1),

-- Mitraillettes
(40, 'Contenu\img\weapon\BO4\Mitraillette\MX9.png', 'MX9', 6, 85, 14, 70, 8, NULL, 'SMG équilibré avec de bonnes performances en combat rapproché.', NULL, 4, 2),
(45, 'Contenu\img\weapon\BO4\Mitraillette\CORDITE.png', 'Cordite', 7, 75, 15, 65, 7, NULL, 'SMG avec une excellente capacité de munitions.', NULL, 4, 2),
(30, 'Contenu\img\weapon\BO4\Mitraillette\SAUG-9mm.png', 'Saug-9mm', 5, 90, 16, 50, 9, NULL, 'Légère et maniable, idéale pour des combats rapides.', NULL, 4, 2),

-- Fusils tactiques
(75, 'Contenu\img\weapon\BO4\Fusil_tactique\AUGER_DMR.png', 'Auger DMR', 10, 55, 5, 60, 11, NULL, 'Fusil semi-automatique avec de gros dégâts.', NULL, 4, 5),
(70, 'Contenu\img\weapon\BO4\Fusil_tactique\SWORDFISH.png', 'Swordfish', 7, 65, 13, 70, 14, NULL, 'Fusil burst à quatre coups précis.', NULL, 4, 5),

-- Fusils à pompe
(25, 'Contenu\img\weapon\BO4\Fusil_à_pompe\MOG_12.png', 'MOG 12', 12, 60, 2, 70, 8, NULL, 'Fusil à pompe puissant avec une cadence lente.', NULL, 4, 3),
(20, 'Contenu\img\weapon\BO4\Fusil_à_pompe\SG12.png', 'SG12', 8, 75, 4, 65, 9, NULL, 'Fusil à pompe semi-automatique maniable et efficace en combat rapproché.', NULL, 4, 3),

-- Mitrailleuses légères
(80, 'Contenu\img\weapon\BO4\Mitrailleuse\TITAN.png', 'Titan', 9, 50, 9, 60, 8, NULL, 'Mitrailleuse avec de bons dégâts et une grande capacité.', NULL, 4, 4),
(75, 'Contenu\img\weapon\BO4\Mitrailleuse\HADES.png', 'Hades', 7, 55, 14, 65, 7, NULL, 'Mitrailleuse légère avec une cadence élevée.', NULL, 4, 4),

-- Fusils de précision
(95, 'Contenu\img\weapon\BO4\Fusil_de_precision\PALADIN_HB50.png', 'Paladin HB50', 15, 30, 1, 40, 16, NULL, 'Fusil de précision avec des dégâts massifs.', NULL, 4, 6),
(90, 'Contenu\img\weapon\BO4\Fusil_de_precision\OUTLAW.png', 'Outlaw', 13, 35, 3, 45, 16, NULL, 'Fusil rapide avec une excellente précision.', NULL, 4, 6),

-- Pistolets
(15, 'Contenu\img\weapon\BO4\Pistolets\RK_7_GARRISON.png', 'RK 7 Garrison', 5, 85, 12, 70, 7, NULL, 'Pistolet burst précis pour les duels rapprochés.', NULL, 4, 7),
(20, 'Contenu\img\weapon\BO4\Pistolets\STRIFE.png', 'Strife', 6, 90, 10, 75, 8, NULL, 'Pistolet semi-automatique avec une bonne précision.', NULL, 4, 7),
(25, 'Contenu\img\weapon\BO4\Pistolets\MOZU.png', 'Mozu', 8, 80, 8, 60, 9, NULL, 'Pistolet revolver avec des dégâts élevés.', NULL, 4, 7),

-- Lanceurs
(10, 'Contenu\img\weapon\BO4\Lanceurs\HELLION_SALVO.png', 'Hellion Salvo', 12, 40, 4, 30, 5, NULL, 'Lance-roquettes utilisé contre véhicules et infanterie.', NULL, 4, 8),

-- Armes de mêlée
(5, 'Contenu\img\weapon\BO4\Armes_de_melee\COUTEAU.png', 'Couteau de combat', 10, 100, 0, 80, 0, NULL, 'Arme blanche rapide et mortelle à courte distance.', NULL, 4, 9),

-- Équipement mortel
(20, 'Contenu\img\weapon\BO4\Equipement_mortel\GRENADE.png', 'Grenade', 85, 95, 0, 50, 70, NULL, 'Grenade classique avec un large rayon d''explosion.', NULL, 4, 10),
(25, 'Contenu\img\weapon\BO4\Equipement_mortel\SEMTEX.png', 'Semtex', 90, 90, 0, 45, 65, NULL, 'Grenade collante qui explose après un court délai.', NULL, 4, 10),
(22, 'Contenu\img\weapon\BO4\Equipement_mortel\CLAYMORE.png', 'Claymore', 80, 80, 0, 40, 68, NULL, 'Mine antipersonnelle activée par mouvement.', NULL, 4, 10),
(23, 'Contenu\img\weapon\BO4\Equipement_mortel\C4.png', 'C4', 95, 70, 0, 35, 60, NULL, 'Explosif télécommandé polyvalent.', NULL, 4, 10),
(15, 'Contenu\img\weapon\BO4\Equipement_mortel\HACHE_DE_COMBAT.png', 'Hache de combat', 70, 100, 0, 60, 50, NULL, 'Hachette jetable pour des éliminations instantanées.', NULL, 4, 10),

-- Équipement tactique
(10, 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_FLASH.png', 'Grenade assourdissante', 0, 90, 0, 30, 75, NULL, 'Éblouit temporairement les ennemis et les désoriente.', NULL, 4, 11),
(12, 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_PARALYSANTE.png', 'Grenade paralysante', 0, 85, 0, 35, 70, NULL, 'Ralentit et perturbe les ennemis.', NULL, 4, 11),
(8, 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_SMOKE.png', 'Grenade fumigène', 0, 88, 0, 25, 68, NULL, 'Crée un écran de fumée pour masquer les mouvements.', NULL, 4, 11),
(11, 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_IEM.png', 'Grenade IEM', 0, 80, 0, 20, 65, NULL, 'Désactive temporairement l''électronique ennemie.', NULL, 4, 11),
(9, 'Contenu\img\weapon\BO4\Equipement_tactique\CAPTEUR_ACOUSTIQUE.png', 'Capteur acoustique', 0, 82, 0, 22, 67, NULL, 'Détecte les mouvements ennemis à proximité.', NULL, 4, 11),

-- Armes spéciales

-- Ajout des armes de Call of Duty: Black Ops 5 avec descriptions et anecdotes

-- Fusils d'assaut
(65, 'Contenu\img\weapon\BO5\Fusil_d''assault\Krig6.png', 'Krig 6', 38, 82, 70, 70, 85, NULL, 'Fusil d''assaut précis et stable.', 'Populaire pour son équilibre, il est souvent préféré dans des engagements à moyenne distance.', 5, 1),
(55, 'Contenu\img\weapon\BO5\Fusil_d''assault\QBZ-83.png', 'QBZ-83', 40, 80, 80, 66, 78, NULL, 'Fusil d''assaut mobile et polyvalent.', 'Inspiré des modèles modernes chinois, il offre une grande maniabilité.', 5, 1),
(70, 'Contenu\img\weapon\BO5\Fusil_d''assault\XM4.png', 'XM4', 40, 80, 75, 85, 90, NULL, 'Fusil d''assaut polyvalent avec une excellente maniabilité.', 'Considéré comme un fusil standard pour les forces spéciales.', 5, 1),
(65, 'Contenu\img\weapon\BO5\Fusil_d''assault\AK-47.png', 'AK-47', 42, 75, 70, 80, 85, NULL, 'Fusil robuste et puissant, emblématique.', 'Reconnue mondialement comme un symbole d''armes à feu pour sa robustesse.', 5, 1),
(75, 'Contenu\img\weapon\BO5\Fusil_d''assault\FFAR1.png', 'FFAR 1', 35, 80, 90, 75, 80, NULL, 'Fusil d''assaut avec une cadence rapide, efficace à courte portée.', 'Surnommé ''Bullet Hose'' pour sa cadence de tir fulgurante.', 5, 1),
(72, 'Contenu\img\weapon\BO5\Fusil_d''assault\Groza.png', 'Groza', 40, 80, 80, 80, 85, NULL, 'Fusil d''assaut compact et rapide.', 'Initialement conçu comme une arme de soutien rapproché.', 5, 1),
(72, 'Contenu\img\weapon\BO5\Fusil_d''assault\FARA83.png', 'FARA 83', 40, 80, 80, 80, 85, NULL, 'Fusil d''assaut équilibré avec un recul modéré.', 'Utilisé dans les conflits sud-américains, ce fusil est synonyme de fiabilité.', 5, 1),
(68, 'Contenu\img\weapon\BO5\Fusil_d''assault\C58.png', 'C58', 45, 75, 70, 80, 85, NULL, 'Fusil d''assaut puissant avec un rythme de tir modéré.', 'Apprécié pour ses performances dans des engagements à longue distance.', 5, 1),

-- Mitraillettes
(50, 'Contenu\img\weapon\BO5\Mitraillette\MP5.png', 'MP5', 30, 88, 85, 65, 72, NULL, 'Mitraillette classique avec une excellente mobilité.', 'Icône des forces spéciales, elle est utilisée depuis des décennies.', 5, 2),
(45, 'Contenu\img\weapon\BO5\Mitraillette\AK-74u.png', 'AK-74u', 35, 84, 78, 68, 70, NULL, 'Mitraillette avec une portée efficace.', 'Version compacte du légendaire AK-47.', 5, 2),
(52, 'Contenu\img\weapon\BO5\Mitraillette\Bullfrog.png', 'Bullfrog', 32, 80, 80, 62, 75, NULL, 'Mitraillette avec une grande capacité de chargeur.', 'Son large chargeur est parfait pour des combats prolongés.', 5, 2),
(50, 'Contenu\img\weapon\BO5\Mitraillette\Milano821.png', 'Milano 821', 35, 85, 60, 80, 85, NULL, 'Mitraillette efficace à moyenne distance.', 'Son design rappelle les armes utilisées par la mafia des années 80.', 5, 2),
(55, 'Contenu\img\weapon\BO5\Mitraillette\KSP45.png', 'KSP 45', 30, 85, 75, 75, 80, NULL, 'Mitraillette en rafales avec une précision accrue.', 'Idéal pour les joueurs privilégiant la précision à la cadence.', 5, 2),
(45, 'Contenu\img\weapon\BO5\Mitraillette\MAC-10.png', 'MAC-10', 25, 92, 90, 70, 75, NULL, 'Mitraillette ultra-rapide pour le combat rapproché.', 'Sa cadence de tir la rend redoutable dans les espaces confinés.', 5, 2),
(60, 'Contenu\img\weapon\BO5\Mitraillette\LC10.png', 'LC10', 30, 90, 75, 75, 80, NULL, 'Mitraillette stable et précise.', 'Son faible recul en fait une favorite pour les tirs à longue portée.', 5, 2),
(65, 'Contenu\img\weapon\BO5\Mitraillette\PPSh-41.png', 'PPSH-41', 30, 90, 90, 75, 80, NULL, 'Mitraillette à grande cadence, idéale pour les assauts rapprochés.', 'Célèbre pour son rôle dans la Seconde Guerre mondiale.', 5, 2),

-- Fusils à pompe
(35, 'Contenu\img\weapon\BO5\Fusil_à_pompe\hauer77.png', 'Hauer 77', 90, 62, 40, 70, 50, NULL, 'Fusil à pompe puissant pour les combats rapprochés.', 'Connu pour son impact destructeur à courte portée.', 5, 3),
(40, 'Contenu\img\weapon\BO5\Fusil_à_pompe\Gallo-SA12.png', 'Gallo SA12', 85, 68, 65, 60, 52, NULL, 'Fusil à pompe semi-automatique rapide.', 'Une arme polyvalente, très populaire parmi les chasseurs.', 5, 3),
(25, 'Contenu\img\weapon\BO5\Fusil_à_pompe\streetsweeper.png', 'Streetsweeper', 80, 65, 120, 60, 65, NULL, 'Fusil à pompe semi-automatique idéal pour le combat rapproché.', 'Conçu pour nettoyer les zones densément peuplées d''ennemis.', 5, 3),

-- Mitrailleuses
(65, 'Contenu\img\weapon\BO5\Mitrailleuse\Stoner63.png', 'Stoner 63', 50, 52, 70, 66, 72, NULL, 'Mitrailleuse légère avec une cadence de tir stable.', 'Utilisée avec succès dans les conflits du Vietnam.', 5, 4),
(70, 'Contenu\img\weapon\BO5\Mitrailleuse\RPD.png', 'RPD', 55, 50, 60, 70, 74, NULL, 'Mitrailleuse classique avec une grande puissance.', 'Son design simple la rend facile à entretenir en conditions difficiles.', 5, 4),
(90, 'Contenu\img\weapon\BO5\Mitrailleuse\M60.png', 'M60', 50, 50, 54, 85, 85, NULL, 'Mitrailleuse lourde à forte puissance de feu.', 'Surnommée ''The Pig'' par les soldats, elle est redoutée pour sa puissance.', 5, 4),
(85, 'Contenu\img\weapon\BO5\Mitrailleuse\MG82.png', 'MG 82', 40, 60, 75, 80, 85, NULL, 'Mitrailleuse légère rapide et efficace pour les tirs prolongés.', 'Connue pour sa fiabilité dans les opérations de couverture.', 5, 4),

-- Fusils tactiques
(75, 'Contenu\img\weapon\BO5\Fusil_tactique\DMR14.png', 'DMR 14', 60, 75, 65, 70, 80, NULL, 'Fusil tactique polyvalent et précis.', 'C''est un choix populaire parmi les tireurs d''élite modernes.', 5, 5),
(80, 'Contenu\img\weapon\BO5\Fusil_tactique\Type63.png', 'Type 63', 65, 78, 62, 68, 83, NULL, 'Fusil semi-automatique puissant.', 'Inspiré des premiers fusils tactiques chinois.', 5, 5),
(85, 'Contenu\img\weapon\BO5\Fusil_tactique\M16.png', 'M16', 55, 75, 50, 85, 90, NULL, 'Fusil tactique à rafales, précis et puissant.', 'Icône de la guerre du Vietnam, il excelle dans les engagements à moyenne portée.', 5, 5),
(80, 'Contenu\img\weapon\BO5\Fusil_tactique\AUG.png', 'AUG', 55, 75, 50, 85, 90, NULL, 'Fusil tactique équilibré et efficace à distance moyenne.', 'Son design futuriste le distingue des autres fusils tactiques.', 5, 5),
(82, 'Contenu\img\weapon\BO5\Fusil_tactique\CARV.2.png', 'CARV.2', 55, 75, 50, 85, 90, NULL, 'Fusil tactique moderne et précis.', 'Connu pour son faible recul malgré une cadence élevée.', 5, 5),

-- Fusils de précision
(95, 'Contenu\img\weapon\BO5\Fusil_de_precision\LW3-Tundra.png', 'LW3 - Tundra', 95, 48, 35, 72, 92, NULL, 'Fusil de précision lourd et précis.', 'Idéal pour des tirs à très longue distance grâce à sa puissance brute.', 5, 6),
(90, 'Contenu\img\weapon\BO5\Fusil_de_precision\pelington703.png', 'Pelington 703', 90, 50, 40, 75, 88, NULL, 'Fusil de précision rapide et maniable.', 'Apprécié par les tireurs rapides pour sa faible latence.', 5, 6),
(120, 'Contenu\img\weapon\BO5\Fusil_de_precision\M82.png', 'M82', 150, 40, 30, 85, 90, NULL, 'Fusil de précision semi-automatique puissant.', 'Un choix courant pour neutraliser les véhicules légers.', 5, 6),
(115, 'Contenu\img\weapon\BO5\Fusil_de_precision\ZRG20mm.png', 'ZRG 20mm', 150, 40, 30, 85, 90, NULL, 'Fusil de précision à haute puissance.', 'Sa portée exceptionnelle lui permet de dominer sur les cartes ouvertes.', 5, 6),
(125, 'Contenu\img\weapon\BO5\Fusil_de_precision\SwissK31.png', 'Swiss K31', 140, 50, 50, 90, 95, NULL, 'Fusil de précision rapide et maniable.', 'Ce fusil suisse est souvent salué pour son équilibre parfait.', 5, 6),

-- Pistolets
(25, 'Contenu\img\weapon\BO5\Pistolets\1911.png', '1911', 35, 92, 80, 78, 65, NULL, 'Pistolet classique avec une bonne maniabilité.', 'Ce pistolet a servi durant deux guerres mondiales.', 5, 7),
(30, 'Contenu\img\weapon\BO5\Pistolets\diamatti.png', 'Diamatti', 38, 88, 85, 70, 68, NULL, 'Pistolet en rafales rapide.', 'Son design est inspiré des armes compactes italiennes.', 5, 7),
(35, 'Contenu\img\weapon\BO5\Pistolets\magnum.png', 'Magnum', 60, 85, 40, 75, 70, NULL, 'Pistolet puissant pour les tirs précis à moyenne distance.', 'Appelé ''Hand Cannon'', il est célèbre pour sa puissance brutale.', 5, 7),
(40, 'Contenu\img\weapon\BO5\Pistolets\AMP63.png', 'AMP63', 30, 90, 60, 80, 75, NULL, 'Pistolet automatique compact et rapide.', 'Sa cadence de tir en fait une arme redoutable au corps à corps.', 5, 7),

-- Lanceurs
(75, 'Contenu\img\weapon\BO5\Lanceurs\Cigma2.png', 'Cigma 2', 100, 42, 20, 55, 30, NULL, 'Lance-roquettes polyvalent.', 'Souvent utilisé pour détruire des véhicules ennemis rapidement.', 5, 8),
(10, 'Contenu\img\weapon\BO5\Lanceurs\RPG-7.png', 'RPG-7', 150, 40, 30, 70, 60, NULL, 'Lance-roquettes polyvalent, efficace contre les véhicules.', 'Symbole des conflits modernes, il est aussi utilisé par les forces irrégulières.', 5, 8),

-- Armes de mêlée
(10, 'Contenu\img\weapon\BO5\Armes_de_melee\couteau.png', 'Couteau de combat', 75, 100, 100, 95, 50, NULL, 'Couteau utilisé pour les attaques rapprochées.', 'Une arme discrète qui peut être fatale dans les bonnes mains.', 5, 9),
(5, 'Contenu\img\weapon\BO5\Armes_de_melee\Wakizashi.png', 'Wakizashi', 150, 100, 0, 90, 0, NULL, 'Katana utilisé pour les éliminations rapides et silencieuses.', 'Inspiré des armes traditionnelles japonaises.', 5, 9),
(5, 'Contenu\img\weapon\BO5\Armes_de_melee\machette.png', 'Machette', 150, 100, 0, 90, 0, NULL, 'Arme tranchante, idéale pour le combat rapproché.', 'Utilisée à l''origine dans les jungles pour défricher.', 5, 9),
(5, 'Contenu\img\weapon\BO5\Armes_de_melee\masse.png', 'Masse', 150, 95, 0, 85, 0, NULL, 'Marteau imposant pour des coups dévastateurs.', 'Lourd mais dévastateur lorsqu''il est manié avec force.', 5, 9),
(5, 'Contenu\img\weapon\BO5\Armes_de_melee\BaseballBat.png', 'Batte de baseball', 150, 100, 0, 85, 0, NULL, 'Batte classique pour les combats rapprochés.', 'Un classique des affrontements urbains.', 5, 9),

-- Équipement mortel
(15, 'Contenu\img\weapon\BO5\Equipement_mortel\grenade.png', 'Grenade', 80, 100, 0, 50, 70, NULL, 'Explosion mortelle pour les zones denses.', 'La grenade est un incontournable depuis les guerres du XXe siècle.', 5, 10),
(20, 'Contenu\img\weapon\BO5\Equipement_mortel\C4.png', 'C4', 90, 95, 0, 40, 65, NULL, 'Explosif à détonation à distance.', 'Utilisé par les forces spéciales pour neutraliser des cibles spécifiques.', 5, 10),

-- Équipement tactique
(15, 'Contenu\img\weapon\BO5\Equipement_tactique\grenade-flash.png', 'Grenade assourdissante', 0, 90, 0, 40, 80, NULL, 'Aveugle temporairement les ennemis.', 'Idéal pour désorienter les adversaires avant un assaut.', 5, 11),
(20, 'Contenu\img\weapon\BO5\Equipement_tactique\grenade-paralysante.png', 'Grenade paralysante', 0, 85, 0, 35, 75, NULL, 'Génère un nuage de fumée pour couvrir vos mouvements.', 'Utilisée pour les attaques furtives ou pour protéger une retraite.', 5, 11),

-- Armes spéciales
(30, 'Contenu\img\weapon\BO5\Arme_speciale\M79.png', 'M79', 80, 60, 30, 65, 55, NULL, 'Lance-grenades compact.', 'Surnommé ''Thumper'' pour le bruit distinct qu''il produit lors des tirs.', 5, 12),

-- Ajout des armes de Call of Duty: Black Ops 6 avec descriptions et anecdotes

-- Fusils d'assaut
(62, 'Contenu\img\weapon\BO6\Fusil_d''assault\XM4.png', 'XM4', 40, 78, 76, 72, 82, NULL, 'Fusil d''assaut équilibré et polyvalent.', 'Décrit comme l''arme par défaut idéale pour tout soldat débutant.', 6, 1),
(70, 'Contenu\img\weapon\BO6\Fusil_d''assault\AS-VAL.png', 'AS VAL', 45, 75, 80, 70, 85, NULL, 'Fusil d''assaut russe silencieux, adapté aux combats rapprochés et à moyenne portée.', 'Connue pour sa cadence de tir élevée et son intégration dans les opérations spéciales.', 6, 1),
(65, 'Contenu\img\weapon\BO6\Fusil_d''assault\KRIG-C.png', 'Krig C', 42, 80, 78, 76, 82, NULL, 'Fusil d''assaut polyvalent avec une grande précision et contrôle.', 'Apprécié pour ses performances stables en combat.', 6, 1),
(60, 'Contenu\img\weapon\BO6\Fusil_d''assault\AK-74.png', 'AK-74', 45, 70, 11.67, 68, 65, NULL, 'Un fusil d''assaut robuste utilisé pour des engagements à moyenne portée. Il est apprécié pour sa puissance et sa fiabilité.', 'Connu pour être un favori des forces spéciales dans le monde entier.', 6, 1),
(55, 'Contenu\img\weapon\BO6\Fusil_d''assault\AMES-85.png', 'AMES 85', 38, 78, 12.83, 72, 74, NULL, 'Fusil d''assaut rapide et précis, idéal pour le combat rapproché.', 'Son design compact est inspiré des fusils européens modernes.', 6, 1),
(58, 'Contenu\img\weapon\BO6\Fusil_d''assault\GPR-91.png', 'GPR 91', 40, 74, 12.67, 70, 68, NULL, 'Un fusil équilibré offrant une bonne stabilité et un recul maîtrisé.', 'Utilisé par plusieurs armées fictives dans les précédents opus de la saga.', 6, 1),
(62, 'Contenu\img\weapon\BO6\Fusil_d''assault\MODEL-L.png', 'Model L', 43, 72, 12.00, 73, 70, NULL, 'Un fusil d''assaut polyvalent avec un recul légèrement supérieur, mais une précision accrue.', 'Développé à partir d''un prototype abandonné d''arme militaire.', 6, 1),
(65, 'Contenu\img\weapon\BO6\Fusil_d''assault\GOBLIN-MK-2.png', 'Goblin MK 2', 41, 76, 12.17, 71, 71, NULL, 'Un fusil futuriste avec une cadence de tir rapide et une mobilité accrue.', 'Sa version précédente était utilisée par les mercenaires dans Black Ops 5.', 6, 1),

-- Mitraillettes
(30, 'Contenu\img\weapon\BO6\Mitraillette\C9.png', 'C9', 30, 90, 14.17, 62, 58, NULL, 'Une mitraillette compacte idéale pour les combats rapprochés.', 'Inspirée par les armes utilisées dans les guerres urbaines.', 6, 2),
(28, 'Contenu\img\weapon\BO6\Mitraillette\KSV.png', 'KSV', 32, 88, 14.00, 60, 55, NULL, 'Une mitraillette avec un faible recul, mais une portée limitée.', 'Son design rappelle les mitraillettes russes modernes.', 6, 2),
(50, 'Contenu\img\weapon\BO6\Mitraillette\PP-919.png', 'PP-919', 35, 90, 85, 72, 75, NULL, 'Mitraillette compacte, parfaite pour le combat rapproché.', 'Utilisée par les forces spéciales pour sa maniabilité.', 6, 2),
(55, 'Contenu\img\weapon\BO6\Mitraillette\Kompakt-92.png', 'Kompakt-92', 37, 88, 88, 70, 78, NULL, 'Mitraillette légère avec une bonne précision pour les rafales courtes.', 'Son design compact en fait une arme populaire.', 6, 2),
(48, 'Contenu\img\weapon\BO6\Mitraillette\Jackel-PDW.png', 'Jackel-PDW', 40, 85, 90, 68, 70, NULL, 'Arme tactique avec une cadence de tir élevée.', 'Appréciée pour son efficacité dans les zones urbaines.', 6, 2),
(35, 'Contenu\img\weapon\BO6\Mitraillette\TANTO-22.png', 'TANTO-22', 28, 92, 14.33, 63, 54, NULL, 'Une mitraillette ultra-légère avec une cadence de tir élevée.', 'Son calibre unique permet une gestion facile du recul.', 6, 2),
(33, 'Contenu\img\weapon\BO6\Mitraillette\SAUG.png', 'Saug', 35, 85, 13.33, 66, 59, NULL, 'Une mitraillette performante avec un bon compromis entre mobilité et puissance.', 'Largement utilisée dans des environnements hostiles comme les jungles.', 6, 2),

-- Fusils à pompe
(20, 'Contenu\img\weapon\BO6\Fusil_à_pompe\Marine-SP.png', 'Marine SP', 85, 68, 5.00, 50, 40, NULL, 'Un fusil à pompe puissant conçu pour un maximum de dégâts à courte portée.', 'Utilisé par des unités maritimes d''élite dans des missions clandestines.', 6, 3),
(18, 'Contenu\img\weapon\BO6\Fusil_à_pompe\ASG-89.png', 'ASG-89', 90, 65, 4.67, 48, 38, NULL, 'Un fusil à pompe lourd avec une grande puissance de feu.', 'Sa conception est basée sur un modèle expérimental militaire.', 6, 3),
(22, 'Contenu\img\weapon\BO6\Fusil_à_pompe\Maelstrom.png', 'Maelstrom', 88, 67, 5.17, 52, 42, NULL, 'Un fusil à pompe moderne offrant un bon équilibre entre puissance et cadence.', 'Une arme prototype développée pour des situations extrêmes.', 6, 3),

-- Mitrailleuses
(75, 'Contenu\img\weapon\BO6\Mitrailleuse\PU-21.png', 'PU-21', 47, 52, 10.00, 56, 65, NULL, 'Une mitrailleuse légère polyvalente avec un bon compromis entre puissance et contrôle.', 'Son nom provient d''une unité paramilitaire fictive célèbre dans Black Ops 3.', 6, 4),
(72, 'Contenu\img\weapon\BO6\Mitrailleuse\XMG.png', 'XMG', 45, 50, 9.67, 58, 63, NULL, 'Conçue pour une précision accrue malgré sa cadence de tir modérée.', 'L''arme a été conçue pour résister aux environnements désertiques.', 6, 4),
(78, 'Contenu\img\weapon\BO6\Mitrailleuse\GPMG-7.png', 'GPMG-7', 50, 48, 9.83, 54, 64, NULL, 'Une mitrailleuse lourde avec une grande capacité de munition et des dégâts élevés.', 'Célèbre pour sa durabilité lors des campagnes prolongées.', 6, 4),
 
-- Fusils tactiques
(210, 'Contenu\img\weapon\BO6\Fusil_tactique\AEK-973.png', 'AEK-973', 92, 40, 0.92, 81, 94, NULL, 'Un fusil semi-automatique, offrant un mélange de puissance et de maniabilité.', 'L''arme a été adoptée par un groupe fictif de tireurs d''élite dans Black Ops 4.', 6, 5),
(200, 'Contenu\img\weapon\BO6\Fusil_tactique\SWAFT-5.56.png', 'SWAFT 5.56', 90, 42, 1.00, 80, 95, NULL, 'Un fusil semi-automatique conçu pour une précision maximale à longue portée.', 'Utilisé par des équipes tactiques dans de nombreuses missions fictives.', 6, 5),
(220, 'Contenu\img\weapon\BO6\Fusil_tactique\Tsarkov-7.62.png', 'Tsarkov 7.62', 95, 38, 0.83, 82, 97, NULL, 'Un fusil semi-automatique extrêmement puissant, mais lourd et lent.', 'Connu pour avoir été modélisé après une arme soviétique légendaire.', 6, 5),
(215, 'Contenu\img\weapon\BO6\Fusil_tactique\DM-10.png', 'DM-10', 93, 39, 0.87, 79, 96, NULL, 'Un fusil à verrou avec une cadence légèrement améliorée pour un tir de suivi rapide.', 'Il est basé sur une technologie expérimentale présentée dans les précédents opus.', 6, 5),

-- Fusils de précision
(95, 'Contenu\img\weapon\BO6\Fusil_de_precision\LW3A1-Frostline.png', 'LW3A1-Frostline', 110, 50, 55, 80, 90, NULL, 'Fusil de précision mortel avec une portée exceptionnelle.', 'Utilisé par les tireurs d''élite dans des conditions extrêmes.', 6, 6),
(85, 'Contenu\img\weapon\BO6\Fusil_de_precision\SVD.png', 'SVD', 100, 55, 60, 75, 85, NULL, 'Fusil de précision semi-automatique fiable et robuste.', 'Fameux pour sa polyvalence sur le terrain.', 6, 6),
(92, 'Contenu\img\weapon\BO6\Fusil_de_precision\AMR-MOD-4.png', 'AMR-MOD-4', 120, 45, 40, 70, 95, NULL, 'Fusil anti-matériel conçu pour neutraliser les cibles lourdes.', 'Sa puissance est redoutable contre les véhicules.', 6, 6),
(90, 'Contenu\img\weapon\BO6\Fusil_de_precision\LR.7.62.png', 'LR.7.62', 105, 48, 58, 78, 88, NULL, 'Fusil à verrou précis avec une excellente stabilité.', 'Réputé pour ses tirs longue portée.', 6, 6),

-- Pistolets
(40, 'Contenu\img\weapon\BO6\Pistolets\9mm-pm.png', '9mm-pm', 38, 95, 450, 72, 68, NULL, 'Pistolet standard compact et efficace.', 'Très utilisé dans les forces de police.', 6, 7),
(38, 'Contenu\img\weapon\BO6\Pistolets\Grekhova.png', 'Grekhova', 42, 90, 400, 70, 65, NULL, 'Pistolet semi-automatique avec un bon contrôle.', 'Nommé d''après son concepteur.', 6, 7),
(45, 'Contenu\img\weapon\BO6\Pistolets\Gs45.png', 'Gs45', 48, 88, 420, 68, 70, NULL, 'Pistolet moderne fiable et précis.', 'Apprécié pour sa rapidité d''action.', 6, 7),
(50, 'Contenu\img\weapon\BO6\Pistolets\Stryder-22.png', 'Stryder', 50, 85, 410, 65, 72, NULL, 'Pistolet performant avec une bonne cadence de tir.', 'Populaire dans les environnements tactiques.', 6, 7),

-- Lanceurs
(70, 'Contenu\img\weapon\BO6\Lanceurs\HE-1.png', 'HE-1', 130, 40, 10, 30, 25, NULL, 'Lanceur polyvalent conçu pour éliminer les véhicules et les groupes ennemis.', 'Connu pour son efficacité contre les blindages lourds.', 6, 8),
(80, 'Contenu\img\weapon\BO6\Lanceurs\CIGMA-2.png', 'Cigma 2', 100, 42, 20, 55, 30, NULL, 'Lance-roquettes anti-aérien.', 'Efficace contre les véhicules et les séries d''éliminations ennemies.', 6, 8),

-- Armes de mêlée
(5, 'Contenu\img\weapon\BO6\Armes_de_melee\couteau.png', 'Couteau', 150, 100, 0, 90, 50, NULL, 'Couteau de combat classique, idéal pour les éliminations silencieuses.', 'Outil polyvalent depuis des décennies.', 6, 9),
(10, 'Contenu\img\weapon\BO6\Armes_de_melee\perceuse.png', 'Perceuse', 160, 95, 0, 85, 45, NULL, 'Arme improvisée causant des dégâts lourds en mêlée.', 'Une innovation brutale sur le champ de bataille.', 6, 9),
(7, 'Contenu\img\weapon\BO6\Armes_de_melee\couperet.png', 'Couperet', 140, 98, 0, 88, 52, NULL, 'Hachoir modifié pour des combats rapprochés.', 'Terrifiant dans les mains d''un expert.', 6, 9),
(8, 'Contenu\img\weapon\BO6\Armes_de_melee\Bat_de_Baseball.png', 'Bat de Baseball', 130, 97, 0, 80, 48, NULL, 'Arme de mêlée rapide et efficace.', 'Également utilisée comme outil dans les situations de survie.', 6, 9),

-- Équipement mortel
(NULL, 'Contenu\img\weapon\BO6\Equipement_mortel\Molotov.png', 'Cocktail molotov', 150, 0, 0, 0, 0, NULL, 'Explosif incendiaire capable de couvrir une zone avec des flammes.', 'Efficace pour bloquer des passages ou piéger des ennemis.', 6, 10),
(NULL, 'Contenu\img\weapon\BO6\Equipement_mortel\Frag.png', 'Grenade frag', 200, 0, 0, 0, 0, NULL, 'Grenade explosive standard causant des dégâts sur une large zone.', 'Une arme classique utilisée depuis des décennies.', 6, 10),

-- Équipement tactique
(NULL, 'Contenu\img\weapon\BO6\Equipement_tactique\Grenade_flash.png', 'Grenade flash', 0, 0, 0, 0, 0, NULL, 'Dispositif tactique aveuglant temporairement les ennemis.', 'Très efficace pour désorienter l''adversaire avant une attaque.', 6, 11),
(19, 'Contenu\img\weapon\BO6\Equipement_tactique\Grenade_paralysante.png', 'Grenade paralysante', 0, 85, 0, 35, 78, NULL, 'Ralentit et perturbe les ennemis.', 'L''un des outils préférés des unités tactiques pour prendre l''avantage.', 6, 11),
(NULL, 'Contenu\img\weapon\BO6\Equipement_tactique\Stimulant.png', 'Stimulant', 0, 0, 0, 0, 0, NULL, 'Injection rapide permettant de restaurer la santé en combat.', 'Utilisé par les soldats pour une survie prolongée.', 6, 11),

-- Armes spéciales
(60, 'Contenu\img\weapon\BO6\Arme_speciale\Sirin-9mm.png', 'Sirin-9mm', 85, 70, 75, 65, 80, NULL, 'Arme unique combinant la cadence d''un pistolet-mitrailleur avec une précision accrue.', 'Développée dans le cadre d''un projet secret.', 6, 12),

-- Ajout des armes de Valorant

-- Fusils d'assaut
(50, 'Contenu\img\weapon\VALORANT\Fusil_d''assault\VANDAL.png', 'Vandal', 160, 80, 9, 70, 85, NULL, 'Fusil d''assaut puissant offrant un coup létal à la tête, sans perte de dégâts sur la distance.', NULL, 7, 1),
(45, 'Contenu\img\weapon\VALORANT\Fusil_d''assault\PHANTOM.png', 'Phantom', 140, 85, 11, 75, 90, NULL, 'Fusil d''assaut silencieux, idéal à courte et moyenne distance.', NULL, 7, 1),

-- Snipers
(100, 'Contenu\img\weapon\VALORANT\Sniper\OPERATOR.png', 'Operator', 255, 30, 1, 40, 95, NULL, 'Fusil de précision à verrou, doté d''une énorme puissance de tir.', NULL, 7, 6),
(90, 'Contenu\img\weapon\VALORANT\Sniper\MARSHAL.png', 'Marshal', 202, 50, 1.2, 50, 80, NULL, 'Fusil de précision léger, plus rapide mais moins puissant que l''Operator.', NULL, 7, 6),

-- Mitraillettes
(30, 'Contenu\img\weapon\VALORANT\Mitraillette\SPECTRE.png', 'Spectre', 78, 90, 13.3, 70, 65, NULL, 'Mitraillette silencieuse idéale pour le combat rapproché.', NULL, 7, 2),
(25, 'Contenu\img\weapon\VALORANT\Mitraillette\STINGER.png', 'Stinger', 67, 95, 18, 60, 55, NULL, 'Petite mitraillette avec une cadence de tir très rapide.', NULL, 7, 2),

-- Fusils à pompes
(20, 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\JUDGE.png', 'Judge', 85, 50, 3.5, 65, 40, NULL, 'Fusil à pompe semi-automatique avec une grande puissance au corps à corps.', NULL, 7, 3),
(15, 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\BUCKY.png', 'Bucky', 90, 40, 1.1, 55, 35, NULL, 'Fusil à pompe à pompe efficace à courte portée.', NULL, 7, 3),
(10, 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\SHORTY.png', 'Shorty', 90, 50, 2.22, 55, 40, NULL, 'Petit fusil à pompe à double canon, idéal pour le combat rapproché.', NULL, 7, 3),

-- Mitrailleuses lourdes
(60, 'Contenu\img\weapon\VALORANT\Mitrailleuse\ARES.png', 'Ares', 72, 40, 13, 55, 50, NULL, 'Mitrailleuse légère avec une cadence de tir croissante.', NULL, 7, 4),
(70, 'Contenu\img\weapon\VALORANT\Mitrailleuse\ODIN.png', 'Odin', 95, 30, 12, 45, 60, NULL, 'Mitrailleuse lourde avec une forte pénétration des surfaces.', NULL, 7, 4),

-- Pistolets
(20, 'Contenu\img\weapon\VALORANT\Pistolets\CLASSIC.png', 'Classic', 78, 90, 6.75, 85, 80, NULL, 'Pistolet semi-automatique standard gratuit.', NULL, 7, 7),
(18, 'Contenu\img\weapon\VALORANT\Pistolets\FRENZY.png', 'Frenzy', 63, 95, 10, 60, 65, NULL, 'Pistolet automatique idéal pour des tirs rapides.', NULL, 7, 7),
(25, 'Contenu\img\weapon\VALORANT\Pistolets\GHOST.png', 'Ghost', 105, 85, 6.75, 70, 90, NULL, 'Pistolet silencieux avec une excellente précision.', NULL, 7, 7),
(30, 'Contenu\img\weapon\VALORANT\Pistolets\SHERIFF.png', 'Sheriff', 160, 70, 4, 50, 95, NULL, 'Pistolet puissant capable d''éliminer en un seul tir.', NULL, 7, 7),

-- Armes de mêlée
(5, 'Contenu\img\weapon\VALORANT\Armes_de_melee\COUTEAU.png', 'Couteau', 50, 100, 1.5, 90, 100, NULL, 'Arme de mêlée standard utilisée pour les attaques rapides.', NULL, 7, 9);


INSERT INTO Keyword (keywordName, idWeapon)
VALUES

-- BO1 les armes : 

-- Fusils d'assaut
('Commando', 1),
('Galil', 2),
('AUG', 3),
('FAMAS', 4),
('AK-47', 5),
('M16', 6),
('G11', 7),

-- Mitraillettes
('MP5K', 8),
('AK-74u', 9),
('PM63', 10),
('MPL', 11),
('Uzi', 12),
('Spectre', 13),
('Kiparis', 14),

-- Fusils à pompe
('SPAS-12', 15),
('Olympia', 16),
('Stakeout', 17),
('HS10', 18),

-- Mitrailleuses
('M60', 19),
('HK21', 20),
('RPK', 21),

-- Fusils tactiques
('M14', 22),
('FN FAL', 23),

-- Fusils de précision
('L96A1', 24),
('Dragunov', 25),
('WA2000', 26),

-- Pistolets
('M1911', 27),
('Python', 28),
('CZ75', 29),

-- Lanceurs
('RPG-7', 30),
('China Lake', 31),

-- Armes de mêlée
('Couteau', 32),

-- Équipement mortel
('Grenade', 33),
('Semtex', 34),
('Claymore', 35),
('C4', 36),

-- Équipement tactique
('Grenade assourdissante', 37),
('Grenade paralysante', 38),
('Grenade fumigène', 39),
('Gaz nova', 40),

-- Armes spéciales
('Crossbow', 41),
('Ballistic Knife', 42),


-- BO2 : 

-- Fusils d'assaut
('AN-94', 43),
('Type 25', 44),
('SCAR-H', 45),
('M8A1', 46),
('FAL OSW', 47),
('SMR', 48),

-- Mitraillettes
('MP7', 49),
('MSMC', 50),
('PDW-57', 51),
('Vector K10', 52),
('Chicom CQB', 53),

-- Fusils à pompe
('Remington 870 MCS', 54),
('S12', 55),
('KSG', 56),
('M1216', 57),

-- Mitrailleuses légères
('LSAT', 58),
('QBB LSW', 59),
('MK 48', 60),
('HAMR', 61),

-- Fusils de précision
('DSR-50', 62),
('Ballista', 63),
('XPR-50', 64),
('SVU-AS', 65),

-- Pistolets
('Five-Seven', 66),
('Tac-45', 67),
('Executioner', 68),
('B23R', 69),

-- Lanceurs
('RPG', 70),
('FHJ-18 AA', 71),
('SMAW', 72),

-- Armes de mêlée
('Couteau', 73),

-- Équipement mortel
('Grenade', 74),
('Semtex', 75),
('Claymore', 76),
('C4', 77),
('Hache de combat', 78),

-- Équipement tactique
('Grenade assourdissante', 79),
('Grenade paralysante', 80),
('Grenade fumigène', 81),
('Grenade IEM', 82),
('Charge éléctrique', 83),

-- Armes spéciales
('Arbalète', 84),
('Couteau balistique', 85),

-- Call of Duty: Black Ops 3
-- Fusils d'assaut
('KN-44', 86),
('HVK-30', 87),
('ICR-1', 88),
('Man-O-War', 89),

-- Mitraillettes
('VMP', 90),
('Kuda', 91),
('Weevil', 92),
('Pharo', 93),
('Vesper', 94),
('Razorback', 95),

-- Fusils à pompe
('KRM-262', 96),
('Argus', 97),
('Haymaker 12', 98),
('Brecci', 99),

-- Mitrailleuses
('BRM', 100),
('Dingo', 101),
('Gorgon', 102),
('48 Dredge', 103),

-- Fusils tactiques
('M8A7', 104),
('Sheiva', 105),

-- Fusils de précision
('Locus', 106),
('SVG-100', 107),
('Drakon', 108),
('P-06', 109),

-- Pistolets
('MR6', 110),
('RK5', 111),
('L-CAR 9', 112),

-- Lanceurs
('XM-53', 113),
('Blackcell', 114),

-- Armes de mêlée
('Couteau de combat', 115),

-- Équipement mortel
('Frag Grenade', 116),
('Semtex', 117),
('Mine Terrestre', 118),

-- Équipement tactique
('Grenade assourdissante', 119),
('Grenade fumigène', 120),
('Grenade à concussion', 121),

-- Armes spéciales
('NX ShadowClaw', 122),

-- BO4 : 
-- Fusils d'assaut
('Maddox RFB', 123),
('KN-57', 124),
('ICR-7', 125),

-- Mitraillettes
('MX9', 126),
('Cordite', 127),
('Saug-9mm', 128),

-- Fusils tactiques
('Auger DMR', 129),
('Swordfish', 130),

-- Fusils à pompe
('MOG 12', 131),
('SG12', 132),

-- Mitrailleuses légères
('Titan', 133),
('Hades', 134),

-- Fusils de précision
('Paladin HB50', 135),
('Outlaw', 136),

-- Pistolets
('RK 7 Garrison', 137),
('Strife', 138),
('Mozu', 139),

-- Lanceurs
('Hellion Salvo', 140),

-- Armes de mêlée
('Couteau de combat', 141),

-- Équipement mortel
('Grenade', 142),
('Semtex', 143),
('Claymore', 144),
('C4', 145),
('Hache de combat', 146),

-- Équipement tactique
('Grenade assourdissante', 147),
('Grenade paralysante', 148),
('Grenade fumigène', 149),
('Grenade IEM', 150),
('Capteur acoustique', 151),

-- BO5 : 
-- Fusils d'assaut
('Krig 6', 152),
('QBZ-83', 153),
('XM4', 154),
('AK-47', 155),
('FFAR 1', 156),
('Groza', 157),
('FARA 83', 158),
('C58', 159),

-- Mitraillettes
('MP5', 160),
('AK-74u', 161),
('Bullfrog', 162),
('Milano 821', 163),
('KSP 45', 164),
('MAC-10', 165),
('LC10', 166),
('PPSH-41', 167),

-- Fusils à pompe
('Hauer 77', 168),
('Gallo SA12', 169),
('Streetsweeper', 170),

-- Mitrailleuses
('Stoner 63', 171),
('RPD', 172),
('M60', 173),
('MG 82', 174),

-- Fusils tactiques
('DMR 14', 175),
('Type 63', 176),
('M16', 177),
('AUG', 178),
('CARV.2', 179),

-- Fusils de précision
('LW3 - Tundra', 180),
('Pelington 703', 181),
('M82', 182),
('ZRG 20mm', 183),
('Swiss K31', 184),

-- Pistolets
('1911', 185),
('Diamatti', 186),
('Magnum', 187),
('AMP63', 188),

-- Lanceurs
('Cigma 2', 189),
('RPG-7', 190),

-- Armes de mêlée
('Couteau de combat', 191),
('Wakizashi', 192),
('Machette', 193),
('Masse', 194),
('Batte de baseball', 195),

-- Équipement mortel
('Grenade', 196),
('C4', 197),

-- Équipement tactique
('Grenade assourdissante', 198),
('Grenade paralysante', 199),

-- Armes spéciales
('M79', 200),

-- BO6 : 
-- Fusils d'assaut
('XM4', 201),
('AS VAL', 202),
('Krig C', 203),
('AK-74', 204),
('AMES 85', 205),
('GPR 91', 206),
('Model L', 207),
('Goblin MK 2', 208),

-- Mitraillettes
('C9', 209),
('KSV', 210),
('PP-919', 211),
('Kompakt-92', 212),
('Jackel-PDW', 213),
('TANTO-22', 214),
('Saug', 215),

-- Fusils à pompe
('Marine SP', 216),
('ASG-89', 217),
('Maelstrom', 218),

-- Mitrailleuses
('PU-21', 219),
('XMG', 220),
('GPMG-7', 221),

-- Fusils tactiques
('AEK-973', 222),
('SWAFT 5.56', 223),
('Tsarkov 7.62', 224),
('DM-10', 225),

-- Fusils de précision
('LW3A1-Frostline', 226),
('SVD', 227),
('AMR-MOD-4', 228),
('LR.7.62', 229),

-- Pistolets
('9mm-pm', 230),
('Grekhova', 231),
('Gs45', 232),
('Stryder', 233),

-- Lanceurs
('HE-1', 234),
('Cigma 2', 235),

-- Armes de mêlée
('Couteau', 236),
('Perceuse', 237),
('Couperet', 238),
('Bat de Baseball', 239),

-- Équipement mortel
('Cocktail molotov', 240),
('Grenade frag', 241),

-- Équipement tactique
('Grenade flash', 242),
('Grenade paralysante', 243),
('Stimulant', 244),

-- Armes spéciales
('Sirin-9mm', 245),

-- Valorant 
-- Fusils d'assaut
('Vandal', 246),
('Phantom', 247),

-- Snipers
('Operator', 248),
('Marshal', 249),

-- Mitraillettes
('Spectre', 250),
('Stinger', 251),

-- Fusils à pompes
('Judge', 252),
('Bucky', 253),
('Shorty', 254),

-- Mitrailleuses lourdes
('Ares', 255),
('Odin', 256),

-- Pistolets
('Classic', 257),
('Frenzy', 258),
('Ghost', 259),
('Sheriff', 260),

-- Armes de mêlée
('Couteau', 261),

-- Catégories d'armes : 

-- BO1 : 
-- Fusils d'assaut
('Fusil d''assault', 1), -- Commando
('Fusil d''assault', 2), -- Galil
('Fusil d''assault', 3), -- AUG
('Fusil d''assault', 4), -- FAMAS
('Fusil d''assault', 5), -- AK-47
('Fusil d''assault', 6), -- M16
('Fusil d''assault', 7), -- G11

-- Mitraillettes
('Mitraillette', 8), -- MP5K
('Mitraillette', 9), -- AK-74u
('Mitraillette', 10), -- PM63
('Mitraillette', 11), -- MPL
('Mitraillette', 12), -- Uzi
('Mitraillette', 13), -- Spectre
('Mitraillette', 14), -- Kiparis

-- Fusils à pompe
('Fusil a pompe', 15), -- SPAS-12
('Fusil a pompe', 16), -- Olympia
('Fusil a pompe', 17), -- Stakeout
('Fusil a pompe', 18), -- HS10

-- Mitrailleuses
('Mitrailleuse', 19), -- M60
('Mitrailleuse', 20), -- HK21
('Mitrailleuse', 21), -- RPK

-- Fusils tactiques
('Fusil tactique', 22), -- M14
('Fusil tactique', 23), -- FN FAL

-- Fusils de précision
('Fusil de precision', 24), -- L96A1
('Fusil de precision', 25), -- Dragunov
('Fusil de precision', 26), -- WA2000

-- Pistolets
('Pistolet', 27), -- M1911
('Pistolet', 28), -- Python
('Pistolet', 29), -- CZ75

-- Lanceurs
('Lanceur', 30), -- RPG-7
('Lanceur', 31), -- China Lake

-- Armes de mêlée
('Arme_de_melee', 32), -- Couteau

-- Équipement mortel
('Equipement mortel', 33), -- Grenade
('Equipement mortel', 34), -- Semtex
('Equipement mortel', 35), -- Claymore
('Equipement mortel', 36), -- C4

-- Équipement tactique
('Equipement tactique', 37), -- Grenade assourdissante
('Equipement tactique', 38), -- Grenade paralysante
('Equipement tactique', 39), -- Grenade fumigène
('Equipement tactique', 40), -- Gaz nova

-- Armes spéciales
('Arme speciale', 41), -- Crossbow
('Arme speciale', 42), -- Ballistic Knife


-- BO2 : 

-- Fusils d'assaut
('Fusil d''assault', 43), -- AN-94
('Fusil d''assault', 44), -- Type 25
('Fusil d''assault', 45), -- SCAR-H
('Fusil d''assault', 46), -- M8A1
('Fusil d''assault', 47), -- FAL OSW
('Fusil d''assault', 48), -- SMR

-- Mitraillettes
('Mitraillette', 49), -- MP7
('Mitraillette', 50), -- MSMC
('Mitraillette', 51), -- PDW-57
('Mitraillette', 52), -- Vector K10
('Mitraillette', 53), -- Chicom CQB

-- Fusils à pompe
('Fusil a pompe', 54), -- Remington 870 MCS
('Fusil a pompe', 55), -- S12
('Fusil a pompe', 56), -- KSG
('Fusil a pompe', 57), -- M1216

-- Mitrailleuses légères
('Mitrailleuse', 58), -- LSAT
('Mitrailleuse', 59), -- QBB LSW
('Mitrailleuse', 60), -- MK 48
('Mitrailleuse', 61), -- HAMR

-- Fusils de précision
('Fusil de precision', 62), -- DSR-50
('Fusil de precision', 63), -- Ballista
('Fusil de precision', 64), -- XPR-50
('Fusil de precision', 65), -- SVU-AS

-- Pistolets
('Pistolet', 66), -- Five-Seven
('Pistolet', 67), -- Tac-45
('Pistolet', 68), -- Executioner
('Pistolet', 69), -- B23R

-- Lanceurs
('Lanceur', 70), -- RPG
('Lanceur', 71), -- FHJ-18 AA
('Lanceur', 72), -- SMAW

-- Armes de mêlée
('Arme_de_melee', 73), -- Couteau

-- Équipement mortel
('Equipement mortel', 74), -- Grenade
('Equipement mortel', 75), -- Semtex
('Equipement mortel', 76), -- Claymore
('Equipement mortel', 77), -- C4
('Equipement mortel', 78), -- Hache de combat

-- Équipement tactique
('Equipement tactique', 79), -- Grenade assourdissante
('Equipement tactique', 80), -- Grenade paralysante
('Equipement tactique', 81), -- Grenade fumigène
('Equipement tactique', 82), -- Grenade IEM
('Equipement tactique', 83), -- Charge électrique

-- Armes spéciales
('Arme speciale', 84), -- Arbalète
('Arme speciale', 85), -- Couteau balistique


-- BO3 :

-- Fusils d'assaut
('Fusil d''assault', 86), -- KN-44
('Fusil d''assault', 87), -- HVK-30
('Fusil d''assault', 88), -- ICR-1
('Fusil d''assault', 89), -- Man-O-War

-- Mitraillettes
('Mitraillette', 90), -- VMP
('Mitraillette', 91), -- Kuda
('Mitraillette', 92), -- Weevil
('Mitraillette', 93), -- Pharo
('Mitraillette', 94), -- Vesper
('Mitraillette', 95), -- Razorback

-- Fusils à pompe
('Fusil a pompe', 96), -- KRM-262
('Fusil a pompe', 97), -- Argus
('Fusil a pompe', 98), -- Haymaker 12
('Fusil a pompe', 99), -- Brecci

-- Mitrailleuses
('Mitrailleuse', 100), -- BRM
('Mitrailleuse', 101), -- Dingo
('Mitrailleuse', 102), -- Gorgon
('Mitrailleuse', 103), -- 48 Dredge

-- Fusils tactiques
('Fusil tactique', 104), -- M8A7
('Fusil tactique', 105), -- Sheiva

-- Fusils de précision
('Fusil de precision', 106), -- Locus
('Fusil de precision', 107), -- SVG-100
('Fusil de precision', 108), -- Drakon
('Fusil de precision', 109), -- P-06

-- Pistolets
('Pistolet', 110), -- MR6
('Pistolet', 111), -- RK5
('Pistolet', 112), -- L-CAR 9

-- Lanceurs
('Lanceur', 113), -- XM-53
('Lanceur', 114), -- Blackcell

-- Armes de mêlée
('Arme_de_melee', 115), -- Couteau de combat

-- Équipement mortel
('Equipement mortel', 116), -- Frag Grenade
('Equipement mortel', 117), -- Semtex
('Equipement mortel', 118), -- Mine Terrestre

-- Équipement tactique
('Equipement tactique', 119), -- Grenade assourdissante
('Equipement tactique', 120), -- Grenade fumigène
('Equipement tactique', 121), -- Grenade à concussion

-- Armes spéciales
('Arme speciale', 122), -- NX ShadowClaw


-- BO4 : 

-- Fusils d'assaut
('Fusil d''assault', 123), -- Maddox RFB
('Fusil d''assault', 124), -- KN-57
('Fusil d''assault', 125), -- ICR-7

-- Mitraillettes
('Mitraillette', 126), -- MX9
('Mitraillette', 127), -- Cordite
('Mitraillette', 128), -- Saug-9mm

-- Fusils tactiques
('Fusil tactique', 129), -- Auger DMR
('Fusil tactique', 130), -- Swordfish

-- Fusils à pompe
('Fusil a pompe', 131), -- MOG 12
('Fusil a pompe', 132), -- SG12

-- Mitrailleuses légères
('Mitrailleuse', 133), -- Titan
('Mitrailleuse', 134), -- Hades

-- Fusils de précision
('Fusil de precision', 135), -- Paladin HB50
('Fusil de precision', 136), -- Outlaw

-- Pistolets
('Pistolet', 137), -- RK 7 Garrison
('Pistolet', 138), -- Strife
('Pistolet', 139), -- Mozu

-- Lanceurs
('Lanceur', 140), -- Hellion Salvo

-- Armes de mêlée
('Arme_de_melee', 141), -- Couteau de combat

-- Équipement mortel
('Equipement mortel', 142), -- Grenade
('Equipement mortel', 143), -- Semtex
('Equipement mortel', 144), -- Claymore
('Equipement mortel', 145), -- C4
('Equipement mortel', 146), -- Hache de combat

-- Équipement tactique
('Equipement tactique', 147), -- Grenade assourdissante
('Equipement tactique', 148), -- Grenade paralysante
('Equipement tactique', 149), -- Grenade fumigène
('Equipement tactique', 150), -- Grenade IEM
('Equipement tactique', 151), -- Capteur acoustique


-- BO5 :

-- Fusils d'assaut
('Fusil d''assault', 152), -- Krig 6
('Fusil d''assault', 153), -- QBZ-83
('Fusil d''assault', 154), -- XM4
('Fusil d''assault', 155), -- AK-47
('Fusil d''assault', 156), -- FFAR 1
('Fusil d''assault', 157), -- Groza
('Fusil d''assault', 158), -- FARA 83
('Fusil d''assault', 159), -- C58

-- Mitraillettes
('Mitraillette', 160), -- MP5
('Mitraillette', 161), -- AK-74u
('Mitraillette', 162), -- Bullfrog
('Mitraillette', 163), -- Milano 821
('Mitraillette', 164), -- KSP 45
('Mitraillette', 165), -- MAC-10
('Mitraillette', 166), -- LC10
('Mitraillette', 167), -- PPSh-41

-- Fusils à pompe
('Fusil a pompe', 168), -- Hauer 77
('Fusil a pompe', 169), -- Gallo SA12
('Fusil a pompe', 170), -- Streetsweeper

-- Mitrailleuses
('Mitrailleuse', 171), -- Stoner 63
('Mitrailleuse', 172), -- RPD
('Mitrailleuse', 173), -- M60
('Mitrailleuse', 174), -- MG 82

-- Fusils tactiques
('Fusil tactique', 175), -- DMR 14
('Fusil tactique', 176), -- Type 63
('Fusil tactique', 177), -- M16
('Fusil tactique', 178), -- AUG
('Fusil tactique', 179), -- CARV.2

-- Fusils de précision
('Fusil de precision', 180), -- LW3 - Tundra
('Fusil de precision', 181), -- Pelington 703
('Fusil de precision', 182), -- M82
('Fusil de precision', 183), -- ZRG 20mm
('Fusil de precision', 184), -- Swiss K31

-- Pistolets
('Pistolet', 185), -- 1911
('Pistolet', 186), -- Diamatti
('Pistolet', 187), -- Magnum
('Pistolet', 188), -- AMP63

-- Lanceurs
('Lanceur', 189), -- Cigma 2
('Lanceur', 190), -- RPG-7

-- Armes de mêlée
('Arme_de_melee', 191), -- Couteau de combat
('Arme_de_melee', 192), -- Wakizashi
('Arme_de_melee', 193), -- Machette
('Arme_de_melee', 194), -- Masse
('Arme_de_melee', 195), -- Batte de baseball

-- Équipement mortel
('Equipement mortel', 196), -- Grenade
('Equipement mortel', 197), -- C4

-- Équipement tactique
('Equipement tactique', 198), -- Grenade assourdissante
('Equipement tactique', 199), -- Grenade paralysante

-- Armes spéciales
('Arme speciale', 200), -- M79


-- BO6 :

-- Fusils d'assaut
('Fusil d''assault', 201), -- XM4
('Fusil d''assault', 202), -- AS VAL
('Fusil d''assault', 203), -- Krig C
('Fusil d''assault', 204), -- AK-74
('Fusil d''assault', 205), -- AMES 85
('Fusil d''assault', 206), -- GPR 91
('Fusil d''assault', 207), -- Model L
('Fusil d''assault', 208), -- Goblin MK 2

-- Mitraillettes
('Mitraillette', 209), -- C9
('Mitraillette', 210), -- KSV
('Mitraillette', 211), -- PP-919
('Mitraillette', 212), -- Kompakt-92
('Mitraillette', 213), -- Jackel-PDW
('Mitraillette', 214), -- TANTO-22
('Mitraillette', 215), -- Saug

-- Fusils à pompe
('Fusil a pompe', 216), -- Marine SP
('Fusil a pompe', 217), -- ASG-89
('Fusil a pompe', 218), -- Maelstrom

-- Mitrailleuses
('Mitrailleuse', 219), -- PU-21
('Mitrailleuse', 220), -- XMG
('Mitrailleuse', 221), -- GPMG-7

-- Fusils tactiques
('Fusil tactique', 222), -- AEK-973
('Fusil tactique', 223), -- SWAFT 5.56
('Fusil tactique', 224), -- Tsarkov 7.62
('Fusil tactique', 225), -- DM-10

-- Fusils de précision
('Fusil de precision', 226), -- LW3A1-Frostline
('Fusil de precision', 227), -- SVD
('Fusil de precision', 228), -- AMR-MOD-4
('Fusil de precision', 229), -- LR.7.62

-- Pistolets
('Pistolet', 230), -- 9mm-pm
('Pistolet', 231), -- Grekhova
('Pistolet', 232), -- Gs45
('Pistolet', 233), -- Stryder-22

-- Lanceurs
('Lanceur', 234), -- HE-1
('Lanceur', 235), -- Cigma 2

-- Armes de mêlée
('Arme_de_melee', 236), -- Couteau
('Arme_de_melee', 237), -- Perceuse
('Arme_de_melee', 238), -- Couperet
('Arme_de_melee', 239), -- Bat de Baseball

-- Équipement mortel
('Equipement mortel', 240), -- Cocktail molotov
('Equipement mortel', 241), -- Grenade frag

-- Équipement tactique
('Equipement tactique', 242), -- Grenade flash
('Equipement tactique', 243), -- Grenade paralysante
('Equipement tactique', 244), -- Stimulant

-- Armes spéciales
('Arme speciale', 245), -- Sirin-9mm


-- Valorant : 

-- Fusils d'assaut
('Fusil d''assault', 246), -- Vandal
('Fusil d''assault', 247), -- Phantom

-- Snipers

('Fusil de precision', 248), -- Operator
('Fusil de precision', 249), -- Marshal

-- Mitraillettes
('Mitraillette', 250), -- Spectre
('Mitraillette', 251), -- Stinger

-- Fusils à pompes

('Fusil a pompe', 252), -- Judge
('Fusil a pompe', 253), -- Bucky
('Fusil a pompe', 254), -- Shorty

-- Mitrailleuses lourdes

('Mitrailleuse', 255), -- Ares
('Mitrailleuse', 256), -- Odin

-- Pistolets
('Pistolet', 257), -- Classic
('Pistolet', 258), -- Frenzy
('Pistolet', 259), -- Ghost
('Pistolet', 260), -- Sheriff

-- Armes de mêlée
('Arme_de_melee', 261), -- Couteau


-- Nom des jeux : 

-- Call of Duty: Black Ops 1

-- Fusils d'assaut
('Call Of Duty Black Ops 1', 1), -- Commando
('Call Of Duty Black Ops 1', 2), -- Galil
('Call Of Duty Black Ops 1', 3), -- AUG
('Call Of Duty Black Ops 1', 4), -- FAMAS
('Call Of Duty Black Ops 1', 5), -- AK-47
('Call Of Duty Black Ops 1', 6), -- M16
('Call Of Duty Black Ops 1', 7), -- G11

-- Mitraillettes
('Call Of Duty Black Ops 1', 8), -- MP5K
('Call Of Duty Black Ops 1', 9), -- AK-74u
('Call Of Duty Black Ops 1', 10), -- PM63
('Call Of Duty Black Ops 1', 11), -- MPL
('Call Of Duty Black Ops 1', 12), -- Uzi
('Call Of Duty Black Ops 1', 13), -- Spectre
('Call Of Duty Black Ops 1', 14), -- Kiparis

-- Fusils à pompe
('Call Of Duty Black Ops 1', 15), -- SPAS-12
('Call Of Duty Black Ops 1', 16), -- Olympia
('Call Of Duty Black Ops 1', 17), -- Stakeout
('Call Of Duty Black Ops 1', 18), -- HS-10

-- Mitrailleuses
('Call Of Duty Black Ops 1', 19), -- M60
('Call Of Duty Black Ops 1', 20), -- HK21
('Call Of Duty Black Ops 1', 21), -- RPK

-- Fusils tactiques
('Call Of Duty Black Ops 1', 22), -- M14
('Call Of Duty Black Ops 1', 23), -- FN FAL

-- Fusils de précision
('Call Of Duty Black Ops 1', 24), -- L96A1
('Call Of Duty Black Ops 1', 25), -- Dragunov
('Call Of Duty Black Ops 1', 26), -- WA2000

-- Pistolets
('Call Of Duty Black Ops 1', 27), -- M1911
('Call Of Duty Black Ops 1', 28), -- Python
('Call Of Duty Black Ops 1', 29), -- CZ75

-- Lanceurs
('Call Of Duty Black Ops 1', 30), -- RPG-7
('Call Of Duty Black Ops 1', 31), -- China Lake

-- Armes de mêlée
('Call Of Duty Black Ops 1', 32), -- Couteau

-- Équipement mortel
('Call Of Duty Black Ops 1', 33), -- Grenade
('Call Of Duty Black Ops 1', 34), -- Semtex
('Call Of Duty Black Ops 1', 35), -- Claymore
('Call Of Duty Black Ops 1', 36), -- C4

-- Équipement tactique
('Call Of Duty Black Ops 1', 37), -- Grenade assourdissante
('Call Of Duty Black Ops 1', 38), -- Grenade paralysante
('Call Of Duty Black Ops 1', 39), -- Grenade fumigène
('Call Of Duty Black Ops 1', 40), -- Gaz nova

-- Armes spéciales
('Call Of Duty Black Ops 1', 41), -- Crossbow
('Call Of Duty Black Ops 1', 42), -- Ballistic Knife


-- Call of Duty: Black Ops 2

-- Fusils d'assaut
('Call Of Duty Black Ops 2', 43), -- AN-94
('Call Of Duty Black Ops 2', 44), -- Type 25
('Call Of Duty Black Ops 2', 45), -- SCAR-H
('Call Of Duty Black Ops 2', 46), -- M8A1
('Call Of Duty Black Ops 2', 47), -- FAL OSW
('Call Of Duty Black Ops 2', 48), -- SMR

-- Mitraillettes
('Call Of Duty Black Ops 2', 49), -- MP7
('Call Of Duty Black Ops 2', 50), -- MSMC
('Call Of Duty Black Ops 2', 51), -- PDW-57
('Call Of Duty Black Ops 2', 52), -- Vector K10
('Call Of Duty Black Ops 2', 53), -- Chicom CQB

-- Fusils à pompe
('Call Of Duty Black Ops 2', 54), -- Remington 870 MCS
('Call Of Duty Black Ops 2', 55), -- S12
('Call Of Duty Black Ops 2', 56), -- KSG
('Call Of Duty Black Ops 2', 57), -- M1216

-- Mitrailleuses légères
('Call Of Duty Black Ops 2', 58), -- LSAT
('Call Of Duty Black Ops 2', 59), -- QBB LSW
('Call Of Duty Black Ops 2', 60), -- MK 48
('Call Of Duty Black Ops 2', 61), -- HAMR

-- Fusils de précision
('Call Of Duty Black Ops 2', 62), -- DSR-50
('Call Of Duty Black Ops 2', 63), -- Ballista
('Call Of Duty Black Ops 2', 64), -- XPR-50
('Call Of Duty Black Ops 2', 65), -- SVU-AS

-- Pistolets
('Call Of Duty Black Ops 2', 66), -- Five-Seven
('Call Of Duty Black Ops 2', 67), -- Tac-45
('Call Of Duty Black Ops 2', 68), -- Executioner
('Call Of Duty Black Ops 2', 69), -- B23R

-- Lanceurs
('Call Of Duty Black Ops 2', 70), -- RPG
('Call Of Duty Black Ops 2', 71), -- FHJ-18 AA
('Call Of Duty Black Ops 2', 72), -- SMAW

-- Armes de mêlée
('Call Of Duty Black Ops 2', 73), -- Couteau

-- Équipement mortel
('Call Of Duty Black Ops 2', 74), -- Grenade
('Call Of Duty Black Ops 2', 75), -- Semtex
('Call Of Duty Black Ops 2', 76), -- Claymore
('Call Of Duty Black Ops 2', 77), -- C4
('Call Of Duty Black Ops 2', 78), -- Hache de combat

-- Équipement tactique
('Call Of Duty Black Ops 2', 79), -- Grenade assourdissante
('Call Of Duty Black Ops 2', 80), -- Grenade paralysante
('Call Of Duty Black Ops 2', 81), -- Grenade fumigène
('Call Of Duty Black Ops 2', 82), -- Grenade IEM
('Call Of Duty Black Ops 2', 83), -- Charge électrique

-- Armes spéciales
('Call Of Duty Black Ops 2', 84), -- Arbalète
('Call Of Duty Black Ops 2', 85), -- Couteau balistique


-- Call of Duty: Black Ops 3

-- Fusils d'assaut
('Call Of Duty Black Ops 3', 86), -- KN-44
('Call Of Duty Black Ops 3', 87), -- HVK-30
('Call Of Duty Black Ops 3', 88), -- ICR-1
('Call Of Duty Black Ops 3', 89), -- Man-O-War

-- Mitraillettes
('Call Of Duty Black Ops 3', 90), -- VMP
('Call Of Duty Black Ops 3', 91), -- Kuda
('Call Of Duty Black Ops 3', 92), -- Weevil
('Call Of Duty Black Ops 3', 93), -- Pharo
('Call Of Duty Black Ops 3', 94), -- Vesper
('Call Of Duty Black Ops 3', 95), -- Razorback

-- Fusils à pompe
('Call Of Duty Black Ops 3', 96), -- KRM-262
('Call Of Duty Black Ops 3', 97), -- Argus
('Call Of Duty Black Ops 3', 98), -- Haymaker 12
('Call Of Duty Black Ops 3', 99), -- Brecci

-- Mitrailleuses
('Call Of Duty Black Ops 3', 100), -- BRM
('Call Of Duty Black Ops 3', 101), -- Dingo
('Call Of Duty Black Ops 3', 102), -- Gorgon
('Call Of Duty Black Ops 3', 103), -- 48 Dredge

-- Fusils tactiques
('Call Of Duty Black Ops 3', 104), -- M8A7
('Call Of Duty Black Ops 3', 105), -- Sheiva

-- Fusils de précision
('Call Of Duty Black Ops 3', 106), -- Locus
('Call Of Duty Black Ops 3', 107), -- SVG-100
('Call Of Duty Black Ops 3', 108), -- Drakon
('Call Of Duty Black Ops 3', 109), -- P-06

-- Pistolets
('Call Of Duty Black Ops 3', 110), -- MR6
('Call Of Duty Black Ops 3', 111), -- RK5
('Call Of Duty Black Ops 3', 112), -- L-CAR 9

-- Lanceurs
('Call Of Duty Black Ops 3', 113), -- XM-53
('Call Of Duty Black Ops 3', 114), -- Blackcell

-- Armes de mêlée
('Call Of Duty Black Ops 3', 115), -- Couteau de combat

-- Équipement mortel
('Call Of Duty Black Ops 3', 116), -- Frag Grenade
('Call Of Duty Black Ops 3', 117), -- Semtex
('Call Of Duty Black Ops 3', 118), -- Mine Terrestre

-- Équipement tactique
('Call Of Duty Black Ops 3', 119), -- Grenade assourdissante
('Call Of Duty Black Ops 3', 120), -- Grenade fumigène
('Call Of Duty Black Ops 3', 121), -- Grenade à concussion

-- Armes spéciales
('Call Of Duty Black Ops 3', 122), -- NX ShadowClaw


-- Call of Duty: Black Ops 4

-- Fusils d'assaut
('Call Of Duty Black Ops 4', 123), -- Maddox RFB
('Call Of Duty Black Ops 4', 124), -- KN-57
('Call Of Duty Black Ops 4', 125), -- ICR-7

-- Mitraillettes
('Call Of Duty Black Ops 4', 126), -- MX9
('Call Of Duty Black Ops 4', 127), -- Cordite
('Call Of Duty Black Ops 4', 128), -- Saug-9mm

-- Fusils tactiques
('Call Of Duty Black Ops 4', 129), -- Auger DMR
('Call Of Duty Black Ops 4', 130), -- Swordfish

-- Fusils à pompe
('Call Of Duty Black Ops 4', 131), -- MOG 12
('Call Of Duty Black Ops 4', 132), -- SG12

-- Mitrailleuses légères
('Call Of Duty Black Ops 4', 133), -- Titan
('Call Of Duty Black Ops 4', 134), -- Hades

-- Fusils de précision
('Call Of Duty Black Ops 4', 135), -- Paladin HB50
('Call Of Duty Black Ops 4', 136), -- Outlaw

-- Pistolets
('Call Of Duty Black Ops 4', 137), -- RK 7 Garrison
('Call Of Duty Black Ops 4', 138), -- Strife
('Call Of Duty Black Ops 4', 139), -- Mozu

-- Lanceurs
('Call Of Duty Black Ops 4', 140), -- Hellion Salvo

-- Armes de mêlée
('Call Of Duty Black Ops 4', 141), -- Couteau de combat

-- Équipement mortel
('Call Of Duty Black Ops 4', 142), -- Grenade
('Call Of Duty Black Ops 4', 143), -- Semtex
('Call Of Duty Black Ops 4', 144), -- Claymore
('Call Of Duty Black Ops 4', 145), -- C4
('Call Of Duty Black Ops 4', 146), -- Hache de combat

-- Équipement tactique
('Call Of Duty Black Ops 4', 147), -- Grenade assourdissante
('Call Of Duty Black Ops 4', 148), -- Grenade paralysante
('Call Of Duty Black Ops 4', 149), -- Grenade fumigène
('Call Of Duty Black Ops 4', 150), -- Grenade IEM
('Call Of Duty Black Ops 4', 151), -- Capteur acoustique

-- Call of Duty: Black Ops 5

-- Fusils d'assaut
('Call Of Duty Black Ops 5', 152), -- Krig 6
('Call Of Duty Black Ops 5', 153), -- QBZ-83
('Call Of Duty Black Ops 5', 154), -- XM4
('Call Of Duty Black Ops 5', 155), -- AK-47
('Call Of Duty Black Ops 5', 156), -- FFAR 1
('Call Of Duty Black Ops 5', 157), -- Groza
('Call Of Duty Black Ops 5', 158), -- FARA 83
('Call Of Duty Black Ops 5', 159), -- C58

-- Mitraillettes
('Call Of Duty Black Ops 5', 160), -- MP5
('Call Of Duty Black Ops 5', 161), -- AK-74u
('Call Of Duty Black Ops 5', 162), -- Bullfrog
('Call Of Duty Black Ops 5', 163), -- Milano 821
('Call Of Duty Black Ops 5', 164), -- KSP 45
('Call Of Duty Black Ops 5', 165), -- MAC-10
('Call Of Duty Black Ops 5', 166), -- LC10
('Call Of Duty Black Ops 5', 167), -- PPSH-41

-- Fusils à pompe
('Call Of Duty Black Ops 5', 168), -- Hauer 77
('Call Of Duty Black Ops 5', 169), -- Gallo SA12
('Call Of Duty Black Ops 5', 170), -- Streetsweeper

-- Mitrailleuses
('Call Of Duty Black Ops 5', 171), -- Stoner 63
('Call Of Duty Black Ops 5', 172), -- RPD
('Call Of Duty Black Ops 5', 173), -- M60
('Call Of Duty Black Ops 5', 174), -- MG 82

-- Fusils tactiques
('Call Of Duty Black Ops 5', 175), -- DMR 14
('Call Of Duty Black Ops 5', 176), -- Type 63
('Call Of Duty Black Ops 5', 177), -- M16
('Call Of Duty Black Ops 5', 178), -- AUG
('Call Of Duty Black Ops 5', 179), -- CARV.2

-- Fusils de précision
('Call Of Duty Black Ops 5', 180), -- LW3 - Tundra
('Call Of Duty Black Ops 5', 181), -- Pelington 703
('Call Of Duty Black Ops 5', 182), -- M82
('Call Of Duty Black Ops 5', 183), -- ZRG 20mm
('Call Of Duty Black Ops 5', 184), -- Swiss K31

-- Pistolets
('Call Of Duty Black Ops 5', 185), -- 1911
('Call Of Duty Black Ops 5', 186), -- Diamatti
('Call Of Duty Black Ops 5', 187), -- Magnum
('Call Of Duty Black Ops 5', 188), -- AMP63

-- Lanceurs
('Call Of Duty Black Ops 5', 189), -- Cigma 2
('Call Of Duty Black Ops 5', 190), -- RPG-7

-- Armes de mêlée
('Call Of Duty Black Ops 5', 191), -- Couteau de combat
('Call Of Duty Black Ops 5', 192), -- Wakizashi
('Call Of Duty Black Ops 5', 193), -- Machette
('Call Of Duty Black Ops 5', 194), -- Masse
('Call Of Duty Black Ops 5', 195), -- Batte de baseball

-- Équipement mortel
('Call Of Duty Black Ops 5', 196), -- Grenade
('Call Of Duty Black Ops 5', 197), -- C4

-- Équipement tactique
('Call Of Duty Black Ops 5', 198), -- Grenade assourdissante
('Call Of Duty Black Ops 5', 199), -- Grenade paralysante

-- Armes spéciales
('Call Of Duty Black Ops 5', 200), -- M79


-- Call of Duty: Black Ops 6

-- Fusils d'assaut
('Call Of Duty Black Ops 6', 201), -- XM4
('Call Of Duty Black Ops 6', 202), -- AS VAL
('Call Of Duty Black Ops 6', 203), -- Krig C
('Call Of Duty Black Ops 6', 204), -- AK-74
('Call Of Duty Black Ops 6', 205), -- AMES 85
('Call Of Duty Black Ops 6', 206), -- GPR 91
('Call Of Duty Black Ops 6', 207), -- Model L
('Call Of Duty Black Ops 6', 208), -- Goblin MK 2

-- Mitraillettes
('Call Of Duty Black Ops 6', 209), -- C9
('Call Of Duty Black Ops 6', 210), -- KSV
('Call Of Duty Black Ops 6', 211), -- PP-919
('Call Of Duty Black Ops 6', 212), -- Kompakt-92
('Call Of Duty Black Ops 6', 213), -- Jackel-PDW
('Call Of Duty Black Ops 6', 214), -- TANTO-22
('Call Of Duty Black Ops 6', 215), -- Saug

-- Fusils à pompe
('Call Of Duty Black Ops 6', 216), -- Marine SP
('Call Of Duty Black Ops 6', 217), -- ASG-89
('Call Of Duty Black Ops 6', 218), -- Maelstrom

-- Mitrailleuses
('Call Of Duty Black Ops 6', 219), -- PU-21
('Call Of Duty Black Ops 6', 220), -- XMG
('Call Of Duty Black Ops 6', 221), -- GPMG-7

-- Fusils tactiques
('Call Of Duty Black Ops 6', 222), -- AEK-973
('Call Of Duty Black Ops 6', 223), -- SWAFT 5.56
('Call Of Duty Black Ops 6', 224), -- Tsarkov 7.62
('Call Of Duty Black Ops 6', 225), -- DM-10

-- Fusils de précision
('Call Of Duty Black Ops 6', 226), -- LW3A1-Frostline
('Call Of Duty Black Ops 6', 227), -- SVD
('Call Of Duty Black Ops 6', 228), -- AMR-MOD-4
('Call Of Duty Black Ops 6', 229), -- LR.7.62

-- Pistolets
('Call Of Duty Black Ops 6', 230), -- 9mm-pm
('Call Of Duty Black Ops 6', 231), -- Grekhova
('Call Of Duty Black Ops 6', 232), -- Gs45
('Call Of Duty Black Ops 6', 233), -- Stryder-22

-- Lanceurs
('Call Of Duty Black Ops 6', 234), -- HE-1
('Call Of Duty Black Ops 6', 235), -- Cigma 2

-- Armes de mêlée
('Call Of Duty Black Ops 6', 236), -- Couteau
('Call Of Duty Black Ops 6', 237), -- Perceuse
('Call Of Duty Black Ops 6', 238), -- Couperet
('Call Of Duty Black Ops 6', 239), -- Bat de Baseball

-- Équipement mortel
('Call Of Duty Black Ops 6', 240), -- Cocktail molotov
('Call Of Duty Black Ops 6', 241), -- Grenade frag

-- Équipement tactique
('Call Of Duty Black Ops 6', 242), -- Grenade flash
('Call Of Duty Black Ops 6', 243), -- Grenade paralysante
('Call Of Duty Black Ops 6', 244), -- Stimulant

-- Armes spéciales
('Call Of Duty Black Ops 6', 245), -- Sirin-9mm

-- Valorant

-- Fusils d'assaut
('Valorant', 246), -- Vandal
('Valorant', 247), -- Phantom

-- Snipers
('Valorant', 248), -- Operator
('Valorant', 249), -- Marshal

-- Mitraillettes
('Valorant', 250), -- Spectre
('Valorant', 251), -- Stinger

-- Fusils à pompe
('Valorant', 252), -- Judge
('Valorant', 253), -- Bucky
('Valorant', 254), -- Shorty

-- Mitrailleuses lourdes
('Valorant', 255), -- Ares
('Valorant', 256), -- Odin

-- Pistolets
('Valorant', 257), -- Classic
('Valorant', 258), -- Frenzy
('Valorant', 259), -- Ghost
('Valorant', 260), -- Sheriff

-- Armes de mêlée
('Valorant', 261), -- Couteau


-- Mots clés des armes : 

-- BO1 :

-- Fusils d'assaut
('polyvalent', 1), -- Commando
('lourde', 2), -- Galil
('automatique', 3), -- AUG
('rapide', 3), -- AUG
('rapide', 4), -- FAMAS
('lourde', 5), -- AK-47
('robuste', 5), -- AK-47
('semi-automatique', 6), -- M16
('précis', 6), -- M16
('rapide', 7), -- G11

-- Mitraillettes
('légère', 8), -- MP5K
('rapprochés', 8), -- MP5K
('rapide', 9), -- AK-74u
('stable', 9), -- AK-74u
('courte', 10), -- PM63
('maniable', 11), -- MPL
('compacte', 12), -- Uzi
('cadence élevée', 12), -- Uzi
('précise', 13), -- Spectre
('faible recul', 14), -- Kiparis

-- Fusils à pompe
('puissant', 15), -- SPAS-12
('grande puissance', 16), -- Olympia
('précis', 17), -- Stakeout
('rapprochés', 17), -- Stakeout
('rapide', 18), -- HS10

-- Mitrailleuses
('lourde', 19), -- M60
('précise', 20), -- HK21
('légère', 21), -- RPK

-- Fusils tactiques
('semi-automatique', 22), -- M14
('précis', 22), -- M14
('puissant', 23), -- FN FAL

-- Fusils de précision
('précis', 24), -- L96A1
('longue portée', 24), -- L96A1
('semi-automatique', 25), -- Dragunov
('compacte', 26), -- WA2000

-- Pistolets
('classique', 27), -- M1911
('puissant', 28), -- Python
('semi-automatique', 29), -- CZ75

-- Lanceurs
('puissant', 30), -- RPG-7
('recul élevé', 31), -- China Lake

-- Armes de mêlée
('rapprochés', 32), -- Couteau

-- Équipement mortel
('explosif', 33), -- Grenade
('adhésif', 34), -- Semtex
('piège', 35), -- Claymore
('télécommandé', 36), -- C4

-- Équipement tactique
('désorienter', 37), -- Grenade assourdissante
('ralentir', 38), -- Grenade paralysante
('couvrir', 39), -- Grenade fumigène
('toxique', 40), -- Gaz nova

-- Armes spéciales
('explosif', 41), -- Crossbow
('rapprochés', 42), -- Ballistic Knife

-- BO2

-- Fusils d'assaut
('automatique', 43), -- AN-94
('rapide', 44), -- Type 25
('recul', 44), -- Type 25
('puissant', 45), -- SCAR-H
('recul modéré', 45), -- SCAR-H
('rafales', 46), -- M8A1
('précis', 46), -- M8A1
('semi-automatique', 47), -- FAL OSW
('puissant', 47), -- FAL OSW
('semi-automatique', 48), -- SMR
('puissant', 48), -- SMR

-- Mitraillettes
('légère', 49), -- MP7
('rapide', 49), -- MP7
('mobile', 50), -- MSMC
('maniable', 50), -- MSMC
('chargeur large', 51), -- PDW-57
('modérée', 51), -- PDW-57
('rapide', 52), -- Vector K10
('maniable', 52), -- Vector K10
('rafales', 53), -- Chicom CQB
('rapide', 53), -- Chicom CQB

-- Fusils à pompe
('puissant', 54), -- R-870 MCS
('rapprochés', 54), -- R-870 MCS
('semi-automatique', 55), -- S12
('rapprochés', 55), -- S12
('précis', 56), -- KSG
('longue portée', 56), -- KSG
('automatique', 57), -- M1216
('rapide', 57), -- M1216

-- Mitrailleuses légères
('précis', 58), -- LSAT
('lourde', 58), -- LSAT
('légère', 59), -- QBB LSW
('rapide', 59), -- QBB LSW
('lourde', 60), -- MK 48
('puissant', 60), -- MK 48
('cadence variable', 61), -- HAMR
('polyvalente', 61), -- HAMR

-- Fusils de précision
('gros dégâts', 62), -- DSR-50
('précis', 63), -- Ballista
('rapide', 63), -- Ballista
('semi-automatique', 64), -- XPR-50
('puissant', 64), -- XPR-50
('semi-automatique', 65), -- SVU-AS
('rapide', 65), -- SVU-AS

-- Pistolets
('léger', 66), -- Five-Seven
('précis', 66), -- Five-Seven
('semi-automatique', 67), -- Tac-45
('puissant', 67), -- Tac-45
('revolver', 68), -- Executioner
('gros dégâts', 68), -- Executioner
('rafales', 69), -- B23R
('rapide', 69), -- B23R

-- Lanceurs
('puissant', 70), -- RPG
('anti-véhicules', 70), -- RPG
('efficace', 71), -- FHJ-18 AA
('anti-aérien', 71), -- FHJ-18 AA
('polyvalent', 72), -- SMAW

-- Armes de mêlée
('rapide', 73), -- Couteau
('rapprochés', 73), -- Couteau

-- Équipement mortel
('explosif', 74), -- Grenade
('adhésif', 75), -- Semtex
('piège', 76), -- Claymore
('télécommandé', 77), -- C4
('jetable', 78), -- Hache de combat

-- Équipement tactique
('désorienter', 79), -- Grenade assourdissante
('ralentir', 80), -- Grenade paralysante
('couvrir', 81), -- Grenade fumigène
('désactiver', 82), -- Grenade IEM
('détection', 83), -- Charge éléctrique

-- Armes spéciales
('explosif', 84), -- Arbalète
('silencieux', 85), -- Couteau balistique
('rapprochés', 85), -- Couteau balistique

-- BO3 :

-- Fusils d'assaut
('équilibré', 86), -- KN-44
('automatique', 86),
('rapide', 87), -- HVK-30
('précis', 88), -- ICR-1
('puissant', 89), -- Man-O-War
('lent', 89),

-- Mitraillettes
('rapide', 90), -- VMP
('légère', 91), -- Kuda
('polyvalente', 91),
('chargeur large', 92), -- Weevil
('rafales', 93), -- Pharo
('rapide', 94), -- Vesper
('rapprochés', 94),
('portée moyenne', 95), -- Razorback

-- Fusils à pompe
('rapprochés', 96), -- KRM-262
('précis', 97), -- Argus
('semi-automatique', 98), -- Haymaker 12
('rapide', 98),
('semi-automatique', 99), -- Brecci
('polyvalent', 99),

-- Mitrailleuses
('lourde', 100), -- BRM
('précis', 100),
('rapide', 101), -- Dingo
('légère', 101),
('lente', 102), -- Gorgon
('puissant', 102),
('rafales', 103), -- 48 Dredge

-- Fusils tactiques
('rafales', 104), -- M8A7
('précis', 104),
('semi-automatique', 105), -- Sheiva
('puissant', 105),

-- Fusils de précision
('portée longue', 106), -- Locus
('précis', 106),
('lourde', 107), -- SVG-100
('puissant', 107),
('semi-automatique', 108), -- Drakon
('rapide', 108),
('tir chargé', 109), -- P-06
('rapide', 109),

-- Pistolets
('maniable', 110), -- MR6
('rafales', 111), -- RK5
('précis', 111),
('automatique', 112), -- L-CAR 9
('polyvalent', 112),

-- Lanceurs
('puissant', 113), -- XM-53
('anti-véhicules', 113),
('verrou', 114), -- Blackcell

-- Armes de mêlée
('rapide', 115), -- Couteau
('rapprochés', 115),

-- Équipement mortel
('explosif', 116), -- Grenade
('adhésif', 117), -- Semtex
('piège', 118), -- Mine Terrestre

-- Équipement tactique
('désorienter', 119), -- Grenade assourdissante
('couvrir', 120), -- Grenade fumigène
('ralentir', 121), -- Grenade à concussion

-- Armes spéciales
('silencieux', 122), -- NX ShadowClaw
('rapprochés', 122), 


-- BO4 :

-- Fusils d'assaut
('automatique', 123), -- Maddox RFB
('rapide', 123),
('courte', 124), -- KN-57
('moyenne', 125), -- ICR-7
('précis', 125),

-- Mitraillettes
('rapprochés', 126), -- MX9
('légère', 126),
('chargeur large', 127), -- Cordite
('rapide', 128), -- Saug-9mm
('maniable', 128),

-- Fusils tactiques
('semi-automatique', 129), -- Auger DMR
('puissant', 129),
('rafales', 130), -- Swordfish
('précis', 130),

-- Fusils à pompe
('puissant', 131), -- MOG 12
('rapprochés', 131),
('semi-automatique', 132), -- SG12
('rapide', 132),

-- Mitrailleuses légères
('lourde', 133), -- Titan
('chargeur large', 133),
('légère', 134), -- Hades
('rapide', 134),

-- Fusils de précision
('verrou', 135), -- Paladin HB50
('puissant', 135),
('rapide', 136), -- Outlaw
('précis', 136),

-- Pistolets
('rafales', 137), -- RK 7 Garrison
('rapprochés', 137),
('semi-automatique', 138), -- Strife
('précis', 138),
('puissant', 139), -- Mozu
('revolver', 139),

-- Lanceurs
('anti-véhicules', 140), -- Hellion Salvo
('puissant', 140),

-- Armes de mêlée
('rapprochés', 141), -- Couteau
('rapide', 141),

-- Équipement mortel
('explosif', 142), -- Grenade
('adhésif', 143), -- Semtex
('piège', 144), -- Claymore
('télécommandé', 145), -- C4
('jetable', 146), -- Hache de combat

-- Équipement tactique
('désorienter', 147), -- Grenade assourdissante
('ralentir', 148), -- Grenade paralysante
('couvrir', 149), -- Grenade fumigène
('électronique', 150), -- Grenade IEM
('détection', 151), -- Capteur acoustique

-- BO5 :

-- Fusils d'assaut
('précis', 152), -- Krig 6
('moyenne', 152),
('rapide', 153), -- QBZ-83
('polyvalent', 153),
('automatique', 154), -- XM4
('maniable', 154),
('puissant', 155), -- AK-47
('lourde', 155),
('rapide', 156), -- FFAR1
('courte', 156),
('rapprochés', 157), -- Groza
('compacte', 157),
('équilibré', 158), -- FARA83
('moyenne', 158),
('puissant', 159), -- C58
('longue', 159),

-- Mitraillettes
('rapprochés', 160), -- MP5
('légère', 160),
('compacte', 161), -- AK-74u
('moyenne', 161),
('chargeur large', 162), -- Bullfrog
('rapide', 162),
('précis', 163), -- Milano 821
('moyenne', 163),
('rafales', 164), -- KSP45
('précis', 164),
('rapide', 165), -- MAC-10
('rapprochés', 165),
('automatique', 166), -- LC10
('précis', 166),
('rapide', 167), -- PPSh-41
('grande cadence', 167),

-- Fusils à pompe
('rapprochés', 168), -- Hauer 77
('puissant', 168),
('semi-automatique', 169), -- Gallo SA12
('rapide', 169),
('polyvalent', 170), -- Streetsweeper
('rapprochés', 170),

-- Mitrailleuses
('stable', 171), -- Stoner 63
('légère', 171),
('lourde', 172), -- RPD
('puissant', 172),
('lourde', 173), -- M60
('grande capacité', 173),
('rapide', 174), -- MG82
('polyvalent', 174),

-- Fusils tactiques
('précis', 175), -- DMR14
('polyvalent', 175),
('semi-automatique', 176), -- Type 63
('puissant', 176),
('rafales', 177), -- M16
('précis', 177),
('moyenne', 178), -- AUG
('équilibré', 178),
('rapide', 179), -- CARV.2
('moderne', 179),

-- Fusils de précision
('lourde', 180), -- LW3-Tundra
('précis', 180),
('rapide', 181), -- Pelington 703
('maniable', 181),
('semi-automatique', 182), -- M82
('puissant', 182),
('longue', 183), -- ZRG 20mm
('haute puissance', 183),
('rapide', 184), -- Swiss K31
('précis', 184),

-- Pistolets
('classique', 185), -- 1911
('maniable', 185),
('rafales', 186), -- Diamatti
('rapide', 186),
('puissant', 187), -- Magnum
('précis', 187),
('automatique', 188), -- AMP63
('rapprochés', 188),

-- Lanceurs
('anti-véhicules', 189), -- Cigma 2
('polyvalent', 189),
('lourde', 190), -- RPG-7
('explosif', 190),

-- Armes de mêlée
('rapide', 191), -- Couteau
('rapprochés', 191),
('silencieux', 192), -- Wakizashi
('rapprochés', 192),
('lourde', 193), -- Machette
('rapprochés', 193),
('lourde', 194), -- Masse
('dévastateur', 194),
('classique', 195), -- Batte de baseball
('rapprochés', 195),

-- Équipement mortel
('explosif', 196), -- Grenade
('adhésif', 197), -- C4
('télécommandé', 197),

-- Équipement tactique
('désorienter', 198), -- Grenade assourdissante
('ralentir', 199), -- Grenade paralysante

-- Armes spéciales
('explosif', 200), -- M79
('compact', 200),

-- BO6 : 

-- Fusils d'assaut
('équilibré', 201), -- XM4
('polyvalent', 201),
('silencieux', 202), -- AS VAL
('rapprochés', 202),
('précis', 203), -- Krig C
('contrôlable', 203),
('moyenne', 204), -- AK-74
('robuste', 204),
('rapide', 205), -- AMES 85
('courte', 205),
('stable', 206), -- GPR 91
('équilibré', 206),
('précis', 207), -- Model L
('moyenne', 207),
('automatique', 208), -- Goblin MK 2
('rapide', 208),

-- Mitraillettes
('compacte', 209), -- C9
('rapprochés', 209),
('légère', 210), -- KSV
('maniable', 210),
('rapprochés', 211), -- PP-919
('mobile', 211),
('précis', 212), -- Kompakt-92
('légère', 212),
('rapide', 213), -- Jackel-PDW
('cadence élevée', 213),
('ultra-légère', 214), -- TANTO-22
('rapide', 214),
('polyvalente', 215), -- Saug
('mobile', 215),

-- Fusils à pompe
('puissant', 216), -- Marine SP
('courte', 216),
('lourde', 217), -- ASG-89
('dégâts élevés', 217),
('semi-automatique', 218), -- Maelstrom
('équilibré', 218),

-- Mitrailleuses
('polyvalente', 219), -- PU-21
('stable', 219),
('précision', 220), -- XMG
('modérée', 220),
('lourde', 221), -- GPMG-7
('grande capacité', 221),

-- Fusils tactiques
('semi-automatique', 222), -- AEK-973
('précis', 222),
('longue portée', 223), -- SWAFT 5.56
('précision maximale', 223),
('lourde', 224), -- Tsarkov 7.62
('puissant', 224),
('verrou', 225), -- DM-10
('suivi rapide', 225),

-- Fusils de précision
('précis', 226), -- LW3A1-Frostline
('longue portée', 226),
('semi-automatique', 227), -- SVD
('fiable', 227),
('anti-matériel', 228), -- AMR-MOD-4
('puissant', 228),
('verrou', 229), -- LR.7.62
('stabilité', 229),

-- Pistolets
('compact', 230), -- 9mm-pm
('efficace', 230),
('semi-automatique', 231), -- Grekhova
('contrôle', 231),
('moderne', 232), -- Gs45
('précis', 232),
('automatique', 233), -- Stryder-22
('rapide', 233),

-- Lanceurs
('polyvalent', 234), -- HE-1
('anti-blindage', 234),
('anti-aérien', 235), -- Cigma 2
('lourde', 235),

-- Armes de mêlée
('silencieux', 236), -- Couteau
('rapprochés', 236),
('improvisée', 237), -- Perceuse
('dégâts lourds', 237),
('tranchante', 238), -- Couperet
('rapprochés', 238),
('rapide', 239), -- Bat de Baseball
('efficace', 239),

-- Équipement mortel
('incendiaire', 240), -- Cocktail Molotov
('explosif', 241), -- Grenade frag
('standard', 241),

-- Équipement tactique
('désorienter', 242), -- Grenade flash
('ralentir', 243), -- Grenade paralysante
('soin', 244), -- Stimulant

-- Armes spéciales
('unique', 245), -- Sirin-9mm
('précis', 245),
('rapide', 245),


-- Fusils d'assaut
('puissant', 246), -- Vandal
('moyenne', 246),
('silencieux', 247), -- Phantom
('courte', 247),
('moyenne', 247),

-- Snipers

('verrou', 248), -- Operator
('lourde', 248),
('puissant', 248),
('rapide', 249), -- Marshal
('légère', 249),
('précise', 249),

-- Mitraillettes
('silencieux', 250), -- Spectre
('rapide', 250),
('rapprochés', 250),
('rapide', 251), -- Stinger
('courte', 251),
('cadence élevée', 251),

-- Fusils à pompe
('semi-automatique', 252), -- Judge
('puissant', 252),
('rapprochés', 252),
('courte', 253), -- Bucky
('lourde', 253),
('rapprochés', 254), -- Shorty
('double canon', 254),

-- Mitrailleuses lourdes

('légère', 255), -- Ares
('cadence croissante', 255),
('lourde', 256), -- Odin
('pénétration élevée', 256),
('puissante', 256),

-- Pistolets
('semi-automatique', 257), -- Classic
('standard', 257),
('automatique', 258), -- Frenzy
('rapide', 258),
('silencieux', 259), -- Ghost
('précis', 259),
('puissant', 260), -- Sheriff
('longue portée', 260),

-- Armes de mêlée
('rapide', 261), -- Couteau
('silencieux', 261),
('rapprochés', 261);


-- Requêtes SQL pour insérer les anecdotes des armes de Call Of Duty Black Ops 1

UPDATE weapon
SET anecdote = 'Cette arme symbolise la guerre froide et reflète les racines soviétiques du conflit.',
    description = 'Cette arme se distingue par ses dégâts élevés, mais un recul difficile à contrôler.'
WHERE weaponname = 'AK-47';

UPDATE weapon
SET anecdote = 'Cette arme est inspirée du Colt Model 733.',
    description = 'Fusil d’assaut offrant une cadence de tir élevée et une faible dispersion des balles.'
WHERE weaponname = 'Commando';

UPDATE weapon
SET anecdote = 'Cette arme est célèbre pour être un fusil de chasse',
    description = 'Cette arme est capable de délivrer des dégâts à courte portée rapidement.'
WHERE weaponname = 'SPAS-12';

UPDATE weapon
SET anecdote = 'Inspiré des fusils de chasse classiques, il se distingue par sa puissance dans les combats rapprochés.',
    description = 'Fusil à double canon offrant de gros dégâts à courte portée, mais nécessitant des rechargements fréquents.'
WHERE weaponname = 'Olympia';

UPDATE weapon
SET anecdote = 'Inspiré des fusils à pompe tactiques utilisés par les forces de l’ordre.',
    description = 'Fusil à pompe avec une cadence de tir modérée, mais capable d’infliger des dégâts massifs à courte portée.'
WHERE weaponname = 'Stakeout';

UPDATE weapon
SET anecdote = 'Principalement utilisé par les forces spéciales pour des opérations rapprochées.',
    description = 'Fusil à pompe semi-automatique avec une cadence de tir rapide, mais des dégâts réduits à longue portée.'
WHERE weaponname = 'HS10';

UPDATE weapon
SET anecdote = 'Inspiré du Colt Python, très apprécié des collectionneurs d''armes, il est mortel en mode multijoueur.',
    description = 'Revolver à haute pénétration, capable de tuer en un coup à courte portée.'
WHERE weaponname = 'Python';

UPDATE weapon
SET anecdote = 'Connu pour être l''un des pistolets les plus copiés au monde, en raison de sa robustesse et de sa précision.',
    description = 'Pistolet semi-automatique avec une cadence de tir rapide et une bonne précision.'
WHERE weaponname = 'CZ75';

UPDATE weapon
SET anecdote = 'Le RPG-7 est l''une des armes les plus répandues dans le monde, célèbre pour sa simplicité et sa puissance.',
    description = 'Lance-roquettes polyvalent à munitions multiples, non guidé mais extrêmement puissant contre les véhicules et les groupes d''ennemis.'
WHERE weaponname = 'RPG-7';

UPDATE weapon
SET anecdote = 'Utilisé par les forces spéciales américaines pendant la guerre du Vietnam, redoutable en mode multijoueur pour les dégâts de zone.',
    description = 'Lance-grenades à pompe capable de tirer des projectiles explosifs avec une cadence modérée.'
WHERE weaponname = 'China Lake';

UPDATE weapon
SET anecdote = 'Utilisé principalement par les forces soviétiques et les pays du bloc de l''Est.',
    description = 'Semi-automatique avec une portée moyenne, conçu pour des tirs rapides et précis.'
WHERE weaponname = 'WA2000';


UPDATE weapon
SET anecdote = 'Utilisé par les forces spéciales américaines pendant la guerre du Vietnam, redoutable en mode multijoueur pour les dégâts de zone.',
    description = 'Lance-grenades à pompe capable de tirer des projectiles explosifs avec une cadence modérée.'
WHERE weaponname = 'Dragunov';


UPDATE weapon
SET anecdote = 'Utilisé par les tireurs d’élite britanniques, reconnu pour sa précision sur de longues distances.',
    description = 'Fusil de précision à verrou, offrant une grande puissance de feu à longue portée.'
WHERE weaponname = 'L96A1';

UPDATE weapon
SET anecdote = 'Cette arme est une représentation de l’arme utilisée par les forces américaines au Vietnam.',
    description = 'Fusil d’assaut avec une rafale de 3 coups pour une meilleure précision.'
WHERE weaponname = 'M16';

UPDATE weapon
SET anecdote = 'Cette arme représente l’arme de service standard des forces françaises.',
    description = 'Fusil d’assaut offrant une cadence rapide avec une précision réduite en mode de tir prolongé.'
WHERE weaponname = 'FAMAS';

UPDATE weapon
SET anecdote = 'Cette arme est une dérivée de l’AK-47 conçue pour l’armée israélienne.',
    description = 'Fusil d’assaut offrant un bon compromis entre la portée, la cadence et les dégâts.'
WHERE weaponname = 'Galil';

UPDATE weapon
SET anecdote = 'Cette arme est équipée d’une lunette, ce qui en fait un hybride entre un fusil d’assaut et un fusil de précision.',
    description = 'Fusil d’assaut avec une cadence de tir rapide ainsi qu’une grande précision de tir.'
WHERE weaponname = 'AUG';

UPDATE weapon
SET anecdote = 'Cette arme a été utilisée dans plus de 90 pays et est surnommée “le bras droit du monde libre”.',
    description = 'Fusil d’assaut semi-automatique avec une grande précision.'
WHERE weaponname = 'FN FAL';

UPDATE weapon
SET anecdote = 'Cette arme se distingue par son design futuriste et sa cadence élevée.',
    description = 'Fusil d’assaut expérimental à rafale qui utilise des munitions sans étui afin d’améliorer la cadence de tir.'
WHERE weaponname = 'G11';

UPDATE weapon
SET anecdote = 'Cette arme est souvent utilisée pour des actions rapides en multijoueurs.',
    description = 'Mitraillette avec une excellente cadence de tir, idéale pour les affrontements à courtes distances.'
WHERE weaponname = 'MP5K';

UPDATE weapon
SET anecdote = 'Cette arme combine la robustesse de l’AK-47 et la maniabilité d’une mitraillette.',
    description = 'Version compacte de l’AK-47 avec une cadence de tir plus élevée.'
WHERE weaponname = 'AK-74u';

UPDATE weapon
SET anecdote = 'Cette arme est devenue emblématique suite à son utilisation par les forces israéliennes.',
    description = 'Mitraillette célèbre pour sa cadence de tir rapide ainsi que son design compact.'
WHERE weaponname = 'Uzi';

UPDATE weapon
SET anecdote = 'Cette arme est inspirée d’une mitraillette italienne des années 1980.',
    description = 'Mitraillette légère avec une haute cadence de tir.'
WHERE weaponname = 'Spectre';

UPDATE weapon
SET anecdote = 'Cette arme était utilisée par les forces spéciales polonaises dans les années 1970.',
    description = 'Mitraillette compacte avec une faible portée mais une cadence de tir rapide.'
WHERE weaponname = 'PM63';

UPDATE weapon
SET anecdote = 'L’arme est issue des usines militaires soviétiques pour un usage rapide et efficace en combat rapproché.',
    description = 'Mitraillette compacte et adaptée aux affrontements rapides.'
WHERE weaponname = 'Kiparis';

UPDATE weapon
SET anecdote = 'Conçue comme une arme de soutien pour des combats de longue durée.',
    description = 'Mitrailleuse légère avec des dégâts élevés et une bonne portée.'
WHERE weaponname = 'RPK';

UPDATE weapon
SET anecdote = 'Utilisée par les forces armées pour dominer les combats de longue durée avec un feu constant.',
    description = 'Mitrailleuse légère avec une grande capacité de munitions et une cadence de tir rapide.'
WHERE weaponname = 'HK21';

UPDATE weapon
SET anecdote = 'Souvent surnommée "The Pig" par les soldats américains en raison de son poids et de sa puissance dans la guerre du Vietnam.',
    description = 'Mitrailleuse légère puissante, mais avec une cadence de tir lente.'
WHERE weaponname = 'M60';

-- Mitraillettes
UPDATE weapon
SET anecdote = 'La MPL est une mitraillette légère avec une cadence rapide, idéale pour les engagements rapides.',
    description = 'Compacte et maniable, cette mitraillette excelle dans les combats rapprochés grâce à sa cadence élevée.'
WHERE weaponname = 'MPL';

-- Fusils tactiques
UPDATE weapon
SET anecdote = 'En tant qu''arme de poing de combat, un 1911 bien réglé est inégalé : excellente ergonomie, sécurités redondantes, fiabilité, longévité, et la meilleure détente sur un pistolet de service, idéale pour un tir rapide.',
    description = 'Pistolet classique avec une bonne maniabilité.'
WHERE weaponname = 'M1911';

-- Pistolets
UPDATE weapon
SET anecdote = 'En tant qu''arme de poing de combat, un 1911 bien réglé est inégalé : excellente ergonomie, sécurités redondantes, fiabilité, longévité, et la meilleure détente sur un pistolet de service, idéale pour un tir rapide.',
    description = 'Fusil semi-automatique, utilisé comme arme de support grâce à sa précision et ses dégâts élevés.'
WHERE weaponname = 'M14';

-- Armes de mêlée
UPDATE weapon
SET anecdote = 'Le Couteau est l''arme de choix pour les joueurs cherchant des éliminations silencieuses.',
    description = 'Arme blanche rapide et légère, parfaite pour des attaques furtives et rapides.'
WHERE weaponname = 'Couteau';

-- Équipement mortel
UPDATE weapon
SET anecdote = 'La Grenade est un explosif classique efficace pour neutraliser des groupes ennemis dans un rayon.',
    description = 'Grenade à fragmentation causant des dégâts de zone, idéale pour les situations d’assaut.'
WHERE weaponname = 'Grenade';

UPDATE weapon
SET anecdote = 'La Claymore est un piège redoutable pour protéger des passages ou des zones stratégiques.',
    description = 'Explosif directionnel déclenché par un capteur de mouvement, conçu pour des frappes stratégiques.'
WHERE weaponname = 'Claymore';

UPDATE weapon
SET anecdote = 'Le C4 est une arme polyvalente permettant des explosions télécommandées.',
    description = 'Explosif plastique déclenchable à distance, parfait pour neutraliser des véhicules ou des groupes.'
WHERE weaponname = 'C4';

-- Équipement tactique
UPDATE weapon
SET anecdote = 'La Grenade assourdissante désoriente les ennemis, offrant un avantage crucial en combat rapproché.',
    description = 'Grenade tactique neutralisant temporairement les sens des adversaires.'
WHERE weaponname = 'Grenade assourdissante';

UPDATE weapon
SET anecdote = 'La Grenade paralysante réduit les mouvements des ennemis, les rendant vulnérables.',
    description = 'Explosif tactique conçu pour immobiliser temporairement les adversaires.'
WHERE weaponname = 'Grenade paralysante';

UPDATE weapon
SET anecdote = 'La Grenade fumigène est utilisée pour masquer des déplacements ou créer des diversions.',
    description = 'Équipement tactique générant un écran de fumée dense, parfait pour les stratégies défensives.'
WHERE weaponname = 'Grenade fumigène';

UPDATE weapon
SET anecdote = 'Le Gaz nova intoxique les ennemis, réduisant leur vision et leur mobilité.',
    description = 'Équipement tactique libérant un gaz toxique, idéal pour perturber les positions adverses.'
WHERE weaponname = 'Gaz nova';

-- Armes spéciales
UPDATE weapon
SET anecdote = 'Le Crossbow est une arme silencieuse redoutée pour ses projectiles explosifs.',
    description = 'Arbalète moderne capable de tirer des flèches explosives, efficace dans les stratégies furtives.'
WHERE weaponname = 'Crossbow';

UPDATE weapon
SET anecdote = 'Le Ballistic Knife est prisé pour ses éliminations créatives et furtives en multijoueur.',
    description = 'Couteau spécial avec un mécanisme de projection, permettant des attaques rapides à distance.'
WHERE weaponname = 'Ballistic Knife';

-- Requêtes SQL pour insérer les anecdotes des armes de Call Of Duty Black Ops 2

UPDATE weapon
SET anecdote = 'Conçu pour les forces israéliennes, le MTAR combine rapidité et maniabilité, ce qui le rend idéal en multijoueur'
WHERE weaponname = 'MTAR';

UPDATE weapon
SET anecdote = 'Basé sur le fusil QBZ-95 chinois, très populaire dans l''armée chinoise et dans les forces de sécurité'
WHERE weaponname = 'Type 25';

UPDATE weapon
SET anecdote = 'Elle est inspirée des fusils tactiques modernes conçus pour les opérations spéciales'
WHERE weaponname = 'SWAT-556';

UPDATE weapon
SET anecdote = 'Connue comme une évolution du FN FAL, elle est souvent associée aux opérations militaires des années 1960'
WHERE weaponname = 'FAL OSW';

UPDATE weapon
SET anecdote = 'Basé sur le M27 Infantry Automatic Rifle, il est conçu pour un soutien efficace en combat rapproché'
WHERE weaponname = 'M27';

UPDATE weapon
SET anecdote = 'Le SCAR-H est une arme standard des forces spéciales américaines, utilisée pour sa capacité à tirer des balles de gros calibre'
WHERE weaponname = 'SCAR-H';

UPDATE weapon
SET anecdote = 'L''AN-94 est un fusil de précision conçu pour des engagements à moyenne et longue portée'
WHERE weaponname = 'AN-94';

UPDATE weapon
SET anecdote = 'Inspirée par des armes de défense personnelle, elle est parfaite pour submerger des ennemis dans des combats rapides'
WHERE weaponname = 'PDW-57';

UPDATE weapon
SET anecdote = 'Elle est basée sur la Kriss Vector, utilisée principalement pour des opérations tactiques en milieu urbain'
WHERE weaponname = 'Vector K10';

UPDATE weapon
SET anecdote = 'Conçu pour l''armée indienne, le MSMC est une arme moderne efficace à courte distance'
WHERE weaponname = 'MSMC';

UPDATE weapon
SET anecdote = 'Le SMR est connu pour sa puissance de feu et sa précision, le rendant redoutable à moyenne distance.',
    description = 'Fusil tactique semi-automatique offrant une précision et des dégâts exceptionnels.'
WHERE weaponname = 'SMR';

UPDATE weapon
SET anecdote = 'Le M8A1 est réputé pour ses tirs en rafales, idéal pour les engagements tactiques.',
    description = 'Fusil tactique avec une cadence de tir équilibrée et une précision remarquable.'
WHERE weaponname = 'M8A1';

UPDATE weapon
SET anecdote = 'Le MP7 est apprécié pour sa rapidité et sa maniabilité, parfait pour les combats rapprochés.',
    description = 'Mitraillette compacte avec une cadence de tir rapide et une bonne stabilité.'
WHERE weaponname = 'MP7';

UPDATE weapon
SET anecdote = 'Le SMAW est une arme efficace pour neutraliser rapidement les véhicules ennemis.',
    description = 'Lance-roquettes portable avec une grande capacité de destruction pour les cibles fixes ou mobiles.'
WHERE weaponname = 'SMAW';

UPDATE weapon
SET anecdote = 'Le Couteau de combat est conçu pour les éliminations silencieuses, parfait pour les missions furtives.',
    description = 'Arme blanche légère offrant une rapidité d''exécution pour les engagements rapprochés.'
WHERE weaponname = 'Couteau de combat';

UPDATE weapon
SET anecdote = 'La charge éléctrique est un équipement tactique emblématique de Call Of Duty Balck Ops 2, car souvent utilisé pour la pratique du "Trickshot", très populaire à l''époque.',
    description = 'Dispositif tactique qui immobilise les adversaires grâce à une décharge électrique.'
WHERE weaponname = 'Charge électrique';

-- Requêtes SQL pour insérer les anecdotes des armes de Call Of Duty Black Ops 3

UPDATE weapon
SET anecdote = 'Inspiré de l''AK-47, c’est une arme polyvalente idéale pour la majorité des combats'
WHERE weaponname = 'KN-44';

UPDATE weapon
SET anecdote = 'Il est apprécié pour sa puissance et sa polyvalence en combat rapproché ou à distance'
WHERE weaponname = 'Man-O-War';

UPDATE weapon
SET anecdote = 'Connu pour sa maniabilité, il est souvent utilisé dans les combats rapides en multijoueur'
WHERE weaponname = 'HVK-30';

UPDATE weapon
SET anecdote = 'Idéal pour les joueurs privilégiant la précision, il se distingue par sa stabilité remarquable'
WHERE weaponname = 'ICR-1';

UPDATE weapon
SET anecdote = 'Inspiré des armes de tir de précision, il est redoutable à moyenne et longue portée'
WHERE weaponname = 'Sheiva';

UPDATE weapon
SET anecdote = 'Basé sur des armes militaires modernes, il est souvent choisi pour son efficacité tactique'
WHERE weaponname = 'M8A7';

UPDATE weapon
SET anecdote = 'Polyvalente, elle est idéale pour les combats rapprochés tout en maintenant une certaine portée'
WHERE weaponname = 'Kuda';

UPDATE weapon
SET anecdote = 'Très populaire en combat rapproché pour abattre rapidement des ennemis dans des environnements confinés'
WHERE weaponname = 'VMP';

UPDATE weapon
SET anecdote = 'Inspirée des armes de défense personnelle, elle est efficace pour submerger les adversaires'
WHERE weaponname = 'Weevil';

UPDATE weapon
SET anecdote = 'Connue pour son recul difficile à contrôler, elle exige une bonne maîtrise'
WHERE weaponname = 'Vesper';

-- Armes de mêlée
UPDATE weapon
SET anecdote = 'Le Couteau de combat est parfait pour les éliminations silencieuses, idéal pour les missions furtives.',
    description = 'Arme blanche légère et rapide, conçue pour neutraliser les ennemis sans faire de bruit.'
WHERE weaponname = 'Couteau de combat';

-- Équipement mortel
UPDATE weapon
SET anecdote = 'La Frag Grenade est une arme polyvalente utilisée pour infliger des dégâts dans une zone étendue.',
    description = 'Grenade classique à fragmentation, idéale pour neutraliser plusieurs ennemis dans un espace confiné.'
WHERE weaponname = 'Frag Grenade';

UPDATE weapon
SET anecdote = 'Le Semtex est apprécié pour sa capacité à adhérer aux surfaces, parfait pour des éliminations précises.',
    description = 'Explosif collant efficace contre les véhicules et les positions ennemies fortifiées.'
WHERE weaponname = 'Semtex';

UPDATE weapon
SET anecdote = 'La Mine terrestre est une arme redoutable pour sécuriser des zones ou des passages stratégiques.',
    description = 'Explosif à déclenchement par mouvement, idéal pour piéger les adversaires.'
WHERE weaponname = 'Mine Terrestre';

-- Équipement tactique
UPDATE weapon
SET anecdote = 'La Grenade assourdissante désoriente les ennemis, offrant un avantage stratégique crucial.',
    description = 'Grenade qui neutralise temporairement les capacités sensorielles des adversaires.'
WHERE weaponname = 'Grenade assourdissante';

UPDATE weapon
SET anecdote = 'La Grenade fumigène est utilisée pour masquer les déplacements ou sécuriser des objectifs.',
    description = 'Équipement tactique déployant un écran de fumée dense pour perturber la visibilité.'
WHERE weaponname = 'Grenade fumigène';

UPDATE weapon
SET anecdote = 'La Grenade à concussion ralentit les ennemis, les rendant vulnérables aux attaques.',
    description = 'Grenade tactique qui désoriente et réduit les mouvements des adversaires à courte portée.'
WHERE weaponname = 'Grenade à concussion';

-- Armes spéciales
UPDATE weapon
SET anecdote = 'La NX ShadowClaw est une arme silencieuse redoutée pour ses projectiles précis et létaux.',
    description = 'Arbalète moderne capable de tirer des flèches silencieuses, efficace pour les approches furtives.'
WHERE weaponname = 'NX ShadowClaw';

-- Requêtes SQL pour insérer les anecdotes des armes de Call Of Duty Black Ops 4

UPDATE weapon
SET anecdote = 'Similaire au M27 de "Black Ops 2", il est souvent utilisé pour sa précision et sa stabilité à longue distance.',
    description = 'Fusil d’assaut automatique avec une grande précision et un faible recul, mais des dégâts modérés.'
WHERE weaponname = 'ICR-7';

UPDATE weapon
SET anecdote = 'Apprécié pour sa maniabilité, il est utilisé dans les situations de combat rapproché.',
    description = 'Fusil d’assaut automatique combinant une cadence rapide et une précision modérée.'
WHERE weaponname = 'VAPR-XKG';

UPDATE weapon
SET anecdote = 'Inspiré de l’AK-47, il allie puissance et polyvalence en combat.',
    description = 'Fusil d’assaut automatique offrant des dégâts élevés et une cadence stable.'
WHERE weaponname = 'KN-57';

UPDATE weapon
SET anecdote = 'Idéal pour les joueurs agressifs, il excelle dans les situations de combat rapide.',
    description = 'Fusil d’assaut avec une cadence de tir élevée et une bonne mobilité.'
WHERE weaponname = 'Maddox RFB';

UPDATE weapon
SET anecdote = 'Basé sur le FN SCAR-H, il est utilisé pour les engagements à longue distance.',
    description = 'Fusil d’assaut puissant avec des dégâts importants mais un recul prononcé.'
WHERE weaponname = 'Rampart 17';

UPDATE weapon
SET anecdote = 'Souvent choisi pour son efficacité dans les combats tactiques à moyenne portée.',
    description = 'Fusil d’assaut automatique avec une précision et une stabilité excellentes.'
WHERE weaponname = 'Swat RFT';

UPDATE weapon
SET anecdote = 'Inspiré du Galil, il est populaire pour sa polyvalence sur le terrain.',
    description = 'Fusil d’assaut automatique équilibré avec une bonne cadence de tir.'
WHERE weaponname = 'Grav';

UPDATE weapon
SET anecdote = 'Très polyvalente, elle est idéale pour les engagements rapides en milieu confiné.',
    description = 'Mitraillette compacte avec une cadence modérée et une grande précision.'
WHERE weaponname = 'MX9';

UPDATE weapon
SET anecdote = 'Inspirée des armes modernes de défense personnelle, elle excelle à moyenne portée.',
    description = 'Mitraillette offrant une précision élevée avec un recul limité.'
WHERE weaponname = 'GKS';

UPDATE weapon
SET anecdote = 'Très prisée dans les parties rapides, parfaite pour des combats en environnement clos où la rapidité est essentielle.',
    description = 'Mitraillette avec la cadence de tir la plus rapide, mais des dégâts réduits et un recul difficile à contrôler.'
WHERE weaponname = 'Spitfire';

UPDATE weapon
SET anecdote = 'Souvent utilisée dans des situations où la puissance de feu continue est essentielle.',
    description = 'Mitraillette avec un grand chargeur et une cadence rapide, idéale pour les assauts prolongés.'
WHERE weaponname = 'Cordite';

UPDATE weapon
SET anecdote = 'Appréciée pour sa maniabilité, elle est redoutable en combat rapproché.',
    description = 'Mitraillette légère et rapide, mais avec une portée limitée.'
WHERE weaponname = 'Saug 9mm';

UPDATE weapon
SET anecdote = 'Elle se distingue par sa cadence stable et ses dégâts constants.',
    description = 'Mitraillette avec un tir en rafale très précis, idéale pour les engagements tactiques.'
WHERE weaponname = 'Daemon 3XB';

UPDATE weapon
SET anecdote = 'Connue pour sa grande mobilité, elle est efficace dans les assauts agressifs.',
    description = 'Mitraillette ultrarapide avec un faible recul, adaptée aux combats rapprochés.'
WHERE weaponname = 'Switchblade X9';

-- Ajout des armes et équipements demandés
-- Équipement mortel
UPDATE weapon
SET anecdote = 'La Grenade est un classique intemporel, utilisée pour infliger des dégâts dans une zone étendue.',
    description = 'Explosif polyvalent efficace pour neutraliser plusieurs ennemis dans des espaces confinés.'
WHERE weaponname = 'Grenade';

UPDATE weapon
SET anecdote = 'Le Semtex est connu pour sa capacité à adhérer aux surfaces, offrant des éliminations précises.',
    description = 'Explosif collant idéal pour des cibles fixes ou des véhicules ennemis.'
WHERE weaponname = 'Semtex';

UPDATE weapon
SET anecdote = 'La Claymore est redoutable pour protéger des zones ou tendre des pièges aux adversaires.',
    description = 'Mine explosive à détection de mouvement, conçue pour la défense stratégique.'
WHERE weaponname = 'Claymore';

UPDATE weapon
SET anecdote = 'Le C4 est une arme tactique puissante, permettant des explosions contrôlées à distance.',
    description = 'Explosif plastique déclenchable manuellement, idéal pour neutraliser des groupes ou des véhicules.'
WHERE weaponname = 'C4';

UPDATE weapon
SET anecdote = 'La Hache de combat est une arme redoutée pour ses éliminations instantanées.',
    description = 'Arme de jet tranchante, idéale pour des frappes rapides et létales.'
WHERE weaponname = 'Hache de combat';

-- Équipement tactique
UPDATE weapon
SET anecdote = 'La Grenade assourdissante neutralise temporairement les ennemis, offrant un avantage stratégique.',
    description = 'Équipement tactique conçu pour désorienter les adversaires en limitant leurs sens.'
WHERE weaponname = 'Grenade assourdissante';

UPDATE weapon
SET anecdote = 'La Grenade paralysante ralentit les ennemis, les rendant vulnérables aux attaques.',
    description = 'Grenade qui réduit la mobilité et la réactivité des adversaires à courte portée.'
WHERE weaponname = 'Grenade paralysante';

UPDATE weapon
SET anecdote = 'La Grenade fumigène est utilisée pour masquer les déplacements ou perturber la visibilité ennemie.',
    description = 'Équipement tactique qui déploie un écran de fumée dense, idéal pour les stratégies offensives ou défensives.'
WHERE weaponname = 'Grenade fumigène';

UPDATE weapon
SET anecdote = 'La Grenade IEM est redoutable pour désactiver les équipements électroniques ennemis.',
    description = 'Équipement tactique conçu pour neutraliser les systèmes électroniques sur le champ de bataille.'
WHERE weaponname = 'Grenade IEM';

UPDATE weapon
SET anecdote = 'Le Capteur acoustique est un outil stratégique pour localiser les ennemis à proximité.',
    description = 'Dispositif électronique qui détecte les bruits et les mouvements ennemis, offrant un avantage tactique.'
WHERE weaponname = 'Capteur acoustique';

-- Requêtes SQL pour insérer les anecdotes des armes de Valorant

UPDATE Weapon
SET anecdote = 'Inspiré des AK classiques, il est préféré par les joueurs cherchant des tirs décisifs en un coup'
WHERE weaponname = 'Vandal';

UPDATE Weapon
SET anecdote = 'Souvent choisi pour sa fiabilité, il excelle dans les engagements silencieux grâce à son suppresseur'
WHERE weaponname = 'Phantom';

UPDATE Weapon
SET anecdote = 'Arme emblématique de Valorant, elle est redoutée pour sa capacité à dominer les lignes de vue'
WHERE weaponname = 'Operator';

UPDATE Weapon
SET anecdote = 'Souvent utilisé comme alternative économique, il récompense les joueurs précis et rapides'
WHERE weaponname = 'Marshal';

UPDATE Weapon
SET anecdote = 'Idéale pour les combats rapprochés, elle est parfaite pour surprendre les adversaires dans les angles'
WHERE weaponname = 'Spectre';

UPDATE Weapon
SET anecdote = 'Connue pour son efficacité dans les engagements rapides, elle est souvent choisie dans les rounds d''eco'
WHERE weaponname = 'Stinger';

UPDATE Weapon
SET anecdote = 'Populaire pour les défenses en sites confinés, il est souvent redouté dans les angles étroits'
WHERE weaponname = 'Judge';

UPDATE Weapon
SET anecdote = 'Apprécié pour ses tirs secondaires à longue portée, il est redoutable entre de bonnes mains'
WHERE weaponname = 'Bucky';

UPDATE Weapon
SET anecdote = 'Souvent utilisé pour des éliminations rapides à très courte portée'
WHERE weaponname = 'Shorty';

UPDATE Weapon
SET anecdote = 'Parfaite pour submerger les adversaires, elle excelle dans les scénarios de suppression'
WHERE weaponname = 'Ares';

UPDATE Weapon
SET anecdote = 'Connu pour sa capacité à percer les murs, il est souvent utilisé pour dominer les zones étroites'
WHERE weaponname = 'Odin';

UPDATE Weapon
SET anecdote = 'Arme par défaut de tous les joueurs, elle est appréciée pour sa polyvalence'
WHERE weaponname = 'Classic';

UPDATE Weapon
SET anecdote = 'Idéal pour les engagements rapprochés, il est souvent choisi pour des rushs agressifs'
WHERE weaponname = 'Frenzy';

UPDATE Weapon
SET anecdote = 'Souvent préféré pour les rounds pistol grâce à sa capacité à éliminer en un tir à la tête sans armure'
WHERE weaponname = 'Ghost';

UPDATE Weapon
SET anecdote = 'Inspiré des armes western, il est redouté pour ses éliminations en un coup à longue portée'
WHERE weaponname = 'Sheriff';

UPDATE Weapon
SET anecdote = 'Souvent utilisé pour les duels humoristiques, il est emblématique des moments mémorables dans le jeu'
WHERE weaponname = 'Couteau';

-- Requêtes SQL manquantes pour insérer les anecdotes

-- Chicom CQB
UPDATE weapon
SET anecdote = 'Inspirée des développements modernes chinois, cette mitraillette offre une précision accrue grâce à son mode de tir en rafale.',
    description = 'Mitraillette compacte avec une cadence rapide et une efficacité à courte portée.'
WHERE weaponname = 'Chicom CQB';

-- Remington 870 MCS
UPDATE weapon
SET anecdote = 'Basé sur le célèbre Remington 870, ce fusil est idéal pour les combats rapprochés.',
    description = 'Fusil à pompe à action manuelle capable d’infliger des dégâts massifs à courte portée.'
WHERE weaponname = 'Remington 870 MCS';

-- S12
UPDATE weapon
SET anecdote = 'Utilisé pour des opérations rapprochées, il est conçu pour maximiser la mobilité.',
    description = 'Fusil à pompe semi-automatique avec une cadence rapide et des dégâts limités à longue portée.'
WHERE weaponname = 'S12';

-- KSG
UPDATE weapon
SET anecdote = 'Basé sur le Kel-Tec KSG, il se distingue par sa capacité unique à atteindre des cibles à moyenne distance.',
    description = 'Fusil à pompe à action manuelle offrant une portée exceptionnelle pour un fusil de ce type.'
WHERE weaponname = 'KSG';

-- M1216
UPDATE weapon
SET anecdote = 'Son design innovant permet de tirer plusieurs coups avant de recharger, idéal pour les affrontements rapides.',
    description = 'Fusil à pompe rotatif avec une cadence rapide et un chargement unique.'
WHERE weaponname = 'M1216';

-- LSAT
UPDATE weapon
SET anecdote = 'Basée sur des concepts expérimentaux, elle symbolise la nouvelle génération des mitrailleuses.',
    description = 'Mitrailleuse offrant une stabilité exceptionnelle avec un faible recul et une capacité de munitions élevée.'
WHERE weaponname = 'LSAT';

-- QBB LSW
UPDATE weapon
SET anecdote = 'Très utilisée dans l’armée chinoise pour des missions d’appui tactique.',
    description = 'Mitrailleuse légère combinant une cadence de tir rapide et une portée moyenne.'
WHERE weaponname = 'QBB LSW';

-- MK 48
UPDATE weapon
SET anecdote = 'Inspirée des armes lourdes militaires, elle est idéale pour le soutien continu sur le champ de bataille.',
    description = 'Mitrailleuse offrant une grande capacité de munitions et des dégâts élevés.'
WHERE weaponname = 'MK 48';

-- HAMR
UPDATE weapon
SET anecdote = 'Elle a été conçue pour fournir un soutien soutenu en situations de combat intenses.',
    description = 'Mitrailleuse légère adaptée aux combats prolongés grâce à sa capacité élevée et à sa grande puissance de feu.'
WHERE weaponname = 'HAMR';

-- DSR-50
UPDATE weapon
SET anecdote = 'Il est basé sur des modèles modernes de fusils de tireurs d’élite, idéal pour le jeu compétitif.',
    description = 'Fusil à verrou offrant une puissance exceptionnelle, capable d’éliminer un ennemi d’un seul tir.'
WHERE weaponname = 'DSR-50';

-- Ballista
UPDATE weapon
SET anecdote = 'Inspiré du fusil Ballista FN, il est souvent utilisé par des tireurs d’élite militaires en raison de sa précision.',
    description = 'Fusil à verrou offrant une cadence de tir rapide et des dégâts élevés.'
WHERE weaponname = 'Ballista';

-- XPR-50
UPDATE weapon
SET anecdote = 'Conçu pour les tireurs polyvalents, il est idéal pour couvrir plusieurs ennemis rapidement.',
    description = 'Fusil semi-automatique avec une cadence de tir modérée et des dégâts élevés.'
WHERE weaponname = 'XPR-50';

-- SVU-AS
UPDATE weapon
SET anecdote = 'Il est souvent associé aux opérations secrètes et aux missions de reconnaissance.',
    description = 'Fusil de précision soviétique semi-automatique avec une portée moyenne et une grande maniabilité.'
WHERE weaponname = 'SVU-AS';

-- Five-Seven
UPDATE weapon
SET anecdote = 'Inspiré par le FN Five-seveN, il est très populaire pour les opérations tactiques modernes.',
    description = 'Pistolet semi-automatique offrant une excellente précision et une grande capacité de chargeur.'
WHERE weaponname = 'Five-Seven';

-- Tac-45
UPDATE weapon
SET anecdote = 'Il est conçu pour les situations où la puissance de feu est essentielle.',
    description = 'Pistolet semi-automatique avec des dégâts élevés et une bonne cadence de tir.'
WHERE weaponname = 'Tac-45';

-- Executioner
UPDATE weapon
SET anecdote = 'Unique en son genre, il combine les caractéristiques d’un revolver et d’un fusil à pompe.',
    description = 'Revolver capable de tirer des cartouches de fusil à pompe, infligeant des dégâts énormes à courte portée.'
WHERE weaponname = 'Executioner';

-- B23R
UPDATE weapon
SET anecdote = 'Son mode de tir en rafale en fait une arme idéale pour les engagements rapprochés.',
    description = 'Pistolet semi-automatique avec une cadence rapide et des dégâts modérés.'
WHERE weaponname = 'B23R';

-- RPG
UPDATE weapon
SET anecdote = 'Le RPG-7 est l’une des armes les plus répandues dans le monde, célèbre pour sa simplicité et sa puissance.',
    description = 'Lance-roquettes non guidé offrant une grande puissance de destruction.'
WHERE weaponname = 'RPG';

-- FHJ-18 AA
UPDATE weapon
SET anecdote = 'Principalement utilisé pour abattre des hélicoptères et d’autres aéronefs ennemis.',
    description = 'Lanceur anti-aérien capable de verrouiller les cibles et de détruire des killstreaks aériens ennemis.'
WHERE weaponname = 'FHJ-18 AA';

-- Arbalète
UPDATE weapon
SET anecdote = 'L’arbalète est une arme silencieuse redoutée pour ses projectiles explosifs.',
    description = 'Arbalète moderne capable de tirer des flèches explosives, idéale pour les stratégies furtives.'
WHERE weaponname = 'Arbalète';

-- Couteau balistique
UPDATE weapon
SET anecdote = 'Le couteau balistique est prisé pour ses éliminations créatives et furtives en multijoueur.',
    description = 'Couteau spécial avec un mécanisme de projection, permettant des attaques rapides à distance.'
WHERE weaponname = 'Couteau balistique';

-- Pharo
UPDATE weapon
SET anecdote = 'Cette mitraillette à rafales est conçue pour combiner rapidité et efficacité en combat rapproché.',
    description = 'Mitraillette compacte offrant une bonne précision et une cadence de tir stable.'
WHERE weaponname = 'Pharo';

-- Razorback
UPDATE weapon
SET anecdote = 'Cette arme se distingue par son design futuriste et sa fiabilité en multijoueur.',
    description = 'Mitraillette avec une portée et une précision élevées, idéale pour les engagements à moyenne distance.'
WHERE weaponname = 'Razorback';

-- KRM-262
UPDATE weapon
SET anecdote = 'Basé sur le Remington 870, ce fusil excelle dans les combats rapprochés grâce à sa puissance brute.',
    description = 'Fusil à pompe à action manuelle infligeant des dégâts massifs à courte portée.'
WHERE weaponname = 'KRM-262';

-- Argus
UPDATE weapon
SET anecdote = 'Reconnaissable à sa précision, il est redoutable pour les éliminations à moyenne portée.',
    description = 'Fusil à pompe à action manuelle offrant une portée exceptionnelle.'
WHERE weaponname = 'Argus';

-- Haymaker 12
UPDATE weapon
SET anecdote = 'Conçu pour des assauts agressifs, il excelle dans les environnements confinés.',
    description = 'Fusil à pompe automatique avec une cadence rapide mais des dégâts modérés.'
WHERE weaponname = 'Haymaker 12';

-- Brecci
UPDATE weapon
SET anecdote = 'Populaire dans les modes compétitifs pour son équilibre entre puissance et rapidité.',
    description = 'Fusil à pompe semi-automatique alliant cadence rapide et efficacité.'
WHERE weaponname = 'Brecci';

-- BRM
UPDATE weapon
SET anecdote = 'Appréciée pour le soutien en combat prolongé, elle est souvent utilisée pour défendre des positions stratégiques.',
    description = 'Mitrailleuse légère offrant une bonne stabilité et une capacité de munitions élevée.'
WHERE weaponname = 'BRM';

-- Dingo
UPDATE weapon
SET anecdote = 'Très utilisée en mode multijoueur pour sa capacité à infliger des dégâts constants.',
    description = 'Mitrailleuse légère avec une cadence rapide et des dégâts modérés.'
WHERE weaponname = 'Dingo';

-- Gorgon
UPDATE weapon
SET anecdote = 'Idéale pour neutraliser des adversaires fortement protégés grâce à ses dégâts massifs.',
    description = 'Mitrailleuse légère avec une cadence lente mais des tirs puissants.'
WHERE weaponname = 'Gorgon';

-- 48 Dredge
UPDATE weapon
SET anecdote = 'Unique en son genre, elle excelle dans les combats soutenus et tactiques.',
    description = 'Mitrailleuse légère tirant en rafales, combinant puissance et précision.'
WHERE weaponname = '48 Dredge';

-- Locus
UPDATE weapon
SET anecdote = 'Repris de Black Ops 3, il est apprécié pour son design iconique et sa puissance.',
    description = 'Fusil de précision à verrou avec des dégâts élevés, redoutable à longue portée.'
WHERE weaponname = 'Locus';

-- SVG-100
UPDATE weapon
SET anecdote = 'Une des armes les plus puissantes du jeu, souvent utilisée pour des tirs longue distance décisifs.',
    description = 'Fusil de précision à verrou avec des dégâts extrêmement élevés, capable d’éliminer en un coup.'
WHERE weaponname = 'SVG-100';

-- Drakon
UPDATE weapon
SET anecdote = 'Connu pour sa rapidité d’exécution, il domine à longue distance dans des parties compétitives.',
    description = 'Fusil de précision semi-automatique avec une cadence de tir rapide et des dégâts modérés.'
WHERE weaponname = 'Drakon';

-- P-06
UPDATE weapon
SET anecdote = 'Apprécié des joueurs tactiques, il est redoutable pour infliger de lourds dégâts à longue distance.',
    description = 'Fusil de précision à tir en rafales avec une grande puissance.'
WHERE weaponname = 'P-06';

-- MR6
UPDATE weapon
SET anecdote = 'Basé sur des designs modernes, il est très polyvalent et efficace.',
    description = 'Pistolet semi-automatique offrant une précision et des dégâts modérés.'
WHERE weaponname = 'MR6';

-- RK5
UPDATE weapon
SET anecdote = 'Souvent choisi comme arme secondaire, il est idéal pour les combats rapprochés.',
    description = 'Pistolet à rafales avec une cadence rapide et une bonne précision.'
WHERE weaponname = 'RK5';

-- L-CAR 9
UPDATE weapon
SET anecdote = 'Idéal pour les engagements rapides, il est apprécié pour sa maniabilité.',
    description = 'Pistolet automatique avec une cadence élevée et une faible portée.'
WHERE weaponname = 'L-CAR 9';

-- XM-53
UPDATE weapon
SET anecdote = 'Très efficace contre les équipements ennemis, il est essentiel en mode multijoueur.',
    description = 'Lance-roquettes polyvalent capable de détruire des véhicules et des groupes ennemis.'
WHERE weaponname = 'XM-53';

-- Blackcell
UPDATE weapon
SET anecdote = 'Conçu pour éliminer rapidement les menaces aériennes, il est indispensable en partie stratégique.',
    description = 'Lance-roquettes spécialisé dans la destruction des killstreaks aériens.'
WHERE weaponname = 'Blackcell';

-- Saug-9mm
UPDATE weapon
SET anecdote = 'Appréciée pour sa maniabilité, elle est redoutable en combat rapproché.',
    description = 'Mitraillette légère et rapide, mais avec une portée limitée.'
WHERE weaponname = 'Saug-9mm';

-- Auger DMR
UPDATE weapon
SET anecdote = 'Conçu pour les engagements à longue distance, il est redoutable contre les cibles statiques.',
    description = 'Fusil semi-automatique infligeant de lourds dégâts avec une excellente précision.'
WHERE weaponname = 'Auger DMR';

-- Swordfish
UPDATE weapon
SET anecdote = 'Connu pour sa polyvalence, il est souvent utilisé dans les modes compétitifs.',
    description = 'Fusil tactique à rafales avec une cadence rapide et une excellente précision.'
WHERE weaponname = 'Swordfish';

-- MOG 12
UPDATE weapon
SET anecdote = 'Idéal pour les combats rapprochés, il est inspiré des fusils tactiques modernes.',
    description = 'Fusil à pompe à action manuelle infligeant des dégâts massifs à courte portée.'
WHERE weaponname = 'MOG 12';

-- SG12
UPDATE weapon
SET anecdote = 'Conçu pour les engagements rapides, il est redoutable dans les espaces confinés.',
    description = 'Fusil à pompe semi-automatique avec une cadence rapide et des dégâts modérés.'
WHERE weaponname = 'SG12';

-- Titan
UPDATE weapon
SET anecdote = 'Sa grande capacité de munitions en fait une arme idéale pour couvrir des zones et des positions stratégiques.',
    description = 'Mitrailleuse légère avec une cadence de tir modérée et des dégâts élevés.'
WHERE weaponname = 'Titan';

-- Hades
UPDATE weapon
SET anecdote = 'Conçue pour fournir un feu constant, elle excelle dans les modes défensifs et tactiques.',
    description = 'Mitrailleuse avec une cadence rapide et une bonne précision.'
WHERE weaponname = 'Hades';

-- Paladin HB50
UPDATE weapon
SET anecdote = 'Très utilisé dans les parties compétitives, apprécié pour sa capacité à tuer d’un seul coup bien placé.',
    description = 'Fusil de précision à verrou, infligeant des dégâts élevés et capable d’éliminer un ennemi en un seul tir.'
WHERE weaponname = 'Paladin HB50';

-- Outlaw
UPDATE weapon
SET anecdote = 'Basé sur un modèle western classique, il combine rapidité et précision.',
    description = 'Fusil à verrou avec une grande cadence, adapté aux combats rapides.'
WHERE weaponname = 'Outlaw';

-- RK 7 Garrison
UPDATE weapon
SET anecdote = 'Idéal pour submerger un ennemi dans des combats rapprochés.',
    description = 'Pistolet à rafales avec une cadence rapide et une bonne maniabilité.'
WHERE weaponname = 'RK 7 Garrison';

-- Strife
UPDATE weapon
SET anecdote = 'Polyvalent et fiable, il est souvent utilisé comme arme de secours.',
    description = 'Pistolet semi-automatique léger et rapide, idéal pour les engagements secondaires.'
WHERE weaponname = 'Strife';

-- Mozu
UPDATE weapon
SET anecdote = 'Apprécié pour son style classique et son efficacité en mode compétitif.',
    description = 'Revolver puissant, capable d’éliminer un ennemi en un seul coup à courte portée.'
WHERE weaponname = 'Mozu';

-- Hellion Salvo
UPDATE weapon
SET anecdote = 'Indispensable pour contrer les équipements lourds, il est essentiel en mode tactique.',
    description = 'Lance-roquettes polyvalent, efficace contre les véhicules et les killstreaks aériens.'
WHERE weaponname = 'Hellion Salvo';

--  Requêtes SQL pour insérer les sons des armes 

-- BO1 : 

-- idWeapon = 1, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\COMMANDO.mp3'
WHERE idWeapon = 1; 

-- idWeapon = 2, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\GALIL.mp3'
WHERE idWeapon = 2;

-- idWeapon = 3, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\AUG.mp3'
WHERE idWeapon = 3; 

-- idWeapon = 4, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\FAMAS.mp3'
WHERE idWeapon = 4; 

-- idWeapon = 5, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\AK47.mp3'
WHERE idWeapon = 5; 

-- idWeapon = 6, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\M16.mp3'
WHERE idWeapon = 6; 

-- idWeapon = 7, Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_d''assault\G11.mp3'
WHERE idWeapon = 7; 

-- idWeapon = 8, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\MP5K.mp3'
WHERE idWeapon = 8; 

-- idWeapon = 9, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\AK-74U.mp3'
WHERE idWeapon = 9; 

-- idWeapon = 10, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\PM63.mp3'
WHERE idWeapon = 10; 

-- idWeapon = 11, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\MPL.mp3'
WHERE idWeapon = 11; 

-- idWeapon = 12, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\UZI.mp3'
WHERE idWeapon = 12; 

-- idWeapon = 13, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\SPECTRE.mp3'
WHERE idWeapon = 13; 

-- idWeapon = 14, Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitraillette\KIPARIS.mp3'
WHERE idWeapon = 14; 

-- idWeapon = 15, Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_à_pompe\SPAS-12.mp3'
WHERE idWeapon = 15; 

-- idWeapon = 16, Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_à_pompe\OLYMPIA.mp3'
WHERE idWeapon = 16; 

-- idWeapon = 17, Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_à_pompe\STAKEOUT.mp3'
WHERE idWeapon = 17; 

-- idWeapon = 18, Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_à_pompe\HS-10.mp3'
WHERE idWeapon = 18; 

-- idWeapon = 19, Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitrailleuse\M60.mp3'
WHERE idWeapon = 19; 

-- idWeapon = 20, Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitrailleuse\HK21.mp3'
WHERE idWeapon = 20; 

-- idWeapon = 21, Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Mitrailleuse\RPK.mp3'
WHERE idWeapon = 21; 

-- idWeapon = 22, Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_tactique\M14.mp3'
WHERE idWeapon = 22; 

-- idWeapon = 23, Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_tactique\FNFAL.mp3'
WHERE idWeapon = 23; 

-- idWeapon = 24, Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_de_precision\L96A1.mp3'
WHERE idWeapon = 24; 

-- idWeapon = 25, Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_de_precision\DRAGUNOV.mp3'
WHERE idWeapon = 25; 

-- idWeapon = 26, Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Fusil_de_precision\WA2000.mp3'
WHERE idWeapon = 26; 

-- idWeapon = 27, Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Pistolets\M1911.mp3'
WHERE idWeapon = 27; 

-- idWeapon = 28, Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Pistolets\PYTHON.mp3'
WHERE idWeapon = 28; 

-- idWeapon = 29, Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Pistolets\CZ-75.mp3'
WHERE idWeapon = 29; 

-- idWeapon = 30, Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Lanceurs\RPG7.mp3'
WHERE idWeapon = 30; 

-- idWeapon = 31, Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Lanceurs\CHINA_LAKE.mp3'
WHERE idWeapon = 31; 

-- idWeapon = 32, Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Armes_de_melee\COUTEAU.mp3'
WHERE idWeapon = 32; 

-- idWeapon = 33, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_mortel\GRENADE.mp3'
WHERE idWeapon = 33; 

-- idWeapon = 34, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_mortel\SEMTEX.mp3'
WHERE idWeapon = 34; 

-- idWeapon = 35, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_mortel\CLAYMORE.mp3'
WHERE idWeapon = 35; 

-- idWeapon = 36, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_mortel\C4.mp3'
WHERE idWeapon = 36; 

-- idWeapon = 37, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_tactique\FLASHBANG.mp3'
WHERE idWeapon = 37; 

-- idWeapon = 38, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_tactique\GRENADE_PARALYSANTE.mp3'
WHERE idWeapon = 38; 

-- idWeapon = 39, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_tactique\SMOKE_GRENADE.mp3'
WHERE idWeapon = 39; 

-- idWeapon = 40, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Equipement_tactique\NOVA_GAS.mp3'
WHERE idWeapon = 40; 

-- idWeapon = 41, Armes spéciales
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Arme_speciale\CROSSBOW.mp3'
WHERE idWeapon = 41; 

-- idWeapon = 42, Armes spéciales
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO1\Arme_speciale\BALLISTIC_KNIFE.mp3'
WHERE idWeapon = 42; 


-- BO2 : 

-- UPDATE DES SONS : 

-- idWeapon = 43, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\AN-94.mp3'
WHERE idWeapon = 43;

-- idWeapon = 44, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\TYPE_25.mp3'
WHERE idWeapon = 44;

-- idWeapon = 45, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\SCAR-H.mp3'
WHERE idWeapon = 45;

-- idWeapon = 46, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\M8A1.mp3'
WHERE idWeapon = 46;

-- idWeapon = 47, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\FAL_OSW.mp3'
WHERE idWeapon = 47;

-- idWeapon = 48, Fusil d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_d''assault\SMR.mp3'
WHERE idWeapon = 48;

-- idWeapon = 49, Mitraillette
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitraillette\MP7.mp3'
WHERE idWeapon = 49;

-- idWeapon = 50, Mitraillette
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitraillette\MSMC.mp3'
WHERE idWeapon = 50;

-- idWeapon = 51, Mitraillette
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitraillette\PDW-57.mp3'
WHERE idWeapon = 51;

-- idWeapon = 52, Mitraillette
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitraillette\VECTOR_K10.mp3' 
WHERE idWeapon = 52;

-- idWeapon = 53, Mitraillette
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitraillette\CHICOM_CQB.mp3'
WHERE idWeapon = 53;

-- idWeapon = 54, Fusil à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_à_pompe\RM870MSC.MP3'
WHERE idWeapon = 54;

-- idWeapon = 55, Fusil à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_à_pompe\S12.mp3'
WHERE idWeapon = 55;

-- idWeapon = 56, Fusil à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_à_pompe\KSG.mp3'
WHERE idWeapon = 56;

-- idWeapon = 57, Fusil à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_à_pompe\M1216.mp3'
WHERE idWeapon = 57;

-- idWeapon = 58, Mitrailleuse
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitrailleuse\LSAT.mp3'
WHERE idWeapon = 58;

-- idWeapon = 59, Mitrailleuse
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitrailleuse\QBB_LSW.mp3'
WHERE idWeapon = 59;

-- idWeapon = 60, Mitrailleuse
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitrailleuse\MK48.mp3'
WHERE idWeapon = 60;

-- idWeapon = 61, Mitrailleuse
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Mitrailleuse\HAMR.mp3'
WHERE idWeapon = 61;

-- idWeapon = 62, Fusil de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_de_precision\DSR-50.mp3'
WHERE idWeapon = 62;

-- idWeapon = 63, Fusil de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_de_precision\Ballista.mp3'
WHERE idWeapon = 63;

-- idWeapon = 64, Fusil de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_de_precision\XPR-50.mp3'
WHERE idWeapon = 64;

-- idWeapon = 65, Fusil de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Fusil_de_precision\SVU-AS.mp3'
WHERE idWeapon = 65;

-- idWeapon = 66, Pistolet
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Pistolets\FIVE-SEVEN.MP3'
WHERE idWeapon = 66;

-- idWeapon = 67, Pistolet
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Pistolets\TAC-45.mp3'
WHERE idWeapon = 67;

-- idWeapon = 68, Pistolet
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Pistolets\Executioner.mp3'
WHERE idWeapon = 68;

-- idWeapon = 69, Pistolet
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Pistolets\B23R.mp3'
WHERE idWeapon = 69;

-- idWeapon = 70, Lanceur
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Lanceurs\RPG.MP3'
WHERE idWeapon = 70;

-- idWeapon = 71, Lanceur
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Lanceurs\FHJ-18_AA.mp3'
WHERE idWeapon = 71;

-- idWeapon = 72, Lanceur
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Lanceurs\SMAW.PM3'
WHERE idWeapon = 72;

-- idWeapon = 73, Arme de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Armes_de_melee\Couteau.mp3'
WHERE idWeapon = 73;

-- idWeapon = 74, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_mortel\GRENADE.mp3'
WHERE idWeapon = 74;

-- idWeapon = 75, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_mortel\SEMTEX.mp3'
WHERE idWeapon = 75;

-- idWeapon = 76, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_mortel\CLAYMORE.mp3'
WHERE idWeapon = 76;

-- idWeapon = 77, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_mortel\C4.mp3'
WHERE idWeapon = 77;

-- idWeapon = 78, Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_mortel\Hache_de_combat.mp3'
WHERE idWeapon = 78;

-- idWeapon = 79, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_tactique\FLASHBANG.mp3'
WHERE idWeapon = 79;

-- idWeapon = 80, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_PARALYSANTE.mp3'
WHERE idWeapon = 80;

-- idWeapon = 81, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_tactique\SMOKE_GRENADE.mp3'
WHERE idWeapon = 81;

-- idWeapon = 82, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_tactique\GRENADE_IEM.mp3'
WHERE idWeapon = 82;

-- idWeapon = 83, Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Equipement_tactique\Charge_electrique.mp3'
WHERE idWeapon = 83;

-- idWeapon = 84, Arme spéciale
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Arme_speciale\ARBALETE.mp3'
WHERE idWeapon = 84;

-- idWeapon = 85, Arme spéciale
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO2\Arme_speciale\Couteau_Balistique.mp3'
WHERE idWeapon = 85;





-- BO3 : 
-- Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_d''assault\KN_44.mp3'
WHERE idWeapon = 86;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_d''assault\HVK_30.mp3'
WHERE idWeapon = 87;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_d''assault\ICR_1.mp3'
WHERE idWeapon = 88;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_d''assault\MAN_O_WAR.mp3'
WHERE idWeapon = 89;

-- Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\VMP.mp3'
WHERE idWeapon = 90;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\KUDA.mp3'
WHERE idWeapon = 91;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\WEEVIL.mp3'
WHERE idWeapon = 92;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\PHARO.mp3'
WHERE idWeapon = 93;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\VESPER.mp3'
WHERE idWeapon = 94;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitraillette\RAZORBACK.mp3'
WHERE idWeapon = 95;

-- Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_à_pompe\KRM_262.mp3'
WHERE idWeapon = 96;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_à_pompe\Argus.mp3'
WHERE idWeapon = 97;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_à_pompe\Haymaker_12.mp3'
WHERE idWeapon = 98;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_à_pompe\BRECCI.mp3'
WHERE idWeapon = 99;

-- Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitrailleuse\BRM.mp3'
WHERE idWeapon = 100;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitrailleuse\DINGO.mp3'
WHERE idWeapon = 101;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitrailleuse\GORGON.mp3'
WHERE idWeapon = 102;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Mitrailleuse\48_DREDGE.mp3'
WHERE idWeapon = 103;

-- Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_tactique\M8A7.mp3'
WHERE idWeapon = 104;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_tactique\SHEIVA.mp3'
WHERE idWeapon = 105;

-- Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_de_precision\LOCUS.mp3'
WHERE idWeapon = 106;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_de_precision\SVG_100.mp3'
WHERE idWeapon = 107;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_de_precision\DRAKON.mp3'
WHERE idWeapon = 108;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Fusil_de_precision\P_06.mp3'
WHERE idWeapon = 109;

-- Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Pistolets\MR6.mp3'
WHERE idWeapon = 110;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Pistolets\RK5.mp3'
WHERE idWeapon = 111;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Pistolets\L_CAR9.mp3'
WHERE idWeapon = 112;

-- Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Lanceurs\XM_53.mp3'
WHERE idWeapon = 113;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Lanceurs\BLACKCELL.mp3'
WHERE idWeapon = 114;

-- Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Armes_de_melee\Couteau.mp3'
WHERE idWeapon = 115;

-- Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_mortel\Frag_Grenade.mp3'
WHERE idWeapon = 116;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_mortel\SEMTEX.mp3'
WHERE idWeapon = 117;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_mortel\MINE_TERRESTRE.mp3'
WHERE idWeapon = 118;

-- Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_tactique\Grenade_flash.mp3'
WHERE idWeapon = 119;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_tactique\Grenade_fumigene.mp3'
WHERE idWeapon = 120;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Equipement_tactique\GRENADE_CONCUSSION.mp3'
WHERE idWeapon = 121;

-- Armes spéciales
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO3\Arme_speciale\NX_SHADOWCLAW.mp3'
WHERE idWeapon = 122;





-- BO4 :
-- Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_d''assault\MADDOX_RFB.mp3'
WHERE idWeapon = 123;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_d''assault\KN-57.mp3'
WHERE idWeapon = 124;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_d''assault\ICR-7.mp3'
WHERE idWeapon = 125;

-- Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Mitraillette\MX9.mp3'
WHERE idWeapon = 126;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Mitraillette\CORDITE.mp3'
WHERE idWeapon = 127;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Mitraillette\SAUG_9MM.mp3'
WHERE idWeapon = 128;

-- Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_tactique\AUGER_DMR.mp3'
WHERE idWeapon = 129;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_tactique\Swordfish.mp3'
WHERE idWeapon = 130;

-- Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_à_pompe\MOG_12.mp3'
WHERE idWeapon = 131;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_à_pompe\SG_12.mp3'
WHERE idWeapon = 132;

-- Mitrailleuses légères
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Mitrailleuse\TITAN.mp3'
WHERE idWeapon = 133;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Mitrailleuse\HADES.mp3'
WHERE idWeapon = 134;

-- Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_de_precision\PALADIN_HB50.mp3'
WHERE idWeapon = 135;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Fusil_de_precision\Outlaw.mp3'
WHERE idWeapon = 136;

-- Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Pistolets\RK_7_GARRISON.mp3'
WHERE idWeapon = 137;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Pistolets\Strife.MP3'
WHERE idWeapon = 138;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Pistolets\MOZU.mp3'
WHERE idWeapon = 139;

-- Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Lanceurs\HELLION_SALVO.mp3'
WHERE idWeapon = 140;

-- Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Armes_de_melee\couteau.mp3'
WHERE idWeapon = 141;

-- Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_mortel\GRENADE.mp3'
WHERE idWeapon = 142;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_mortel\SEMTEX.mp3'
WHERE idWeapon = 143;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_mortel\CLAYMORE.mp3'
WHERE idWeapon = 144;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_mortel\C4.mp3'
WHERE idWeapon = 145;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_mortel\Hache_de_combat.mp3'
WHERE idWeapon = 146;

-- Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_tactique\FLASHBANG.mp3'
WHERE idWeapon = 147;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_PARALYSANTE.mp3'
WHERE idWeapon = 148;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_tactique\SMOKE_GRENADE.mp3'
WHERE idWeapon = 149;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_tactique\GRENADE_IEM.mp3'
WHERE idWeapon = 150;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO4\Equipement_tactique\CAPTEUR_ACOUSTIQUE.mp3'
WHERE idWeapon = 151;



-- BO5 :

-- Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\Krig6.MP3'
WHERE idWeapon = 152;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\QBZ-83.mp3'
WHERE idWeapon = 153;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\XM4.mp3'
WHERE idWeapon = 154;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\AK-47.mp3'
WHERE idWeapon = 155;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\FFAR_1.mp3'
WHERE idWeapon = 156;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\Groza.mp3'
WHERE idWeapon = 157;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\FARA_83.mp3'
WHERE idWeapon = 158;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_d''assault\C58.MP3'
WHERE idWeapon = 159;

-- Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\MP5.mp3'
WHERE idWeapon = 160;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\AK-74u.mp3'
WHERE idWeapon = 161;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\Bullfrog.mp3'
WHERE idWeapon = 162;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\Milano_821.mp3'
WHERE idWeapon = 163;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\KSP45.mp3'
WHERE idWeapon = 164;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\MAC-10.mp3'
WHERE idWeapon = 165;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\LC10.mp3'
WHERE idWeapon = 166;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitraillette\PPSh-41.mp3'
WHERE idWeapon = 167;

-- Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_à_pompe\Hauer_77.mp3'
WHERE idWeapon = 168;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_à_pompe\Gallo_SA12.mp3'
WHERE idWeapon = 169;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_à_pompe\Streetsweeper.MP3'
WHERE idWeapon = 170;

-- Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitrailleuse\Stoner63.mp3'
WHERE idWeapon = 171;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitrailleuse\RPD.mp3'
WHERE idWeapon = 172;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitrailleuse\M60.mp3'
WHERE idWeapon = 173;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Mitrailleuse\MG82.MP3'
WHERE idWeapon = 174;

-- Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_tactique\DMR_14.mp3'
WHERE idWeapon = 175;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_tactique\Type 63.mp3'
WHERE idWeapon = 176;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_tactique\M16.mp3'
WHERE idWeapon = 177;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_tactique\AUG.mp3'
WHERE idWeapon = 178;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_tactique\CARV.2.mp3'
WHERE idWeapon = 179;

-- Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_de_precision\LW3-Tundra.MP3'
WHERE idWeapon = 180;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_de_precision\Pelington_703.mp3'
WHERE idWeapon = 181;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_de_precision\M82.mp3'
WHERE idWeapon = 182;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_de_precision\ZRG_20mm.mp3'
WHERE idWeapon = 183;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Fusil_de_precision\Swiss_K31.mp3'
WHERE idWeapon = 184;

-- Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Pistolets\1911.mp3'
WHERE idWeapon = 185;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Pistolets\Diamatti.mp3'
WHERE idWeapon = 186;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Pistolets\Magnum.mp3'
WHERE idWeapon = 187;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Pistolets\AMP63.mp3'
WHERE idWeapon = 188;

-- Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Lanceurs\Cigma 2.mp3'
WHERE idWeapon = 189;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Lanceurs\RPG-7.mp3'
WHERE idWeapon = 190;

-- Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Armes_de_melee\Couteau_Balistique.mp3'
WHERE idWeapon = 191;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Armes_de_melee\Wakizashi.mp3'
WHERE idWeapon = 192;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Armes_de_melee\Machette.mp3'
WHERE idWeapon = 193;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Armes_de_melee\Masse.mp3'
WHERE idWeapon = 194;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Armes_de_melee\Batte_de_Baseball.mp3'
WHERE idWeapon = 195;

-- Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Equipement_mortel\GRENADE.mp3'
WHERE idWeapon = 196;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Equipement_mortel\C4.mp3'
WHERE idWeapon = 197;

-- Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Equipement_tactique\FLASHBANG.mp3'
WHERE idWeapon = 198;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Equipement_tactique\GRENADE_PARALYSANTE.mp3'
WHERE idWeapon = 199;

-- Armes spéciales
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO5\Arme_speciale\M79.mp3'
WHERE idWeapon = 200;



-- BO6 : 

-- Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\xm4.mp3'
WHERE idWeapon = 201;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\asval.mp3'
WHERE idWeapon = 202;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\krigC.mp3'
WHERE idWeapon = 203;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\ak74.mp3'
WHERE idWeapon = 204;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\armes85.mp3'
WHERE idWeapon = 205;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\gpr91.mp3'
WHERE idWeapon = 206;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\modelL.mp3'
WHERE idWeapon = 207;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_d''assault\goblinmk2.mp3'
WHERE idWeapon = 208;

-- Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\c9.mp3'
WHERE idWeapon = 209;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\ksv.mp3'
WHERE idWeapon = 210;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\pp-919.mp3'
WHERE idWeapon = 211;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\kompakt92.mp3'
WHERE idWeapon = 212;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\jackelpow.mp3'
WHERE idWeapon = 213;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\tanto.22.mp3'
WHERE idWeapon = 214;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitraillette\saug.mp3'
WHERE idWeapon = 215;

-- Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_à_pompe\marineSP.mp3'
WHERE idWeapon = 216;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_à_pompe\asg-89.mp3'
WHERE idWeapon = 217;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_à_pompe\maelstrom.mp3'
WHERE idWeapon = 218;

-- Mitrailleuses
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitrailleuse\pu-21.mp3'
WHERE idWeapon = 219;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitrailleuse\xmg.mp3'
WHERE idWeapon = 220;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Mitrailleuse\gpmg_7.mp3'
WHERE idWeapon = 221;

-- Fusils tactiques
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_tactique\aek-973.mp3'
WHERE idWeapon = 222;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_tactique\swaft-5.56.mp3'
WHERE idWeapon = 223;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_tactique\tsarkov7.62.mp3'
WHERE idWeapon = 224;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_tactique\dm-10.mp3'
WHERE idWeapon = 225;

-- Fusils de précision
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_de_precision\LW3A1-frostline.mp3'
WHERE idWeapon = 226;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_de_precision\svd.mp3'
WHERE idWeapon = 227;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_de_precision\amr-mod4.mp3'
WHERE idWeapon = 228;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Fusil_de_precision\lr.7.62.mp3'
WHERE idWeapon = 229;

-- Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Pistolets\9mmPM.mp3'
WHERE idWeapon = 230;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Pistolets\grekhova.mp3'
WHERE idWeapon = 231;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Pistolets\gs45.mp3'
WHERE idWeapon = 232;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Pistolets\stryder.22.mp3'
WHERE idWeapon = 233;

-- Lanceurs
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Lanceurs\HE-1.mp3'
WHERE idWeapon = 234;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Lanceurs\CIGMA2B.mp3'
WHERE idWeapon = 235;

-- Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Armes_de_melee\couteau.mp3'
WHERE idWeapon = 236;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Armes_de_melee\perceuse.mp3'
WHERE idWeapon = 237;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Armes_de_melee\couperet.mp3'
WHERE idWeapon = 238;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Armes_de_melee\Bat_de_Baseball.mp3'
WHERE idWeapon = 239;

-- Équipement mortel
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Equipement_mortel\molotov.mp3'
WHERE idWeapon = 240;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Equipement_mortel\Frag.mp3'
WHERE idWeapon = 241;

-- Équipement tactique
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Equipement_tactique\Grenade_flash.mp3'
WHERE idWeapon = 242;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Equipement_tactique\grenade_paralysante.mp3'
WHERE idWeapon = 243;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Equipement_tactique\Stimulant.mp3'
WHERE idWeapon = 244;

-- Armes spéciales
UPDATE Weapon
SET sound = 'Contenu\img\weapon\BO6\Arme_speciale\SIRIN9MM.mp3'
WHERE idWeapon = 245;



-- Valorant

-- Fusils d'assaut
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_d''assault\valo_vandal.mp3'
WHERE idWeapon = 246;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_d''assault\valo_phantom.mp3'
WHERE idWeapon = 247;

-- Snipers
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_de_precision\OPERATOR.mp3'
WHERE idWeapon = 248;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_de_precision\MARSHAL.mp3'
WHERE idWeapon = 249;

-- Mitraillettes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Mitraillette\valo_spectre.mp3'
WHERE idWeapon = 250;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Mitraillette\valo_stinger.mp3'
WHERE idWeapon = 251;

-- Fusils à pompe
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\valo_judge.mp3'
WHERE idWeapon = 252;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\valo_bucky.mp3'
WHERE idWeapon = 253;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Fusil_à_pompe\valo_shorty.mp3'
WHERE idWeapon = 254;

-- Mitrailleuses lourdes
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Mitrailleuse\valo_ares.mp3'
WHERE idWeapon = 255;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Mitrailleuse\valo_odin.mp3'
WHERE idWeapon = 256;

-- Pistolets
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Pistolets\valo_classic.mp3'
WHERE idWeapon = 257;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Pistolets\valo_frenzy.mp3'
WHERE idWeapon = 258;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Pistolets\valo_ghost.mp3'
WHERE idWeapon = 259;

UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Pistolets\valo_sheriff.mp3'
WHERE idWeapon = 260;

-- Armes de mêlée
UPDATE Weapon
SET sound = 'Contenu\img\weapon\VALORANT\Armes_de_melee\Couteau.mp3'
WHERE idWeapon = 261;
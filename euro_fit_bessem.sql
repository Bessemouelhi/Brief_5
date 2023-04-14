
-- Création de la base de données si elle n'existe pas
CREATE SCHEMA IF NOT EXISTS euro_fit_bessem
-- on défini le codage des caractères
DEFAULT CHARACTER SET utf8mb4;

-- on utilise la base de données créée
USE euro_fit_bessem;

-- on commence par les feuilles tel que les tables les plus éloignées

-- Si elle n'existe pas on crée la table coach
CREATE TABLE IF NOT EXISTS coach
(
-- id_coach en auto increment et non nulle c'est un int
id_coach INT NOT NULL AUTO_INCREMENT, 

-- prenom_coach est non nulle c'est un text de 30 caractères
prenom_coach VARCHAR(30) NOT NULL,
nom_coach VARCHAR(30) NOT NULL,
mail_coach VARCHAR(50) NOT NULL,
tel_coach VARCHAR(15),

-- la clé primaire est id_admin
PRIMARY KEY (id_coach)
);

-- Si elle n'existe pas on crée la table 

-- ------------------------------------------
-- ADRESSE
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS pays
(
id_pays INT NOT NULL AUTO_INCREMENT, 
pays  VARCHAR(30) NOT NULL,
PRIMARY KEY (id_pays)
);

CREATE TABLE IF NOT EXISTS adresse
(
id_adresse INT NOT NULL AUTO_INCREMENT, 
num_adresse  VARCHAR(20) NOT NULL,
rue_adresse  VARCHAR(15) NOT NULL,
vile_adresse  VARCHAR(50) NOT NULL,
code_postal  VARCHAR(15) NOT NULL,
id_pays INT,
PRIMARY KEY (id_adresse),

-- on défini la clé étrangère avec le nom fk_id_pays
-- elle fait le lien en id_code_postal de notre table et
-- id_pays de la table pays
CONSTRAINT `fk_id_pays` FOREIGN KEY (id_pays) REFERENCES pays (id_pays) ON DELETE SET NULL ON UPDATE CASCADE
);

-- ------------------------------------------
-- CLIENT
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS clients
(
id_client INT NOT NULL AUTO_INCREMENT, 
prenom_client VARCHAR(30) NOT NULL,
nom_client VARCHAR(30) NOT NULL,
email_client VARCHAR(50) NOT NULL,
tel_client VARCHAR(15) NOT NULL,
id_adresse INT,
PRIMARY KEY (id_client),
CONSTRAINT `fk_id_adresse` FOREIGN KEY (id_adresse) REFERENCES adresse (id_adresse) ON DELETE SET NULL ON UPDATE CASCADE
);


-- ------------------------------------------
-- ABONNEMENT
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS type_abonnement
(
id_type_abo INT NOT NULL AUTO_INCREMENT, 
libelle  VARCHAR(25) NOT NULL,
prix_abonnement  float NOT NULL,
PRIMARY KEY (id_type_abo)
);

CREATE TABLE IF NOT EXISTS abonnement
(
id_abonnement INT NOT NULL AUTO_INCREMENT, 
-- date_debut est une variable de type DATE
date_debut DATE,
date_fin DATE,
num_badge VARCHAR(30),
id_type_abo INT,
id_client INT,
PRIMARY KEY (id_abonnement),
CONSTRAINT `fk_id_type_abo` FOREIGN KEY (id_type_abo) REFERENCES type_abonnement (id_type_abo) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `fk_id_client` FOREIGN KEY (id_client) REFERENCES clients (id_client) ON DELETE SET NULL ON UPDATE CASCADE
);


-- ------------------------------------------
-- ACTIVITE
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS activite
(
id_activite INT NOT NULL AUTO_INCREMENT, 
libelle VARCHAR(50) NOT NULL,
id_coach INT,
PRIMARY KEY (id_activite),
CONSTRAINT `fk_id_coach` FOREIGN KEY (id_coach) REFERENCES coach (id_coach) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS activite_client
(
id_activite_client INT NOT NULL AUTO_INCREMENT, 
libelle VARCHAR(25) NOT NULL,
heure_debut datetime NOT NULL,
heure_fin datetime NOT NULL,
date_activite date NOT NULL,
id_client INT,
id_activite INT,
PRIMARY KEY (id_activite_client),
CONSTRAINT `fk_id_clients` FOREIGN KEY (id_client) REFERENCES clients (id_client) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT `fk_id_activite` FOREIGN KEY (id_activite) REFERENCES activite (id_activite) ON DELETE SET NULL ON UPDATE CASCADE
);

ALTER TABLE adresse
RENAME COLUMN vile_adresse to ville_adresse;
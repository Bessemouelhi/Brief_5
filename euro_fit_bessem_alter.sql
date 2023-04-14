ALTER TABLE adresse
RENAME COLUMN vile_adresse to ville_adresse;

ALTER TABLE adresse
MODIFY COLUMN num_adresse int;

ALTER TABLE adresse
MODIFY COLUMN rue_adresse varchar(50);

ALTER TABLE adresse
MODIFY COLUMN ville_adresse varchar(35);

ALTER TABLE clients
DROP COLUMN id_abonnement;

ALTER TABLE activite_client
DROP COLUMN libelle;

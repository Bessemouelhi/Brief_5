-- Affiche la liste de tout les clients
select nom_client, prenom_client, email_client from clients
order by nom_client DESC;

-- quel client a son prenom qui commence par 'Z'
select prenom_client, nom_client from clients
WHERE prenom_client LIKE 'Z%';

-- quel coach pratique la zumba
select prenom_coach, nom_coach, libelle from coach
join activite using (id_coach)
WHERE libelle = 'Zumba';

-- Quels clients habite aux Pays_Bas
select prenom_client, nom_client, pays.pays from clients 
join adresse using (id_adresse)
join pays using (id_pays)
where pays = 'PAYS_BAS';

-- Quels clients ont leurs abonnements qui se terminent avant 2024
select prenom_client, nom_client, abonnement.date_fin from clients 
join abonnement using (id_client)
where date_fin < '2024-01-01';

-- Quels clients ont un abonnement VIP
select prenom_client, nom_client, type_abonnement.libelle from clients 
join abonnement using (id_client)
join type_abonnement using (id_type_abo)
where type_abonnement.libelle = 'VIP';

-- Quels clients ont pratiqué une activité en janvier 2023
select prenom_client, nom_client, activite_client.date_activite, activite.libelle AS sport from clients 
join activite_client using (id_client)
join activite using (id_activite)
where activite_client.date_activite between '2023-01-01' and '2023-01-31';

-- Combien de fois le pilate a été pratiqué en 2023
select activite.libelle, count(id_activite) as total from activite_client 
join activite using (id_activite)
where activite.libelle = 'Pilate' and activite_client.date_activite between '2023-01-01' and '2023-12-31'
group by id_activite;
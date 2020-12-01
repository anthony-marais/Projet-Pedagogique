use db_reservation;

# les 3x3 diez = nouveau test unitaire

###
###
### Test unitaire procédure stockée `PI_MAIL_SIMPLE` (Create)

START TRANSACTION;


#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id
INSERT INTO INFORMATION (in_mail, in_nom, in_prenom, in_poste, in_organisation) VALUES ('lukas@mail.com', 'clave', 'lukas', 'apprenant', 'simplon');
#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @iid = (SELECT in_id from INFORMATION where in_mail = 'lukas@mail.com') ;
#-- on s'assure qu'un mail ayant pour contenu 'je souhaite réserver la salle 210 le 15 janvier de 15h à 17h' n'existe pas déjà
SET @maid = (SELECT ma_id from MAIL where ma_contenu = 'je souhaite réserver la salle 210 le 15 janvier de 15h à 17h' and ma_date < ma_date);
CALL PI_MAIL_SIMPLE (@maid, 'je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid);
#--on choisit la 1ere valeur dispo pour ma_id
SET @maid = (SELECT max(ma_id) from MAIL);
SELECT @maid;
#-- on s'assure que la ligne a bien été insérée existe bien
SELECT * FROM MAIL where ma_id = @maid ;
ROLLBACK; #-- on annule toutes les actions précédentes
#Demande a Valerio/rafik pour savoir pourquoi le block et le block+transaction ne marche pas


###
###
### Test unitaire procédure stockée `PSGet_MAIL`(Retrieve/Read)

START TRANSACTION;

#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id
INSERT INTO INFORMATION (in_mail, in_nom, in_prenom, in_poste, in_organisation) VALUES ('lukas@mail.com', 'clave', 'lukas', 'apprenant', 'simplon');
#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @iid = (SELECT in_id from INFORMATION where in_mail = 'lukas@mail.com') ;

#--on insère un premier mail au cas où la table serait vide
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid);
#--on récupère l'id max de tous les mails dans la table, en l'occurrence celui qui a été inséré
SET @maid = (SELECT max(ma_id) from MAIL);

CALL PSGet_MAIL(@maid) ; #--renvoie les infos du mail dont l'ID est spécifié

#-- on insère la ligne que l'on souhaite afficher
INSERT INTO MAIL (`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid) ;

#--on récupère l'id max de tous les mails dans la table, en l'occurrence celui qui a été inséré en 2e
SET @maid = (SELECT max(ma_id) from MAIL);

CALL PSGet_MAIL(@maid) ; #--renvoie les infos du mail dont l'ID est spécifié

ROLLBACK; #-- on annule toutes les actions précédentes
#Demande a Valerio/rafik pour savoir pourquoi le block et le block+transaction ne marche pas

###
###
### Test unitaire procédure stockée `PFind_MAIL`(Retrieve/Read)

START TRANSACTION;

#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id
INSERT INTO INFORMATION (in_mail, in_nom, in_prenom, in_poste, in_organisation) VALUES ('lukas@mail.com', 'clave', 'lukas', 'apprenant', 'simplon');
#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @iid = (SELECT in_id from INFORMATION where in_mail = 'lukas@mail.com') ;

CALL PFind_MAIL(); #--on affiche la totalité des lignes de la table, peut renvoyer 0 lignes

SELECT count(*) FROM MAIL; #-- on souhaite compter le nombre de lignes avant (surtout s'il y en a beaucoup)

#--on insère 2 MAIL pour être sûrs que la procédure puisse renvoyer plus d'une ligne
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid);
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 300 le 17 janvier de 17h à 19h', NOW(), @iid);

CALL PFind_MAIL(); #--on affiche la totalité des lignes de la table, doit renvoyer au moins 2 lignes

SELECT count(*) FROM MAIL; #-- on souhaite compter le nombre de lignes après (surtout s'il y en a beaucoup)

ROLLBACK; #-- on annule toutes les actions précédentes

###
###
### Test unitaire procédure stockées `PU_MAIL` (UPDATE / mise à jour)

START TRANSACTION;

#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id
INSERT INTO INFORMATION (in_mail, in_nom, in_prenom, in_poste, in_organisation) VALUES ('lukas@mail.com', 'clave', 'lukas', 'apprenant', 'simplon');

#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @iid = (SELECT in_id from INFORMATION where in_mail = 'lukas@mail.com');

#-- on insère une ligne témoin
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid);

#--on récupère l'id max de tous les films dans la table, en l'occurrence celui qui a été inséré
SET @maid = (SELECT max(ma_id) from MAIL);

SELECT * FROM MAIL WHERE ma_id = @maid ; #--on affiche la ligne avant modification

SET @madate = (SELECT ma_date FROM MAIL) ;

SELECT * FROM MAIL WHERE ma_date = @madate ;

#--appel à la procédure d'update avec de nouvelles valeurs
CALL PU_MAIL(@maid, 'je souhaite réserver la salle 12 le 16 janvier de 13h à 15h', @madate, @iid);

SELECT * FROM MAIL where ma_id = @maid ; #--on affiche la ligne après modification

ROLLBACK; #-- on annule toutes les actions précédentes


###
###
### Test unitaire `PD_MAIL` (DELETE)

START TRANSACTION;

#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id
INSERT INTO INFORMATION (in_mail, in_nom, in_prenom, in_poste, in_organisation) VALUES ('lukas@mail.com', 'clave', 'lukas', 'apprenant', 'simplon');

#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @iid = (SELECT in_id from INFORMATION where in_mail = 'lukas@mail.com');

#-- on insère une ligne témoin
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', NOW(), @iid);

#--on récupère l'id max de tous les films dans la table, en l'occurrence celui qui a été inséré
SET @maid = (SELECT max(ma_id) from MAIL);

SELECT * FROM MAIL WHERE ma_id = @maid ; #--on affiche la ligne avant modification

CALL PD_MAIL (@maid); #--on supprime la ligne

SELECT * FROM MAIL where ma_id = @maid ; #--on essaye d'afficher la ligne et on doit constater la suppression

ROLLBACK;

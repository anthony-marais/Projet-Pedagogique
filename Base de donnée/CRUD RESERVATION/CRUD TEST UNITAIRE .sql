use db_reservation;


### Test unitaire procédure stockée `PI_RES_SIMPLE` (Create)

START TRANSACTION;


#--il y a 1 clés étrangères pointant vers la table SALLE : sa_id et une autre vers  information :in_id et une autre sur MAIL: ma_id
INSERT INTO SALLE (sa_name) VALUES ('210');

#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @said = (SELECT sa_id from SALLE where sa_name = '210') ;
INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia');
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)VALUES ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h',DATE(now()),@iid);
#-- on s'assure qu'un mail ayant pour contenu 'je souhaite réserver la salle 210 le 15 janvier de 15h à 17h' n'existe pas déjà
SET @maid = (SELECT ma_id from MAIL where ma_contenu = 'je souhaite réserver la salle 210 le 15 janvier de 15h à 17h');
CALL PI_RES_SIMPLE ('0',DATE(NOW()),'15','17','2',@said,@maid);
#--on choisit la 1ere valeur dispo pour ma_id
SET @maid = (SELECT max(ma_id) from MAIL);
SELECT @maid;
#-- on s'assure que la ligne a bien été insérée existe bien

SELECT * FROM RESERVATION where ma_id = @maid AND sa_id = @said;
ROLLBACK; #-- on annule toutes les actions précédentes



### Test unitaire procédure stockée `PSGet_RES`(Retrieve/Read)

START TRANSACTION;

INSERT INTO SALLE (sa_name) VALUES ('210');
SET @said = (SELECT sa_id from SALLE where sa_name = '210') ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia');
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');

INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)VALUES ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h',DATE(now()),@iid);
SET @maid = (SELECT max(ma_id) from MAIL);


INSERT INTO RESERVATION (res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id)
values ('0',DATE(NOW()),'15','17','2',@said,@maid) ;
SET @resid = (SELECT max(res_id) from RESERVATION);


CALL PSGet_RES(@resid) ;  #--renvoie les infos du mail dont l'ID est spécifié

ROLLBACK; #-- on annule toutes les actions précédentes


###
###
### Test unitaire procédure stockée `PFind_RES`(Retrieve/Read)

START TRANSACTION;

INSERT INTO SALLE (sa_name) VALUES ('210');
SET @said = (SELECT sa_id from SALLE where sa_name = '210') ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia');
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');

INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)VALUES ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h',DATE(now()),@iid);
SET @maid = (SELECT max(ma_id) from MAIL);


INSERT INTO RESERVATION (res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id)
values ('0',DATE(NOW()),'15','17','2',@said,@maid) ;
SET @resid = (SELECT max(res_id) from RESERVATION);



CALL PFind_RES(); 
SELECT count(*) FROM RESERVATION; 
ROLLBACK; #-- on annule toutes les actions précédentes

###
###
### Test unitaire procédure stockées `PU_RES` (UPDATE / mise à jour)

START TRANSACTION;

INSERT INTO SALLE (sa_name) VALUES ('210');
SET @said = (SELECT sa_id from SALLE where sa_name = '210') ;


INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia');
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');

INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)VALUES ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h',DATE(now()),@iid);
SET @maid = (SELECT ma_id from MAIL);


INSERT INTO RESERVATION (`res_date`, `res_heure_arrive`, `res_heure_depart`, `res_temps_reserver`, `sa_id`, `ma_id`)
values (DATE(now()),15,17,2,@said,@maid) ;
SET @resid = (SELECT max(res_id) from RESERVATION);

SELECT * FROM RESERVATION WHERE res_id = @resid ; #--on affiche la ligne avant modification

##SET @resdate = (SELECT res_date FROM RESERVATION WHERE res_id = @resid) ;
##SET @resarrive = (SELECT res_heure_arrive FROM RESERVATION WHERE res_id = @resid) ;

SET @resdate = (SELECT res_date from RESERVATION);

SELECT * FROM RESERVATION WHERE res_date = @resdate ; #--on affiche la ligne avant modification

SET @resarrive = (SELECT res_heure_arrive FROM RESERVATION) ;

SELECT * FROM RESERVATION WHERE res_heure_arrive = @resarrive ; 

SELECT * FROM RESERVATION WHERE res_date = @resdate AND res_heure_arrive = @resarrive ;

#--appel à la procédure d'update avec de nouvelles valeurs
CALL PU_RES(@resid,@resdate,@resarrive,18,3, @said,@maid); 

SELECT * FROM RESERVATION where res_id = @resid ; #--on affiche la ligne après modification

ROLLBACK; #-- on annule toutes les actions précédentes




### 
###
### Test unitaire `PD_RES` (DELETE)

START TRANSACTION;

#--il y a 1 clés étrangères pointant vers la table INFORMATION : in_id

INSERT INTO SALLE (sa_name) VALUES ('210');
SET @said = (SELECT sa_id from SALLE where sa_name = '210') ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia');
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');

#-- on insère une ligne témoin
INSERT INTO MAIL(`ma_contenu`, `ma_date`, `in_id`)
values ('je souhaite réserver la salle 210 le 15 janvier de 15h à 17h', DATE(now()), @iid);
SET @maid = (SELECT max(ma_id) from MAIL);

INSERT INTO RESERVATION (`res_date`, `res_heure_arrive`, `res_heure_depart`, `res_temps_reserver`, `sa_id`, `ma_id`)
values (DATE(now()),15,17,2,@said,@maid) ;
SET @resid = (SELECT max(res_id) from RESERVATION) ;

SELECT * FROM RESERVATION WHERE res_id = @resid ; #--on affiche la ligne avant modification

CALL PD_RES (@resid); #--on supprime la ligne

SELECT * FROM RESERVATION WHERE res_id = @resid ; #--on essaye d'afficher la ligne et on doit constater la suppression

ROLLBACK;
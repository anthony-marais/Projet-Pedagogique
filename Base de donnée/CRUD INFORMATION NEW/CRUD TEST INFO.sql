use db_reservation;


### Test unitaire procédure stockée `PI_RES_SIMPLE` (Create)

START TRANSACTION;


#--il y a 1 clés étrangères pointant vers la table SALLE : sa_id et une autre vers  information :in_id et une autre sur MAIL: ma_id

#--on récupère la clé primaire correspondante à la ligne que l'on vient d'insérer
SET @roid = (SELECT role_id from ROLE where role_intitule = 'USER') ;


CALL PI_INFORMATION_SIMPLE ('0','caca@gmail.com','fils','de_pute','grosse_merde','facebook','cacasurtasoeur',@roid);
#--on choisit la 1ere valeur dispo pour ma_id

#-- on s'assure que la ligne a bien été insérée existe bien

SELECT * FROM INFORMATION where role_id = @roid; 
ROLLBACK; #-- on annule toutes les actions précédentes



### Test unitaire procédure stockée `PSGet_RES`(Retrieve/Read)

START TRANSACTION;


SET @roid = (SELECT role_id from ROLE where role_id = 1) ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`, `in_mdp`, `role_id`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia','caca',1);
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');






CALL PSGet_INFORMATION(@iid) ;  #--renvoie les infos du mail dont l'ID est spécifié

ROLLBACK; #-- on annule toutes les actions précédentes


###
###
### Test unitaire procédure stockée `PFind_RES`(Retrieve/Read)

START TRANSACTION;


SET @roid = (SELECT role_id from ROLE where role_id = 1) ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`, `in_mdp`, `role_id`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia','caca',1);
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');


CALL PFind_INFORMATION(); 
SELECT count(*) FROM INFORMATION; 
ROLLBACK; #-- on annule toutes les actions précédentes

###
###
### Test unitaire procédure stockées `PU_RES` (UPDATE / mise à jour)

START TRANSACTION;


SET @roid = (SELECT role_id from ROLE where role_id = 1) ;


INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`, `in_mdp`, `role_id`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia','caca',1);
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');




SELECT * FROM INFORMATION WHERE in_id = @iid ; #--on affiche la ligne avant modification








#--appel à la procédure d'update avec de nouvelles valeurs
CALL PU_INFORMATION(28,'caca@gmail.com','pd','grospd','paysans','facebook','piou',@roid ); 

SELECT * FROM INFORMATION where in_id = @iid ; #--on affiche la ligne après modification

ROLLBACK; #-- on annule toutes les actions précédentes




### 
###
### Test unitaire `PD_RES` (DELETE)

START TRANSACTION;

SET @roid = (SELECT role_id from ROLE where role_id = 1) ;

INSERT INTO INFORMATION (`in_mail`, `in_nom`, `in_prenom`, `in_poste`, `in_organisation`, `in_mdp`, `role_id`) VALUES ('Boubaker.s@gmail.com','Boubaker','Samy','Pekor','Narnia','caca',1);
SET @iid = (SELECT in_id FROM INFORMATION where in_mail = 'Boubaker.s@gmail.com');




SELECT * FROM INFORMATION WHERE in_id = @iid ;

CALL PD_INFORMATION (@iid); #--on supprime la ligne

SELECT * FROM INFORMATION WHERE in_id = @iid ; #--on essaye d'afficher la ligne et on doit constater la suppression

ROLLBACK;
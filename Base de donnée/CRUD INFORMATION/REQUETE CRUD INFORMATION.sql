use db_reservation ;




# On change le délimiteur de la fin d'une instruction (; remplacé par $$)
# pour que MySQL lise chaque procédure d'un bloc
DELIMITER $$

 
##CRUD TABLE INFORMATION


##CREATE 

# Ajoute une INFORMATION avec un identifiant, mail, nom, prenom, poste, organisation 
CREATE PROCEDURE PI_INFORMATION(IN ID INT, IN MAIL VARCHAR(300), IN NOM VARCHAR(30), IN PRENOM VARCHAR(30), IN POSTE VARCHAR(50), IN ORGANISATION VARCHAR(100))
	# Si l'identifiant est déjà attribué
    IF EXISTS(SELECT * FROM INFORMATION WHERE in_id = ID)
    # Alors on renvoie un message d'erreur
	THEN 
		## un numéro d'erreur bidon
		SIGNAL SQLSTATE '45000'
			# avec son message perso
			SET MESSAGE_TEXT = "L'identifiant existe déjà";
	# Sinon
	ELSE
		# Si le mail existe déjà
		IF EXISTS(SELECT * FROM INFORMATION WHERE in_mail = MAIL)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Ce mail existe déjà";
		ELSE
			# On insère la nouvelle INFORMATION dans la table
			INSERT INTO INFORMATION VALUES(ID, MAIL, NOM, PRENOM, POSTE, ORGANISATION);
		END IF;
    # Fin du 1er IF    
	END IF$$

# Ajoute une INFORMATION avec juste son mail, nom, prenom, poste, organisation  (l'identifiant est autoincrémenté)
CREATE PROCEDURE PI_INFORMATION_SIMPLE(IN MAIL VARCHAR(300), IN NOM VARCHAR(30), IN PRENOM VARCHAR(30), IN POSTE VARCHAR(50), IN ORGANISATION VARCHAR(100))
	# On vérifie que le l'adresse mail n'existe pas déjà
    IF EXISTS(SELECT * FROM INFORMATION WHERE in_mail = MAIL)
	THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Le mail existe déjà";
	ELSE
		INSERT INTO INFORMATION (in_mail,in_nom,in_prenom,in_poste,in_organisation) VALUES(MAIL, NOM, PRENOM, POSTE, ORGANISATION);
	END IF$$

-- RETRIEVE

# Affiche l'identifiant de INFORMATION
CREATE PROCEDURE PSGetINFROMATION(IN ID INT)
	SELECT in_id , in_mail, in_nom,in_prenom,in_poste,in_organisation FROM INFORMATION 
    WHERE in_id = ID$$
    
# Affiche le mail de INFORMATION
CREATE PROCEDURE PSGetINFROMATIONmail(IN MAIL VARCHAR(300))
	SELECT in_id , in_mail, in_nom,in_prenom,in_poste,in_organisation FROM INFORMATION 
    WHERE in_mail = MAIL$$


# Affiche toutes les INFORMATION
CREATE PROCEDURE PL_INFORMATION()
	SELECT in_id , in_mail, in_nom,in_prenom,in_poste,in_organisation FROM INFORMATION$$

-- UPDATE

# Change les INFORMATION d'identifiant ID
CREATE PROCEDURE PU_INFORMATION(IN ID INT, IN MAIL VARCHAR(300), IN NOM VARCHAR(30), IN PRENOM VARCHAR(30), IN POSTE VARCHAR(50), IN ORGANISATION VARCHAR(100))
	# Si l'information existe
	IF EXISTS(SELECT * FROM INFORMATION WHERE in_id = ID)
    # Alors
	THEN 
		# On vérifie que la salle n'existe pas déjà
		IF EXISTS(SELECT * FROM INFORMATION WHERE in_mail = MAIL)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Le mail existe déjà";
		ELSE
		# On met à jour les informaiton
			UPDATE INFORMATION
				SET in_mail = MAIL, in_nom = NOM ,in_prenom = PRENOM ,in_poste = POSTE ,in_organisation= ORGANISATION
			# de la catégorie d'identifiant idCategorie         
			WHERE in_id = ID;
		END IF;
	ELSE 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "L'information que vous essayez de modifier n'existe pas";
	END IF$$

-- DELETE

# Supprime la salle d'identifiant ID
CREATE PROCEDURE PD_INFORMATION(IN ID INT)
	# Si l'INFORMATION existe
	IF EXISTS(SELECT * FROM INFORMATION WHERE in_id = ID)
    THEN
		# Si l'identifiant de la salle est référencé dans la table mail
        -- Test à supprimer si DELETE SET NULL
        -- ID (colonne dans MAIL) = ID (entrée de la procédure)
		IF EXISTS(SELECT * FROM MAIL WHERE ID = ID)
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "L' INFORMATION a son identifiant référencé dans la table MAIL; toutes ces entrées sont à rectifier au préalable";
		ELSE
			DELETE FROM INFORMATION WHERE in_id = ID;
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "L'information que vous essayez de supprimer n'existe pas";
	END IF$$
    

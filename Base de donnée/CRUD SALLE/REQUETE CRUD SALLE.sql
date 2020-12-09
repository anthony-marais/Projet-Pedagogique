use db_reservation ;




# On change le délimiteur de la fin d'une instruction (; remplacé par $$)
# pour que MySQL lise chaque procédure d'un bloc
DELIMITER $$

 
##CRUD TABLE categorie


##CREATE 

# Ajoute une catégorie avec un identifiant et un type 
CREATE PROCEDURE PI_SALLE(IN ID INT, IN SALLE VARCHAR(50))
	# Si l'identifiant est déjà attribué
    IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    # Alors on renvoie un message d'erreur
	THEN 
		## un numéro d'erreur bidon
		SIGNAL SQLSTATE '45000'
			# avec son message perso
			SET MESSAGE_TEXT = "L'identifiant existe déjà";
	# Sinon
	ELSE
		# Si la salle existe déjà
		IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Cette salle existe déjà";
		ELSE
			# On insère la nouvelle catégorie dans la table
			INSERT INTO SALLE VALUES(ID, SALLE);
		END IF;
    # Fin du 1er IF    
	END IF$$

# Ajoute une SALLE avec juste son sa_name (l'identifiant est autoincrémenté)
CREATE PROCEDURE PI_SALLE_SIMPLE(IN SALLE VARCHAR(50))
	# On vérifie que la salle n'existe pas déjà
    IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
	THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle existe déjà";
	ELSE
		INSERT INTO SALLE (sa_name) VALUES(SALLE);
	END IF$$

-- RETRIEVE

# Affiche l'identifiant de SALLE
CREATE PROCEDURE PSGetSALLE(IN ID INT)
	SELECT sa_id , sa_name FROM SALLE 
    WHERE sa_id = ID$$

# Affiche toutes les salle
CREATE PROCEDURE PL_SALLE()
	SELECT sa_id, sa_name FROM SALLE$$

-- UPDATE

# Change le nom de la salle d'identifiant ID
CREATE PROCEDURE PU_SALLE(IN ID INT, IN SALLE VARCHAR(50))
	# Si la salle existe
	IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    # Alors
	THEN 
		# On vérifie que la salle n'existe pas déjà
		IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "La salle existe déjà";
		ELSE
		# On met à jour le nom de la salle
			UPDATE SALLE
				SET sa_name = SALLE
			# de la catégorie d'identifiant idCategorie         
			WHERE sa_id = ID;
		END IF;
	ELSE 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle que vous essayez de modifier n'existe pas";
	END IF$$

-- DELETE

# Supprime la salle d'identifiant ID
CREATE PROCEDURE PD_SALLE(IN ID INT)
	# Si la salle existe
	IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    THEN
		# Si l'identifiant de la salle est référencé dans la table reservation
        -- Test à supprimer si DELETE SET NULL
        -- ID (colonne dans RESERVATION) = ID (entrée de la procédure)
		IF EXISTS(SELECT * FROM RESERVATION WHERE ID = ID)
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "La salle a son identifiant référencé dans la table RESERVATION; toutes ces entrées sont à rectifier au préalable";
		ELSE
			DELETE FROM SALLE WHERE sa_id = ID;
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle que vous essayez de supprimer n'existe pas";
	END IF$$
    

use db_reservation;

DELIMITER $$
CREATE PROCEDURE PI_ROLE(IN ID INT, IN ROLE VARCHAR(45))
IF EXISTS(SELECT * FROM ROLE WHERE role_id = ID)
    # Alors on renvoie un message d'erreur
    THEN 
        ## un numéro d'erreur bidon
        SIGNAL SQLSTATE '45000'
            # avec son message perso
            SET MESSAGE_TEXT = "L'identifiant existe déjà";
    # Sinon
    ELSE
        # Si le role existe déjà
        IF EXISTS(SELECT * FROM ROLE WHERE role_intitule = ROLE)
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = "Ce ROLE existe déjà";
        ELSE
            # On insère un nouveau role dans la table
            INSERT INTO ROLE VALUES(ID, ROLE);
        END IF;
	END IF$$
    

CREATE PROCEDURE PSGetROLE(IN ID INT)
	SELECT role_id , role_intitule FROM ROLE 
    WHERE role_id = ID;

DELIMITER $$
# Affiche toutes les salle
CREATE PROCEDURE PL_ROLE()
	SELECT role_id, role_intitule FROM ROLE;
$$



DELIMITER ||
# Change le nom de la salle d'identifiant ID
CREATE PROCEDURE PU_ROLE(IN ID INT, IN ROLE VARCHAR(45))
	# Si la salle existe
	IF EXISTS(SELECT * FROM ROLE WHERE role_id = ID)
    # Alors
	THEN 
		
		IF EXISTS(SELECT * FROM ROLE WHERE role_intule = USER)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "compte user";
		ELSE
		# On met à jour le nom de la salle
			UPDATE ROLE
				SET role_intitule = USERS
			# de la catégorie d'identifiant idCategorie         
			WHERE role_id = ID;
		END IF;
	ELSE 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Le role que vous essayez de modifier n'existe pas";
	END IF;



DELIMITER ||
CREATE PROCEDURE PD_ROLE(IN ID INT)
	# Si la salle existe
BEGIN

DELETE


FROM role

WHERE role_id = ID;
END ||
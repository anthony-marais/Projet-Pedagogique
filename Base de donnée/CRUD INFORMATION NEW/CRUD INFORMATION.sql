USE db_reservation;



DELIMITER ||



CREATE PROCEDURE `PI_INFORMATION`  (IN ID INT,mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))

BEGIN
    # verification de l'existence de l'utilisateur 
    IF EXISTS (SELECT * FROM INFORMATION WHERE role_id = ROLE_ID AND mail = in_mail )
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "un compte lié à cette adresse email existe déjà";
	END IF;
    ## 
     IF EXISTS (SELECT * FROM INFORMATION WHERE  in_id = ID ) 
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Le compte existe déjà";
	END IF;
    
    
	IF NOT EXISTS (SELECT * FROM ROLE WHERE role_id = ROLE_ID)
    #  message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "role_id non trouvé";
	END IF;
   
    
    
	# nouvelle données de reservation
	INSERT INTO INFORMATION(in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id) VALUES( ID ,mail , nom , prenom , poste , organisation , mdp , ROLE_ID);
			
	END ||

DELIMITER ; 


# Ajout d'une reservation 
DELIMITER ||


CREATE PROCEDURE `PI_INFORMATION_SIMPLE` (IN ID INT,mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
BEGIN
    
    IF EXISTS (SELECT * FROM INFORMATION WHERE mail = in_mail )
    
    THEN
		
	SIGNAL SQLSTATE '45000'
       
	SET MESSAGE_TEXT = "un compte lié à cette adresse email  existe déjà";
	END IF;
    
 INSERT INTO INFORMATION( in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id) VALUES(mail , nom , prenom , poste , organisation , mdp , ROLE_ID);	
	END ||
    
DELIMITER ;



### Procédure stockées Read




DELIMITER ||

CREATE PROCEDURE `PSGet_INFORMATION` (IN ID int(11))

BEGIN

	SELECT in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id
		FROM INFORMATION
		WHERE in_id = ID;
        
END ||

DELIMITER ;

### Procédure pour afficher la reservation



DELIMITER ||

CREATE PROCEDURE `PFind_INFORMATION` ()

BEGIN

		SELECT in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id
		FROM INFORMATION;
		
        
END ||

DELIMITER ;


### Procédure stockées Update



DELIMITER ||

CREATE PROCEDURE `PU_INFORMATION` (IN ID INT, mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
						

BEGIN

IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = ID) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Information utilisateur non trouvé';
END IF;

IF NOT EXISTS (SELECT * FROM ROLE WHERE role_id = ROLE_ID) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'type utilisateur  non trouvées';
END IF;



#-- mise à jour

UPDATE INFORMATION

SET in_mail = mail, in_nom = nom, in_prenom = prenom, in_poste = poste, in_organisation = organisation, in_mdp = mdp, role_id = ROLE_ID


WHERE in_id = ID ;

END ||

DELIMITER ;



### Procédure stockées Delete






DELIMITER ||

CREATE PROCEDURE `PD_INFORMATION` (IN ID INT(11))

BEGIN

DELETE

FROM INFORMATION

WHERE in_id = ID;

END ||


DELIMITER ;


USE db_reservation;

##Procédure create

DELIMITER ||

##Ajoute une reservation avec l'id de reservation l'id de la salle et l'id du mail avec la date
##l'heure de départ, l'heure d'arrivé , et le temps réservé

CREATE PROCEDURE `PI_RES`  (IN ID INT, RES_DATE DATE, heure_arrive INT, heure_depart INT, temps_reserver INT, SALLE_id INT, MAIL_id INT)

BEGIN
    # Si la salle est déjà réservé à cet heure ci 
    IF EXISTS (SELECT * FROM RESERVATION WHERE sa_id = SALLE_ID AND heure_arrive = res_heure_arrive AND res_date = RES_DATE )
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "La salle à déjà été reservée à cet heure ci";
	END IF;
    ## Si une reservation est déjà effectué
     IF EXISTS (SELECT * FROM RESERVATION WHERE  ma_id = MAIL_ID ) or (SELECT * FROM RESERVATION WHERE res_id= ID)
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Une réservation à déjà été effectué";
	END IF;
    
    
	IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MAIL_ID)
    #  message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "ma_id non trouvé";
	END IF;
    IF NOT EXISTS (SELECT * FROM SALLE WHERE sa_id = SALLE_ID)
    ##message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "sa_id non trouvé";
	END IF;
    
    
	# nouvelle données de reservation
	INSERT INTO RESERVATION(res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id) VALUES(ID, DATE(now()), heure_arrive , heure_depart , temps_reserver , SALLE_id , MAIL_id );
			
	END ||

DELIMITER ; 


# Ajout d'une reservation 
DELIMITER ||


CREATE PROCEDURE `PI_RES_SIMPLE` (IN RESID int,RES_DATE DATE, heure_arrive INT, heure_depart INT, temps_reserver INT, SALLE_id INT, MAIL_id INT )

BEGIN
    
    IF EXISTS (SELECT * FROM RESERVATION WHERE RES_DATE = res_date and SALLE_id = sa_id and heure_arrive = res_heure_arrive)
    
    THEN
		
	SIGNAL SQLSTATE '45000'
       
	SET MESSAGE_TEXT = "La reservation existe déjà";
	END IF;
    
 INSERT INTO RESERVATION(res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id) VALUES( DATE(now()), heure_arrive , heure_depart , temps_reserver , SALLE_id , MAIL_id );
		
	END ||
    
DELIMITER ;



### Procédure stockées Read




DELIMITER ||

CREATE PROCEDURE `PSGet_RES` (IN RESID int(11))

BEGIN

	SELECT res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id
		FROM RESERVATION
		WHERE res_id = RESID;
        
END ||

DELIMITER ;

### Procédure pour afficher la reservation



DELIMITER ||

CREATE PROCEDURE `PFind_RES` ()

BEGIN

	SELECT res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id
		FROM RESERVATION;
        
END ||

DELIMITER ;


### Procédure stockées Update



DELIMITER ||

CREATE PROCEDURE `PU_RES` (IN RESID INT,
						RES_DATE DATE,
						heure_arrive INT,
						heure_depart INT,
						temps_reserver INT,
						SALLE_id INT,
						MAIL_id INT)  
						

BEGIN

IF NOT EXISTS (SELECT * FROM RESERVATION WHERE res_id = RESID) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Reservation non trouvé';
END IF;

IF NOT EXISTS (SELECT * FROM SALLE WHERE sa_id = SALLE_id) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Salle non trouvées';
END IF;

IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MAIL_id) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Mail non trouvées';
END IF;

#-- mise à jour

UPDATE RESERVATION 

SET res_date = RES_DATE, res_heure_arrive = heure_arrive, res_heure_depart = heure_depart, res_temps_reserver = temps_reserver, sa_id = SALLE_id, ma_id = MAIL_id


WHERE res_id = RESID ;

END ||

DELIMITER ;



### Procédure stockées Delete






DELIMITER ||

CREATE PROCEDURE `PD_RES` (IN RESID INT(11))

BEGIN

DELETE

FROM RESERVATION

WHERE res_id = RESID;

END ||


DELIMITER ;










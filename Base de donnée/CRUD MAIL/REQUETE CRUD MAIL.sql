
USE db_reservation;


## Procédures stockées Create


DELIMITER ||


# Ajoute un mail avec un id un contenu de mail, une date 
CREATE PROCEDURE `PI_MAIL` (IN ID int, CONTENU varchar(300), MA_DATE datetime, INFO_ID int)

BEGIN
    # Si l'identifiant est déjà attribué
    IF EXISTS (SELECT * FROM MAIL WHERE ma_id = ID)
    # Alors on renvoie un message d'erreur
    THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "L'identifiant existe déjà";
	END IF;
    #-- vérifier l'existence des valeurs des paramètres destinés à des clés étrangères
	IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = INFO_ID)
    # Alors on renvoie un message d'erreur
	THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "in_id non trouvé";
	END IF;
	# On insère le nouveau mail dans la table
	INSERT INTO MAIL(ma_id, ma_contenu, ma_date, in_id) VALUES(ID, CONTENU, NOW(), INFO_ID);
			
	END ||

DELIMITER ;
    
   

# On ajoute un mail avec son contenu d'un mail avec son id_information (l'ID est autoincrémenté)
DELIMITER ||


CREATE PROCEDURE `PI_MAIL_SIMPLE` (IN MAILID int, CONTENU varchar(300), MA_DATE datetime, INFO_ID int)

BEGIN
    # On vérifie que le contenu et la date du mail n'existe pas déjà
    IF EXISTS (SELECT * FROM MAIL WHERE ma_contenu = CONTENU and ma_date = MA_DATE)
    # Alors on renvoie un message d'erreur
    THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "Le contenu et la date du mail existe déjà";
	END IF;
    # On insere le nouveau contenu mail dans la table
	INSERT INTO MAIL (ma_contenu, ma_date, in_id ) VALUES(CONTENU, NOW(), INFO_ID);
		
	END ||
    
DELIMITER ;

### Procédure stockées Retrieve/Read

### Procédure pour renvoyer 0/1 ligne


DELIMITER ||

CREATE PROCEDURE `PSGet_MAIL` (IN MailId int(11))

BEGIN

	SELECT ma_id, ma_contenu, ma_date, in_id
		FROM MAIL
		WHERE ma_id = MailId;
        
END ||

DELIMITER ;

### Procédure pour renvoyez tout les champs de la table



DELIMITER ||

CREATE PROCEDURE `PFind_MAIL` ()

BEGIN

	SELECT ma_id, ma_contenu, ma_date, in_id
		FROM MAIL;
        
END ||

DELIMITER ;


### Procédure stockées Update(mettre à jour)



DELIMITER ||

CREATE PROCEDURE `PU_MAIL` (
						IN MailId int(11),
						CONTENU varchar(320),
                        MA_DATE datetime,
						INFO_ID int(11))

BEGIN
#-- vérifier que le mail que l'on souhaite mettre à jour existe bien
IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MailId) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Mail non trouvé';
END IF;
#-- vérifier l'existence des valeurs des paramètres destinés à des clés étrangères
IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = INFO_ID) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Infomations non trouvées';
END IF;

#-- mise à jour

UPDATE MAIL

SET CONTENU=ma_contenu, MA_DATE=ma_date, INFO_ID=in_id

WHERE ma_id = MailId ;

END ||

DELIMITER ;


### Procédure stockées Delete



DELIMITER ||

CREATE PROCEDURE `PD_MAIL` (IN MailId int(11))

BEGIN

#--verification des clés étrangères pointant sur ma_id

IF EXISTS (SELECT * FROM RESERVATION WHERE ma_id = MailId) THEN
SIGNAL SQLSTATE '50005' SET MESSAGE_TEXT = 'Le mail a son identifiant référencé dans la table reservation; toutes ces entrées sont à supprimer au préalable';

END IF;

#--suppression

DELETE

FROM MAIL

WHERE ma_id = MailId;

END ||

DELIMITER ;

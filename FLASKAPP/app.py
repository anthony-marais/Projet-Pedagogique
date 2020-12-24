#**************************************************************************************IMPORT DES LIBRAIRIE**********************************************************

from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
## import de la librairie sqlalchemy pour crée la connexion entre python et la database
from sqlalchemy import create_engine
#import de la librairie pandas pour lire les information de la database sous forme de dataframe 
import pandas as pd
# import de la librairie json pour lire le fichier de config contenant les information de connexion
import json
# import de werkzeug security pour génerer un mdp hasher et checker le mdp
from werkzeug.security import generate_password_hash, check_password_hash
# import de re pour traiter le mail 
import re
# import de dateparser et datetime pour determiner la date demander du mail
import dateparser
import datetime
# connector de python à mysql
import mysql.connector

#**************************************************************************************INITIALISATION DE LA FLASK APP**********************************************************


app = Flask(__name__)

#**************************************************************************************SECRET KEY AJOUT DE SECURITE**********************************************************

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'


#**************************************************************************************CREATION DE LA CONNEXION SQLALCHEMY**********************************************************

## IMPORT DU CONFIG.JSON
# assignation de la config.json à fichierConfig
fichierConfig = "Projet-Pedagogique/FLASKAPP/config.json"
# ouverture et chargement des donnée contenu dans fichierConfig
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]

# assignation de de la connexion par create_engine avec les éléement de connexion + les info du fichierConfig à engine
# en dehors de la class car cet élémeent ne change pas
connection = mysql.connector.connect(host=config["host"],database = config["bdd"],user=config["user"],password=config["password"])
cursor = connection.cursor()
#**************************************************************************************CREATION DE L'URL /...**********************************************************

@app.route("/")    ### création de la route "/"
def starting_url():
    return redirect("/home") ### redirection de la route "/" vers "/home"

#**************************************************************************************REDIRECTION DE L'ULR /... à /home  **********************************************************



@app.route('/home', methods=['GET', 'POST']) # création de la route "/home" avec pour méthode GET & POST
def acceuil():
    #return "Bienvenue sur la page d'accueil"
    return render_template('index_booking.html') ## AFFICHAGE DU TEMPLATE DE LA PAGE D'ACCEUIL "index_booking.html"


#**************************************************************************************CONNEXION**********************************************************

@app.route('/login', methods=['GET', 'POST'])   # création de la route "/login" avec pour méthode GET & POST
def login():
    # Output message if something goes wrong...
    msg = ''                # variable msg = "" vide pour pouvoir l'utiliser et l'initialiser au msg voulu
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:  # récuperation des information email et password dans le formulaire de loggin "index.html"
        # Create variables for easy access
        email = request.form['email']       # assignation du resultat de email contenu dans le formulaire dans la variable email
        email = str(email)                  # conversion de de email en str() pour qu'il soit en chaine de caractere
        

        

        cursor.execute('SELECT in_mdp FROM INFORMATION WHERE in_mail = %s' , (email,))   # requete pour recuperer le mdp hasher correspondant a l'email taper pour pouvoir le comparer par la suite
        mdp = cursor.fetchone()                 # assignation du resultat de la requete dans la variable mdp

        password = request.form['password']     # assignation du resultat du password contenu dans le formulaire dans la variable password
        password = str(password)                # conversion du password en str() pour qu'il soit en chaine de caractere
        if check_password_hash(mdp[0], password) == True:       # verification si "mdp" de la base de donné qui est hasher correspond bien au mdp entrer par l'utilisateur dans le formulaire SI il est valable on peut continuer
            cursor.execute('SELECT * FROM INFORMATION WHERE in_mail = %s', (email,))    # VU que le password correspond au mdp de la base de donnée on requete la database pour récuperer toutes les informations de l'utilisateur
            # Fetch one record and return result
        account = cursor.fetchone()         # assignation de toutes les information de la requete dans account sous forme de liste

            # If account exists in accounts table in out database
        if account:         # création de la session
            # Create session data, we can access this data in other routes


            session['loggedin'] = True     ## le statut loggedin en True signifie que l'utilisateur est bien connecter
            session['id'] = account[0]      ## le session['id'] corréspond au 1ere élément de la liste de account
            session['email'] = account[1]      ## le session['email] correspond au 2eme élément de la liste de account
            # Redirect to home page
            return redirect(url_for('home'))        ## vu que l'utilisateur est bien connecté on le redirige vers la route 
        else:        # si l'utilisateur n'existe pas OU si il tape une mauvaise adresse mail OU mot de passe ALORS  
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'    # On lui affiche le message d'erreur
    # Show the login form with message (if any)
    return render_template('index.html', msg=msg)       ## On lui retourne le temple "index.html" qui contient le formulaire de connexion avec le message erreur initialiser dans "msg"




#**************************************************************************************DECONNEXION**********************************************************



# http://localhost:5000/python/logout - this will be the logout page
@app.route('/login/logout')                     ## CREATION DE LA ROUTE "/login/logout"
def logout():
    # Remove session data, this will log the user out
    # On initialise les parametre de connection de la session a None 
   session.pop('loggedin', None)     # On initialise le parametre session loggedin a None 
   session.pop('id', None)               # On initialise le parametre session id a None 
   session.pop('email', None)               # On initialise le parametre session email a None 
   # Redirect to login page
   return redirect(url_for('login'))        ## REDIRECTION VERS LA PAGE DE "login" 



#**************************************************************************************CREATION DE COMPTE**********************************************************



# http://localhost:5000/pythinlogin/register - this will be the registration page, we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST']) ## CREATION DE LA ROUTE "/register"
def register():         
    # Output message if something goes wrong...
    msg = ''        ## initialisation de la variable "msg" vide pour qu'elle puisse etre initialise au moment voulu avec le message souhaiter
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    ## RECUPERATION DES INFORMATION DANS LE FORMULAIRE REGISTE
    if request.method == 'POST' and 'email' in request.form and 'name' in request.form and 'surname' in request.form and 'user_poste' in request.form and 'user_org' in request.form and 'password' in request.form and 'repeat_password' in request.form:
        # Create variables for easy access
        email = request.form['email']       # assignation du champ email du formulaire dans la variable email
        email = str(email)                  # conversion de email en chaine de caractere avec str()
        name = request.form['name']         # assignation du champ name du formulaire dans la variable name
        name = str(name)                    # conversion de name en chaine de caractere avec str()
        surname = request.form['surname']   # assignation du champ surname du formulaire dans la variable surname
        surname = str(surname)              # conversion de surname en chaine de caractere avec str()
        user_poste = request.form['user_poste'] # assignation du champ user_poste du formulaire dans la variable user_poste
        user_poste = str(user_poste)               # conversion de user_poste en chaine de caractere avec str()
        user_org = request.form['user_org']         # assignation du champ user_org du formulaire dans la variable user_org
        user_org = str(user_org)                       # conversion de user_org en chaine de caractere avec str()
        password = request.form['password']         # assignation du password du formulaire dans la variable password
        password= str(password)                        # conversion de password en chaine de caractere avec str()
        repeat_password = request.form['repeat_password']  # assignation du repeat_password du formulaire dans la variable repeat_password
        repeat_password = str(repeat_password)      # conversion de repeat_password en chaine de caractere avec str()
        role_id = 2                                   # On force le role_id = 2 pour rendre obligatoire l'usage du role USER
        role_id = int(role_id)                        # conversion du role id en ENTIER avec int()
        

        

                # Check if account exists using MySQL
        cursor.execute('SELECT * FROM INFORMATION WHERE in_mail = %s', (email,)) ## on execute une requete pour voir si l'email existe deja dans la base de donnée 
        account = cursor.fetchone() # on stocke le resultat de la requete dans la variable account
        # If account exists show error and validation checks
        if account:                             ## si le compe avec l'addresse email exite on affiche un message d'erreur
            msg = 'Account already exists!'     ## on initialise la variable "msg"
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):    ## si l'addresse email ne contient pas de '@' ou un '@' avec du texte + un ' . ' l'adresse email n'est pas valide
            msg = 'Invalid email address!'      ## on initialise la variable "msg"
        elif not re.match(r'[A-Za-z0-9]+', name):   ## on verifie que l'addresse email ne contient que des chiffres et des lettres
            msg = 'Username must contain only characters and numbers!'         ## on initialise la variable "msg"
        elif password != repeat_password:       ## on verifie que le password soit identique au repeat_password
            msg = "Password do not match"       ## on initialise la variable "msg"
        elif not password or not email:         ## on verifie qu'il y ai bien un password et un email
            msg = 'Please fill out the form!'   ## on initialise la variable "msg"
        else:       ## SI TOUTES LES CONDITION SON REUNIES

            password = generate_password_hash(password)     ### ON GENERE UN MOT DE PASSE HASHER avec generate_password_hash pour le password que l'utilisateur a rentrer dans le formulaire
            password = str(password)        ### on convertie le mot de passe hasher en chaine de caractere avec str()


            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO INFORMATION VALUES (DEFAULT, %s, %s,%s, %s, %s,%s, %s)', (email, password, name,surname,user_poste,user_org, role_id))      ## ON INSERE ALORS LES DONNEES DU FORMULAIRE REGISTER DANS LA DATABASE
            connection.commit() # ON VALIDE L4INSERTION DES DONNEE
            msg = 'You have successfully registered!'   ## on initialise la variable "msg" ET ON AVERTI L'USER qu'il a bien été enregistrer
    elif request.method == 'POST':      ## SI LE FORMULAIRE NE CONTIENT AUCUNE DONNEES 
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'       ## on initialise la variable "msg" pour avertir a l'utilisateur de remplir le formulaire
    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)     ## ON AFFICHE LE TEMPLATE REGISTER "register.html" avec les "msg" 


#**************************************************************************************ACCEUIL USER**********************************************************
# http://localhost:5000/pythinlogin/home - this will be the home page, only accessible for loggedin users
@app.route('/login/home')           ## CREATION DE LA ROUTE "/login/home" QUI EST L'ACCEUIL USER
def home():         
    # Check if user is loggedin
    if 'loggedin' in session:       ## ON VERIFIE QUE L'USER SOIT BIEN CONNECTER 
        # User is loggedin show them the home page
        return render_template('home.html', mail=session['email'])  ## S'IL EST BIEN CONNECTER ON LUI AFFICHE LE TEMPLATE home.html avec un message d'acceuil contenant son email
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))   ## SI L'USER N'EST PAS CONNECTER ON LE REDIRIGE VERS LA ROUTE 'login' POUR QU'IL SE CONNECTE


#**************************************************************************************PAGE PROFIL USER**********************************************************


# http://localhost:5000/pythinlogin/profile - this will be the profile page, only accessible for loggedin users
@app.route('/login/profile')        ## CREATION DE LA ROUTE "/login/profile" QUI EST LA PAGE DE PROFIL DE L'USER
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:       ## ON VERIFIE QUE L'USER SOIT BIEN CONNECTER
        # We need all the account info for the user so we can display it on the profile page
        cursor.execute('SELECT * FROM INFORMATION WHERE in_id = %s', (session['id'],))  ## S'IL EST BIEN CONNECTER ON EFFECTUE une REQUETE POUR AFFICHER LES INFORMATION SOUHAITER
        account = cursor.fetchone() ## ON STOCKE le resultat de la requete dans la variable account
        
        # Show the profile page with account info
        return render_template('profile.html', account=account) ## ON AFFICHE LA PAGE profile avec le template "profile.html"
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))       ## SI L'USER N'EST PAS CONNECTER ON LE REDIRIGE VERS LA PAGE DE CONNECION "login"

#**************************************************************************************PAGE PROFIL POUR RESERVER**********************************************************


# http://localhost:5000/pythinlogin/profile - this will be the profile page, only accessible for loggedin users
@app.route('/login/reservation',  methods=['GET', 'POST'])      ## CREATION DE LA ROUTE "/login/reservation" avec les méthode GET & POST POUR LA DEMANDE DE RESERVATION
def reservation():  

    # Output message if something goes wrong...
    msg = ''    ## ON INITIALISE LA variable "msg"
    # Check if user is loggedin
    if 'loggedin' in session:       ## SI L'USER EST BIEN CONNECTER
        
        # variable du message flash pour avertir l'utilisateur
        msg = ''
        # récuperation des information du formualaire 
        if request.method == 'POST' and 'reservation' in request.form:      ## ON RECUPERER LE message de reservation dans le formulaire 
            mail_contenu = request.form['reservation']  ## on stocke la reservation dans "mail_contenu"
            mail_contenu = str(mail_contenu)       ## on converti "mail_contenu" en chaine de caractere avec str()
            
            
            #********************************** Traitement du mail en reservation***********************
            
            motif = "[a-zA-Z]+\s(\d+)[^\d]+([\d]+)\s*([a-zA-Z]+)[^\d]+([\d]+)[^\d]+([\d]+)" ## création du motif qui va être utiliser pour chercher les informations dans "mail_contenu"
            res_mail = re.findall(motif,mail_contenu) # application de la méthode findall() avec regex, on applique le motif sur le "mail_contenu", stocker dans la variable "res_mail"
            res_mail    
            # assignation du 1 élément de la liste
            num_salle_reserv = res_mail[0][0] # le premiere élément de la premiere liste correspond au nom de la salle est donc stocker dans "num_salle_reserv"
             # assignation du 2 élément de la liste
            day_reserv = res_mail[0][1]     # le deuxieme élément de la premiere liste correspond au jour demander est donc stocker dans "day_reserv"
             # assignation du 3 élément de la liste
            month_reserv = res_mail[0][2]   # le troisieme élément de la premiere liste correspond au mois demander est donc stocker dans "month_reserv"
             # assignation du 4 élément de la liste
            debut_reserv = res_mail[0][3]      # le quatrieme élément de la premiere liste correspond au l'heure de debut demander est donc stocker dans "debut_reserv"
            debut_reserv = int(debut_reserv)    # debut_reserv est converti en entier avec int()
             # assignation du 5 élément de la liste
            fin_reserv = res_mail[0][4]     # le cinquièeme élément de la premiere liste correspond au l'heure de fin demander est donc stocker dans "fin_reserv"
            fin_reserv = int(fin_reserv)        # fin_reserv est converti en entier avec int()
             # assignation de la différence entre le 4eme et 5eme élément de la liste
            time_reserv = fin_reserv - debut_reserv # time_reserv est la différence entre l'heure de fin et de début 
             # assignation du 2 et 3 eme élément de la liste et traitement pour convertir en format date
            date_reserv = day_reserv + " " + month_reserv   # date_reserv correspon au jour + mois en format texte
            date_reserv = dateparser.parse(date_reserv)  ## on converti date_reserv dans un format DATETIME
            now = datetime.datetime.now()   ## ON INITALISE now à la valeur de l'instant T quand est éxecuter le code
            if date_reserv <= now:          ## si la date_reserv est inférieur à now
                now_year = now.year + 1     ## alors on ajoute +1 à l'année de now et on le stocke dans la variable now_year
            else:                           ## sinon 
                now.year                    ## now.year ne change pas 
            date_reserv = str(date_reserv)  ## on convertie date_reserv en chaine de caractere avec str()
            date_reserv = date_reserv[5:10] ## on selectionne du 5eme au 9eme élément de la date 12-12 toujours stocker dans date_reserv
            date_reserv = str(now_year) + ' ' + date_reserv  # on convertie now_year en chaine de caractere avec str() et on l'additionne " " et plus la date_reserv pour avoir ce resultat 2020 12-12
            date_reserv = dateparser.parse(date_reserv) ## on transforme notre date_reserv en DATETIME
            date_reserv = date_reserv.date()    ## ON CONVERTI date_reserv en format DATE
            
             #********************************** Check de la dispo de la demande de reservation***********************

            #SELECT * FROM RESERVATION R INNER JOIN SALLES S ON S.sa_id=R.sa_id WHERE S.sa_name="1337" AND R.date="13-13-2020" AND ((10 > R.res_heure_arrive AND 10 < R.res_heure_depart) OR (11 > R.res_heure_arrive AND 11 < R.res_heure_depart));
            ## SELECT res_date, res_heure_arrive, res_heure_depart, S.sa_name FROM RESERVATION R INNER JOIN SALLE S ON S.sa_id=R.sa_id WHERE S.sa_name=%s AND R.res_date=%s AND %s BETWEEN R.res_heure_arrive AND R.res_heure_depart OR %s BETWEEN R.res_heure_arrive AND R.res_heure_depart;
            
            
            
            ## ON CHECK SI UNE RESERVATION EXISTE DEJA DANS LA BASE DE DONNEE POUR LE MEME "nom de salle" la même "DATE" et si les heures peuvent correspondre
            cursor.execute('SELECT * FROM RESERVATION R INNER JOIN SALLE S ON S.sa_id=R.sa_id WHERE S.sa_name=%s AND R.res_date=%s AND ((%s > R.res_heure_arrive AND %s < R.res_heure_depart) OR (%s > R.res_heure_arrive AND %s < R.res_heure_depart));', (num_salle_reserv,date_reserv,debut_reserv,debut_reserv, fin_reserv,fin_reserv))
            resa_db = cursor.fetchone()    ## ON STOCKE LE RESULTAT DE LA REQUETE DANS la variable "resa_db"
            
            if resa_db == None:  ## SI LE RESULTAT DE LA REQUETE N'AS AUCUNNE CORRESPONDANCE ALORS 
                ### insert ma_contenu + reservation
                #**********************************Si check OK insertion dans la table MAIL*********************
                parameter_ma_contenu = mail_contenu ## on initialise le mail_contenu dans la variable "parameter_ma_contenu"
                parameter_session_id = session['id'] ## on initialise le session['id'] qui est l'id de la session en cours dans la variable "parameter_session_id"

                cursor.callproc("PI_MAIL_SIMPLE", [parameter_ma_contenu,parameter_session_id,],)    ## ON INSERE DANS LA TABLE MAIL LE MAIL CONTENU ET L'ID DE LA SESSION
                connection.commit() ## ON VALIDE L'INSERTION
                
                ### recup ma_id du mail inserer dans le dernier ma_contenu de l'user
                cursor.execute('SELECT ma_id FROM MAIL WHERE in_id = %s ORDER BY ma_date DESC LIMIT 1 ', (parameter_session_id,))   ## ON RECUPERE LE DERNIER MAIL ENVOYER DE L'USER ORDONNER PAR LA DATE ET L'HEURE ET SECONDE LA PLUS RECENTE 
                ma_id_recup = cursor.fetchone() ## ON STOCKE LE RESULTAT DE LA REQUETE DANS LA VARIABLE "ma_id_recup"
                ma_id_recup = ma_id_recup[0]    ## ma_id_recup est initialise avec son premier élément de sa liste
                
                
                ### recup le sa_id where num_salle_reserv
                cursor.execute('SELECT sa_id FROM SALLE WHERE sa_name = %s', (num_salle_reserv,)) ## ON REQUETE LA DATABASE POUR RECUPER L'ID DE LA SALLE DEMANDER PAR LE NOM DE LA SALLE
                sa_id_recup = cursor.fetchone() # on stocke le resultat de la requete dans "sa_id_recup"
                sa_id_recup = sa_id_recup[0]    # sa_id_recup est initialise avec son premier élément de sa liste


########################################################
                #parameter_date_reserv = date_reserv     
                #parameter_debut_reserv = debut_reserv
                #parameter_fin_reserv = fin_reserv
                #parameter_time_reserv = time_reserv
                #parameter_id_salle = sa_id_recup                ### id salle
                #parameter_ma_id = ma_id_recup           ### ma_id
       
             #********************************** Insertion du contenu en reservation dans RESERVATION***********************
                args = [date_reserv,debut_reserv,fin_reserv,time_reserv,sa_id_recup,ma_id_recup,] ### ASSIGNATION DANS "args" LISTE DES ARGUMENT D'ENTRER DANS LA PROCEDURE SOTCKE POUR INSERER LA RESERVATION
                cursor.callproc("PI_RES_SIMPLE", (args[0],args[1],args[2],args[3],args[4],args[5],))    ### EXECUTION DE LA PROCEDURE STOCKE POUR INSERER LA RESERVATION
                connection.commit()     ## ON VALIDE L'INSERTION
                
                # fetch result parameters
                
                

                msg = 'You have successfully send your reservation !'       ## ON AVERTIE L'USER qu'il a bien envoyer sa reservation 
            
            else:
                resa_db != None             ## SI LE RESULTAT DE LA REQUETE  ##  QUI CHECK SI UNE RESERVATION EXISTE DEJA DANS LA BASE DE DONNEE POUR LE MEME "nom de salle" la même "DATE" et si les heures peuvent correspondre
                                            ## N'EST PAS EGALE A NONE CELA SIGNIFI QU'IL Y AS DES CORRESPONDANCE 
                                            ## ALORS LA RESERVATION N'EST PAS VALIDE
                msg = 'your reservation is invalid!'






            
    
    
        return render_template('login_reservation.html' , msg=msg) ## SI L'USER EST CONNECTER ON AFFICHE LE TEMPLATE DE DEMANDE DE RESERVATION "login_reservation.thml"
    else:   ## SINON 
        return redirect(url_for('login')) ## ON LE REDIRIGE VERS LA PAGE DE CONNEXION "login"
    # User is not loggedin redirect to login page
    #return redirect(url_for('login'))


#**************************************************************************************DEFINITION DU PORT DE l'APP**********************************************************
if __name__=='__main__':
     app.run(debug=True, port=5000)  ## DEINITION DU PORT DE CONNEXION DE L'APP FLASK 
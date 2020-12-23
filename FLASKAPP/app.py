from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
# import de la librairie json pour lire le fichier de config contenant les information de connexion
import json
## import de la librairie sqlalchemy pour crée la connexion entre python et la database
from sqlalchemy import create_engine
#import de la librairie pandas pour lire les information de la database sous forme de dataframe 
import pandas as pd
# import de la librairie json pour lire le fichier de config contenant les information de connexion
import json
import hashlib
from werkzeug.security import generate_password_hash, check_password_hash
import re
import dateparser
import datetime


app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'


#**************************************************************************************CREATION DE LA CONNEXION SQLALCHEMY**********************************************************

# assignation de la config.json à fichierConfig
fichierConfig = "Projet-Pedagogique/FLASKAPP/config.json"
# ouverture et chargement des donnée contenu dans fichierConfig
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]



# assignation de de la connexion par create_engine avec les éléement de connexion + les info du fichierConfig à engine
# en dehors de la class car cet élémeent ne change pas
engine = create_engine('mysql+' + config["connector"] + '://' + config["user"] + ":" + config["password"] + "@" + config["host"] + ":" + config["port"] + "/" + config["bdd"], echo=False)
connection = engine.raw_connection()
#**************************************************************************************CREATION DE L'URL /...**********************************************************

@app.route("/")
def starting_url():
    return redirect("/home")

#**************************************************************************************REDIRECTION DE L'ULR /... à /home  **********************************************************



@app.route('/home', methods=['GET', 'POST'])
def acceuil():
    #return "Bienvenue sur la page d'accueil"
    return render_template('index_booking.html')


#**************************************************************************************CONNEXION**********************************************************

@app.route('/login', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        # Create variables for easy access
        email = request.form['email']
        email = str(email)


        cursor = connection.cursor()
        cursor.execute('SELECT in_mdp FROM INFORMATION WHERE in_mail = %s' , (email,))
        mdp = cursor.fetchone()

        password = request.form['password']
        password = str(password)
        if check_password_hash(mdp[0], password) == True:
            cursor = connection.cursor()
            cursor.execute('SELECT * FROM INFORMATION WHERE in_mail = %s', (email,))
            # Fetch one record and return result
        account = cursor.fetchone()
            # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes


            session['loggedin'] = True
            session['id'] = account[0]
            session['email'] = account[1]
            # Redirect to home page
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return render_template('index.html', msg=msg)




#**************************************************************************************DECONNEXION**********************************************************



# http://localhost:5000/python/logout - this will be the logout page
@app.route('/login/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('email', None)
   # Redirect to login page
   return redirect(url_for('login'))



#**************************************************************************************CREATION DE COMPTE**********************************************************



# http://localhost:5000/pythinlogin/register - this will be the registration page, we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST'])
def register():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    if request.method == 'POST' and 'email' in request.form and 'name' in request.form and 'surname' in request.form and 'user_poste' in request.form and 'user_org' in request.form and 'password' in request.form and 'repeat_password' in request.form:
        # Create variables for easy access
        email = request.form['email']
        email = str(email)
        name = request.form['name']
        name = str(name)
        surname = request.form['surname']
        surname = str(surname)
        user_poste = request.form['user_poste']
        user_poste = str(user_poste)
        user_org = request.form['user_org']
        user_org = str(user_org)
        password = request.form['password']
        password= str(password)
        repeat_password = request.form['repeat_password']
        repeat_password = str(repeat_password)
        in_id = 2
        in_id = int(in_id)
        

        

                # Check if account exists using MySQL
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM INFORMATION WHERE in_mail = %s', (email,))
        account = cursor.fetchone()
        # If account exists show error and validation checks
        if account:
            msg = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', name):
            msg = 'Username must contain only characters and numbers!'
        elif password != repeat_password:
            msg = "Password do not match"
        elif not password or not email:
            msg = 'Please fill out the form!'
        else:

            password = generate_password_hash(password)
            password = str(password)


            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO INFORMATION VALUES (DEFAULT, %s, %s,%s, %s, %s,%s, %s)', (email, password, name,surname,user_poste,user_org, in_id) )
            cursor.close()
            connection.commit()
            msg = 'You have successfully registered!'
    elif request.method == 'POST':
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'
    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)


#**************************************************************************************ACCEUIL USER**********************************************************
# http://localhost:5000/pythinlogin/home - this will be the home page, only accessible for loggedin users
@app.route('/login/home')
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        return render_template('home.html', mail=session['email'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


#**************************************************************************************PAGE PROFIL USER**********************************************************


# http://localhost:5000/pythinlogin/profile - this will be the profile page, only accessible for loggedin users
@app.route('/login/profile')
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM INFORMATION WHERE in_id = %s', (session['id'],))
        account = cursor.fetchone()
        # Show the profile page with account info
        return render_template('profile.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

#**************************************************************************************PAGE PROFIL POUR RESERVER**********************************************************


# http://localhost:5000/pythinlogin/profile - this will be the profile page, only accessible for loggedin users
@app.route('/login/reservation',  methods=['GET', 'POST'])
def reservation():

    # Output message if something goes wrong...
    msg = ''
    # Check if user is loggedin
    if 'loggedin' in session:
        
        # variable du message flash pour avertir l'utilisateur
        msg = ''
        # récuperation des information du formualaire 
        if request.method == 'POST' and 'reservation' in request.form:
            mail_contenu = request.form['reservation']
            mail_contenu = str(mail_contenu)
            
            
            #********************************** Traitement du mail en reservation***********************
            
            motif = "[a-zA-Z]+\s(\d+)[^\d]+([\d]+)\s*([a-zA-Z]+)[^\d]+([\d]+)[^\d]+([\d]+)"
            res_mail = re.findall(motif,mail_contenu)
            res_mail
            # assignation du 1 élément de la liste
            num_salle_reserv = res_mail[0][0]
             # assignation du 2 élément de la liste
            day_reserv = res_mail[0][1]
             # assignation du 3 élément de la liste
            month_reserv = res_mail[0][2]
             # assignation du 4 élément de la liste
            debut_reserv = res_mail[0][3]
            debut_reserv = int(debut_reserv)
             # assignation du 5 élément de la liste
            fin_reserv = res_mail[0][4]
            fin_reserv = int(fin_reserv)
             # assignation de la différence entre le 4eme et 5eme élément de la liste
            time_reserv = fin_reserv - debut_reserv
             # assignation du 2 et 3 eme élément de la liste et traitement pour convertir en format date
            date_reserv = day_reserv + " " + month_reserv
            date_reserv = dateparser.parse(date_reserv)
            now = datetime.datetime.now()
            if date_reserv <= now:
                now_year = now.year + 1
            else:
                now.year
            date_reserv = str(date_reserv)
            date_reserv = date_reserv[5:10]
            date_reserv = str(now_year) + ' ' + date_reserv
            date_reserv = dateparser.parse(date_reserv)
            date_reserv = date_reserv.date()
            
             #********************************** Check de la dispo de la demande de reservation***********************

            cursor = connection.cursor()
            cursor.execute('SELECT * FROM RESERVATION R INNER JOIN SALLE S ON S.sa_id=R.sa_id WHERE S.sa_name=%s AND R.res_date=%s AND %s BETWEEN R.res_heure_arrive AND R.res_heure_depart;', (num_salle_reserv,date_reserv,debut_reserv,))
            resa_db = cursor.fetchone()
            



            # SELECT * FROM RESERVATION R
            # INNER JOIN SALLES S ON S.sa_id=R.sa_id
            # WHERE S.sa_name="1337" AND R.date="13-13-2020" AND 9 #BETWEEN R.res_heure_arrive AND R.res_heure_depart; ( debut_reserv)



             #**********************************Si check OK insertion dans la table MAIL*********************

            ## insert ma_contenu si check est ok
            parameterIn1 = mail_contenu
            parameterIn2 = session['id']



            
            cursor = connection.cursor()
            cursor.callproc("PI_MAIL_SIMPLE", [parameterIn1,parameterIn2],)
        # fetch result parameters
            cursor.close()
            connection.commit()


             #********************************** Insertion du contenu en reservation dans RESERVATION***********************
            msg = 'You have successfully send your reservation !'

            ## insert reservation si check plus insertion ma_contenu est ok
            
    
    # Show the profile page with account info
        return render_template('login_reservation.html' , msg=msg)
    else:
        return redirect(url_for('login'))
    
    # User is not loggedin redirect to login page
    #return redirect(url_for('login'))




#**************************************************************************************DEFINITION DU PORT DE l'APP**********************************************************
if __name__=='__main__':
     app.run(debug=True, port=5000)
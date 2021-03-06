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


app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'



# assignation de la config.json à fichierConfig
fichierConfig = "Projet-Pedagogique/FLASKAPP/config.json"
# ouverture et chargement des donnée contenu dans fichierConfig
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]



# assignation de de la connexion par create_engine avec les éléement de connexion + les info du fichierConfig à engine
# en dehors de la class car cet élémeent ne change pas
engine = create_engine('mysql+' + config["connector"] + '://' + config["user"] + ":" + config["password"] + "@" + config["host"] + ":" + config["port"] + "/" + config["bdd"], echo=False)
connection = engine.raw_connection()

# Enter your database connection details below
app.config['MYSQL_HOST'] = config["host"]
app.config['MYSQL_USER'] = config["user"]
app.config['MYSQL_PASSWORD'] = config["password"]
app.config['MYSQL_DB'] = config["bdd"]

# Intialize MySQL
mysql = MySQL(app)




@app.route("/")
def starting_url():
    return redirect("/home")




@app.route('/home', methods=['GET', 'POST'])
def acceuil():
    #return "Bienvenue sur la page d'accueil"
    return render_template('index_booking.html')

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









# http://localhost:5000/python/logout - this will be the logout page
@app.route('/login/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('id', None)
   session.pop('email', None)
   # Redirect to login page
   return redirect(url_for('login'))






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











# http://localhost:5000/pythinlogin/home - this will be the home page, only accessible for loggedin users
@app.route('/login/home')
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        return render_template('home.html', mail=session['email'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))









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



















if __name__=='__main__':
     app.run(debug=True, port=5000)
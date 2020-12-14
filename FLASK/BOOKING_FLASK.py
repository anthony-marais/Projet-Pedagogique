from flask import *
from forms import RegisterForm
from config import Config
import sqlalchemy 
import pymysql
import pandas as pd
from flask_sqlalchemy import *
from sqlalchemy.sql import *
from sqlalchemy import *
from jinja2 import *
import hashlib
import os
from werkzeug.security import generate_password_hash, check_password_hash


app = Flask(__name__)

app.config.from_object(Config)




@app.route("/")
def starting_url():
    return redirect("/home")


@app.route('/home', methods=['GET', 'POST'])
def page_acceuil():
    #return "Bienvenue sur la page d'accueil"
    return render_template('index_booking.html')






@app.route('/register',methods=["get" , "post"])

def register():

    form = RegisterForm()

    if form.validate_on_submit():
        print(f'Email:{form.email.data} Password:{form.password.data}')
        # Insert user in DATABASE
        # Message flash OK
        return redirect(url_for('index'))

    return render_template('register_booking.html', form=form ,  title='Register')


#@app.route('/login')

#def login():

#@app.route('/user')

#def user():


#@app.route('/admin')

#def admin():
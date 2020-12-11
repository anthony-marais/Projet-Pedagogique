from flask import *
from forms import *
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
from flask import * 

app = Flask(__name__)

app.config.from_object(Config)

@app.route('/')
def PAGE_ACCUEIL():
    #return "Bienvenue sur la page d'accueil"
    return render_template('index_booking.html')
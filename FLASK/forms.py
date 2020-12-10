# pip install flask-wtf
# pip install flask 
# pip install email_validator
from flask_wtf import FlaskForm
from wtforms import StringField , SubmitField , PasswordField
#from wtforms import *
from wtforms.validators import DataRequired , Email , Length , ValidationError


class RegisterForm(FlaskForm):
    email = StringField('Email' , validators=[DataRequired(), Email()])
    password = PasswordField('Mot de passe' , validators=[DataRequired(), Length(min=6, max=20)])
    submit = SubmitField("S'inscrire")


    def validate_email(self, email):

        # Requete SQL check email in database if exist
        if email.data == 'anthony.marais@icloud.com':
            raise ValidationError('Cet email est déjà enregistré')
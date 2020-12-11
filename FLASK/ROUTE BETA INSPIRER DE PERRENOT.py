import sqlalchemy 
import pymysql
import pandas as pd
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text
from sqlalchemy import create_engine
from jinja2 import Environment, FileSystemLoader 
import hashlib
import os
#import extrai_mag_volum_casino as vc
#import CONFIGG
#import flask
from flask import * 

app = Flask(__name__)
#app.config.from_object(Config)

#app.config['SECRET_KEY']='Ma super secret key'

"""app.config.from_object(config)
print(config.CONFIGG['SECRET_KEY'])
capp = app.config['CONFIGG']"""

app.config.update( 
    SECRET_KEY  = 'ma cle secrete'
)

engine = create_engine('mysql+pymysql://root:Simplon1!@localhost:3306/PERRENOT')
con=engine.connect()

@app.route('/', methods=['GET','post'])
def home():
     
    return render_template('pages/index1.html')


#***********************************************************************************************************************Ajouter un utilisateur*********************************************************************

@app.route('/ajout_utilisateur', methods=['GET','post'])
def ajouter_user():
    Fpseudo=''
    Frole,Fmdp,FCmdp,Fnom,Fprenom='','','','',''
    requete_role="select role_id, role_intitule from role"
    role=con.execute(text(requete_role)).fetchall()
    role_n=[row[0] for row in role]
    nbre_role=len(role_n)
    data={
                'role_selec':Frole,
                'role':role,
                'nbre_role' : nbre_role,
                'pseudo':Fpseudo,
                'mdp':Fmdp,
                'Cmpd':FCmdp,
                'nom':Fnom,
                'prenom':Fprenom
         }
    if request.method =='POST':
        Frole=request.form['liste_roles']
        Fpseudo=request.form['pseudo']
        Fnom=request.form['nom']
        Fprenom=request.form['prenom']
        Fmdp=request.form['mdp']
        FCmdp=request.form['Cmdp']
        requet_pseudo=text('select utilisateur_id from utilisateur where utilisateur_pseudo=:pseudo')
        pseudo=con.execute(requet_pseudo,{'pseudo':Fpseudo}).fetchone()
        
        if pseudo:
            flash('ce pseudo existe déjà, veuillez le changer', 'danger')
        elif request.form['mdp'] != request.form['Cmdp']:
            flash('les deux mots de passe ne correspondent pas','danger')
        else:
            Fmdp=hashlib.sha1(str.encode(Fmdp)).hexdigest()
            #requete_ajout="call create_utilisateur(:nom,:prenom,:mdp,:pseudo, :role)"
           
            """conect = pymysql.connect(host='localhost', user='simplon', password='Simplon2020', db='perrenot', cursorclass= pymysql.cursors.DictCursor)

            try:
                curseur = conect.cursor()
                curseur.execute("call create_utilisateur(?, ?, ?, ?, ?)", ('Janvier','fevier','mars','pseudo', 2))

            except Exception as e:
                print("exception occured: {}".format (e))

            finally:
                conect.close()
            curseur = conect.cursor()"""
            #curseur.execute("call create_utilisateur(?, ?, ?, ?, ?)", ['Janvier','fevier','mars','pseudo', 2])
            requete_ajout="INSERT INTO utilisateur (utilisateur_nom, utilisateur_prenom, utilisateur_MDP, utilisateur_pseudo, role_id) VALUES (:nom, :prenom, :mdp, :pseudo,:role)"

            con.execute(text(requete_ajout),{'nom': Fnom, 'prenom':Fprenom, 'mdp':Fmdp, 'pseudo':Fpseudo,'role':Frole})
            #con.execute(text("call create_utilisateur('Janvier','fevier','mars','pseudo', 2)"))
            flash("l'utilisateur a été bien enregistré", 'success')
            Fpseudo=''
            Fnom=''
            Fprenom=''
            Fmdp=''
            FCmdp=''
            Frole=''
        data['pseudo']=Fpseudo 
        data['nom']  =Fnom 
        data['prenom']=Fprenom
        data['mdp']=Fmdp
        data['role_selec']=Frole
        return render_template('pages/ajouter_utilisateur.jinja', **data)   
        
    else:
        
        return render_template('pages/ajouter_utilisateur.jinja', **data)    


#*************************************************************************************************Identification***************************************************************        
@app.route('/authentification', methods=['post', 'get'])
def identification():
    pseudo=''
    nom=''
    prenom=''
    data={
            'nom': nom ,
            'prenom': prenom,
            'pseudo':pseudo
        }
    if request.method== 'POST':
        
        mot_de_pass=request.form['mdp']
        mot_de_pass=hashlib.sha1(str.encode(mot_de_pass)).hexdigest() # crypter le mot de passe tapé et le comparer avec celui qui est enregitré dans la BDD
        pseudo=request.form['pseudo']
        
        requete_role="select role_id as id from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass"
        requete_nom="select utilisateur_nom as nom from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass"
        requete_prenom= "select utilisateur_prenom as prenom from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass" 

              
        role=con.execute(text(requete_role),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        nom=con.execute(text(requete_nom),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        prenom=con.execute(text(requete_prenom),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        data['pseudo']=pseudo
        data['nom']=nom
        data['prenom']=prenom
        
        if role is None: 
            flash(' pseudo et mot de passe ne correspondent pas, Veuillez vérifier votre saisie','danger')
            return render_template('pages/index1.html',**data)
            
        elif role[0]==1:
            return render_template('pages/accueil_admin.html',**data)
        
        elif role[0]==2:
            return render_template('pages/accueil_agent.html',**data)
    return render_template('pages/accueil_admin.html',**data)    
            


#**********************************************************************************changement MDP********************************************************************************      

    #return render_template('pages/index1.html',**data)
        
@app.route('/changement_mdp', methods=['post'])
def change_mdp():
    # connexion BDD
    pseudo=''
    nom=''
    prenom=''
    data={
            'nom': nom ,
            'prenom': prenom,
            'pseudo':pseudo
        }
    if request.method== 'POST':
        
        mot_de_pass=request.form['mdp']
        mot_de_pass=hashlib.sha1(str.encode(mot_de_pass)).hexdigest() # crypter le mot de passe tapé et le comparer avec celui qui est enregitré dans la BDD
        pseudo=request.form['pseudo']
        
        requete_role="select role_id as id from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass"
        requete_nom="select utilisateur_nom as nom from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass"
        requete_prenom= "select utilisateur_prenom as prenom from utilisateur where utilisateur_pseudo=:pseudo and utilisateur_MDP=:pass" 

              
        role=con.execute(text(requete_role),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        nom=con.execute(text(requete_nom),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        prenom=con.execute(text(requete_prenom),{'pass':mot_de_pass, 'pseudo':pseudo}).fetchone()
        
               
        data['pseudo']=pseudo
        
        if role is None: 
            flash('ce pseudo n existe pas, veuillez vérifier votre saisie', 'danger')
            return 'pseudo ou mot de passe ne sont pas corrects'
            
        elif role[0]==1:    
            
            return render_template('pages/accueil_admin.html',**data)
            
        else:
            return "bonjour agent d exploitation"       


if __name__=='__main__':
     app.run(debug=True, port=3000)
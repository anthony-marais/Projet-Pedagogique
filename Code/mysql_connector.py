import pandas as pd
import json
## installation de # pip3 install mysql-connector-python
import mysql.connector
from mysql.connector import Error

fichierConfig = "config.json"
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]



connection = mysql.connector.connect(host=config["host"],database = config["bdd"],user=config["user"],password=config["password"])


cursor = connection.cursor()
# 0 is to hold value of the OUT parameter sum
query = ("SELECT * FROM SALLE")


cursor.execute(query)
result = cursor.fetchall
cursor.close()
connection.close()
print(result)








import mysql.connector
import sys
import pandas as pd
import json
## installation de # pip3 install mysql-connector-python
import mysql.connector
from mysql.connector import Error

fichierConfig = "config.json"
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]







conn = mysql.connector.connect(host=config["host"],database = config["bdd"],user=config["user"],password=config["password"])
cursor = conn.cursor()
parameter = "testconnectorTEST"
cursor.callproc("PI_SALLE_SIMPLE",[parameter,])
cursor.close()
conn.commit()
conn.close()















import mysql.connector
import sys
import pandas as pd
import json
## installation de # pip3 install mysql-connector-python
import mysql.connector
from mysql.connector import Error

fichierConfig = "config.json"
with open(fichierConfig) as fichier:
    config = json.load(fichier)["mysql"]







conn = mysql.connector.connect(host=config["host"],database = config["bdd"],user=config["user"],password=config["password"])


cursor = conn.cursor()
cursor.execute('SELECT res_date, res_heure_arrive, res_heure_depart, S.sa_name FROM RESERVATION R INNER JOIN SALLE S ON S.sa_id=R.sa_id WHERE S.sa_name=%s AND R.res_date=%s AND %s BETWEEN R.res_heure_arrive AND R.res_heure_depart OR %s BETWEEN R.res_heure_arrive AND R.res_heure_depart;', (736,"2021-01-17",8,10,))
resa_db = cursor.fetchone()
from flask import *
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)


@app.route("/" , methods=['get','post'])
def index():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        print('Username:', username, 'password:', password )
        admin_password = 'pbkdf2:sha256:150000$gGy2VuW0$000768cfb41969ffa1072f25f36d6dcb78999a74ea057b165eed0a7e3d621956'
        if username == 'admin' and check_password_hash(admin_password, password):
            return 'Accès autorisé'
        else:
            return 'Accès interdit'
        return 'Traitement'
    else:
        return render_template('index.html')

@app.route('/post-login', methods=['get','post'])
def login():
    return "Page de traitement" 


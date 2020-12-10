from flask import *
from forms import RegisterForm
from config import Config

app = Flask(__name__)
app.config.from_object(Config)



@app.route('/')
def hello_world():
    return "Bienvenue sur la page d'accueil"

@app.route('/register', methods=["get" , "post"])
def register():
    form = RegisterForm()

    if form.validate_on_submit():
        print(f'Email:{form.email.data} Password:{form.password.data}')
        # Insert user in DATABASE
        # Message flash OK
        return redirect(url_for('index'))

    return render_template('register.html', form=form ,  title='Register')



# from the app package import the app Flask instance
from flask import render_template
from app import app

@app.route('/')
@app.route('/index')
def index():
    user = {'username' : 'Christopher Francisco'}
    return render_template('index.html', title='Home', user=user)

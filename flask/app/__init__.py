# from flask package, import Flask class instance
from flask import Flask

# __name__ variable is set to the module name in which it is used, in this case, app
# location of module used as starting point needed to load associated resources
app = Flask(__name__) 

from app import routes

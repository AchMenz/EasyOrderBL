import logging
from flask import Flask
from flask.ext.appbuilder import SQLA, AppBuilder
from config import STATIC_DIR
from flask_mail import Mail
#from app.modified_skript.manager import SecurityManager


"""
 Logging configuration
"""

logging.basicConfig(format='%(asctime)s:%(levelname)s:%(name)s:%(message)s')
logging.getLogger().setLevel(logging.DEBUG)

app = Flask(__name__)
mail = Mail(app)

app.config.from_object('config')
db = SQLA(app)
#"static_folder=STATIC_DIR" hinzugefuegt; Issue #1 geloest
####
#Richard
####
#appbuilder = AppBuilder(app, db.session, static_folder=STATIC_DIR,security_manager_class=SecurityManager)

appbuilder = AppBuilder(app, db.session, static_folder=STATIC_DIR)

"""
from sqlalchemy.engine import Engine
from sqlalchemy import event

#Only include this for SQLLite constraints
@event.listens_for(Engine, "connect")
def set_sqlite_pragma(dbapi_connection, connection_record):
    # Will force sqllite contraint foreign keys
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA foreign_keys=ON")
    cursor.close()
"""    

from app import views


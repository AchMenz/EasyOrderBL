# Universal Order Program "EasyOrderBL" with Flask-Appbuilder
## Installation
Commandline:

    mkdir EasyOrderBLMain
    cd EasyOrderBLMain
    virtualenv .
    . bin/activate
    pip3 install flask-appbuilder flask_mail
    
    git clone https://github.com/AchimMenzel/EasyOrderBL.git
    
    cd EasyOrderBL
    fabmanager create-admin
    
Interactive:

    Username [admin]: admin
    User first name [admin]: Test
    User last name [admin]: Admin
    Email [admin@fab.org]: test@mail.com
    Password: password
    Repeat for confirmation: password

### Populate database with example data
Commandline:

    sqlite3 app.db < app/scratch/SqlInsert.sql

### Adjust host and port in "run.py"
    
    app.run(host='127.0.0.1', port=8080, debug=True)

### Adjust data for email in "config.py"

    #Email provider details
    MAIL_SERVER = 'smtp.web.de'
    MAIL_PORT = 587

    #Email credentials
    MAIL_USERNAME = 'blabla@aol.com'
    MAIL_PASSWORD = 'blabla'
    MAIL_USE_TLS = True

## Run
Commandline:

    fabmanager run
## Navigate to app
Browser (depending on run.py):
    
    127.0.0.1:8080
or:

    localhost:8080

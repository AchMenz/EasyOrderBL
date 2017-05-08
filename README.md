# Universal Order Program with Flask-Appbuilder
## Installation
Kommandozeile:

    mkdir UniBestFlaskAB
    cd UniBestFlaskAB
    virtualenv .
    . bin/activate
    pip3 install flask-appbuilder
    
    git clone https://github.com/AchimMenzel/UniversalOrderProgramFlaskAB.git
    
    cd UniversalOrderProgramFlaskAB
    fabmanager create-admin
    
dort interaktiv:

    Username [admin]: admin
    User first name [admin]: Test
    User last name [admin]: Admin
    Email [admin@fab.org]: test@mail.com
    Password: password
    Repeat for confirmation: password

### Datenbank mit Beispieldaten füllen
Kommandozeile:

    sqlite3 app.db < app/scratch/SqlInsert.sql

### In "run.py" Host und Port anpassen
    
    app.run(host='127.0.0.1', port=8080, debug=True)

### In "config.py" Daten für Emailversand anpassen

    #Email provider details
    MAIL_SERVER = 'smtp.web.de'
    MAIL_PORT = 587

    #Email credentials
    MAIL_USERNAME = 'blabla@aol.com'
    MAIL_PASSWORD = 'blabla'
    MAIL_USE_TLS = True

## Run
Kommandozeile:

    fabmanager run

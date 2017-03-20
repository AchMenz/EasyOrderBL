# Universal Order Program with Flask-Appbuilder
## Installation

    mkdir UniBestFlaskAB
    cd UniBestFlaskAB
    virtualenv .
    . bin/activate
    pip3 install flask-appbuilder
    
    git clone https://github.com/AchimMenzel/UniversalOrderProgramFlaskAB.git
    
    cd UniversalOrderProgramFlaskAB
    fabmanager create-admin
    
    Username [admin]: admin
    User first name [admin]: Test
    User last name [admin]: Admin
    Email [admin@fab.org]: test@mail.com
    Password: password
    Repeat for confirmation: password
       
## Run

    fabmanager run

In der Datei "run.py" kann der Host und der Port angepasst werden.
    
    app.run(host='127.0.0.1', port=8080, debug=True)

## Datenbank füllen

    sqlite3 app.db < app/scratch/SqlInsert.sql

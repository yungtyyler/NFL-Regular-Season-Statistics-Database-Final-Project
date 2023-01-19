from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Conference(db.Model):
    __tablename__ = 'conferences'
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, unique = True, nullable = False)
    abbreviation = db.Column(db.String(3), unique = True, nullable = False)

    def __init__(self, name: str, abbreviation: str):
        self.name = name
        self.abbreviation = abbreviation

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'abbreviation': self.abbreviation
        }

class Division(db.Model):
    __tablename__= 'divisions'
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    region = db.Column(db.String, nullable = False)
    conference_id = db.Column(db.Integer, db.ForeignKey('conferences.id'), nullable = False)

    def __init__(self, name: str, region: str, conference_id: int):
        self.name = name
        self.region = region
        self.conference_id = conference_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'region': self.region,
            'conference_id': self.conference_id
        }

class Team(db.Model):
    __tablename__ = 'teams'
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    city = db.Column(db.String)
    name = db.Column(db.String, unique = True, nullable = False)
    state = db.Column(db.String)
    home_color = db.Column(db.String, nullable = False)
    wins = db.Column(db.Integer)
    losses = db.Column(db.Integer)
    ties = db.Column(db.Integer)
    division_id = db.Column(db.Integer, db.ForeignKey('divisions.id'), nullable = False)
    conference_id = db.Column(db.Integer, db.ForeignKey('conferences.id'), nullable = False)

    def __init__(self, name: str, home_color: str, division_id: int, conference_id: int):
        self.name = name
        self.home_color = home_color
        self.division_id = division_id
        self.conference_id = conference_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'city': self.city,
            'state': self.state,
            'home_color': self.home_color,
            'wins': self.wins,
            'losses': self.losses,
            'ties': self.ties,
            'division_id': self.division_id,
            'conference_id': self.conference_id
        }
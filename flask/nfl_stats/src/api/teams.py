from flask import Blueprint, jsonify, abort, request
from ..models import Conference, Division, Team, db

bp = Blueprint('teams', __name__, url_prefix = '/teams')

@bp.route('', methods=['GET'])
def index():
    teams = Team.query.all()
    result = []
    for t in teams:
        result.append(t.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    t = Team.query.get_or_404(id)
    return jsonify(t.serialize())

@bp.route('/<int:id>', methods=['PATCH','PUT'])
def update(id: int):
    t = Team.query.get_or_404(id)
    if 'name' not in request.json and 'wins' not in request.json and 'losses' not in request.json and 'ties' not in request.json:
        return abort(400)
    
    if 'wins' in request.json:
        if int(request.json['wins']) < t.wins:
            return abort(400)
        t.wins = request.json['wins']
    
    if 'losses' in request.json:
        if int(request.json['losses']) < t.losses:
            return abort(400)
        t.losses = request.json['losses']

    if 'ties' in request.json:
        if int(request.json['ties']) < t.ties:
            return abort(400)
        t.ties = request.json['ties']

    try:
        db.session.commit()
        return jsonify(t.serialize())
    except:
        return jsonify(False)

@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json or 'home_color' not in request.json or 'division_id' not in request.json or 'conference_id' not in request.json:
        return abort(400)

    t = Team(
        name = request.json['name'],
        home_color = request.json['home_color'],
        division_id = request.json['division_id'],
        conference_id = request.json['conference_id']
    )

    if 'city' in request.json:
        t.city = request.json['city']
    if 'state' in request.json:
        t.state = request.json['state']
    if 'wins' in request.json:
        t.wins = request.json['wins']
    if 'losses' in request.json:
        t.losses = request.json['losses']
    if 'ties' in request.json:
        t.ties = request.json['ties']

    db.session.add(t) 
    db.session.commit()
    return jsonify(t.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    t = Team.query.get_or_404(id)
    try:
        db.session.delete(t)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)
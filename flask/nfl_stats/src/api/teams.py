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
def update_games(id: int):
    t = Team.query.get_or_404(id)
    if 'name' not in request.json and 'wins' not in request.json and 'losses' not in request.json and 'ties' not in request.json:
        return abort(404)
    
    if 'wins' in request.json:
        if int(request.json['wins']) < t.wins:
            return abort(404)
        t.wins = request.json['wins']
    
    if 'losses' in request.json:
        if int(request.json['losses']) < t.losses:
            return abort(404)
        t.losses = request.json['losses']

    if 'ties' in request.json:
        if int(request.json['ties']) < t.ties:
            return abort(404)
        t.ties = request.json['ties']

    try:
        db.session.commit()
        return jsonify(t.serialize())
    except:
        return jsonify(False)
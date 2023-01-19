from flask import Blueprint, jsonify, abort, request
from ..models import Conference, Division, Team, db

bp = Blueprint('conferences', __name__, url_prefix = '/conferences')

@bp.route('', methods=['GET'])
def index():
    conferences = Conference.query.all()
    result = []
    for c in conferences:
        result.append(c.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    c = Conference.query.get_or_404(id)
    return jsonify(c.serialize())
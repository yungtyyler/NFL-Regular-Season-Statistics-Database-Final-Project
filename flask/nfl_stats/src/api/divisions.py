from flask import Blueprint, jsonify, abort, request
from ..models import Conference, Division, Team, db

bp = Blueprint('divisions', __name__, url_prefix = '/divisions')

@bp.route('', methods=['GET'])
def index():
    divisions = Division.query.all()
    result = []
    for d in divisions:
        result.append(d.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    d = Division.query.get_or_404(id)
    return jsonify(d.serialize())
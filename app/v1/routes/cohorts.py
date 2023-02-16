from flask import Blueprint, jsonify

cohorts_api = Blueprint('cohorts', __name__)


@cohorts_api.route('all', methods=['GET'])
def login():
    
    cohorts = {
        '1': {
            'id': 286,
            'codigo': 'PER-0922',
            'nombre': 'Cohort 19'
        },
        '2': {
            'id': 386,
            'codigo': 'PER-0223',
            'nombre': 'Cohort 20'
        },
        '3': {
            'id': 375,
            'codigo': 'PER-0623',
            'nombre': 'Cohort 21'
        }
    }

    rtn = cohorts

    return (jsonify(rtn), 200)
from ..data.cohortes import CohortesData
# #from dotenv import load_dotenv

# # load_dotenv()


def check_alumnos(cohort_id):
    o_cohortes = CohortesData()
    alumnos_list = o_cohortes.obtener_alumnos_from_cohort(cohort_id)

    if alumnos_list == []:
        return None

    return alumnos_list

def cohortes_all():
    o_cohortes = CohortesData()
    cohortes_list = o_cohortes.obtener_cohortes()
    return cohortes_list


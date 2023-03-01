from ..data.cohortes_data import CohortesData
# #from dotenv import load_dotenv

# # load_dotenv()


def verificar_alumnos(cohorte_id):
    o_cohortes = CohortesData()
    alumnos_list = o_cohortes.obtener_alumnos_cohorte(cohorte_id)

    if alumnos_list == []:
        return None

    return alumnos_list

def all_cohortes():
    o_cohortes = CohortesData()
    cohortes_list = o_cohortes.obtener_cohortes()
    return cohortes_list


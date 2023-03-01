from .data_access import DataAccess

class CohortesData(DataAccess):
    
    def obtener_cohortes(self):
        procedure = "usp_all_cohortes"
        data = self.ExecuteSelectProdure(procedure)
        arr = data['result']
        return arr
    
    def obtener_alumnos_cohorte(self, cohort_id):
        procedure = "usp_alumnos_cohorte"
        parametros = [cohort_id]
        data = self.ExecuteSelectProdure(procedure, parametros)
        arr = data['result']
        return arr

    
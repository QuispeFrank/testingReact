from .data_access import DataAccess

class CohortesData(DataAccess):
    
    def obtener_cohortes(self):
        procedure = "usp_cohortes_s_all"
        data = self.ExecuteSelectProdure(procedure)
        arr = data['result']
        return arr
    
    def obtener_alumnos_from_cohort(self, cohort_id):
        procedure = "usp_cohorte_s_alumnos"
        parametros = [cohort_id]
        data = self.ExecuteSelectProdure(procedure, parametros)
        arr = data['result']
        return arr

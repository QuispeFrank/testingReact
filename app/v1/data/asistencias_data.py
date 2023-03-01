from .data_access import DataAccess

class AsistenciasData(DataAccess):
    
    def listar_registros_a_p(self, cohort_id):
        """
        Listar todos los registros_a_p de la tabla asistencias_participaciones
        mediante una cohorte
        """
        procedure = "usp_listar_registros_a_p"
        parametros = [cohort_id]
        data = self.ExecuteSelectProdure(procedure, parametros)
        arr = data['result']
        return arr

    def contar_participaciones_alumnos(self, asis_id):
        """
        Cuenta la cantidad de participaciones que hubieron en un registro_a_p en la
        tabla alumnos_asistencia_participacion mediaten el id_asis
        """
        procedure = "usp_count_asistencias"
        parametros = [asis_id]
        data = self.ExecuteSelectProdure(procedure, parametros)
        arr = data['result']
        return arr

    #   (286, '3ER TRIMESTRE', 'MAÑANA', '2022-11-28'),
    # def alumno_asistencias_registro

    def crear_registro_a_p(self, params):
        """
        Crea un registro en la tabla asistencias_participaciones
        """
        procedure = "usp_crear_registro_a_p"
        parametros = params
        registro = self.ExecuteProdure(procedure, parametros)
        #new_registro = registro['id']
        return registro

    def agregar_alumnos_a_p(self, params):
        """
        agrega un registro en la tabla alumnos_asistencia_participacion"
        """
        procedure = "usp_insertar_alumnos_registro_a_p"
        parametros = params
        self.ExecuteProdure(procedure, parametros)
        

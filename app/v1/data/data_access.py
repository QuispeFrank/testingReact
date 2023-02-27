import mysql.connector
from mysql.connector import Error
from os import getenv
#from dotenv import load_dotenv
#import json

#load_dotenv()


class DataAccess:

    def connector(self):
        conexion = mysql.connector.connect(
            host=getenv("INT_MYSQL_HOST"),
            user=getenv("INT_MYSQL_USER"),
            password=getenv("INT_MYSQL_PASSWORD"),
            database=getenv("INT_MYSQL_DB"),
        )
        return conexion

    def ExecuteSelectProdure(self, procedureName, params=[]):
        rtn = []
        args = params
        cnn = self.connector()
        try:
            cursor = cnn.cursor(dictionary=True)
            args = cursor.callproc(procedureName, params)
            for result in cursor.stored_results():
                rows = result.fetchall()
                for row in rows:
                    rtn.append(dict(row))
                #rtn.append(result.fetchall())
            cnn.commit()
            cursor.close()
        except Error as e:
            print(e)
        finally:
            if (cnn and cnn.is_connected()):
                cnn.close()
        return { 'result': rtn, 'params': args }
    
    def ExecuteProdure(self, procedureName, params):
        args = params
        try:
            cnn = self.connector()
            cursor = cnn.cursor()
            args = cursor.callproc(procedureName, params)
            cnn.commit()
            cursor.close()
        except Error as e:
            print(e) 
        finally:
            if (cnn and cnn.is_connected()):
                cnn.close()
        return { 'params': args }
    


# procedure = "usp__cohortes_s_cohortes"
# instance = DataAccess()
# data = instance.ExecuteSelectProdure(procedure)
# dataserialize = json.dumps(data['result'])
# print(dataserialize)
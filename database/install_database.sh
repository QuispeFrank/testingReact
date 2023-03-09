DB_USER='user'
DB_PASSWORD='pass'
DB_NAME='db'

if [ $DB_USER != 'user' -a $DB_PASSWORD != 'pass' -a $DB_NAME != 'db' ]; then
	cat \
		init.sql \
		tables/roles.sql \
		tables/usuarios.sql \
		tables/cohortes.sql \
		tables/alumnos.sql \
		tables/asistencias_participaciones.sql \
		tables/evaluacion_oral.sql \
		tables/alumnos_asistencia_participacion.sql \
		tables/alumnos_evaluacion_oral.sql \
		$(find procedures/ -name "*.sql") \
		data_dummy.sql | \
		sed "s/DATABASE_NAME/$DB_NAME/g" | \
		mysql -u $DB_USER -p$DB_PASSWORD;

		if [ $? -eq 0 ]; then
				echo "OK - CREATED DATABASE $DB_NAME";
				echo "OK - ADDED PROCEDURES"
				echo "OK - ADDED DATA DUMMY";
				echo "\n----- Enjoy!"
		fi

	else
		echo "you forgot to write your credentials"

fi

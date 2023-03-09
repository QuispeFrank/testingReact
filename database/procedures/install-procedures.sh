DB_USER='user'
DB_PASSWORD='pass'
DB_NAME='db'

if [ $DB_USER != 'user' -a $DB_PASSWORD != 'pass' -a $DB_NAME != 'db' ]; then
	cat $(find . -name "*.sql") | \
	mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME
		if [ $? -eq 0 ]; then
			echo "OK - ADDED PROCEDURES"
			echo "\n-------Enjoy!"
		fi
	else
		echo "you forgot to write your credentials"
fi


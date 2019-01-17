import psycopg2

user_name = 'postgres'
password = 'postegres'
db_name = 'menu'

DB_USER = "cherowl"
DB_PASSWORD = "matrix" 
DB_SERVER = "localhost"
DB_NAME = "users_jokes"

con = psycopg2.connect(
        dbname=db_name,
        user=user_name, 
        host='',
        password=password
)
con.autocommit = True

cur = con.cursor()
cur.execute('CREATE DATABASE {};'.format(db_name))
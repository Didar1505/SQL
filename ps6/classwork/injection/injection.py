import sqlite3

connection = sqlite3.connect("injection.db")
cursor = connection.cursor()
cursor.executescript("SELECT * FROM users;")
rows = cursor.fetchall()
print(rows)

connection.close()

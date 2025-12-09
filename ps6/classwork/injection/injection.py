import sqlite3

connection = sqlite3.connect("injection.db")
cursor = connection.cursor()

username = input("Name: ")
password = input("Password: ")

query = f"SELECT * FROM users WHERE name = '{username}' AND password = '{password}'"

print(query)
cursor.execute(query)
rows = cursor.fetchall()
print(rows)

connection.close()

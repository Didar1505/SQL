import sqlite3

class Server:
    def __init__(self):  
        self.connection = sqlite3.connect("injection.db")
        self.cursor = self.connection.cursor()

    def request(self, _id):
        query = f"SELECT * FROM users WHERE id = {_id}"
        self.cursor.execute(query)
        result = self.cursor.fetchall()

        return len(result) > 0
    
    def close(self):
        self.connection.close()
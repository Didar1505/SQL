from server import Server

server = Server()

_id = input("Enter user id: ")
response = server.request(_id)

if response:
    print("success")
else:
    print("failure")
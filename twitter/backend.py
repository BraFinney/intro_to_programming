database = {}

def update_database(username,email,password):
	database[username.lower()] = [email,password]
	

def create_account(username, email, password):
	update_database(username,email,password)

create_account('josgh','j@gmail.com','hey')

# dic = {"users": {"username":"charlse", }}

# dic["users"]=dic["users"],{"work":"Not yet"}

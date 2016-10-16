user_post = {}

def post(username,text="",picture="",video=""):
	user_post[username] = [""]
	user_post[username].insert(0, video)
	user_post[username].insert(0, picture)
	user_post[username].insert(0, text)
	post = "\n".join(user_post[username])
	return (post)










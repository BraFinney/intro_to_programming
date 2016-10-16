import backend
import post
database = backend.database
friends = {}
requests = {"Friend":" Status"}


class User:
	
	def __init__(self,username):
		self.username = username	


	def sign_up(self,email,password):
		backend.create_account(self.username,email,password)
		return ( "Account created successfully, " + 
		 	self.username.title() + " You are welcome to Twiter" + "\n")
		

	def sign_in(self,password):
		if database[self.username.lower()][1] == password:
			return (self.username.title() + " welcome back, pick up from where you " 
				+"left off"  + "\n")
		else: 
			return ("Error!! username does not match password, please "
				+"check and retype")

	def users(self):
		h = []
		for keys in database.keys():
			h.append(keys.title())	
		return ("\n".join(h))	
		

	def total_users(self):
		return ("Total Number of Users: " + str(len(database.keys())) + "\n")


	def account_details(self):
		position = database[self.username]
		return ("Name  : "+ (self.username).title() + "\n"
						"Email : " + position[0] + "\n")

	def update_email(self,email):
	 position = database[self.username]
	 position[0] = email.lower()
	 return ("Email updated" + "\n")

	def update_password(self,oldpassword,password):
		position = database[self.username]
		if oldpassword == position[1]:
			position[1] = password
			show = self.account_details()
			return ("Password updated" +"\n" + show 
				 + "Password: " + position[1])
		else: 
			return ("Wrong old password " +
				"check and try again")	

	def update_profile(self,location="none",job="none",relstatus="none",education="none",work="none"):
		position = database[self.username]
 		position.insert(2,location)
		position.insert(3,job)
		position.insert(4,relstatus)
		position.insert(5,education)
		return ("profile updated" + "\n")
			

	def display_profile(self):
		self.update_profile()
		position = database[self.username]
		return ("Username: " + self.username.title() + "\n" +
						"Email: " 			+  position[0] + "\n" + 
						"City: "  			+  position[2] + "\n" + 
						"Occupation: "  +  position[3] + "\n" + 
						"Rel status: "  +  position[3] + "\n" + 
						"Education: "  	+  position[3] + "\n" + 
						"Work place: "  +  position[3] + "\n" + "\n"  )

	def tweet(self,text="",picture="",video=""):
		print ("Tweet by @"+  self.username)
		rpost = post.post(self.username,text,picture,video)
		return rpost

	def timeline(self):
		print("\n")
		h = []
		b = post.user_post.values()
		for i in b:
			h.append(" ".join(i))
		return ("\n".join(h))

	def follow(self,username):
		try:
			if database[username.lower()].count >= 1:
				if (len(requests)) <= 1:
					requests[self.username] = ['']
					requests[self.username].append(username)
					return ("\n" + "You are now following " + username.title())
				elif (len(requests)) > 1:
					requests[self.username].append(username)
				return ("\n" + "You are now following " + username.title())				
		except:
			return ("\n" + "Could not send follow request because" + "\n" +
						"name was not found in database")

	def following(self):	
		h = []
		for i in requests[self.username]:
			h.append("You follow " + i.title())
		return ("\n".join(h[1:]))	

	def followers(self): 
		print("\n"+ "Hey "+ self.username.title() +" The following people follow you ")
		h = []
		for k,v in requests.items():
			for i in v:
				if i.lower() == self.username.lower():
					h.append(k.title() + " follows you")
					return (" ".join(h))

	def retweet(self,post,num):
		timeline =  self.timeline().split("\n")
		for i in timeline:
		 if (i[:num]) == post:
		 	return self.tweet(self.username,(i + "\nRetweet"))

	def sign_out(self):
		return ( "\n"+ "Signed out succesfully come again next time "
		 + self.username)


	


	
josh = User('Joshua')
ama = User('ama')

# print (ama.sign_up('kooper@gmail.com','pooma'))
# print (josh.sign_up('jomp','koomer'))
# print (ama.sign_in('pooma'))
# print (josh.sign_in('koomer'))
# print (ama.display_profile())
# print (ama.update_profile('Accra'))
# print (ama.display_profile())
# print (ama.update_email('ama@gmail.com'))
# print (ama.display_profile())
# print (ama.users())
# print (ama.total_users())
# print (ama.tweet('hey',"you xup yo"))
# print (ama.tweet('you', 'dey.png','me.mp4'))
# print (josh.tweet("new day", "My first Post"))
# print (josh.timeline())
# # print (ama.timeline())
# print (ama.follow('joshua'))
# print (ama.followers())
# #print (josh.followers())

# print (ama.following())
# print (ama.timeline())
# print (ama.retweet('you',3))
# #print (josh.sign_out())o
# #print (ama.tweet("you making workd "))









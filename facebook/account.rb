module Facebook

	class User 
		@@database = Hash.new
		@@user_post = Hash.new
		@@friends = Hash.new
		@@friends_requests = Hash.new

		def initialize(username)
			@username = username.downcase()
			
		end	

		def sign_up(email,password)
			@@database[@username.to_sym] = [email,password]
			("\n"+'Account created successfully.' +
				" Welcome to facebook " + @username.capitalize)
		end		

		def sign_in(password)
			real_password = @@database[@username.to_sym][1]
			if password == real_password
				("\n"+'Welcome back ' + @username.capitalize + " pick up from where you left off")
			else
				("\n"+'Password does not match username please check and retype')	
			end	
		end	

		def change_password(oldpassword,newpassword)
			if @@database[@username.to_sym][1] == oldpassword
				@@database[@username.to_sym][1] = newpassword
				return ("Password was successfully changed")
			else	
				return ("Error!!, please type the oldpassword correctly")
			end	

		end	

		def change_email(password,username)
			if @@database[@username.to_sym][1] == password
				@@database[@username.to_sym][0] = username
				return ("Username was successfully changed")
			else	
				return ("Error!!, please type the oldpassword correctly")
			end
		end	

		def users
			puts ("\n")
			h = []
			@@database.each{|k,v|
			 h<<k.capitalize }
			 h

		end

		def update_profile(location="None",occupation="None",education="None",workplace="None",relstatus="Single")
			key = @@database[@username.to_sym]
			key.insert(2, location,occupation,education,workplace,relstatus)
			("\nYour profile has been successfully updated")
		end	

		def profile()
			key = @@database[@username.to_sym]
			("\nYour Profile\nUsername: #{@username}\nEmail: #{key[0]}\nPassword: *****\nCity: #{key[2]}\nOcuupation: #{key[3]}\nEducation: #{key[4]}\nWorkplace: #{key[5]}\nRel Status: #{key[6]}" )

		end	



		def post(text,picture="",video="")
			 puts("\nYour Post")
			b = @@user_post.has_key? @username 
			if b == false
				@@user_post[@username] = ['']
				@@user_post[@username].insert(0,text,picture,video)
				return @@user_post[@username]
			else
				@@user_post[@username].push(text,picture,video)
				return @@user_post[@username].last(3)
			end			
		end

		def timeline()
			m = []
			puts ("\nPosts From You And Your Friends")
			@@user_post.each{|poster,post|
				m.push("\nPosts by " + poster.capitalize )
				m.push(post)}
			m
	    end


		def share(text,num)
			h = []
	    	@@user_post.each{|poster,posting|
	    		posting.each{|posts|
	    		if posts[0..num] == text
	    		 	h.push("\n#{@username} shared #{poster} post \n"+ posts)
	    		end	
	    		}
	    	}
	    	return h
	    end

	    def like_post(post,num)
	    	h = []
	    	@@user_post.each{|poster,posting|
	    		posting.each{|posts|
	    		if posts[0..num] == post
	    		 	h.push("\n#{@username} Liked #{poster} post \n"+ posts)
	    		end	
	    		}
	    	}
	    	h
	    end	

	    def send_friend_request(username)
	    	if @@database.has_key? username.downcase().to_sym 
	    		 if @@friends_requests.has_key? @username
	    		 	@@friends_requests[@username].push(username)
	    		 	return ("Hey #{@username.capitalize} a Frienship request has been sent to #{username.capitalize}")
	    		else
	    			@@friends_requests[@username] = ['']
	    			@@friends_requests[@username].push(username)
	    			return ("Hey #{@username.capitalize} a Frienship request has been sent to #{username.capitalize}")
	    		end
	    	else
	    		("\nCould not send request because Username was not found in database")	
	    	end		
	    end

	    def request_hub()
	    	h = []
	    	puts("\n")
	    	@@friends_requests.each{|k,v|
	    		v.each{|names|
	    			if names == @username
	    				h.push( k.capitalize + " accept" + " reject")
	    			end	

	    		}
	    	} 
	    	h 
	    end

	    def requests()
	    	puts("\nHey #{@username.capitalize} The following want to be your friend")
	    	request_hub
	    end	

	    def requests_sent()
	    	h = []
	    	puts("\nHey #{@username.capitalize} You sent frienship request to the following")
	    	@@friends_requests.each{|k,v|
	    		if k == @username
	    			h.push(v)
	    		end	
	    	} 
	    	h 
	    end

	    def friends()
	    	number = process_request.length
	    	return ("You have #{number} friends \n#{process_request.join("\n")}")
	    end

	    def process_request(username="all")
	    	h = []
	    	list = request_hub
	    	list.each{|names|
	    		if username == "all"
	    			h.push(names[0..names.length-15])
	    		else 
					h.push(names)
	    		end	
	    	}
	    	h
	    end	


	#here	
	end
end	

# him = Facebook::User.new('ama')
# me  = Facebook::User.new('Charles')
# all = Facebook::User.new('mest')
# puts him.sign_up('Kofi@gmail.com','Pooma')
# puts him.sign_in('Pooma')
# puts him.profile
# puts him.change_email('Pooma','ama@gmail.com')
# puts him.profile()
# puts me.sign_up('Charles@gmail.com','pou')
# puts all.sign_up('mest@meltwater.org','hey')
# puts me.sign_in('pou')
# puts him.users()
# puts him.update_profile('Accra','Pastor','Bsc Admin','MEST','Complicated')
# puts him.profile()
# puts me.post('hi','me.png','you.mp4')
# puts him.post('you','fx.png','mest.avi')
# puts him.timeline
# puts me.post('haja','agfagfahg','ahjkahja')
# puts me.timeline()
# puts me.share('you',3)
# puts me.like_post('hi',2)
# puts him.like_post('hi',2)
# puts me.send_friend_request('ama')
# puts me.send_friend_request('mest')
# puts him.send_friend_request('charles')
# puts him.send_friend_request('mest')
# # puts all.send_friend_request('charles')
# # # puts me.requests()
# puts him.requests()
# puts him.process_request()
# # # puts all.requests_sent
# # # puts him.requests_sent
# # # puts me.requests_sent
# # # puts me.change_password('pou','uop')
# # # #puts me.profile
# # # #puts me.requests
# # # #puts me.process_request()
# puts him.friends
# # # puts him.timeline








package budgetapp

class UserController {

    def index() {
		
	}
	
	def create()	{
		def newestUser = new User(username:params.username, password:params.password)
		newestUser.save(failOnError:true)
		
		//	Assigning the new user the "user" authority role:
		def userRole = UserRole.findByAuthority('ROLE_USER')
		UserUserRole.create newestUser, userRole
	}
}

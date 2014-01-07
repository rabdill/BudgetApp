package budgetapp

class PublicController {
	def springSecurityService

    def index() { 
		if(springSecurityService.currentUser) redirect controller: 'home'
		
	}
}

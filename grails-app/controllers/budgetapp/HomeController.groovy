package budgetapp

//	The main controller. Linked to '/' directory; acts as "index"
class HomeController {
	def springSecurityService
	//	Homepage
    def index() {
		def user = User.get(springSecurityService.principal.id)
		def allBudgets = Budget.findAllByUser(user)
		
		return [allBudgets:allBudgets]
	}
}

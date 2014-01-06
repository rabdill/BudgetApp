package budgetapp

//	The main controller. Linked to '/' directory; acts as "index"
class HomeController {
	def springSecurityService
	//	Homepage
    def index() {
		def allBudgets = Budget.findAll()
		
		return [allBudgets:allBudgets]
	}
}

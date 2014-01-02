package budgetapp

//	The main controller. Linked to '/' directory; acts as "index"
class HomeController {

	//	Homepage
    def index() {
		def allBudgets = Budget.findAll()
		
		return [allBudgets:allBudgets]
	}
}

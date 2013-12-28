package budgetapp

class HomeController {

    def index() {
		def allBudgets = Budget.findAll()
		
		return [allBudgets:allBudgets]
	}
}

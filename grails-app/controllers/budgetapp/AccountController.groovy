package budgetapp

class AccountController {
	def index() {
		
	}	
	
	def create() {
		def newAccount = new Account(name:params.name, startValue:params.startValue, multiplier:params.multiplier, budget:session.currentBudget).save(failOnError:true)
	}
}

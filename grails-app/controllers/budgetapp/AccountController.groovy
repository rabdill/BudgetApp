package budgetapp

class AccountController {
	
	//	The index is just the acount form, and doesn't require any info.
	def index() {
		
	}	
	
	
	//	Making a new account in the session's current budget:
	def create() {
		def newAccount = new Account(name:params.name, startValue:params.startValue, multiplier:params.multiplier, budget:session.currentBudget).save(failOnError:true)
	}
}

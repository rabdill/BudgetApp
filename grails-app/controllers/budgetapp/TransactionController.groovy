package budgetapp

class TransactionController {
	
	def index() {
		def allAccounts = Account.findAll("from Account as a where a.budget=:budget",[budget:session.currentBudget])	
		return [allAccounts:allAccounts]
	}	
	
	//	Processes the transaction form:
	def create()	{
		def formattedDate = new Date().parse("MM/dd/yyyy", params.date)
		
		def formattedAccountLink
		if(params.accountFlag) formattedAccountLink = params.accountLink
		else formattedAccountLink = null 
		
		def bindingMap = [date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget]
		def newTransaction = new Transaction(bindingMap)
		
		newTransaction.save(failOnError:true)
		//	http://jts-blog.com/?p=9269
		
		return [currentBudget:session.currentBudget]
		
	}
}

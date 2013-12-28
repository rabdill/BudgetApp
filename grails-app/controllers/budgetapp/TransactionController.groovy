package budgetapp
import groovy.time.TimeCategory

class TransactionController {
	
	def index() {
		def allAccounts = Account.findAll("from Account as a where a.budget=:budget",[budget:session.currentBudget])	
		return [allAccounts:allAccounts]
	}	
	
	//	Processes the transaction form:
	def create()	{
		def testDate = new Date[10]
		def formattedDate = new Date().parse("MM/dd/yyyy", params.date)
		def formattedAccountLink
		if(params.accountFlag) formattedAccountLink = params.accountLink
		else formattedAccountLink = null 
		
		def bindingMap = [date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget]
		def newTransaction = new Transaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget).save(failOnError:true)
		
		def repeated = 0
		
		
		
		
		//	If it repeats:
		if(params.repeatFlag)	{	
			
			def formattedRepeatDate = new Date().parse("MM/dd/yyyy", params.repeatDate)
			
			//	record it as a repeating transaction:
			def newRepeater = new RepeatingTransaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, repeatType:params.repeatType, repeatVariable:params.repeatVariable, repeatDate:formattedRepeatDate, budget:session.currentBudget).save(failOnError:true)
			
			
			while(formattedDate < formattedRepeatDate)
			{
				repeated++
				//Increment the date:
				if(params.repeatType == 'days') {
					formattedDate = formattedDate + params.int('repeatVariable')
				}
				
				else {
					use (TimeCategory) {
						formattedDate = formattedDate + 1.month
					}
				}
				
				if(formattedDate <= formattedRepeatDate) newTransaction = new Transaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget).save(failOnError:true)
				
			}
		}

		
		
		//	http://jts-blog.com/?p=9269
		
		return [currentBudget:session.currentBudget, repeated:repeated]
		
	}
	
	
	//	Editing and deleting transactions:
	def alter()	{
		def displayEditForm = 0
		
		def transaction = Transaction.load(params.int('transactionChoice'))
		
		if(params.actionChoice == 'Delete selected transaction')	{
			transaction.delete()						
		}
		
		else displayEditForm = 1
		
		return [displayEditForm:displayEditForm, transaction:transaction]

	}
}

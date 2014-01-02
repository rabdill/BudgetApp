package budgetapp
import groovy.time.TimeCategory

class TransactionController {
	
	//	The "create transaction" form
	def index() {
		def allAccounts = Account.findAll("from Account as a where a.budget=:budget",[budget:session.currentBudget])	//	Populates the list of accounts the transaction can be linked with	
		return [allAccounts:allAccounts]
	}	
	
	
	
	//	Processes the transaction form:
	def create()	{
		def formattedDate = new Date().parse("MM-dd-yyyy", params.date)		//	Fixes the input date
		def formattedAccountLink
		if(params.accountFlag) formattedAccountLink = params.accountLink	//	If transaction is marked as affecting another account (accountFlag), set the accountLink field to the account's ID
		else formattedAccountLink = null 	//	Otherwise the transaction isn't linked to any account
		
		//	Create the new transaction:
		def bindingMap = [date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget]
		def newTransaction = new Transaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget).save(failOnError:true)
		
		
		
		def repeated = 0		//	For debugging. Counts the number of times the transaction has been repeated.

		//	If it repeats:
		if(params.repeatFlag)	{	
			
			def formattedRepeatDate = new Date().parse("MM-dd-yyyy", params.repeatDate)	//	The date the transaction stops repeating
			
			//	record it as a repeating transaction:
			def newRepeater = new RepeatingTransaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, repeatType:params.repeatType, repeatVariable:params.repeatVariable, repeatDate:formattedRepeatDate, budget:session.currentBudget).save(failOnError:true)
			
			
			while(formattedDate < formattedRepeatDate)	
			{
				repeated++
				
				//Increment the date:
				if(params.repeatType == 'days') {	//	If it repeats every X days:
					formattedDate = formattedDate + params.int('repeatVariable')
				}
				
				else {	//	Otherwise just add a month (does this get messed up with 30/31-day months?)
					use (TimeCategory) {
						formattedDate = formattedDate + 1.month
					}
				}
				
				//	Create the new transaction, unless the transaction overshot the date limit on the last iteration:
				if(formattedDate <= formattedRepeatDate) newTransaction = new Transaction(date:formattedDate, amount:params.amount, description:params.description, accountLink:formattedAccountLink, budget:session.currentBudget).save(failOnError:true)
				
			}
		}

		
		
		//	http://jts-blog.com/?p=9269
		
		return [currentBudget:session.currentBudget, repeated:repeated]
		
	}
	
	
	
	
	//	Form for editing and deleting transactions:
	def alter()	{
		def displayEditForm = 0
		
		def transaction = Transaction.load(params.int('transactionChoice'))	//	get the transaction
		
		if(params.actionChoice == 'Delete selected transaction')	{
			transaction.delete()						
		}
		
		else displayEditForm = 1	//	If the transaction isn't deleted, tell the view to ask how to edit it
		
		return [displayEditForm:displayEditForm, transaction:transaction]

	}
	
	
	//	Processing edit-transaction form:
	def edit()	{		
		def transaction = Transaction.load(params.int('idNum'))
		def formattedDate = new Date().parse("MM-dd-yyyy", params.date)
		def formattedAccountLink
		if(params.accountFlag) formattedAccountLink = params.accountLink
		else formattedAccountLink = null
		
		transaction.date = formattedDate
		transaction.amount = params.int('amount')
		transaction.description = params.description
		transaction.accountLink = formattedAccountLink
		transaction.budget = session.currentBudget
		transaction.save(failOnError:true)
				
		return [currentBudget:session.currentBudget]

	}
}

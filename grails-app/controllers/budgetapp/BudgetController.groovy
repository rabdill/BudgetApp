package budgetapp
import budgetapp.User


class BudgetController {
	
	def springSecurityService
	
	//	Asks user what budget to open:
	def index()	{
		def user = User.get(springSecurityService.principal.id)
		def allBudgets = Budget.findAllByUser(user)
		
		return [allBudgets:allBudgets]
	}
	
	//	Opens the selected budget:
	def view() {
		def user = User.get(springSecurityService.principal.id)
		def allBudgets = Budget.findAllByUser(user)		//	Loaded for the top menu where you can select other budgets
		if(params.budgetSelect) session.currentBudget = Budget.findWhere(name:params.budgetSelect)	//	If the user came from the index (Where the "budgetSelect" param came from),
		
		def ownedByUser		//	Checks to see if the budget is owned by the user
		if(session.currentBudget)	{	//Checks to see if the selected budget is real
				def realOwner = session.currentBudget.user																						
				if(user == realOwner) ownedByUser=1
				else ownedByUser=0	
		}
		else ownedByUser = 0	//if selected budget isn't real, throw the "nonexistent budget" error
		
		def allTransactions = Transaction.findAll("from Transaction as t where t.budget=:budget order by t.date",[budget:session.currentBudget])	//	Get all the transactions in the current budget
		def allAccounts = Account.findAll("from Account as a where a.budget=:budget",[budget:session.currentBudget])   //	Get all the accounts in the current budget
		def transactionCount = Transaction.countByBudget(session.currentBudget)		//	Count the number of transactions in the current budget. For loops.
		def accountCount = Account.countByBudget(session.currentBudget)				//	Count the number of accounts in the current budget. Also for loops.
	   def idNum = new Integer[transactionCount]									//	Tracks the ID number of each transaction in the grid.
	   def date = new Date[transactionCount]										//	the date of each transaction
	   def description = new String[transactionCount]								//	the description of each transaction
	   def amount = new Integer[transactionCount]									//	the amount of each transaction
	   def accountLink = new Integer[transactionCount]								//	the affected account of each transaction
	   def accountIds = new Integer[accountCount]									//	Tracks the ID number for each account
	   def accountMultiplier = new Integer[accountCount]							//	Tracks the multiplier (+/-) for each account
	   def runningTotal = new Integer[transactionCount]								//	running total for cash
	   def runningAccount = new Integer[accountCount][transactionCount]				//	running totals for each account
	   
	   //	the graphing definitions:
	   def chartData  = [:]
	   chartData.columns = [ ['date', 'Date'], ['number', 'Cash'] ]
	   chartData.data = []
	   
	   
	   //	Store the info of all the accounts, in the order they're displayed
	   def column = 0
	   allAccounts.each{
		   accountIds[column] = it.id
		   accountMultiplier[column] = it.multiplier
		   column++
	   }
	   
	   //	Go through all the transactions
	   def row = 0
	   allTransactions.each{
		   column = 0			//	Start on the far left
		   
		   //	Fill in the straightforward matrices
		   idNum[row] = it.id
		   date[row] = it.date
		   description[row] = it.description
		   amount[row] = it.amount
		   accountLink[row] = it.accountLink
		   
		   //	Set the new running total:
		   if(row > 0) runningTotal[row] = runningTotal[row-1] + it.amount
		   else runningTotal[row] = it.amount	//	If it's the first row, running total is the amount of the first transaction
		   
		   //	Add the information to the cash graph:
		   chartData.data << [ it.date, runningTotal[row] ?: 0 ]
		   
		   //Calculate all the account totals:
			   allAccounts.each{
				   if(row > 0) {
					   if(accountLink[row] == it.id) runningAccount[column][row] = runningAccount[column][row-1] + (amount[row] * accountMultiplier[column])	//	If the current transaction is linked to the account in this column
					   else runningAccount[column][row] = runningAccount[column][row-1]		//	Otherwise just copy the last value
					   
				   }
				   
				   else runningAccount[column][row] = it.startValue		//	If it's the first row, just assign the starting value to the account
				   column++			//	Rotate through to the next account
			   }
		   
		   row++	//	Rotate through to the next transaction
	   }
	      
	   return [ownedByUser:ownedByUser, allBudgets:allBudgets, chartData:chartData, idNum:idNum, date:date, description:description, amount:amount, runningTotal:runningTotal, transactionCount:transactionCount, allAccounts:allAccounts, runningAccount:runningAccount, accountCount:accountCount]   
   }
	
	
	//	The form for creating a new budget:
	def createForm()	{
		//	nothing here for now	
	}
	
	
	
	
	//	Process the new budget form:
	def create()	{
		def user = User.get(springSecurityService.principal.id)
		def newBudget = new Budget(name:params.name, user:user).save(failOnError:true)
		
		return [newBudget:newBudget]
		}
	
	
	def updateForm()	{
		//	nothing here at the moment
		
	}
	
	def update()	{
		def formattedDate = new Date().parse("MM-dd-yyyy", params.date)		//	Fixes the input date
		def deletedTransactions = Transaction.findAll("from Transaction as t where t.budget=:budget and t.date <=:date",[budget:session.currentBudget, date:formattedDate])	//	Get all the transactions before the current date
		
		deletedTransactions.each {
			it.delete()	
		}
		
		
		//	Set the new cash amount:	
		def fillerDescription="Updated total"
		def newTransaction = new Transaction(date:formattedDate, amount:params.amount, description:fillerDescription, budget:session.currentBudget).save(failOnError:true)
		
		
	}
	
}

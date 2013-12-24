package budgetapp

class BudgetController {
	
	def index()	{
		def allBudgets = Budget.findAll()
		
		return [allBudgets:allBudgets]
	}
	
	def viewBudget() {
	   def allTransactions = Transaction.findAll("from Transaction as t where t.budget=:budget order by t.date",[budget:Budget.findWhere(name:params.budgetSelect)])
	   def allAccounts = Account.findAll("from Account as a where a.budget=:budget",[budget:Budget.findWhere(name:params.budgetSelect)])
	   	   
	   def transactionCount = Transaction.countByBudget(Budget.findWhere(name:params.budgetSelect))
	   def accountCount = Account.countByBudget(Budget.findWhere(name:params.budgetSelect))
	   def date = new Date[transactionCount]
	   def description = new String[transactionCount]
	   def amount = new Integer[transactionCount]
	   def accountLink = new Integer[transactionCount]						//	the affected accounts for each transaction
	   def accountMultiplier = new Integer[accountCount]					//	the multiplier (+/-) for each account
	   def runningTotal = new Integer[transactionCount]						//	running total for cash
	   def runningAccount = new Integer[accountCount][transactionCount]		//	running totals for all the accounts
	   
	   //	Store the IDs of all the accounts, in the order they're displayed
	   def column = 0
	   def accountIds = new Integer[accountCount]
	   allAccounts.each{
		   accountIds[column] = it.id
		   accountMultiplier[column] = it.multiplier
		   column++
	   }
	   
	   //	Go through all the transactions
	   def row = 0
	   allTransactions.each{
		   column = 0
		   date[row] = it.date
		   description[row] = it.description
		   amount[row] = it.amount
		   accountLink[row] = it.accountLink
		   
		   if(row > 0) runningTotal[row] = runningTotal[row-1] + it.amount
		   else runningTotal[row] = it.amount
		   
		   //Calculate all the account totals:
			   allAccounts.each{
				   if(row > 0) {
					   if(accountLink[row] == it.id) runningAccount[column][row] = runningAccount[column][row-1] + (amount[row] * accountMultiplier[column])
					   else runningAccount[column][row] = runningAccount[column][row-1]
					   
				   }
				   
				   else runningAccount[column][row] = it.startValue
				   column++
			   }
		   
		   row++
	   }
	   
	  
	   
	   return [date:date, description:description, amount:amount, runningTotal:runningTotal, transactionCount:transactionCount, allAccounts:allAccounts, runningAccount:runningAccount, accountCount:accountCount]   
   }
	
	
}

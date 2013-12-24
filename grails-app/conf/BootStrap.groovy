import budgetapp.Budget
import budgetapp.Account
import budgetapp.Transaction

class BootStrap {

    def init = { servletContext ->
		def richard = new Budget(name: "RichBudg")
		.addToTransactions(date: "12/25/2013", description: "Xmas", amount: "1000")		
		.addToTransactions(date: "12/31/2013", description: "found in road", amount: "203")
		.addToTransactions(date: "12/03/2013", description: "starter", amount: "20")
		.addToTransactions(date: "01/09/2014", description: "stereo", amount: "-550")
		.addToAccounts(name: "Student loan", startValue: "5051", multiplier: "1").save(failOnError: true)
		
		def creditCard = new Account(name: "Credit card", startValue: "1490", multiplier: "1", budget:richard).save(failOnError: true)
		
		def ccPay = new Transaction(date:"03/25/2014", description: "cc payment", amount: "-1000", budget:richard, accountLink:creditCard.id).save(failOnError: true)
		
    }
    def destroy = {
    }
}

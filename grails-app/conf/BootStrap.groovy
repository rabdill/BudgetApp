import budgetapp.Budget
import budgetapp.User
import budgetapp.UserRole
import budgetapp.UserUserRole
import budgetapp.Account
import budgetapp.Transaction

class BootStrap {

	def springSecurityService
	
    def init = { servletContext ->
		
		//	Setting up the two kinds of users:
		def userRole = UserRole.findByAuthority('ROLE_USER') ?: new UserRole(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = UserRole.findByAuthority('ROLE_ADMIN') ?: new UserRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		//	Making rabdill user
		def rabdillUser = User.findByUsername('rabdill') ?: new User(
			username: 'rabdill',
			password: 'admin',
			enabled: true).save(failOnError: true)

		if (!rabdillUser.authorities.contains(userRole)) {
			UserUserRole.create rabdillUser, userRole
		}
		
		
		
		
		//	Making a sample budget:
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

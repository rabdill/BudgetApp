package budgetapp

class Transaction {
	Date date
	Integer amount
	String description
	Integer accountLink //	If the transaction affects another account,
						//	i.e. credit card payment. The ID of the account.
	
	static belongsTo = [budget:Budget]
	
	static mapping = {
		sort date: "asc"
	}
    static constraints = {
		date blank: false
		amount blank: false
		description nullable: true
		accountLink nullable: true
    }
}

package budgetapp

class Budget {
	String name
	String toString() {return name	}
	
	static belongsTo = [user:User]
	static hasMany = [transactions:Transaction, accounts:Account, repeatingTransactions: RepeatingTransaction]
	
	
    static constraints = {
		name blank: false, unique: true
    }
}

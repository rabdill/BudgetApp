package budgetapp

class Budget {
	String name
	String toString() {return name	}
	
	static hasMany = [transactions:Transaction, accounts:Account]
	
	
    static constraints = {
		name blank: false, unique: true
    }
}

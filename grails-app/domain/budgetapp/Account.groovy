package budgetapp

class Account {
	String name
	String toString() {return name	}
	Integer startValue
	Integer multiplier	//	A '-1' here reflects a deposit,
								//	while a '1' reflects a credit card.
								//	Essentially whether a contribution is
								//	added or subtracted.
	
	static belongsTo = [budget:Budget]
	
    static constraints = {
		name blank: false
		startValue blank: false
		multiplier blank: false
    }
}

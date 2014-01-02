package budgetapp

//	Repeating transactions have no direct use in the
//	application, but are stored here in case someone
//	wishes to extend a budget past the date it has so
//	far been calculated to. Saying "Add another year
//	to my budget, for example, is only possible to do
//	if you know how often each transaction repeats.

class RepeatingTransaction {
	Date date
	Integer amount
	String description
	Integer accountLink
	String repeatType	// "days"=repeats every x days, or "date"=repeats once a month
	Integer repeatVariable	//	how many days between repeats, if "days" is selected. Otherwise null.
	Date repeatDate //	the original end date of the event. Used
					//	when asking user to select which repeating
					//	events to continue repeating.
	
	static belongsTo = [budget:Budget]
	
	static mapping = {
		sort date: "asc"
	}
	
    static constraints = {
		date blank: false
		amount blank: false
		description nullable: true
		accountLink nullable: true
		repeatType blank: false
		repeatVariable nullable: true
		repeatDate blank: false
    }
}

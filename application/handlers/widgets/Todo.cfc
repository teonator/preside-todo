component {

	private function index( event, rc, prc, args={} ) {
		return runEvent(
			  event          = "Todo.index"
			, prepostExempt  = true
			, private        = true
			, eventArguments = {}
		);
	}

}

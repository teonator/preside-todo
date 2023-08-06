component {

	property name="validationEngine" inject="ValidationEngine";

	private function index( event, rc, prc, args={} ) {
		args.tasks = getPresideObject( "task" ).selectData(
			selectFields = [
				  "id"
				, "label"
				, "done"
			]
		);

		args.validationResult = rc.validationResult ?: validationEngine.newValidationResult();

		return renderView( view="widgets/todo/index", args=args );
	}

}

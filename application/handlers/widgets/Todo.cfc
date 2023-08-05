component {

	private function index( event, rc, prc, args={} ) {

		args.tasks = getPresideObject( "task" ).selectData(
			selectFields = [
				  "id"
				, "label"
			]
		);

		return renderView( view="widgets/todo/index", args=args );

	}


}

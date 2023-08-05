component {

	public function addTaskAction( event, rc, prc, args={} ) {
		var formData = event.getCollectionForForm( "task" );

		var task = formData.task ?: "";

		var taskId = getPresideObject( "task" ).insertData(
			data = {
				  label = task
				, status = false
			}
		);

		setNextEvent( url=cgi.http_referer );
	}

}

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

	public function deleteTaskAction( event, rc, prc, args={} ) {
		var taskId = rc.id ?: "";

		getPresideObject( "task" ).deleteData( id=taskId );

		setNextEvent( url=cgi.http_referer );
	}

	public function editTaskAction( event, rc, prc, args={} ) {
		var taskId   = rc.id   ?: "";
		var taskDone = rc.done ?: false;

		getPresideObject('task').updateData(
			  id   = taskId
			, data = {
				done = taskDone
			}
		);

		setNextEvent( url=cgi.http_referer );
	}

}

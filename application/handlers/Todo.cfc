component {

	property name="validationEngine" inject="ValidationEngine";
	property name="todoService"      inject="TodoService";

	variables.formName = "task";

	public function index( event, rc, prc, args={} ) {
		args.tasks = todoService.getTasks( filter=( rc.filter ?: "" ) );

		args.formName         = variables.formName;
		args.validationResult = rc.validationResult ?: validationEngine.newValidationResult();

		return renderView( view="todo/index", args=args );
	}

	public function addTaskAction( event, rc, prc, args={} ) {
		var formData         = event.getCollectionForForm( formName=variables.formName );
		var validationResult = validateForm( formName=variables.formName, formData=formData );

		if ( validationResult.validated() ) {
			var taskId = todoService.addTask( formData.task );
		}

		setNextEvent(
			  url           = cgi.http_referer
			, persistStruct = {
				  validationResult = validationResult
				, savedData        = formData
			}
		);
	}

	public function editTaskAction( event, rc, prc, args={} ) {
		var taskId   = rc.id   ?: "";
		var taskDone = rc.done ?: false;

		todoService.editTask( id=taskId, done=taskDone );

		setNextEvent( url=cgi.http_referer );
	}

	public function deleteTaskAction( event, rc, prc, args={} ) {
		var taskId = rc.id ?: "";

		todoService.deleteTask( id=taskId );

		setNextEvent( url=cgi.http_referer );
	}

}

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
			var taskId = getPresideObject( "task" ).insertData(
				data = {
					  label = formData.task ?: ""
					, status = false
				}
			);
		}

		setNextEvent(
			  url           = cgi.http_referer
			, persistStruct = {
				  validationResult = validationResult
				, savedData        = formData
			}
		);
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

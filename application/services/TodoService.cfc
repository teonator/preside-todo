/**
 * @presideService true
 * @singleton      true
 */
 component{

	public any function init() {
		return this;
	}

	public any function getTasks(
		  string  filterType = ""
		, boolean taskCount  = false
	) {
		var filter = {};

		switch ( arguments.filterType ) {
			case "pending":
				filter = { done=false };
				break;

			case "done":
				filter = { done=true };
				break;
		}

		return $getPresideObject( "task" ).selectData(
			  selectFields    = [
				  "id"
				, "label"
				, "done"
			]
			, filter          = filter
			, recordCountOnly = arguments.taskCount
		);
	}

	public numeric function getTaskCount( string filterType="" ) {
		return getTasks( argumentCollection=arguments, taskCount=true );
	}

	public string function addTask( required string label ) {
		return $getPresideObject( "task" ).insertData(
			data = {
				  label = arguments.label
				, done  = false
			}
		);
	}

	public numeric function editTask( required string  id, required boolean done ) {
		return $getPresideObject( "task" ).updateData(
			  id   = arguments.id
			, data = {
				done = arguments.done
			}
		);
	}

	public numeric function deleteTask( required string id ) {
		return $getPresideObject( "task" ).deleteData( id=arguments.id );
	}

}
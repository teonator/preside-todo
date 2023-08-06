/**
 * @presideService true
 * @singleton      true
 */
 component{

	public any function init() {
		return this;
	}

	public query function getTasks( string filterType="" ) {
		var filter = {};

		switch ( arguments.filterType ) {
			case "pending":
				filter = { done=false };
				break;

			case "done":
				filter = { done=true };
				break;
		}

		var result = $getPresideObject( "task" ).selectData(
			  selectFields = [
				  "id"
				, "label"
				, "done"
			]
			, filter       = filter
		);

		return result;
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


}
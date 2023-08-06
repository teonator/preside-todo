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

		var result = $getPresideObject('task').selectData(
			  selectFields = [
				  "id"
				, "label"
				, "done"
			]
			, filter       = filter
		);

		return result;
	}


}
<cfscript>
	formName         = args.formName         ?: "";
	validationResult = args.validationResult ?: "";
	savedData        = args.savedData        ?: {};

	tasks = args.tasks ?: QueryNew( "" );

	all     = args.all     ?: 0;
	pending = args.pending ?: 0;
	done    = args.done    ?: 0;

	errors = validationResult.getMessages();
	pageId = event.getCurrentPageId();

	filter = rc.filter ?: "";
</cfscript>

<cfoutput>
	<div>
		<div class="row mb-3">
			<div class="col col-xl-8 offset-xl-2">

				<h1>Todo</h1>

			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="col col-xl-8">

				<div class="card">
					<div class="card-body p-5">

						<form action="#event.buildLink( linkTo="Todo.addTaskAction" )#" method="post">
							#renderForm(
								  formName            = formName
								, formId              = formName
								, context             = "website"
								, fieldLayout         = "formcontrols.layouts.taskField"
								, savedData           = savedData
								, validationResult    = validationResult
								, includeValidationJs = false
							)#
						</form>

						<cfif StructCount( errors )>
							<div>
								 <cfloop collection="#errors#" item="field">
									<span class="text-danger">#translateResource( uri=errors[ field ].message, data=errors[ field ].params )#</span>
								</cfloop>
							</div>
						</cfif>

						<div class="d-flex align-items-center mt-4">
							<h4 class="flex-fill m-0">Tasks</h4>

							<ul class="nav nav-underline flex-fill justify-content-end">
								<li class="nav-item">
									<a class="nav-link #( filter == "" ? "active" : "" )#" href="#event.buildLink( page=pageId )#">
										All (#all#)
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link #( filter == "pending" ? "active" : "" )#" href="#event.buildLink( page=pageId, queryString="filter=pending" )#">
										Pending (#pending#)
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link #( filter == "done" ? "active" : "" )#" href="#event.buildLink( page=pageId, queryString="filter=done" )#">
										Done (#done#)
									</a>
								</li>
							</ul>
						</div>

						<cfif tasks.recordCount>
							<div class="list-group mt-3">
								<cfloop query="tasks">
									<div class="list-group-item list-group-item-action d-flex align-items-center">
										<a class="btn btn-sm me-2 btn-outline-secondary #( done ? "btn-outline-success" : "btn-outline-secondary" )#" href="#event.buildLink( linkTo="Todo.editTaskAction", queryString="id=#id#&done=#( !done )#" )#">
											<i class="fas fa-check #( done ? "" : "text-white" )#"></i>
										</a>
										<p class="flex-grow-1 mb-0 text-secondary #( done ? "text-decoration-line-through" : "" )#">#label#</p>

										<a class="btn btn-sm text-danger" href="#event.buildLink( linkTo="Todo.deleteTaskAction", queryString="id=#id#" )#">
											<i class="fas fa-trash"></i>
										</a>
									</div>
								</cfloop>
							</div>
						<cfelse>
							<p class="mt-4 text-center">Hooray! You don't have any #filter# task.</p>
						</cfif>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col col-xl-8 offset-xl-2 text-end">

				<span>Made with <a href="https://www.preside.org" target="_blank">Preside</a></span>

			</div>
		</div>
	</div>
</cfoutput>
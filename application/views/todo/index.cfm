<cfscript>
	tasks            = args.tasks            ?: QueryNew( "" );
	validationResult = args.validationResult ?: "";
	savedData        = args.savedData        ?: {};

	errors = validationResult.getMessages();
	pageId = event.getCurrentPageId();
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
								  formName            = "task"
								, formId              = "task"
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
									<a class="nav-link" href="#event.buildLink( page=pageId )#">
										All
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#event.buildLink( page=pageId, queryString="filter=pending" )#">
										Pending
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#event.buildLink( page=pageId, queryString="filter=done" )#">
										Done
									</a>
								</li>
							</ul>
						</div>

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
<cfscript>
	body     = renderView();
	metaTags = renderView( "/general/_pageMetaForHtmlHead" );
	adminBar = renderView( "/general/_adminToolbar" );

	event
		.include( "bootstrap-css" )
		.include( "fontawesome-css" )
	;
</cfscript>

<cfoutput><!DOCTYPE html>
<html>
	<head>
		#metaTags#

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		#event.renderIncludes( "css" )#
	</head>
	<body>
		<main>
			<div class="container py-4">
				<header class="pb-3 mb-4">
				</header>

				 #body#

				<footer class="pt-3 mt-4 text-body-secondary">
				</footer>
			</div>
		</main>

		#adminBar#

		#event.renderIncludes( "js" )#
	</body>
</html></cfoutput>

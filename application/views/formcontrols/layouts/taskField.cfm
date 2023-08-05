<cfparam name="args.control"  default="" />
<cfparam name="args.label"    default="" />
<cfparam name="args.help"     default="" />
<cfparam name="args.for"      default="" />
<cfparam name="args.error"    default="" />
<cfparam name="args.required" default="false" />

<cfscript>
	hasError = !isEmptyString( args.error );
</cfscript>

<cfoutput>
	<label class="sr-only" for="#args.for#">
		#args.label#
		<cfif args.required>
			<sup><i class="fas fa-asterisk"></i></sup>
		</cfif>
	</label>
	#args.control#
	<cfif hasError>
		<div class="invalid-feedback">
			#args.error#
		</div>
	</cfif>
	<cfif len( trim( args.help ) )>
		<small class="form-text text-muted">
			#htmlEditFormat( args.help )#
		</small>
	</cfif>
</cfoutput>
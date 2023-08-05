<cfscript>
	inputName    = args.name         ?: "";
	inputId      = args.id           ?: "";
	inputClass   = args.class        ?: "";
	defaultValue = args.defaultValue ?: "";
	maxlength    = args.maxlength    ?: "";
	minlength    = args.minlength    ?: "";
	disabled     = isTrue( args.disabled ?: "" );
	autocomplete = args.autocomplete ?: "";
	placeholder  = args.placeholder  ?: "";
	placeholder  = EncodeForHTML( translateResource( uri=placeholder, defaultValue=placeholder ) );

	value = event.getValue( name=inputName, defaultValue=defaultValue );
	if ( not IsSimpleValue( value ) ) {
		value = "";
	}

	value = EncodeForHTML( value );
</cfscript>

<cfoutput>
	<input type="text" id="#inputId#" placeholder="#placeholder#" name="#inputName#" value="#value#" class="#inputClass# form-control" tabindex="#getNextTabIndex()#"<cfif isNumeric( maxlength ) and maxlength gt 0> maxlength="#maxlength#"</cfif> <cfif isNumeric( minlength ) and minlength gt 0> minlength="#minlength#"</cfif><cfif !isEmptyString( autocomplete )> autocomplete="#autocomplete#"</cfif><cfif disabled> disabled</cfif>>
	<button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i></button>
</cfoutput>
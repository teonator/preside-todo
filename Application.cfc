component extends="preside.system.Bootstrap" {

	// see /preside/system/Bootstrap.cfc$setupApplication()
	// for further options
	super.setupApplication(
		  id                       = "Preside Todo"
		, presideSessionManagement = true
	);

}

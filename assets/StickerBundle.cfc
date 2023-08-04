/**
 * Sticker bundle configuration file. See: http://sticker.readthedocs.org/
 */
component {

	public void function configure( bundle ) {
		bundle.addAsset( id="bootstrap-css", url="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" );
		bundle.addAsset( id="bootstrap-js" , url="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" );

		bundle.addAsset( id="fontawesome-css", url="https://use.fontawesome.com/releases/v5.15.4/css/all.css" );
	}

}
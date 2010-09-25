component extends="algid.inc.resource.base.service" {
	public component function init( required struct transport ) {
		var app = '';
		
		super.init(arguments.transport);
		
		app = arguments.transport.theApplication.managers.singleton.getApplication();
		
		// Retrieve the mongo singleton
		variables.mongo = arguments.transport.theApplication.managers.singleton.getMongo();
		
		// Retrieve the database based upon the application key
		variables.db = variables.mongo.getDB('app_' & app.getKey());
		
		return this;
	}
}

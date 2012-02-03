component extends="algid.inc.resource.plugin.configure" {
	public void function onApplicationStart(required struct theApplication) {
		var plugin = '';
		var settings = '';
		
		plugin = arguments.theApplication.managers.plugin.getMongoDB();
		settings = plugin.getMongoDB();
		
		// Create the mongoDB singletons
		local.mongo = arguments.theApplication.factories.transient.getMongoForMongoDB(settings.serverName, settings.port);
		arguments.theApplication.managers.singleton.setMongo(local.mongo);
		
		local.mongoUtility = arguments.theApplication.factories.transient.getUtilityForMongoDB();
		arguments.theApplication.managers.singleton.setMongoUtility(local.mongoUtility);
	}
	
	public void function onApplicationEnd(required struct applicationScope) {
		// Close the mongo connections
		arguments.applicationScope.managers.singleton.getMongo().close();
	}
}

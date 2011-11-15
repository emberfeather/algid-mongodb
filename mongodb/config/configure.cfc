component extends="algid.inc.resource.plugin.configure" {
	public void function onApplicationStart(required struct theApplication) {
		var plugin = '';
		var port = 27017;
		var serverName = '127.0.0.1';
		var settings = '';
		
		plugin = arguments.theApplication.managers.plugin.getMongoDB();
		
		// Check for configuration override
		if(plugin.hasMongoDB()) {
			settings = plugin.getMongoDB();
			
			serverName = settings.serverName;
			port = settings.port;
		}
		
		// Create the mongoDB singletons
		local.mongo = arguments.theApplication.factories.transient.getMongoForMongoDB(serverName, port);
		arguments.theApplication.managers.singleton.setMongo(local.mongo);
		
		local.mongoUtility = arguments.theApplication.factories.transient.getUtilityForMongoDB();
		arguments.theApplication.managers.singleton.setMongoUtility(local.mongoUtility);
	}
}

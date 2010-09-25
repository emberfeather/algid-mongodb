component extends="algid.inc.resource.plugin.configure" {
	public void function onApplicationStart(required struct theApplication) {
		var mongo = '';
		var plugin = '';
		var port = 27017;
		var serverName = 'localhost';
		var settings = '';
		
		plugin = arguments.theApplication.managers.plugin.getMongoDB();
		
		// Check for configuration override
		if(plugin.hasMongoDB()) {
			settings = plugin.getMongoDB();
			
			serverName = settings.serverName;
			port = settings.port;
		}
		
		// Create the mongoDB singleton
		mongo = createObject('component', 'mongo4cf.mongo').init(serverName, port);
		
		arguments.theApplication.managers.singleton.setMongo(mongo);
	}
}

component extends="algid.inc.resource.base.modelTest" {
	public void function setup() {
		super.setup();
		
		variables.model = createObject('component', 'plugins.mongodb.inc.resource.base.model').init(variables.i18n);
	}
	
	/**
	 * Test that getting a value without setting it returns a blank string.
	 */
	public void function testReturnBlankWhenNotSet() {
		assertEquals('', variables.model.getSomething());
	}
	
	/**
	 * Test that getting a value with a provided default without setting it returns a blank string.
	 */
	public void function testReturnDefaultWhenNotSet() {
		assertEquals('default', variables.model.getSomething('default'));
	}
	
	/**
	 * Test that getting a value with setting it returns the set value.
	 */
	public void function testReturnValueWhenSet() {
		variables.model.setSomething('val');
		
		assertEquals('val', variables.model.getSomething());
	}
}

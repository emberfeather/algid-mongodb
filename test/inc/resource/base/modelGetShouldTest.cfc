component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
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

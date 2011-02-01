component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		variables.model = createObject('component', 'plugins.mongodb.inc.resource.base.model').init(variables.i18n);
	}
	
	/**
	 * Test that setting a value to a struct when the default value is also a struct extends the default.
	 */
	public void function testExtendsDefaultWhenBothStructs() {
		variables.model.add__attribute(
			attribute = 'test',
			defaultValue = {
				'one': 1,
				'two': 2
			}
		);
		
		variables.model.setTest({
			two: 'II'
		});
		
		assertEquals({ one: 1, two: 'II' }, variables.model.getTest());
	}
	
	/**
	 * Test that setting a value to a struct when the default value is also a struct extends the default.
	 */
	public void function testOverridesWhenValueNotStruct() {
		variables.model.add__attribute(
			attribute = 'test',
			defaultValue = {
				'one': 1,
				'two': 2
			}
		);
		
		variables.model.setTest('something');
		
		assertEquals('something', variables.model.getTest());
	}
}

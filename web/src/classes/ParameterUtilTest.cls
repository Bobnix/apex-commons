/* ============================================================
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* ============================================================
*/

@IsTest
public class ParameterUtilTest {
	@IsTest
	public static void testGetParameter(){
		PageReference ref = new PageReference('http://www.google.com');
		ref.getParameters().put('param1', 'exists');

		Test.setCurrentPage(ref);

		Test.startTest();
		System.assertEquals('exists', ParameterUtil.get('param1'));
		System.assertEquals(null, ParameterUtil.get('param2'));
		Test.stopTest();
	}

	@IsTest
	public static void testGetParameterWithDefault(){
		PageReference ref = new PageReference('http://www.google.com');
		ref.getParameters().put('param1', 'exists');

		Test.setCurrentPage(ref);

		Test.startTest();
		System.assertEquals('exists', ParameterUtil.get('param1', 'where is it'));
		System.assertEquals('the default should be used', ParameterUtil.get('param2', 'the default should be used'));
		Test.stopTest();
	}

	@IsTest
	public static void testRequireParameter(){
		PageReference ref = new PageReference('http://www.google.com');
		ref.getParameters().put('param1', 'exists');

		Test.setCurrentPage(ref);

		Test.startTest();
		System.assertEquals('exists', ParameterUtil.require('param1'));
		Exception thrownException = null;
		try{
			System.assertEquals(null, ParameterUtil.require('param2'));
		} catch (Exception e){
			thrownException = e;
		}
		Test.stopTest();

		System.assert(thrownException != null, 'An exception should have been thrown');
		System.assertEquals('Parameter required but not found: param2', thrownException.getMessage(), 'Exception message is incorrect');
	}
}
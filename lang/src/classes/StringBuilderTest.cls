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
public with sharing class StringBuilderTest {
	@IsTest
	public static void testRegularString(){
		StringBuilder builder = new StringBuilder();
		builder.append('She sells');
		builder.append(' sea shells');
		builder.append(' by the sea shore.');

		System.assertEquals('She sells sea shells by the sea shore.', builder.toString(), 'Constructed string does not match expectations');
	}

	@IsTest
	public static void testMixedObjects(){
		StringBuilder builder = new StringBuilder();
		builder.append(1);
		builder.append(2.3);
		builder.append(true);
		builder.append('This is odd');

		System.assertEquals('12.3trueThis is odd', builder.toString(), 'Constructed string does not match expectations');
	}

	@IsTest
	public static void testLists(){
		StringBuilder builder = new StringBuilder();
		builder.append(new List<Object>{'String1', 'String2'});

		System.assertEquals('String1String2', builder.toString(), 'Constructed string does not match expectations');
	}
}
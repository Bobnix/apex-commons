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
public class XMLSerializerTest {
	private class SimpleDummy{
		String stringVal{get; set;}
		String nullVal{get; set;}
		Decimal decimalVal{get; set;}
		Datetime dateTimeVal{get; set;}
	}

	@IsTest
	public static void testSerializeSimpleDummy(){
		SimpleDummy dummy = new SimpleDummy();
		dummy.stringVal = 'Hi';
		dummy.decimalVal = 3.14;
		dummy.dateTimeVal = Datetime.now();

		String retVal = XMLSerializer.serialize(dummy);
		System.assert(retVal.contains('<stringVal>Hi</stringVal>'), 'stringval not found in output');
		System.assert(retVal.contains('<decimalVal>3.14</decimalVal>'), 'decimalVal not found in output');
		System.assert(retVal.contains('<dateTimeVal>'+JSON.serialize(dummy.dateTimeVal).replace('"', '')+'</dateTimeVal>'), 'dateTimeVal not found in output');
		System.assert(!retVal.contains('<nullVal>'), 'nullVal should not be found in output');
	}

	private class ComplexDummy{
		List<SimpleDummy> listVal{get; set;}
		Set<SimpleDummy> setVal{get; set;}
		Map<String, SimpleDummy> mapVal{get; set;}
	}

	@IsTest
	public static void testSerializeComplexDummy(){
		SimpleDummy sDummy = new SimpleDummy();
		sDummy.stringVal = 'Hi';

		ComplexDummy cDummy = new ComplexDummy();
		cDummy.listVal = new List<SimpleDummy>{sDummy};
		cDummy.setVal = new Set<SimpleDummy>{sDummy};
		cDummy.mapVal = new Map<String, SimpleDummy>{'KeyElement'=>sDummy};

		String retVal = XMLSerializer.serialize(cDummy);
		System.assert(retVal.contains('<listVal><value><stringVal>Hi</stringVal></value></listVal>'), 'listVal not found in output');
		System.assert(retVal.contains('<setVal><value><stringVal>Hi</stringVal></value></setVal>'), 'setVal not found in output');
		System.assert(retVal.contains('<mapVal><KeyElement><stringVal>Hi</stringVal></KeyElement></mapVal>'), 'mapVal not found in output');
	}
}
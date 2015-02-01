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
public class ListUtilsTest {
	@IsTest
	static void testSortIntegers(){
		List<Integer> startList = new List<Integer>{9,1,8,2,7,3,6,4,5};

		List<Integer> retval = (List<Integer>)ListUtils.sort(startList, new IntegerComparator());

		System.assertEquals(new List<Integer>{1,2,3,4,5,6,7,8,9}, retval, 'The list should be sorted');
		System.assertNotEquals(startList, retval, 'The list should be a new instace');
	}

	private class IntegerComparator implements Comparator{
		public Integer compare(Object i1, Object i2){
			return (Integer)i1 - (Integer)i2;
		}
	}
}
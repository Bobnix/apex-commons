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

/**
 * An interface to allow the implementer to set up comparisons between objects
 */
public interface Comparator {

	/**
	 * Compares two values.
	 * @param	a	The first value to compare
	 * @param	b	The second value to compare
	 * @return	A positive is a is greater than b, a negative if a is less than b
	 *          or 0 if the two values are equal
	 */
	Integer compare(Object a, Object b);
}
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
 * A simple, clean way to build strings
 */
public class StringBuilder {

	private List<Object> segments = new List<Object>();

	/**
	 * Constructs a new, empty StringBuilder
	 */
	public StringBuilder() {}

	/**
	 * Constructs a new StringBuilder with the given initial value
	 */
	public StringBuilder(Object value) {
		segments.add(value);
	}

	/**
	 * Appends a list of values onto the string
	 * @param	values	The values to be added
	 * @return	Returns the StringBuilder to allow for chains
	 */
	public StringBuilder append(List<Object> values){
		segments.addAll(values);
		return this;
	}

	/**
	 * Appends a value onto the string
	 * @param	value	The value to be added
	 * @return	Returns the StringBuilder to allow for chains
	 */
	public StringBuilder append(Object value){
		segments.add(value);
		return this;
	}

	/**
	 * Creates a standard String from the StringBuilder
	 * @return	The string constructed from the apppends
	 */
	public override String toString(){
		return String.join(segments, '');
	}
}
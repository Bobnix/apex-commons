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
 * This class provides a number of utility methods to help with emails
 */
public with sharing class EmailUtil {

	/**
	 * Validates a string to see if it is an email address. The validation is very
	 * open ended, checking if there is charecters, an @, more charecters, a period,
	 * and a final set of charecters
	 * 
	 * @param	address	The string being tested
	 * @return	True if the email matches the pattern, false if it doesn't
	 */
	public static Boolean validateEmailAddress(String address){
		String emailRegex = '^.+@.+\\..+$';
		Pattern MyPattern = Pattern.compile(emailRegex);
		Matcher MyMatcher = MyPattern.matcher(address);
		return MyMatcher.matches();
	}
}
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
 * This class provides methods to simplify parameter retrieval
 */
public class ParameterUtil {
	private static final String errorStringFormat = 'Parameter required but not found: {0}';

	/**
	 * Gets a parameter value for the current page
	 * @param	parameterName	The name of the prameter to retrieve the value for
	 * @return	The value of the parameter or null if not found
	 */
	public static String get(String parameterName){
		return ApexPages.currentPage().getParameters().get(parameterName);
	}

	/**
	 * Gets a parameter value for the current page
	 * @param	parameterName	The name of the prameter to retrieve the value for
	 * @param	defaultValue	A default value to return ig the parameter is not found
	 * @return	The value of the parameter or the default value if not found
	 */
	public static String get(String parameterName, String defaultValue){
		String parameterValue = ApexPages.currentPage().getParameters().get(parameterName);
		return !String.isBlank(parameterValue)?parameterValue:defaultValue;
	}

	/**
	 * Gets a parameter value for the current page
	 * @param	parameterName	The name of the prameter to retrieve the value for
	 * @return	The value of the parameter
	 * @throw	RequiredParameterException	Thrown if the parameter is not fount
	 */
	public static String require(String parameterName){
		String parameterValue = ApexPages.currentPage().getParameters().get(parameterName);
		if(String.isBlank(parameterValue)){
			throw new RequiredParameterException(String.format(errorStringFormat, new LIST<String>{parameterName}));
		}
		return ApexPages.currentPage().getParameters().get(parameterName);
	}
}
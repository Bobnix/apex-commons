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
public with sharing class EmailUtilTest {
	@IsTest
	public static void testEmailAddresses(){
		List<String> validAddresses = new List<String>{
			'email@example.com',
			'firstname.lastname@example.com',
			'email@subdomain.example.com',
			'firstname+lastname@example.com',
			'email@123.123.123.123',
			'email@[123.123.123.123]',
			'"email"@example.com',
			'1234567890@example.com',
			'email@example-one.com',
			'_______@example.com',
			'email@example.name',
			'email@example.museum',
			'email@example.co.jp',
			'firstname-lastname@example.com'
		};

		for(String email : validAddresses){
			System.assert(EmailUtil.validateEmailAddress(email), email +' was not a valid address');
		}
	}

	@IsTest
	public static void testStrangeEmailAddresses(){
		List<String> validAddresses = new List<String>{
			'much.”more\\ unusual”@example.com',
			'very.unusual.”@”.unusual.com@example.com',
			'very.”(),:;<>[]”.VERY.”very@\\ "very”.unusual@strange.example.com'
		};

		for(String email : validAddresses){
			System.assert(EmailUtil.validateEmailAddress(email), email +' was not a valid address');
		}
	}

	@IsTest
	public static void testBadEmailAddresses(){
		List<String> validAddresses = new List<String>{
			'plainaddress',
			'@example.com',
			'email.example.com'
		};

		for(String email : validAddresses){
			System.assert(!EmailUtil.validateEmailAddress(email), email +' should not be a valid address');
		}
	}
}
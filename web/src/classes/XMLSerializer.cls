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
 * A class that handles serialization from an object to an xml string
 */
public class XMLSerializer {

	/**
	 * @description Serializes the object to an xml string. 
	 *              Current issues: (1)This method relies on recursion so oject depth should be kept low
	 *              (2)Because Apex does not have native reflection, this method is a bit roundabout
	 * 
	 * @param	obj 	The object being converted
	 * @return	The XML as a string
	 */
	public static String serialize(Object obj){
		Map<String, Object> dataMap = convertToMap(obj);

		XmlStreamWriter writer = new XmlStreamWriter();
    
	    writer.writeStartDocument('utf-8', '1.0');        
	    writer.writeStartElement(null, 'response', null);
	    serializeMap(writer, dataMap);
	    writer.writeEndElement();
	    writer.writeEndDocument();

	    String xmlOutput = writer.getXmlString();
	    writer.close();

		return xmlOutput;
	}

	private static Map<String, Object> convertToMap(Object obj){
		if (obj instanceOf Map<String, Object>){
			return (Map<String, Object>)obj;
		}

		String objectAsJson = JSON.serialize(obj);
		return (Map<String, Object>)JSON.deserializeUntyped(objectAsJson);
	}

	private static void serializeMap(XmlStreamWriter writer, Map<String, Object> dataMap){
		for(String key : dataMap.keySet()){
			Object obj = dataMap.get(key);
			if(obj == null){
				continue;
			}

			writer.writeStartElement(null, key, null);
			serializeValue(writer, obj);
			writer.writeEndElement();
		}
	}

	private static void serializeList(XmlStreamWriter writer, List<Object> collection){
		for(Object obj : collection){
			if(obj == null){
				continue;
			}
			writer.writeStartElement(null, 'value', null);
	   		serializeValue(writer, obj);
	   		writer.writeEndElement();
		}
	}

	private static void serializeValue(XmlStreamWriter writer, Object obj){
		if(obj instanceOf Map<String, Object>){
			serializeMap(writer, (Map<String, Object>)obj);
		} else if(obj instanceOf List<Object>){
			serializeList(writer, (List<Object>) obj);
		} else if(obj instanceOf String){
			writer.writeCharacters((String)obj);
		} else {
			writer.writeCharacters(String.valueOf(obj));
		}
	}
}
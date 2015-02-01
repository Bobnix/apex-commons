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
 * A general utility class for helping with lists
 */
public class ListUtils {

	/**
	 * Sorts a list of objects based on the comparator passed in. Apex has a native
	 * sort for primatives, SObjects and Objects that implement the comparable
	 * interface but this gives much more controll by allowing a number of different
	 * comparators to be written and used.
	 * @param	objects	The list to be sorted
	 * @param	comp	The comparator to sort with
	 * @return	A new list with the sorted values.
	 */
	public static List<Object> sort(List<Object> objects, Comparator comp){
		List<Object> listToSort = objects.clone();
		quicksort(listToSort, 0, listToSort.size()-1, comp);
		return listToSort;
	}

	private static void quickSort(List<Object> objects, Integer left, Integer right, Comparator comp)
	{
		Integer i = left;
		Integer j = right;

		if (right - left >= 1) 
		{
			Object pivot = objects[left];

			while (j > i)
			{
				while (comp.compare(objects[i], pivot) <= 0 && i <= right && j > i){
					i++;
				}
				while (comp.compare(objects[j], pivot) > 0 && j >= left && j >= i){
					j--;
				}
				if (j > i){
					swap(objects, i, j);
				}
			}
			swap(objects, left, j);

			quickSort(objects, left, j - 1, comp);
			quickSort(objects, j + 1, right, comp);
		}
		else
		{
			return;
		}
	}

	private static void swap(List<Object> objects, Integer index1, Integer index2) 
	{
		Object temp = objects[index1];
		objects[index1] = objects[index2];
		objects[index2] = temp;
	}
}
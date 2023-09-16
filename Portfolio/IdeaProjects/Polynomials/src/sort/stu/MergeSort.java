package sort.stu;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Perform an out of place merge sort on a native array of integers.
 *
 * merge_sort (not in place):
 *     best=O(nlogn)
 *     worst=O(nlogn)
 *
 * @author RIT CS
 */
public class MergeSort {
    /**
     * Split the array on the left side.
     *
     * @param data the full array of data
     * @return the left half side of the data
     */
    private static ArrayList<Integer> splitLeft(ArrayList<Integer> data) {
        // TODO
        ArrayList<Integer> left = new ArrayList<>();
        int size = data.size();
        for (int i = 0; i < size / 2; i++)
            left.add(i);
        return left;
    }

    /**
     * Split the array on the right side.
     *
     * @param data the full array of data
     * @return the right half side of the data
     */
    private static ArrayList<Integer> splitRight(ArrayList<Integer> data) {
        // TODO
        ArrayList<Integer> right = new ArrayList<>();
        int size = data.size();
        for (int i = size / 2; i < size; i++)
            right.add(i);
        return right;
    }

    /**
     * Merges two sorted arrays, left and right, into a combined sorted array.
     *
     * @param left  a sorted array
     * @param right a sorted array
     * @return one combined sorted array
     */
    private static ArrayList<Integer> merge(ArrayList<Integer> left, ArrayList<Integer> right) {
        int i = 0, x = 0;
        ArrayList<Integer> arryli = new ArrayList<Integer>();
        while (i < left.size() && x < right.size()) {
            if (left.get(i) <= right.get(x)) {
                arryli.add(left.get(i));
                i++;
            }
            else {
                arryli.add(right.get(x));
                x++;
            }
        }
        while (i < left.size()) {
            arryli.add(left.get(i));
            i++;
        }
        while (x < right.size()) {
            arryli.add(right.get(x));
            x++;
        }
        return arryli;
    }

    /**
     * Performs a merge sort and returns a newly sorted array
     *
     * @param data the data to be sorted (a native array)
     * @return a sorted array
     */
    private static ArrayList<Integer> mergeSort(ArrayList<Integer> data) {

        return merge(splitLeft(data),splitRight(data)) ;
    }

    /**
     * Test function for mergeSort.
     *
     * @param args command line arguments (unused)
     */
    public static void main(String[] args) {
        int[][] DATA = {
                {},
                {0},
                {0, 1},
                {1, 0},
                {0, 1, 2},
                {0, 2, 1},
                {1, 0, 2},
                {1, 2, 0},
                {2, 0, 1},
                {2, 1, 0},
                {9, 5, 2, 6, 3, 8, 1, 4, 0, 7}
        };

        for (int[] data : DATA) {
            // create two lists of the data
            List<Integer> sortData = Arrays.stream(data).boxed().collect(Collectors.toList());
            List<Integer> sorted = Arrays.stream(data).boxed().collect(Collectors.toList());
            // merge sort is not in place and returns a new sorted list
            sortData = mergeSort((ArrayList<Integer>) sortData);
            // use built in sort to compare against
            Collections.sort(sorted);
            // show the results of the comparison
            System.out.print("mergeSort: " + Arrays.stream(data).boxed().collect(Collectors.toList()) +
                    " result: " + sortData);
            System.out.println(sortData.equals(sorted) ? " OK" : " FAIL");
        }
    }
}

"""Author: Christopher Eng, HW08 merge_quick_sort"""

import quick_sort
import merge_sort


def merge_quick_sort(L):
    """
    The merge_quick_sort function calls the split function in merge_sort to break down the file into two half based on
    even or odd indexes of the list. It then uses the quick_sort function in the quick_sort file to split the pieces
    down further and reorder them into the correct order of greatest to least. And then uses the merge function in the
    merge_sort file to combine the two half's into one final ordered list which it returns.
    :param L: L is the List given by the test file
    :return: the final merged and ordered string
    """
    (left, right) = merge_sort.split(L)
    sorted_left = quick_sort.quick_sort(left)
    sorted_right = quick_sort.quick_sort(right)
    final_merge = merge_sort.merge(sorted_left, sorted_right)
    return(final_merge)

if __name__ == '__main__':
    merge_quick_sort()
"""Author: Christopher Eng, HW08 merge_quick_sort"""

import quick_sort
import merge_sort
import merge_quick_sort
import sys
import time
import random

def main():
    """
    The main function tests the quick_sort, merge_sort, and merge_quick_sort functions using a string
    who's length is determined by the user and then times how long it takes to order the string when
    it is sorted and then measures again whn the string is randomly shuffled.
    :return: Prints the results of the sorted and random timed tests.
    """
    N = int(input('List size 0 - 10,000: '))
    lst = list(range(0, N - 1))
    if N + 10 > sys.getrecursionlimit():
        sys.setrecursionlimit(N + 10)
    start = time.perf_counter()
    quick_sort.quick_sort(lst)
    elapsed = time.perf_counter() - start
    print('quick_sort(sorted) elapsed time:', elapsed * 1000, 'msec')

    start = time.perf_counter()
    merge_sort.merge_sort(lst)
    elapsed = time.perf_counter() - start
    print('merge_sort(sorted) elapsed time:', elapsed * 1000, 'msec')

    start = time.perf_counter()
    merge_quick_sort.merge_quick_sort(lst)
    elapsed = time.perf_counter() - start
    print('merge_quick_sort(sorted) elapsed time:', elapsed * 1000, 'msec')

    random.shuffle(lst)

    start = time.perf_counter()
    quick_sort.quick_sort(lst)
    elapsed = time.perf_counter() - start
    print('quick_sort(random) elapsed time:', elapsed * 1000, 'msec')

    start = time.perf_counter()
    merge_sort.merge_sort(lst)
    elapsed = time.perf_counter() - start
    print('merge_sort(random) elapsed time:', elapsed * 1000, 'msec')
    
    start = time.perf_counter()
    merge_quick_sort.merge_quick_sort(lst)
    elapsed = time.perf_counter() - start
    print('merge_quick_sort(random) elapsed time:', elapsed * 1000, 'msec')


if __name__ == '__main__':
    main()
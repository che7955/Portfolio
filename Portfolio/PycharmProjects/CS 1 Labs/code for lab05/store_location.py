"""Author: Christopher Eng, lab05 StoreLocations"""


import quick_sort
import tools
import time


def sort_list(L):
    """calls quick_sort to sort a list"""
    quick_sort.quick_sort(L)
    return L


def best_loc(bus_locs):
    sorted_list = sort_list(bus_locs)
    if len(sorted_list) % 2 == 0:
        higher = len(sorted_list) // 2
        lower = higher - 1
        median = (int(sorted_list[higher]) + int(sorted_list[lower])) / 2
    else:
        index = len(sorted_list) // 2
        median = sorted_list[index]
    return median


def main():
    file_name = str(input('file name: '))
    opened_file = tools.read(file_name)
    start = time.perf_counter()
    best_location = best_loc(opened_file)
    print('Optimum new store location: ' + str(best_location))
    total = tools.best_loc_total(opened_file, best_location)
    print('Sum of distances to the new store: ' + str(total))
    elapsed = time.perf_counter() - start
    print('elapsed time:', elapsed * 1000, 'msec')


if __name__ == '__main__':
    main()
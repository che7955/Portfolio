"""Author: Christopher Eng, lab05 StoreLocations"""


import quick_sort
import tools
import time


def sort_list(L):
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


def quick_select(a_list, k):
    if len(a_list) > 0:
        pivot = a_list[(len(a_list) // 2)]
        (less, same, more) = ([], [], [])
        for e in a_list:
            if int(e) < int(pivot):
                less.append(e)
            elif int(e) > int(pivot):
                more.append(e)
            else:
                same.append(e)
        smaller_list = less
        larger_list = more
        count = len(same)
        m = len(smaller_list)
        if k >= m and k < m + count:
            return pivot
        if m > k:
            return quick_select(smaller_list, k)
        else:
            return quick_select(larger_list, k - m - count)


def main():
    file_name = str(input('file name: '))
    opened_file = tools.read(file_name)
    start = time.perf_counter()
    if len(opened_file) % 2 == 0:
        median1 = len(opened_file) // 2
        median2 = (len(opened_file) // 2) - 1
        best_location = (int(quick_select(opened_file, median1)) + int(quick_select(opened_file, median2))) / 2
        print('Optimum new store location: ' + str(best_location))
    else:
        median = len(opened_file) // 2
        best_location = quick_select(opened_file, median)
        print('Optimum new store location: ' + str(best_location))
    total = tools.best_loc_total(opened_file, best_location)
    print('Sum of distances to the new store: ' + str(total))
    elapsed = time.perf_counter() - start
    print('elapsed time:', elapsed * 1000, 'msec')


if __name__ == '__main__':
    main()
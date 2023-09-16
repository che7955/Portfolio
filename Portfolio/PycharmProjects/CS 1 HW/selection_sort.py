"""
Author: Christopher Eng, HW07 Selection Sort
1. In what kind of test case does insertion_sort perform better than selection_sort?
   Clearly describe the test case.
    - The case where insertion_sort performs better than selection_sort is when some of the lists
    given elements are already in the correct order.
2. Why does selection_sort perform worse than insertion_sort in that test case?
    - The selection_sort performs worse than insertion_sort because of its constant need to iterate
    through the list for every element no matter what, even if the list is already in the correct order.
    The selection sorting method always having a quadratic time complexity of O(n^2), whereas the insertion
    sort needs only needs to iterate through it if the string is out order, and in the best case scenario
    where the list is already in order having a linear time complexity of O(n).
"""


def selection_sort(lst_num):
    """This function takes the list and orders it from least to greatest using the selection sort method,
    and then prints the ordered list"""
    for num in range(len(lst_num)):
        mark = num
        for unsorted in range(mark, len(lst_num)):
            if lst_num[mark] > lst_num[unsorted]:
                mark = unsorted
        lst_num[num], lst_num[mark] = lst_num[mark], lst_num[num]
    print("Sorted list: " + str(lst_num))


def creating_list(lst):
    """This function creates the list of unordered numbers from the file the user input and prints the list
    of unordered numbers before calling the selection_sort function to order the list."""
    list_num = []
    with open(lst) as numbers:
        for line in numbers:
            line = line.strip()
            list_num.append(int(line))
    print("Original list: " + str(list_num))
    selection_sort(list_num)


def main():
    """This function asks the user for the file and then calls to the creating_list function to turn the
    file into a list."""
    lst = str(input('file name: '))
    creating_list(lst)


if __name__ == '__main__':
    main()

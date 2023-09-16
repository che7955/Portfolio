"""
CSCI-141: Linked Lists
Homework 11
author: RIT CS

A test module for the immutable and mutable linked lists.
"""

import linked_lists
from node_types import FrozenNode, MutableNode
from linked_list_type import LinkedList


def to_str(head):
    """
    Convert a sequence of nodes to a string of the nodes' values
    surrounded by brackets and the individual values separated by commas.
    It is a recursive solution.
    :param head: The first node in the list to be converted
    :return: The entire sequence as a legible string, pattern "[a,b,c]"
    """
    result = '['
    result += _to_str_rec(head)
    result += ']'
    return result


def _to_str_rec(head):
    """
    Compute a string version of the linked sequence.
    :param head: The first node in the list to be converted
    :return: The entire sequence as a legible string, pattern "a,b,c"
    """
    if head is None:
        result = ''
    else:
        result = str( head.value )
        if head.next is not None:
            result += ','
        result += _to_str_rec( head.next )
    return result


def test_size_of(name, head, expected):
    """
    Test a single call to size_of.
    :param name: a string with the function and arguments being tested
    :param head: head of the list
    :param expected: the expected list
    """
    result = linked_lists.size_of(head)
    if result == expected:
        print(name, 'passed')
    else:
        print(name, 'failed; expected', expected, 'but got', result)


def testing_size_of():
    """
    The unit tester for size_of.
    """
    print('testing size_of...')

    # manually create some immutable lists
    empty = None
    one = FrozenNode('A', None)
    two = FrozenNode('A', FrozenNode('B', None))
    three = FrozenNode('A', FrozenNode('B', FrozenNode('C', None)))
    five = FrozenNode('A', FrozenNode('B', FrozenNode('C', FrozenNode('D', FrozenNode('E', None)))))

    # collect them into a tuple, along with the expected sizes
    lists = empty, one, two, three, five
    expecteds = 0, 1, 2, 3, 5

    # loop over and test each one
    for list, expected in zip(lists, expecteds):
        test_size_of('size_of(' + to_str(list) + ')', list, expected)


def test_extend(name, head1, head2, expected):
    """

    :param name: a string with the function and arguments being tested
    :param head1: the head of the first list
    :param head2: the head of the second list
    :param expected: the expected result
    """
    result = linked_lists.extend(head1, head2)
    if result == expected:
        print(name, 'passed')
    else:
        print(name, 'failed; expected', to_str(expected), 'but got', to_str(result))


def testing_extend():
    """
    The unit tester for extend.
    """
    print('\ntesting extend...')

    # build the immutable lists
    empty = None
    one = FrozenNode('A', None)
    two = FrozenNode('B', FrozenNode('C', None))
    three = FrozenNode('A', FrozenNode('B', FrozenNode('C', None)))
    four = FrozenNode('D', FrozenNode('E', FrozenNode('F', FrozenNode('G', None))))
    seven = FrozenNode('A', FrozenNode('B', FrozenNode('C', FrozenNode('D',
                FrozenNode('E', FrozenNode('F', FrozenNode('G', None)))))))

    # run the tests on each
    lists = (empty, empty), (empty, one), (one, empty), (one, two), (three, four)
    expecteds = empty, one, one, three, seven

    for lsts, expected in zip(lists, expecteds):
        test_extend('extend(' + to_str(lsts[0]) + ', ' + to_str(lsts[1]) + ')',
                    lsts[0], lsts[1], expected)


def test_reverse(name, lst, expected):
    """
    Test a single call to reverse.
    :param name: a string with the function and arguments being tested
    :param lst: the list to reverse
    :param expected: the reversed list
    """
    linked_lists.reverse(lst)
    if lst == expected:
        print(name, 'passed')
    else:
        print(name, 'failed; expected', to_str(expected.head), 'size=', expected.size,
              'but got', to_str(lst.head), 'size=', lst.size)


def testing_reverse():
    """
    The unit tester for reverse.
    """
    print('\ntesting reverse...')

    # manually create some mutable lists
    empty = LinkedList(None, 0)

    head = MutableNode('A', None)
    one = LinkedList(head, 1)

    head = MutableNode('A', MutableNode('B', None))
    two = LinkedList(head, 2)

    head = MutableNode('A', MutableNode('B', MutableNode('C', None)))
    three = LinkedList(head, 3)

    head = MutableNode('A', MutableNode('B', MutableNode('C', MutableNode('D', MutableNode('E', None)))))
    five = LinkedList(head, 5)

    head = MutableNode('A', None)
    one_reversed = LinkedList(head, 1)

    head = MutableNode('B', MutableNode('A', None))
    two_reversed = LinkedList(head, 2)

    head = MutableNode('C', MutableNode('B', MutableNode('A', None)))
    three_reversed = LinkedList(head, 3)

    head = MutableNode('E', MutableNode('D', MutableNode('C', MutableNode('B', MutableNode('A', None)))))
    five_reversed = LinkedList(head, 5)

    # run the tests
    lists = empty, one, two, three, five
    expecteds = empty, one_reversed, two_reversed, three_reversed, five_reversed

    for lst, expected in zip(lists, expecteds):
        test_reverse('reverse(' + to_str(lst.head) + ')', lst, expected)


def test_remove_index(name, lst, index, expected):
    """
    Test a single call to remove_index.
    :param name: a string with the function and arguments being tested
    :param lst: the list to remove by index
    :param index: the index of the element to remove
    :param expected: the list with the removed element
    """
    linked_lists.remove_index(lst, index)
    if lst == expected:
        print(name, 'passed')
    else:
        if expected is None:
            print(name, 'failed; expected', to_str(expected), 'size=', expected,
                  'but got', to_str(lst.head), 'size=', lst.size)
        else:
            print(name, 'failed; expected', to_str(expected.head), 'size=', expected.size,
              'but got', to_str(lst.head), 'size=', lst.size)



def testing_remove_index():
    """
    Unit tester for remove_index.
    """
    print('\ntesting remove_index...')

    # build the initial mutable list
    head = MutableNode('A', MutableNode('B', MutableNode('C', MutableNode('D', MutableNode('E', None)))))
    lst = LinkedList(head, 5)

    head = MutableNode('B', MutableNode('C', MutableNode('D', MutableNode('E', None))))
    first_remove = LinkedList(head, 4)

    head = MutableNode('B', MutableNode('D', MutableNode('E', None)))
    second_remove = LinkedList(head, 3)

    head = MutableNode('B', MutableNode('D', None))
    third_remove = LinkedList(head, 2)

    head = MutableNode('D', None)
    fourth_remove = LinkedList(head, 1)

    fifth_remove = LinkedList(None, 0)

    # run the series of tests on these lists
    expecteds = first_remove, second_remove, third_remove, fourth_remove, fifth_remove
    indices = 0, 1, 2, 0, 0

    for expected, index in zip(expecteds, indices):
        test_remove_index('remove_index(' + to_str(lst.head) + ', ' + str(index) + ')',
                          lst, index, expected)


def testing_remove_index_bad():
    """
    Unit tester for remove_index with bad indices
    """
    print('\ntesting remove_index_bad...')

    # build the initial mutable list
    head = MutableNode('A', MutableNode('B', MutableNode('C', MutableNode('D', MutableNode('E', None)))))
    lst = LinkedList(head, 5)

    try:
        # removing at index -1 should raise an IndexError
        linked_lists.remove_index(lst, -1)
        print('remove_index(' + to_str(lst.head) + ', ' + str(-1) +
              ') failed!  Expected a IndexError exception to be raised.')
    except IndexError:
        print('remove_index(' + to_str(lst.head) + ', ' + str(-1) + ') passed')

    try:
        # removing at index 5 should raise an IndexError
        linked_lists.remove_index(lst, 5)
        print('remove_index(' + to_str(lst.head) + ', ' + str(5) +
              ') failed!  Expected a IndexError exception to be raised.')
    except IndexError:
        print('remove_index(' + to_str(lst.head) + ', ' + str(5) + ') passed')


def run_tests():
    """
    Run all the tests.
    """
    testing_size_of()
    testing_extend()
    testing_reverse()
    testing_remove_index()
    testing_remove_index_bad()


if __name__ == '__main__':
    run_tests()

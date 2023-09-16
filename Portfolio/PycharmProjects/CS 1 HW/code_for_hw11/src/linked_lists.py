""" Author: Christopher Eng, HW11, linked lists. """

from node_types import FrozenNode, MutableNode
from linked_list_type import LinkedList


def size_of(head):
    """this function finds the size of an immutable list"""
    if head is None:
        return 0
    else:
        count = 1 + size_of(head.next)
    return count


def extend(head_one, head_two):
    """this function concatenates two immutable lists into one"""
    if head_one is None:
        return head_two
    elif head_two is None:
        return head_one
    else:
        return FrozenNode(head_one.value, extend(head_one.next, head_two))


def reverse(mutable_list):
    """this function takes the mutable list and reverses it"""
    if mutable_list is None:
        return None
    else:
        prev = None
        piece = mutable_list.head
        while piece is not None:
            mutable_list.next = piece.next
            piece.next = prev
            prev = piece
            piece = mutable_list.next
            mutable_list.head = prev


def remove_index(mutable_list, index):
    """this function removes an element at a given index of the linked list"""
    current = mutable_list.head
    if index >= mutable_list.size or index < 0:
        raise IndexError('Index out of bounds!')
    if index == 0:
        mutable_list.head = current.next
        mutable_list.size -= 1
    else:
        while index != 1:
            current = current.next
            index -= 1
        mutable_list.size -= 1
        current.next = current.next.next
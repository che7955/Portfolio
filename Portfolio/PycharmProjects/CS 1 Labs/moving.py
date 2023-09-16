"""Author: Christopher Eng, Lab 06 Moving"""
from dataclasses import dataclass


@dataclass
class Box:
    max_weight: int
    items: list
    remaining_weight: int


@dataclass
class Item:
    name: str
    weight: int


def make_box(max_weight: int, items: list, remaining_weight: int):
    """When given inputs creates the data class box with the given inputs"""
    return Box(int(max_weight), list(items), int(remaining_weight))


def make_item(name: str, weight: int):
    """When given inputs creates the data class item with given inputs"""
    return Item(name, weight)


def read_data(file_name: str):
    """reads the file and returns the list of class items and class boxes that are created from the file"""
    item_list = []
    box_list = []
    with open(file_name) as file:
        max_weight = file.readline().strip().split()
        for line in file:
            item_name, item_weight = line.strip().split()
            item_list.append(Item(item_name, int(item_weight)))
        for max_weight in max_weight:
            box_list.append(make_box(int(max_weight), [], int(max_weight)))
    return item_list, box_list


def items_sorter(item_list):
    """sorts the list of inputs so that the item with the larger attribute weight is first"""
    sorted_items = sorted(item_list, key=lambda item: item.weight, reverse=True)
    return sorted_items


def find_roomiest(boxes):
    """sorts the boxes so that the box with the largest remaining weight appears first"""
    roomiest_boxes = sorted(boxes, key=lambda box: box.remaining_weight, reverse=True)
    return roomiest_boxes


def find_tightest(boxes, item):
    """sorts the boxes so that the box with the minimum amount of space is returned"""
    smallest = None
    for box in boxes:
        if item.weight <= box.remaining_weight:
            if smallest == None:
                smallest = box
            elif box.remaining_weight < smallest.remaining_weight:
                smallest = box
            else:
                pass
    return smallest


def strat_one(item_list, boxes):
    """Strategy one iterates through the sorted list of items so that the item is chosen to be
    placed in the box with the greatest remaining allowed weight that can support the item, if no
    more space is left the remaining items are returned"""
    item_list = items_sorter(item_list)
    items_not_found =[]
    for item in item_list:
        roomiest_box = find_roomiest(boxes)
        for box in roomiest_box:
            if item.weight <= box.remaining_weight:
                box.items.append(item)
                box.remaining_weight = box.remaining_weight - item.weight
                break
            else:
                items_not_found.append(item)
    return boxes, items_not_found


def strat_two(item_list, boxes):
    """Strategy two iterates through the sorted list of items so that the item is chosen to be
    placed the box with the least remaining allowed weight that can support the item, if no
    more space is left the remaining items are returned"""
    item_list = items_sorter(item_list)
    items_not_found = []
    for item in item_list:
        tightest_fit = find_tightest(boxes, item)
        if tightest_fit is None:
            items_not_found.append(item)
        else:
            tightest_fit.items.append(item)
            tightest_fit.remaining_weight -= item.weight

    return boxes, items_not_found


def strat_three(item_list, boxes):
    """This strategy fills the boxes one by one. And for each box iterate through the remaining
    ordered items not yet put into a box, if a box is not found return the remaining items."""
    item_list = items_sorter(item_list)
    items_not_found = []
    for item in item_list:
        found = False
        for box in boxes:
            if box.remaining_weight >= item.weight:
                box.items.append(item)
                box.remaining_weight = box.remaining_weight - item.weight
                found = True
                break
        if not found:
            items_not_found.append(item)
    return boxes, items_not_found


def main():
    """asks user for file input then determines the outcome of the packing by calling to the 3 different
    strategies and prints the results."""
    file_name = str(input('Input data file name: '))

    (items, boxes) = read_data(file_name)
    boxes_one, items_not_found_one = strat_one(items, boxes)
    if items_not_found_one == []:
        print('Results from Greedy Strategy 1: All items successfully packed into boxes!')
        for box in boxes_one:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
    else:
        print('Results from Greedy Strategy 1: Unable to pack all items!')
        for box in boxes_one:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
        for item in items_not_found_one:
            print(str(item.name) + ' of weight ' + str(item.weight) + ' was left behind :(')

    (items, boxes) = read_data(file_name)
    boxes_two, items_not_found_two = strat_two(items, boxes)
    if items_not_found_two == []:
        print('Results from Greedy Strategy 2: All items successfully packed into boxes!')
        for box in boxes_two:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
    else:
        print('Results from Greedy Strategy 2: Unable to pack all items!')
        for box in boxes_two:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
        for item in items_not_found_two:
            print(str(item.name) + ' of weight ' + str(item.weight) + ' was left behind :(')

    (items, boxes) = read_data(file_name)
    boxes_three, items_not_found_three = strat_three(items, boxes)
    if items_not_found_three == []:
        print('Results from Greedy Strategy 3: All items successfully packed into boxes!')
        for box in boxes_three:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
    else:
        print('Results from Greedy Strategy 3: Unable to pack all items!')
        for box in boxes_three:
            print('Box of weight capacity ' + str(box.max_weight) + ' contains: ')
            for item in box.items:
                print(str(item.name) + 'of weight ' + str(item.weight))
        for item in items_not_found_three:
            print(str(item.name) + ' of weight ' + str(item.weight) + ' was left behind :(')


if __name__ == '__main__':
    main()
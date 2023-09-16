""" Author: Christopher Eng, HW10 Droid Factory. """
import cs_queue
from dataclasses import dataclass


@dataclass(frozen=False)
class Droid:
    arms: bool
    legs: bool
    head: bool
    body: bool
    serial_num: int


def conveyor_belt(file_name):
    queue = cs_queue.make_empty_queue()
    with open(file_name)as file:
        for part in file:
            part = part.strip()
            cs_queue.enqueue(queue, part)
    return queue


def make_droid(serial_num, pieces_on_conveyor_belt):
    queue = pieces_on_conveyor_belt
    droid = Droid(False, False, False, False, serial_num)
    while droid.arms is False or droid.legs is False or droid.head is False or droid.body is False:
        part = cs_queue.dequeue(queue)
        if part == 'arms' and droid.arms is True:
            print('placing unneeded part back on belt: ' + str(part))
            cs_queue.enqueue(queue, part)
        if part == 'arms' and droid.arms is False:
            droid.arms = True
            print('attaching arms...')

        if part == 'legs' and droid.legs is True:
            print('placing unneeded part back on belt: ' + str(part))
            cs_queue.enqueue(queue, part)
        if part == 'legs' and droid.legs is False:
            droid.legs = True
            print('attaching legs...')

        if part == 'head' and droid.head is True:
            print('placing unneeded part back on belt: ' + str(part))
            cs_queue.enqueue(queue, part)
        if part == 'head' and droid.head is False:
            droid.head = True
            print('attaching head...')

        if part == 'body' and droid.body is True:
            print('placing unneeded part back on belt: ' + str(part))
            cs_queue.enqueue(queue, part)
        if part == 'body' and droid.body is False:
            droid.body = True
            print('attaching body...')
    print('droid ' + str(droid.serial_num) + ' has been assembled')


def assemble_multiple(serial_num, queue):
    while not cs_queue.is_empty(queue):
        make_droid(serial_num, queue)
        serial_num += 1
    else:
        print('All of the droids have been assembled! Time to go to sleep.')


def main():
    file_name = str(input('enter filename: '))
    print('Starting a shift at the droid factory!')
    conveyor_belt(file_name)
    serial_num = 10001
    assemble_multiple(serial_num, conveyor_belt(file_name))


if __name__ == '__main__':
    main()
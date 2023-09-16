"""Author: Christopher Eng, lab08 train run"""
from node_types import MutableNode
from typing import Union
from dataclasses import dataclass
import sys


@dataclass
class Station:
    name: str
    mile: int


class TrainCar:
    destination: str
    contents: str


class Train:
    head: Union['MutableNode', None]
    speed: float


def add_station(station, distance):
    #dictionary = {}
    #station.split()
    #station_loc = station[0]
    #distance = station[1]
    #dictionary[station_loc] = distance
    return True
def set_speed(speed):
    #Train.speed = speed
    return True
def add_car(content, station):
    #TrainCar.contents = content
    #TrainCar.location = station
    #Train.cars = TrainCar
    return True
def show_route():
    #print(add_station)
    return True
def show_train():
    #print(Train)
    return True
def start():
    return True
def help():
    return True
def quit():
    print('Train yard simulation ending.')
    sys.exit()


def process_commands():
    commands = input('> ')
    commands = commands.split()
    command = commands[0]
    while command != '':
        if command == 'quit':
            arguments = commands[1:]
            print('Command is quit arguments are ' + str(arguments))
            quit()
        else:
            if command == 'add_station':
                arguments = commands[1:]
                if add_station(arguments[0], arguments[1]) is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is add_station arguments are ' + str(arguments))
                    process_commands()
            elif command == 'set_speed':
                arguments = commands[1:]
                if set_speed(arguments[0]) is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is set_speed arguments are ' + str(arguments))
                    process_commands()
            elif command == 'add_car':
                arguments = commands[1:]
                if add_car(arguments[0], arguments[1]) is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is add_car arguments are ' + str(arguments))
                    process_commands()
            elif command == 'show_route':
                arguments = commands[1:]
                if show_route() is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is show_route arguments are ' + str(arguments))
                    process_commands()
            elif command == 'show_train':
                arguments = commands[1:]
                if show_train() is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is show_train arguments are ' + str(arguments))
                    process_commands()
            elif command == 'start':
                arguments = commands[1:]
                if start() is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is start arguments are ' + str(arguments))
                    process_commands()
            elif command == 'help':
                arguments = commands[1:]
                if help() is False:
                    print('Illegal use or form for this command.')
                    process_commands()
                else:
                    print('Command is help arguments are ' + str(arguments))
                    process_commands()
            else:
                arguments = commands[1:]
                print('Command is ' + str(command) + ' arguments are ' + str(arguments))
                print('Illegal command name.')
                process_commands()


def main():
    print('Welcome to the train yard.')
    process_commands()


if __name__ == '__main__':
    main()
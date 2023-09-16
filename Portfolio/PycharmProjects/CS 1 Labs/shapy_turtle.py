"""Author: Christopher Eng, Lab 04 shapy_turtle"""
import turtle

char_index = 0


def turn_left(num):
    """
    turns the turtle left by num degrees
    :param num: int number
    """
    turtle.left(num)


def turn_right(num):
    """
    turns turtle right by num degrees
    :param num: int number
    """
    turtle.right(num)


def draw_square(num):
    """
    draws square with sides num long
    :param num: int number
    """
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)


def forward(num):
    """
    goes forward the length of num
    :param num: int number
    """
    turtle.forward(num)


def equ_tri(num):
    """
    draws an equilateral triangle with sides of length num
    :param num: int number
    """
    turtle.forward(num)
    turtle.left(120)
    turtle.forward(num)
    turtle.left(120)
    turtle.forward(num)
    turtle.left(120)


def circle(num):
    """
    draws a circle with num radius
    :param num: int number
    """
    turtle.circle(num)


def backward(num):
    """
    turtle goes backwards num length
    :param num: int number
    """
    turtle.backward(num)


def pen_u():
    """picks up turtle"""
    turtle.penup()


def pen_d():
    """lowers turtle"""
    turtle.pendown()


def rec(num_h, num_w):
    """
    draws rectangle with a height of num_h and width num_w
    :param num_h: int number
    :param num_w: int number
    """
    turtle.forward(num_w)
    turtle.left(90)
    turtle.forward(num_h)
    turtle.left(90)
    turtle.forward(num_w)
    turtle.left(90)
    turtle.forward(num_h)
    turtle.left(90)


def poly(num_s, num_l):
    """
    draws polygon with number of sides num_s with lengths of num_l
    :param num_s: int number
    :param num_l: int number
    """
    for _ in range(num_s):
        turtle.forward(num_l)
        turtle.left(360/num_s)


def go_to(num_x, num_y):
    """
    moves turtle to position (num_x, num_y) on the coordinate plane
    :param num_x: int number
    :param num_y: int number
    """
    turtle.goto(num_x, num_y)


def color(num):
    """
    chooses the color the turtle will be based off the number
    :param num: int number
    """
    if num == 0:
        turtle.color("red")
    elif num == 1:
        turtle.color("blue")
    elif num == 2:
        turtle.color("green")
    elif num == 3:
        turtle.color("yellow")
    elif num == 4:
        turtle.color("brown")
    else:
        turtle.color("black")


def draw(turtle_input):
    """
    finds where the interpeter should start to draw the string of
     commands and then call to take action from that point
    :param turtle_input: str input
    :return: take_action(index, turtle_input)
    """
    first = first_non_num(turtle_input)
    global char_index
    char_index = first
    for index in range(first, len(turtle_input)):
        if index == char_index:
            take_action(index, turtle_input)


def take_action(instruction_index, turtle_input):
    """
    works through the string interpreting the string and making the appropriate drawings
    :param instruction_index: int index of the string
    :param turtle_input: str input
    :return: num
    """
    instruction = turtle_input[instruction_index]
    next_instruction = non_num(instruction_index, turtle_input)
    num = str(turtle_input[instruction_index + 1: next_instruction])
    if num == '':
        print("error input: " + turtle_input)
    elif instruction == str("<"):
        turn_left(int(num))
    elif instruction == str(">"):
        turn_right(int(num))
    elif instruction == str("S"):
        draw_square(int(num))
    elif instruction == str("F"):
        forward(int(num))
    elif instruction == str("T"):
        equ_tri(int(num))
    elif instruction == str("C"):
        circle(int(num))
    elif instruction == str("B"):
        backward(int(num))
    elif instruction == str("U"):
        pen_u()
        next_instruction = non_num(instruction_index, turtle_input)
        instruction = str(turtle_input[instruction_index + 1: next_instruction])
        return instruction
    elif instruction == str("D"):
        pen_d()
        next_instruction = non_num(instruction_index, turtle_input)
        instruction = str(turtle_input[instruction_index + 1: next_instruction])
        return instruction
    elif instruction == str("R"):
        num_h = str(turtle_input[instruction_index + 1: next_instruction])
        next_non_num = non_num(next_instruction + 1, turtle_input)
        num_w = str(turtle_input[next_instruction + 1: next_non_num])
        rec(int(num_h), int(num_w))
    elif instruction == str("P"):
        num_s = str(turtle_input[instruction_index + 1: next_instruction])
        next_non_num = non_num(next_instruction + 1, turtle_input)
        num_l = str(turtle_input[next_instruction + 1: next_non_num])
        poly(int(num_s), int(num_l))
    elif instruction == str("G"):
        num_x = str(turtle_input[instruction_index + 1: next_instruction])
        next_non_num = non_num(next_instruction + 1, turtle_input)
        num_y = str(turtle_input[next_instruction + 1: next_non_num])
        go_to(int(num_x), int(num_y))
    elif instruction == str("Z"):
        color(int(num))
    else:
        print("error input: " + turtle_input)



def first_non_num(turtle_input):
    """
    finds the first non numeric character in the string
    :param turtle_input: str input
    :return: char or None
    """
    for char in range(len(turtle_input)):
        if not turtle_input[char].isdigit():
            return char
    else:
        return None


def non_num(curr_index, turtle_input):
    """
    finds the next non numeric character in the string
    :param curr_index: current index of the string
    :param turtle_input: str input
    :return: char or None
    """
    for char in range(curr_index + 1, len(turtle_input)):
        if not turtle_input[char].isdigit():
            global char_index
            char_index = char
            return char
    else:
        return None


def main():
    """prompts the user for the string input and calls the commands to process the input"""
    turtle_input = str(input("turtle commands: "))
    draw(turtle_input)
    turtle.done()


if __name__ == '__main__':
    main()
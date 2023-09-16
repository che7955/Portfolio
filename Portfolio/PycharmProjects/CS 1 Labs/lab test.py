"""Author: Christopher Eng, Lab 04 shapy_turtle"""
import turtle

char_index = 0


def turn_left(num):
    turtle.left(num)


def turn_right(num):
    turtle.right(num)


def draw_square(num):
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)
    turtle.forward(num)
    turtle.left(90)


def forward(num):
    turtle.forward(num)


def equ_tri(num):
    turtle.forward(num)
    turtle.left(120)
    turtle.forward(num)
    turtle.left(120)
    turtle.forward(num)
    turtle.left(120)


def circle(num):
    turtle.circle(num)


def backward(num):
    turtle.backward(num)


def pen_u():
    turtle.penup()


def pen_d():
    turtle.pendown()


def rec(num_h, num_w):
    turtle.forward(num_w)
    turtle.left(90)
    turtle.forward(num_h)
    turtle.left(90)
    turtle.forward(num_w)
    turtle.left(90)
    turtle.forward(num_h)
    turtle.left(90)


def draw(turtle_input):
    first = first_non_num(turtle_input)
    global char_index
    char_index = first
    for index in range(first, len(turtle_input)):
        if index == char_index:
            take_action(index, turtle_input)


def take_action(instruction_index, turtle_input):
    instruction = turtle_input[instruction_index]
    next_instruction = non_num(instruction_index, turtle_input)
    num = str(turtle_input[instruction_index + 1: next_instruction])
    if instruction == str("<"):
        turn_left(int(num))
    if instruction == str(">"):
        turn_right(int(num))
    if instruction == str("S"):
        draw_square(int(num))
    if instruction == str("F"):
        forward(int(num))
    if instruction == str("T"):
        equ_tri(int(num))
    if instruction == str("C"):
        circle(int(num))
    if instruction == str("B"):
        backward(int(num))
    if instruction == str("U"):
        pen_u()
        next_instruction = non_num(instruction_index, turtle_input)
        instruction = str(turtle_input[instruction_index + 1: next_instruction])
        return instruction
    if instruction == str("D"):
        pen_d()
        next_instruction = non_num(instruction_index, turtle_input)
        instruction = str(turtle_input[instruction_index + 1: next_instruction])
        return instruction
    if instruction == str("R"):
        next_instruction = non_num(instruction_index, turtle_input)
        num_h = str(turtle_input[instruction_index + 1: next_instruction])
        next_non_num = non_num(next_instruction + 1, turtle_input)
        num_w = str(turtle_input[next_instruction + 1: next_non_num])
        rec(int(num_h), int(num_w))


def first_non_num(turtle_input):
    for char in range(len(turtle_input)):
        if not turtle_input[char].isdigit():
            return char
    else:
        return None


def non_num(curr_index, turtle_input):
    for char in range(curr_index + 1, len(turtle_input)):
        if not turtle_input[char].isdigit():
            global char_index
            char_index = char
            return char
    else:
        return None


def main():
    turtle_input = str(input("turtle commands: "))
    draw(turtle_input)
    print(first_non_num(turtle_input))
    turtle.done()


if __name__ == '__main__':
    main()

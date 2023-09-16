"""Author: Christopher Eng, HW05 songs"""

import turtle
side = 10
right_angle = 90


def square(color):
    """This function simply draws a box and fills it with a color and moves to ready itself to draw another box"""
    turtle.fillcolor(color)
    turtle.begin_fill()
    turtle.forward(side)
    turtle.right(right_angle)
    turtle.forward(side)
    turtle.right(right_angle)
    turtle.forward(side)
    turtle.right(right_angle)
    turtle.forward(side)
    turtle.right(right_angle)
    turtle.end_fill()
    turtle.forward(side)


def paint_line(file):
    """This function draws the lines of boxes filled with the colors that are associated with the characters ord values.
    When finished it prepares itself for the next line and strips any unwanted whitespace from the next line."""
    character_count = 0
    for line in file:
        line = line.strip()
        turtle.penup()
        turtle.right(right_angle)
        turtle.forward(side)
        turtle.right(right_angle)
        turtle.forward(character_count * side)
        turtle.left(right_angle * 2)
        turtle.pendown()
        character_count = 0
        for ch in line:
            if 0 <= ord(ch) < 70:
                color = 'red'
            elif 70 <= ord(ch) < 100:
                color = 'green'
            elif 100 <= ord(ch) < 110:
                color = 'yellow'
            elif 110 <= ord(ch) < 122:
                color = 'blue'
            elif ord(ch) >= 122:
                color = 'pink'
            square(color)
            new_character_count = character_count + 1
            character_count = new_character_count
            line = line.strip()


def picture(file_name):
    """This function sets the turtle to the left then,
     opens the file input by the user as file_name then calls for the paint_line file to draw the lines."""
    turtle.speed(0)
    turtle.penup()
    turtle.goto(-275, 275)
    turtle.pendown()
    with open(file_name) as file:
        paint_line(file)


def main():
    """The main function asks the user for the input on the text file they want drawn,
    and calls for the picture function to draw the lines."""
    file_name = str(input('file name: '))
    picture(file_name)
    turtle.done()


if __name__ == '__main__':
        main()
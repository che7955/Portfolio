"""Author: Christopher Eng, lab03 arrows"""

import turtle
import math
import random

zero = 0
thirty = 30
sixty = 60
right_angle = 90
one_twenty = 120
one_fifty = 150
two_hundred = 200
four_hundred = 400
WINDOW_SIZE = 500
BOUNDING_BOX = 200
MAX_FIGURES = 500
MIN_FIGURES = 1
MAX_SIZE = 30
MIN_SIZE = 1
MAX_ANGLE = 30
MAX_DISTANCE = 30
MIN_DISTANCE = 1


def draw_figures_rec(depth, side=random.randint(MIN_SIZE, MAX_SIZE), area=float(zero)):
    """this function draws the triangle images recursively."""
    if depth <= 0:
        print('The total area painted is ' + str(area) + ' units.')
    if depth > 0:
        turtle.speed(zero)
        turtle.fillcolor(random.random(), random.random(), random.random())
        turtle.begin_fill()
        turtle.penup()
        turtle.forward((side * math.sqrt(3) / 2) / 2)
        turtle.left(one_fifty)
        turtle.forward(side)
        turtle.left(one_twenty)
        turtle.forward(side)
        turtle.left(one_twenty)
        turtle.forward(side)
        turtle.right(thirty)
        turtle.backward((side * math.sqrt(3) / 2) / 2)
        turtle.end_fill()
        turtle.penup()
        distance = random.randint(MIN_DISTANCE, MAX_DISTANCE)
        turtle.forward(distance)
        turtle_position_angle()
        side = random.randint(MIN_SIZE, MAX_SIZE)
        draw_figures_rec(depth-1, side, area + (math.sqrt(3) / 4) * (math.pow(side, 2)))


def draw_figures_iter(depth, side=random.randint(MIN_SIZE, MAX_SIZE)):
    """this function draws the triangle images iteratively."""
    area = 0
    while depth > 0:
        turtle.speed(0)
        turtle.fillcolor(random.random(), random.random(), random.random())
        turtle.begin_fill()
        turtle.penup()
        turtle.forward((side * math.sqrt(3) / 2) / 2)
        turtle.left(one_fifty)
        turtle.forward(side)
        turtle.left(one_twenty)
        turtle.forward(side)
        turtle.left(one_twenty)
        turtle.forward(side)
        turtle.right(thirty)
        turtle.backward((side * math.sqrt(3) / 2) / 2)
        turtle.end_fill()
        turtle.penup()
        distance = random.randint(MIN_DISTANCE, MAX_DISTANCE)
        turtle.forward(distance)
        turtle_position_angle()
        area += (math.sqrt(3) / 4) * (math.pow(side, 2))
        depth -= 1
        side = random.randint(MIN_SIZE, MAX_SIZE)
    print('The total area painted is ' + str(area) + ' units.')


def eq_tri_area(side):
    """a basic function used for PPS to find area of a equilateral triangle"""
    area_of_tri = (math.sqrt(3) / 4) * (math.pow(side, 2))
    print(area_of_tri)


def turtle_box():
    """draws and colors the square canvas"""
    turtle.speed(0)
    turtle.penup()
    turtle.right(right_angle)
    turtle.fillcolor('lightyellow')
    turtle.begin_fill()
    turtle.forward(two_hundred)
    turtle.left(right_angle)
    turtle.pendown()
    turtle.forward(two_hundred)
    turtle.left(right_angle)
    turtle.forward(four_hundred)
    turtle.left(right_angle)
    turtle.forward(four_hundred)
    turtle.left(right_angle)
    turtle.forward(four_hundred)
    turtle.left(right_angle)
    turtle.forward(two_hundred)
    turtle.penup()
    turtle.left(right_angle)
    turtle.forward(two_hundred)
    turtle.end_fill()
    turtle.right(right_angle)
    turtle.pendown()


def turtle_position_angle():
    """determines the angle to the place of the next triangle will be. if the next triangle is out of
    bounds it will correct itself to angle back into the space on the canvas."""
    random_angle = random.randint(-MAX_ANGLE, MAX_ANGLE)
    if -BOUNDING_BOX + MAX_SIZE < turtle.xcor() < BOUNDING_BOX - MAX_SIZE \
            and -BOUNDING_BOX + MAX_SIZE < turtle.ycor() < BOUNDING_BOX - MAX_SIZE:
        return turtle.left(random_angle)
    else:
        return turtle.setheading(turtle.towards(zero, zero))


def main():
    """asks the user for the amount of triangles and draws the image desired recursively and iteratively.
    if the user inputs a number out of scope it will alert the user."""
    depth = int(input('Arrows (0-500): '))
    if MIN_FIGURES < depth < MAX_FIGURES:
        turtle_box()
        draw_figures_rec(depth, side=random.randint(MIN_SIZE, MAX_SIZE), area=float(0))
        turtle.hideturtle()
        input('Hit enter to continue...')
        turtle.reset()
        turtle_box()
        draw_figures_iter(depth, side=random.randint(MIN_SIZE, MAX_SIZE))
        turtle.hideturtle()
        print('Close the canvas window to quit.')
        turtle.done()
    else:
        print('Arrows must be between 0 and 500 inclusive.')


if __name__ == '__main__':
    main()
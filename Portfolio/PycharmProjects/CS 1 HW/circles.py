"""
Author: Christopher Eng, HW03 circles .
"""
import turtle

PEN_WIDTH = 2
RADIUS = 150

def init():
    """
    init prepares the program to run by setting the turtles position, speed, size, and makes sure it is drawing.
    """
    turtle.setpos( 0, 0 )
    turtle.speed(0)
    turtle.pensize()
    turtle.down()


def draw_circles_1(radius=500):
    """
    draw_circles_1 draws a simple circle
    """
    turtle.circle(radius)


def draw_circles_2(radius=500):
    """
    draw_circles_2 draws a circle and the draws two, 1/2 scale version of the draw_circles_1 function
    """
    turtle.circle(radius)
    turtle.left(90)
    turtle.penup()
    turtle.forward(radius)
    turtle.pendown()
    draw_circles_1(radius / 2)
    turtle.penup()
    turtle.right(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.pendown()
    draw_circles_1(radius/2)
    turtle.penup()
    turtle.left(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.pendown()


def draw_circles_3(radius=500):
    """
    draw_circles_2 draws a circle and the draws two, 1/2 scale version of the draw_circles_2 function
    """
    turtle.circle(radius)
    turtle.left(90)
    turtle.penup()
    turtle.forward(radius)
    turtle.pendown()
    draw_circles_2(radius / 2)
    turtle.penup()
    turtle.right(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.pendown()
    draw_circles_2(radius/2)
    turtle.penup()
    turtle.left(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.forward(radius)
    turtle.left(90)
    turtle.pendown()



def draw_circles_rec(radius, depth):
    """
    draw_circles_rec function uses the information given to it by the user input to draw the depth of circles
    the user wants by recursively calling itself to draw the circle each time subtracting 1 from the depth
     until the depth is 0
    """
    if depth == 0:
        pass
    else:
        turtle.circle(radius)
        turtle.left(90)
        turtle.penup()
        turtle.forward(radius)
        turtle.pendown()
        draw_circles_rec(radius / 2, depth - 1)
        turtle.penup()
        turtle.right(90)
        turtle.forward(radius)
        turtle.left(90)
        turtle.pendown()
        draw_circles_rec(radius / 2, depth - 1)
        turtle.penup()
        turtle.left(90)
        turtle.forward(radius)
        turtle.left(90)
        turtle.forward(radius)
        turtle.left(90)
        turtle.pendown()


def main():
    """
    the main function calls the init function and then runs the simple circle functions after the user types enter.
    the main function prompts the user for the depth that they want the recursive function to perform and then uses
    the input to draw the desired recursive function
    """
    init()
    print( "Drawing a depth-1 circles drawing." )
    draw_circles_1( RADIUS )
    input( "Hit ENTER to proceed to depth 2:" )
    turtle.clear()
    draw_circles_2( RADIUS )
    input( "Hit ENTER to proceed to depth 3:" )
    turtle.clear()
    draw_circles_3( RADIUS )
    input( "Hit ENTER to proceed to recursive code:" )
    turtle.clear()
    depth = int( input( "depth? " ) )
    draw_circles_rec( RADIUS, depth )
    print( "Close the window to end the program." )
    turtle.done()


if __name__ == '__main__':
    main()
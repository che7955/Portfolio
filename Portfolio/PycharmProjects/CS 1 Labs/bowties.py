""""Author: Christopher Eng, Lab 02, bowties"""

import turtle

def init():
    """
    the init function sets the size of the turtle window and the speed of the turtle.
    """
    turtle.setup(1000,1000)
    turtle.speed(0)

def draw_one_bowtie(size = 166.7):
    """
    The draw_one_bowtie function was created for the post problem solving and serves as the basic
    definition of how to draw a single bowtie.
    pre-condition: turtle is facing east with the pen down
    post-condition: turtle is facing east with the pen down
    """
    turtle.color("blue")
    turtle.left(30)
    turtle.forward(size)
    turtle.right(120)
    turtle.forward(size)
    turtle.right(120)
    turtle.forward(size*2)
    turtle.left(120)
    turtle.forward(size)
    turtle.left(120)
    turtle.forward(size)
    turtle.right(120)
    turtle.penup()
    turtle.forward(size / 4)
    turtle.pendown()
    turtle.left(90)
    turtle.fillcolor("red")
    turtle.begin_fill()
    turtle.circle(size / 4)
    turtle.end_fill()
    turtle.left(90)
    turtle.penup()
    turtle.forward(size / 4)
    turtle.right(90)
    turtle.pendown()

def draw_bowties(size,depth):
    """
    the draw_bowties function draws the bow ties at the depth desired for by the user. it does so by first checking
    what the depth is and then if it is not zero it will draw the bow ties and recursively call itself to go to the
    desired depth until  the depth is zero and then it will stop.
    pre-condition: turtle is facing east with the pen down
    post-condition: turtle is facing east with the pen down
    """
    if depth == 0:
        pass
    else:
        turtle.color("blue")
        turtle.left(30)
        turtle.forward(size)
        turtle.right(120)
        turtle.forward(size)
        turtle.right(120)
        turtle.forward(size * 2)
        turtle.left(120)
        turtle.forward(size)
        turtle.left(120)
        turtle.forward(size)
        turtle.right(120)
        turtle.penup()
        turtle.forward(size / 4)
        turtle.pendown()
        turtle.left(90)
        turtle.fillcolor("red")
        turtle.begin_fill()
        turtle.circle(size / 4)
        turtle.end_fill()
        turtle.left(90)
        turtle.penup()
        turtle.forward(size / 4)
        turtle.right(90)
        turtle.pendown()
        turtle.left(30)
        turtle.penup()
        turtle.forward(size * 2)
        turtle.pendown()
        draw_bowties(size / 3, depth - 1)
        turtle.penup()
        turtle.back(size * 2)
        turtle.left(120)
        turtle.forward(size * 2)
        turtle.pendown()
        draw_bowties(size / 3, depth - 1)
        turtle.penup()
        turtle.backward(size * 2)
        turtle.left(60)
        turtle.forward(size * 2)
        turtle.pendown()
        draw_bowties(size / 3, depth - 1)
        turtle.penup()
        turtle.backward(size * 2)
        turtle.left(120)
        turtle.forward(size * 2)
        turtle.pendown()
        draw_bowties(size / 3, depth - 1)
        turtle.penup()
        turtle.backward(size * 2)
        turtle.left(30)

def main():
    """
    the main function asks the user for their desired depth for drawing bow ties and also sets the size and calls the
    init and draw_bowties function and then ends the turtle function when complete.
    """
    depth = int(input("depth? "))
    size = 166.7
    init()
    draw_bowties(size, depth)
    turtle.done()

if __name__ == '__main__':
    main()
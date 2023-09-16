"""Author: Christopher Eng, Lab 01 scenery"""

import turtle
import random
import math

def draw_pine():
    """
    this function draws the pine tree.
    """
    trunk = random.randint(50, 200)
    turtle.color("green")
    turtle.left(90)
    turtle.forward(trunk)
    turtle.right(90)
    turtle.forward(trunk * .3)
    turtle.left(120)
    turtle.forward(trunk * .6)
    turtle.left(120)
    turtle.forward(trunk * .6)
    turtle.left(120)
    turtle.forward(trunk * .3)
    turtle.right(90)
    turtle.forward(trunk)
    turtle.left(90)
    return(int(2.8 * trunk))

def draw_maple():
    """
    this function draws the maple tree.
    """
    trunk = random.randint(50, 150)
    turtle.color("green")
    turtle.left(90)
    turtle.forward(trunk)
    turtle.right(90)
    turtle.circle(trunk * .4)
    turtle.right(90)
    turtle.forward(trunk)
    turtle.left(90)
    return(int(trunk + 2 * math.pi * .4 * trunk))

def draw_house():
    """
    this function draws the house.
    """
    turtle.color(str(input("what color is the house? ")))
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.left(45)
    turtle.forward(100 / math.sqrt(2))
    turtle.left(90)
    turtle.forward(100 / math.sqrt(2))
    turtle.left(45)
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.color("green")
    return(int(441.421356237))


def main():
    """
    this main function asks the user for input about the drawing, & then draws the image based off of the info.
    """
    a = str(input("Is there a house in the forest? (y/n) "))

    def house_question():
        """
        this function holds the prompt for if the user wats a house drawn or not,
        and then based off answers draws the desired image.
        """
        if a == str("y"):
            b = int(input("At what position (1/2/3)? "))
            if b == 1:
                turtle.color("green")
                turtle.forward(100)
                house_ink = draw_house()
                turtle.color("green")
                turtle.forward(100)
                tree1 = random.randint(1, 2)
                tree1_ink = 0
                if tree1 == 1:
                    tree1_ink = draw_pine()
                if tree1 == 2:
                    tree1_ink = draw_maple()
                turtle.forward(100)
                tree2 = random.randint(1, 2)
                tree2_ink = 0
                if tree2 == 1:
                    tree2_ink = draw_pine()
                if tree2 == 2:
                    tree2_ink = draw_maple()
                turtle.forward(100)
                turtle.hideturtle()
                print("Units of ink used in drawing: ")
                print(400 + tree1_ink + tree2_ink + house_ink)
                turtle.done()
            if b == 2:
                turtle.color("green")
                turtle.forward(100)
                tree1 = random.randint(1, 2)
                tree1_ink = 0
                if tree1 == 1:
                    tree1_ink = draw_pine()
                if tree1 == 2:
                    tree1_ink = draw_maple()
                turtle.forward(100)
                house_ink = draw_house()
                turtle.forward(100)
                tree2 = random.randint(1, 2)
                tree2_ink = 0
                if tree2 == 1:
                    tree2_ink = draw_pine()
                if tree2 == 2:
                    tree2_ink = draw_maple()
                turtle.forward(100)
                turtle.hideturtle()
                print("Units of ink used in drawing: ")
                print(400 + tree1_ink + tree2_ink + house_ink)
                turtle.done()
            if b == 3:
                turtle.color("green")
                turtle.forward(100)
                tree1 = random.randint(1, 2)
                tree1_ink = 0
                if tree1 == 1:
                    tree1_ink = draw_pine()
                if tree1 == 2:
                    tree1_ink = draw_maple()
                turtle.forward(100)
                tree2 = random.randint(1, 2)
                tree2_ink = 0
                if tree2 == 1:
                    tree2_ink = draw_pine()
                if tree2 == 2:
                    tree2_ink = draw_maple()
                turtle.forward(100)
                house_ink = draw_house()
                turtle.color("green")
                turtle.forward(100)
                turtle.hideturtle()
                print("Units of ink used in drawing: ")
                print(400 + tree1_ink + tree2_ink + house_ink)
                turtle.done()

        if a == str("n"):
            turtle.color("green")
            turtle.forward(100)
            tree1 = random.randint(1, 2)
            tree1_ink = 0
            if tree1 == 1:
                tree1_ink = draw_pine()
            if tree1 == 2:
                tree1_ink = draw_maple()
            turtle.forward(100)
            tree2 = random.randint(1, 2)
            tree2_ink = 0
            if tree2 == 1:
                tree2_ink = draw_pine()
            if tree2 == 2:
                tree2_ink = draw_maple()
            turtle.forward(100)
            turtle.hideturtle()
            print("Units of ink used in drawing: ")
            print(300 + tree1_ink + tree2_ink)
            turtle.done()

    house_question()
if __name__ == '__main__':
    main()
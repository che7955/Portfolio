"""
tree3.py draws a recursive tree where each branch has two smaller branches.
author: Chris Eng
"""

import turtle

BRANCH_ANGLE = 35
REDUCTION = 0.75


def init_world():
    """
    Initialize the drawing area.

    :post: turtle is at origin, facing North, pen down
    """

    turtle.clear()
    turtle.home()  # turtle is at origin, facing east, pen-down
    turtle.down()  # turtle's pen is down
    turtle.left(90)  # turtle is facing North
    # turtle.speed( 0 )   # makes it fast


def draw_tree(depth: int, size: float, thickness: float):
    """
    Draw a single tree based on argument values.
    :param depth: depth of recursion of drawing
    :param size: length of tree's initial trunk
    """
    turtle.width(thickness)
    if depth >= 1:
        turtle.forward(size)
        if depth >= 2:
            turtle.left(BRANCH_ANGLE)
            draw_tree(depth - 1, size * REDUCTION, thickness - 2)
            turtle.right(BRANCH_ANGLE)
            draw_tree(depth - 1, size * REDUCTION, thickness - 2)
            turtle.right(BRANCH_ANGLE)
            draw_tree(depth - 1, size * REDUCTION, thickness - 2)
            turtle.left(BRANCH_ANGLE)
        turtle.backward(size)


def prompt_and_draw_tree() -> bool:
    """
    Prompt for number of line segments from the base of the tree to
    the end of any "tip" branch,  and for length of tree "trunk".
    If the user enters a negative number for the depth, that is
    interpreted as the user wanting to quit.
    Otherwise draw the tree and repeat.
    :return: True only if the user wants to continue
    """
    thickness = int(input("branch thickness: "))
    depth = int(input("Tree depth: "))
    if depth >= 0:
        size = float(input("Initial branch length: "))
        init_world()
        draw_tree(depth, size, thickness)
        return True
    else:
        return False


if __name__ == "__main__":
    while prompt_and_draw_tree():
        print("Doing it again!...")
    print("Close the window to quit.")
    turtle.done()
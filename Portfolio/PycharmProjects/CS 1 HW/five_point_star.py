"""Christopher Eng's five pointed star program"""
import turtle


def draw_penta():
  """draw_penta draws the pentagram which the star is based off of"""
  turtle.forward(100)
  turtle.right(72)
  turtle.forward(100)
  turtle.right(72)
  turtle.forward(100)
  turtle.right(72)
  turtle.forward(100)
  turtle.right(72)
  turtle.forward(100)
  turtle.right(72)

def draw_point():
    """draw_point draws an individual point of the star and positions it to draw the next point"""
    turtle.left(60)
    turtle.forward(100)
    turtle.right(120)
    turtle.forward(100)
    turtle.right(12)

def main():
    """the main function initiates the other functions"""
    draw_penta()
    draw_point()
    draw_point()
    draw_point()
    draw_point()
    draw_point()
    turtle.done()

if __name__ == '__main__':
    main()
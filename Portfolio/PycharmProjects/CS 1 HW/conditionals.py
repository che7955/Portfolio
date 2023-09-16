"""Author: Christopher Eng, HW02 conditionals"""

def divisible(a,b):
    """
    the divisible function checks to see if the larger integer is evenly divisible by the smaller integer and then
    informs the user if the larger value is evenly divisible by the smaller value
    """
    if b == a:
        print(str(a) + str(' is equal to') + str(b))
    elif a == 0:
        print(str('Input ') + str(a) + str(' must be a positive value!'))
    elif b == 0:
        print(str('Input ') + str(b) + str(' must be a positive value!'))
    elif a < 1:
        print(str(a) + str(' must be positive integers!'))
    elif b < 1:
        print(str(b) + str(' must be positive integers!'))
    elif a % b == 0:
        print(str(a) + str(' divided by ') + str(b) + str(' is evenly divisible.'))
    elif b % a == 0:
        print(str(b) + str(' divided by ') + str(a) + str(' is evenly divisible.'))
    else:
        print(str(a) + str(' and ') + str(b) + str(' are not evenly divisible.'))

def run_divisible():
    """
    run_divisible prompts the user for information and uses the information to determine a response
    """
    a = int(input('Input Value for Number A: '))
    b = int(input('Input value for Number B: '))
    return(divisible(a,b))

def is_triangle(side1,side2,side3):
    """
    the is_triangle function checks to see if the values can make a triangle and then informs the user if the sides
    given can make a triangle or not
    """
    if side1 == 0:
        print(str('Length given: ') + str(side1) + str(', must be a positive number!'))
    elif side2 == 0:
        print(str('Length given: ') + str(side2) + str(', must be a positive number!'))
    elif side3 == 0:
        print(str('Length given: ') + str(side3) + str(', must be a positive number!'))
    elif side1 < 0:
        print(str('Length given: ') + str(side1) + str(', must be a positive number!'))
    elif side2 < 0:
        print(str('Length given: ') + str(side2) + str(', must be a positive number!'))
    elif side3 < 0:
        print(str('Length given: ') + str(side3) + str(', must be a positive number!'))
    if side1 + side2 >= side3 and side1 + side3 >= side2 and side2 + side3 >= side1:
        print(str('sides: ') + str(side1) + str(', ') + str(side2) + str(', ') + str(side3) + str(' can form a triangle!'))
    else:
        print(str('sides: ') + str(side1) + str(', ') + str(side2) + str(', ') + str(side3) + str(' can NOT form a triangle.'))

def run_is_triangle():
    """
    run_is_triangle prompts the user for information and uses the information to determine a response
    """
    side1 = int(input('length of side 1: '))
    side2 = int(input('length of side 2: '))
    side3 = int(input('length of side 3: '))
    return(is_triangle(side1,side2,side3))

def main():
    """
    main function runs the run_divisible and run_is_triangle functions
    """
    run_divisible()
    run_is_triangle()

if __name__ == '__main__':
    main()
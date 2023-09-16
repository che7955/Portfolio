"""Author: Christopher Eng, HW04 GCD"""

def gcd_rec(num_a, num_b):
    """
    The function gcd_rec finds the greatest common denominator for the two numbers it is given, using tail recursion.
    """
    if num_b == 0:
        return num_a
    else:
        return gcd_rec(num_b, num_a % num_b)


def test_gcd_rec():
    """
    The function test_gcd_rec tests the function gcd_rec by calling it 9 times with different integers
    and then printing the results.
    """
    print(gcd_rec(7, 7))
    print(gcd_rec(18, 9))
    print(gcd_rec(6, 4))
    print(gcd_rec(0, 36))
    print(gcd_rec(16, 0))
    print(gcd_rec(14, 3))
    print(gcd_rec(180, 15))
    print(gcd_rec(270, 192))
    print(gcd_rec(18, 48))


def gcd_inter(num_a, num_b):
    """
    The function gcd_inter finds the greatest common denominator for the two numbers it is given, using iteration.
    """
    while True:
        if num_b == 0:
            return num_a
        else:
            old_a = num_a
            num_a = num_b
            num_b = old_a % num_b


def test_gcd_inter():
    """
    The function test_gcd_inter tests the function gcd_rec by calling it 9 times with different integers
    and then printing the results.
    """
    print(gcd_inter(7, 7))
    print(gcd_inter(18, 9))
    print(gcd_inter(6, 4))
    print(gcd_inter(0, 36))
    print(gcd_inter(16, 0))
    print(gcd_inter(14, 3))
    print(gcd_inter(180, 15))
    print(gcd_inter(270, 192))
    print(gcd_inter(18, 48))



def main():
    """
    The function main asks the user for their choice of either the recursive or iterative GCD functions,it also asks
    for the values of the numbers the user want to find the greatest common factor of and then runs either the
    recursive or iterative function based off which one the user choose and prints the result.
    """
    print('please select the GCD function to use: ')
    print('1. Recursive')
    print('2. Iterative')
    choice_x = int(input('Please select a function: '))
    if choice_x == 1:
        num_a = int(input('Please enter the first number: '))
        num_b = int(input('Please enter the second number: '))
        print('The greatest common denominator is: ' + str(gcd_rec(num_a, num_b)))
    if choice_x == 2:
        num_a = int(input('Please enter the first number: '))
        num_b = int(input('Please enter the second number: '))
        print('The greatest common denominator is: ' + str(gcd_inter(num_a, num_b)))
    #test_gcd_inter()
    #test_gcd_rec()

if __name__ == '__main__':
    main()

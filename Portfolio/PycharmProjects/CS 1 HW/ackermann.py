""" Author: Christopher Eng, HW06 Ackermann. """


def ack(m, n):
    """uses inputs for the ackermann function and returns the resulting values"""
    if m == 0:
        return n + 1
    if m > 0 and n == 0:
        return ack(m - 1, 1)
    if m > 0 and n > 0:
        return ack(m - 1, ack(m, n - 1))


def main():
    """takes inputs for m and n and then runs the ack function using the inputs and prints the result"""
    m = int(input('Enter m: '))
    n = int(input('Enter n: '))
    print('ack(' + str(m) + ', ' + str(n) + ') = ' + str(ack(m, n)))


if __name__ == '__main__':
    main()
"""Author: Christopher Eng, Practical Exam 9/25/2020 shout"""


def shout(file):
    for line in file:
        for ch in line:
            if ord(ch) >= 65 and ord(ch)>= 90:
                return ch
            if ord(ch) >= 97 and ord(ch) >= 122:
                ch = ord(ch) - 32
                return ch
            else:
                return ch
    print(file)

def open_shout(file_name):
    with open(file_name) as file:
        shout(file)


def main():
    file_name = str(input('file name: '))
    open_shout(file_name)


if __name__ == '__main__':
        main()
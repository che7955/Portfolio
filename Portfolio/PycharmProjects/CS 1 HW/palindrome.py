"""
CSCI-141: Testing & Debugging
Homework 6
Author: RIT CS

A palindrome checker that has a logic error.
"""

def is_palindrome(word):
    """
    A boolean function that recursively tests whether a word is a palindrome
    or not.
    :param word: the word
    :return: whether it is a palindrome or not
    """
    if len(word) <= 1:
        return True
    else:
        if word[0] == word[-1]:
            return is_palindrome(word[1:-1])
        else:
            return False


def main():
    """
    The main prompts for a word and checks whether it is a palindrome or not.
    """
    word = input('Enter word: ')
    if (is_palindrome(word)):
        print(word, 'is a palindrome')
    else:
        print(word, 'is NOT a palindrome')

if __name__ == '__main__':
    main()
"""
CSCI-141: Testing & Debugging
Homework 6
Author: RIT CS

Test module for the is_palindrome() function in the palindrome module
"""

import palindrome


def test_is_palindrome(name, word, expected):
    """a single test of the is_palindrome function"""
    result = palindrome.is_palindrome(word)
    if result == expected:
        print(name, 'passed')
    else:
        print(name, 'failed; expected', expected, 'but got', result)


def run_tests():
    """test cases for is_palindrome"""
    test_is_palindrome("is_palindrome('ababab')", 'ababab', False)
    test_is_palindrome("is_palindrome('abaaba')", 'abaaba', True)
    test_is_palindrome("is_palindrome('aba')", 'aba', True)
    test_is_palindrome("is_palindrome('abababa')", 'abababa', True)
    test_is_palindrome("is_palindrome('aabb')", 'aabb', False)
    test_is_palindrome("is_palindrome('baab')", 'baab', True)
    test_is_palindrome("is_palindrome('aaabbb')", 'aaabbb', False)
    test_is_palindrome("is_palindrome('a')", 'a', True)
    test_is_palindrome("is_palindrome('')", '', True)
    test_is_palindrome("is_palindrome('ab')", 'ab', False)
    test_is_palindrome("is_palindrome('ababba')", 'ababba', False)


if __name__ == '__main__':
    run_tests()
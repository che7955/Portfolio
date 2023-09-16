"""Author: Christopher Eng, HW06 Anagrams """

import sys


def split(word):
    """splits up words into list of characters"""
    return [char for char in word]


def read_and_store(file_name):
    """reads the file and creates a dictionary with the lexicographical form of the word
    as a key to the words anagrams which are stored as its values"""
    with open(file_name, encoding="utf-8") as file:
        dictionary = {}
        for line in file:
            word = line.strip()
            orig_word = word.split()
            lst = split(word)
            lst.sort()
            key_lex = "".join(lst)
            if key_lex not in dictionary:
                dictionary[key_lex] = orig_word
            else:
                dictionary[key_lex] = dictionary[key_lex] + orig_word
    return dictionary


def check_word_choice(dictionary, key_from_word_choice, original_word):
    """finds a given strings anagrams"""
    if key_from_word_choice in dictionary.keys():
        print(str(original_word) + "'s anagram(s) are: " + str(dictionary[key_from_word_choice]))
    else:
        print('No anagrams found.')


def anagram_len(dictionary, chosen_anagram_length):
    """finds the longest list of anagrams for a given word length"""
    temp_value = []
    for values in dictionary.values():
        for word in values:
            if len(word) == chosen_anagram_length:
                neat_word = word.strip()
                lst = split(neat_word)
                lst.sort()
                lex_of_word = "".join(lst)
                values = dictionary[lex_of_word]
                if len(values) > len(temp_value):
                    temp_value = values
                elif len(temp_value) >= len(values):
                    pass
    print('Max anagrams for length ' + str(chosen_anagram_length) + ': ' + str(len(temp_value)))
    print('Anagram list: ' + str(temp_value))


def num_jumble_words(dictionary, jumble_word_len):
    """finds how many words do not have anagrams for a given length"""
    total = 0
    for keys in dictionary:
        if int(jumble_word_len) == len(keys) and len(dictionary[keys]) == 1:
            total += 1
    print('Number of jumble usable words of length ' + str(jumble_word_len) + ': ' + str(total))


def init_one():
    """asks for user input and calls the check_word_choice function until enter is given as input"""
    word_choice = str(input('Anagram solver (hit enter key to go to task 3): '))
    if word_choice != "":
        original_word = word_choice
        word = word_choice.strip()
        lst = split(word)
        lst.sort()
        word_choice = "".join(lst)
        check_word_choice(read_and_store('american-english.txt'), word_choice, original_word)
        init_one()
    else:
        pass


def init_two():
    """asks user for input and calls the anagram_len function until enter is given as input"""
    chosen_anagram_length = input('Greatest list of anagrams with length (hit enter key to go to task 4): ')
    if chosen_anagram_length != "":
        anagram_len(read_and_store('american-english.txt'), int(chosen_anagram_length))
        init_two()
    else:
        pass


def init_three():
    """asks user for input and calls the num_jumble_words function until enter is given as input"""
    jumble_word_len = input('Enter word length (hit enter key to exit): ')
    if jumble_word_len != "":
        num_jumble_words(read_and_store('american-english.txt'), int(jumble_word_len))
        init_three()
    else:
        sys.exit()


def main():
    """calls to the init functions to start the function calls"""
    init_one()
    init_two()
    init_three()


if __name__ == '__main__':
    main()
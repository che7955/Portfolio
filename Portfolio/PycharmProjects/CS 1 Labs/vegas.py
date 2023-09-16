"""Author: Christopher Eng, lab07 vegas"""
import cs_stack
import cs_queue
import random


def init_deck(deck_size):
    """Creates a queue representing deck of cards with a range between 0 and the users specified length"""
    deck = cs_queue.make_empty_queue()
    while deck_size > 0:
        cs_queue.enqueue(deck, deck_size)
        deck_size -= 1
    return deck


def random_draw(deck):
    """Takes out a random card from the deck by placing the front card in the back a random number of times
    then returning the front card"""
    grab = random.randint(0, deck.size)
    while grab > 0:
        card = cs_queue.dequeue(deck)
        cs_queue.enqueue(deck, card)
        grab -= 1
    return cs_queue.dequeue(deck)


def play_game(deck):
    """Creates 3 stacks of cards and asks for random cards while ordering them by size if a card is not the 1 card
    then it will be placed into stack one if the next card is greater than the current card on stack one then it is
    placed on stack two, and if it is smaller than the current top card of stack one it is placed on stack one.
    however if the card is the next cart in ascending order after what ever card is on the victory pile the card is
    placed onto the victory pile."""
    stack_one = cs_stack.make_empty_stack()
    stack_two = cs_stack.make_empty_stack()
    stack_victory = cs_stack.make_empty_stack()
    while not cs_queue.is_empty(deck):
        draw = random_draw(deck)
        if draw == 1:
            cs_stack.push(stack_victory, draw)
        elif not cs_stack.is_empty(stack_victory) and draw == cs_stack.top(stack_victory) + 1:
            cs_stack.push(stack_victory, draw)
        else:
            if cs_stack.is_empty(stack_one):
                cs_stack.push(stack_one, draw)
            elif cs_stack.is_empty(stack_two):
                if draw > cs_stack.top(stack_one):
                    cs_stack.push(stack_two, draw)
                else:
                    cs_stack.push(stack_one, draw)
            elif draw > cs_stack.top(stack_one):
                cs_stack.push(stack_two, draw)
            elif draw < cs_stack.top(stack_one):
                cs_stack.push(stack_one, draw)
    while (not cs_stack.is_empty(stack_one) and cs_stack.top(stack_one) == cs_stack.top(stack_victory) + 1) or (not cs_stack.is_empty(stack_two) and cs_stack.top(stack_two) == cs_stack.top(stack_victory) + 1):
        if not cs_stack.is_empty(stack_one) and cs_stack.top(stack_one) == cs_stack.top(stack_victory) + 1:
            cs_stack.push(stack_victory, cs_stack.pop(stack_one))
        elif not cs_stack.is_empty(stack_two) and cs_stack.top(stack_two) == cs_stack.top(stack_victory) + 1:
            cs_stack.push(stack_victory, cs_stack.pop(stack_two))
    return stack_victory.size


def main():
    """asks for the size of the deck and numbers of times the game should be played and then runs the game and finds
    the average amount won the minimum amount won and the maximum amount won"""
    deck_size = int(input('Input deck size: '))
    num_games = int(input('Number of times game should be played: '))
    count = 0
    total_winnings = 0
    average_winnings = ""
    max_win = 0
    min_win = 10
    while count < num_games:
        winnings = play_game(init_deck(deck_size))
        total_winnings += winnings
        average_winnings = total_winnings / num_games
        if max_win < winnings:
            max_win = winnings
        if min_win > winnings:
            min_win = winnings
        count += 1
    print('The average number of cards on the victory pile: ' + str(average_winnings))
    print('max winnings: ' + str(max_win))
    print('min_winnings: ' + str(min_win))


if __name__ == '__main__':
    main()
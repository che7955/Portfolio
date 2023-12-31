package war;

import war.*;

/**
 * The main program for the card game, War.  It is run on the command line as:<br>
 * <br>
 * java War cards-per-player seed<br>
 * <br>
 *
 * @author RIT CS
 * @author YOUR NAME HERE
 */

public class War {
    /** The maximum number of cards a single player can have */
    public final static int MAX_CARDS_PER_PLAYER = 26;
    private Player p1;
    private Player p2;
    private int round;
    /**
     * Initialize the game.
     *
     * @param cardsPerPlayer the number of cards for a single player
     */
    public War(int cardsPerPlayer) {
        Pile initialPile = new Pile("initial");
        for (Rank rank : Rank.values()) {
            for (Suit suit : Suit.values()) {
                Card x = new Card(rank, suit);
                initialPile.addCard(x);
            }
        }
        initialPile.shuffle();
        System.out.println(initialPile);
        p1 = new Player(1);
        p2 = new Player(2);
        for (int i = 0; i < MAX_CARDS_PER_PLAYER; i++) {
            if (i % 2 == 0){
            }
            p2.addCards(initialPile);
        }
    }

    public void playRound() {
        while (p1.hasCard() && p2.hasCard()) {
            Card move1 = p1.drawCard();
            Card move2 = p2.drawCard();
            if (move1.beats(move2)) {
                p1.addCard(move1);
                p1.addCard(move2);
            }
        }
    }
    /** Play the full game. */
    public void playGame(){
        playRound();
            if (p1.hasCard()){
                p1.isWinner();
            }
            p2.isWinner();
    }

    /**
     * The main method get the command line arguments, then constructs
     * and plays the game.  The Pile's random number generator and seed
     * need should get set here using Pile.setSeed(seed).
     *
     * @param args command line arguments
     */
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java War cards-per-player seed");
        } else {
            int cardsPerPlayer = Integer.parseInt(args[0]);
            // must be between 1 and 26 cards per player
            if (cardsPerPlayer <= 0 || cardsPerPlayer > MAX_CARDS_PER_PLAYER) {
                System.out.println("cards-per-player must be between 1 and " + MAX_CARDS_PER_PLAYER);
            } else {
                // set the rng seed
                Pile.setSeed(Integer.parseInt(args[1]));
                War war = new War(cardsPerPlayer);
                war.playGame();
            }
        }
    }
}

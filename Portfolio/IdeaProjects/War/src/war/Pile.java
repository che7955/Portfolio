package war;
import java.util.ArrayList;
import java.util.Random;
import java.util.Collections;

public class Pile {
    private ArrayList<Card> cards;
    private String name;
    private static Random rng;

    public Pile(String name){
        this.name = name;
        this.cards = new ArrayList<>();
    }

    public void addCard(Card card){
        cards.add(card);
    }
    public void clear(){
        cards.clear();
    }
    public Card drawCard(boolean faceUp){
        Card z = cards.get(0);
        if (z.isFaceUp() == true){
            this.shuffle();
            for (Card y: cards){
                y.setFaceDown();
            }
            System.out.println(this);
        }
        Card x = cards.remove(0);
        if (faceUp == true){
            x.setFaceUp();
        }
        return x;
    }
    public ArrayList<Card> getCards(){
        return cards;
    }
    public boolean hasCard(){
        return !cards.isEmpty();
    }
    public static void setSeed(long seed){
    rng = new Random();
    rng.setSeed(seed);
    }
    public void shuffle(){
        Collections.shuffle(cards, rng);
        System.out.println("Shuffling " + name + " pile");
    }
    @Override
    public String toString(){
        String c = new String();
        for (Card x: cards){
            c = c + x + " ";
        }
        return name + " pile: " + c;
    }
}

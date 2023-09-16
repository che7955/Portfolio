package war;

import java.util.ArrayList;

public class Player {
    private Pile pile;
    private boolean winner;

    public Player(int id){
        this.pile = new Pile("P"+id);
    }

    public void addCard(Card card){
        this.pile.addCard(card);
    }
    public void addCards(Pile cards){
    for (Card c: cards.getCards()){
        addCard(c);
    }
    }
    public Card drawCard(){
        return pile.drawCard(true);
    }
    public boolean hasCard(){
        return pile.hasCard();
    }
    public boolean isWinner(){
    return winner;
    }
    public void setWinner(){
    winner = true;
    }
    @Override
    public String toString(){
    return pile.toString();
    }
}

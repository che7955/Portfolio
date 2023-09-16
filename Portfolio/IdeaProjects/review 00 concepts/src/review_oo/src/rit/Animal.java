package review_oo.src.rit;
/**
 * This Object represents all types of animals.
 * get number of legs should be in this class because
 * both of the classes that inherit this class use that method.
 */
public class Animal {
  private int numberOfLegs;

  public String move() {
    return null;
  }
  public int getNumberOfLegs(int numberOfLegs) {
    return numberOfLegs;
  }
}
package review_oo.src.rit;
/**
 * This Object represents all dogs.
 */
public class Dog extends Animal {
  private int numberOfLegs =4;

  public Dog() {
    getNumberOfLegs(numberOfLegs);
  }

  @Override
  public String move() {
    return "chase my tail";
  }
}
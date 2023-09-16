package review_oo.src.rit;
/**
 * This Object represents all spiders.
 */
public class Spider extends Animal {
  private int numberOfLegs=8;

  public Spider() {

    getNumberOfLegs(numberOfLegs);
  }


  @Override
  public String move() {
    return "climb my web";
  }
}
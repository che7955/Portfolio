package review_oo.src.rit;
/**
 * This Object holds an RGB color definition.
 * 
 * WHAT PRICIPLE IS VIOLATED?
 * << the principle of encapsulation is being violated also the law of demeter says that things should
 * not be needlessly connected so the variables being public for no reason breaks that.>>
 */
public class Color {
  private int red;
  private int green;
  private int blue;
  
  public String getCssCode() {
    return "#"
        + Integer.toHexString(red)
        + Integer.toHexString(green)
        + Integer.toHexString(blue);
  }
}
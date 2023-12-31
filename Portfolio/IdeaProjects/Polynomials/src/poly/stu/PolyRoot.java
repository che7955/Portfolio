package poly.stu;

import java.util.ArrayList;

/**
 * This class can compute the root of a polynomial (whose derivative is
 * non-zero), using Newton's method of successive approximation.
 *
 * @author RIT CS
 * @author YOUR NAME HERE
 */
public class PolyRoot {
    /**
     * The degree of acceptable error for the root
     */
    public static final double EPSILON = 0.000001;

    /**
     * The initial guess for the root
     */
    public static final double INITIAL_GUESS = 0.1;

    /**
     * The maximum number of iterations to perform for root finding
     */
    public static final int MAX_ITERATIONS = 100;

    /**
     * Compute an estimate for a root of the polynomial, using  Newton's
     * method.  For example:
     * <pre>
     * poly=[3, -1]: 3.0
     * poly=[0, 3]: -1.3877787807814457E-17
     * poly=[2, -1, -2, 1]: 2.0000000358875707
     * poly=[-5, 0, 0, 3, 3, 1]: 0.9128992721006024
     * </pre>
     *
     * @param poly A native array representing the polynomial, in reverse order.
     * @return An estimated root for the polynomial.
     * @rit.pre poly is not an empty array.  Minimally it will contain
     * a constant term.
     * @rit.pre The derivative of poly is non-zero
     * @rit.pre The evaluation of the derivative of the polynomial at a guessed
     * root is non-zero.
     */
    public static double computeRoot(int[] poly) {
        return newtonsMethod(poly, INITIAL_GUESS, 1);
    }

    /**
     * Compute an estimate for a root of the polynomial, using Newton's
     * method.
     *
     * @param poly A list representing the polynomial, in reverse order.
     * @param x0   The current guess for the root.
     * @param iter The current iteration being performed
     * @return An estimated root for the polynomial.
     * @rit.pre poly is not an empty list.  Minimally it will contain
     * a constant term.
     * @rit.pre The derivative of poly is non-zero
     * @rit.pre The evaluation of the derivative of the polynomial at a guessed
     * root is non-zero.
     */
    private static double newtonsMethod(int[] poly, double x0, int iter) {
        double tempVar;
        if (iter == 1){ tempVar = INITIAL_GUESS;}
        else{ tempVar = x0;}
        double result = PolyEval.evaluate(poly, tempVar);
        if (iter == MAX_ITERATIONS || Math.abs(result)<= EPSILON) {
            return x0;
        }
        else{ double realResult = x0 - (PolyEval.evaluate(poly,x0)
        / (PolyEval.evaluate(PolyDerive.computeDerivative(poly),x0)));
        return newtonsMethod(poly, realResult, iter +1);
        }
    }
}

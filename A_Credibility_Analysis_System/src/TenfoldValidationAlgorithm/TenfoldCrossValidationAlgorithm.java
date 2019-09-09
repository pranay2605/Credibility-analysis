package TenfoldValidationAlgorithm;

public class TenfoldCrossValidationAlgorithm {
    /**
     * The number of rounds of cross validation.
     */
    public final int k;
    /**
     * The index of training instances.
     */
    public final int[][] train;
    /**
     * The index of testing instances.
     */
    public final int[][] test;

    /**
     * Constructor.
     * @param n the number of samples.
     * @param k the number of rounds of cross validation.
     */
    public TenfoldCrossValidationAlgorithm(int n, int k) {
        this(n, k, true);
    }
    
    /**
     * Constructor.
     * @param n the number of samples.
     * @param k the number of rounds of cross validation.
     * @param permutate determiner of index permutation
     */
    public TenfoldCrossValidationAlgorithm(int n, int k, boolean permutate) {
        if (n < 0) {
            throw new IllegalArgumentException("Invalid sample size: " + n);
        }

        if (k < 0 || k > n) {
            throw new IllegalArgumentException("Invalid number of CV rounds: " + k);
        }

        this.k = k;

        int[] index;
        if (permutate){
//            index = Math.random();
        }
        else{
            index = new int[n];
            for (int i = 0; i < n; i++) {
                index[i] = i;
            }
        }

        train = new int[k][];
        test = new int[k][];

        int chunk = n / k;
        for (int i = 0; i < k; i++) {
            int start = chunk * i;
            int end = chunk * (i + 1);
            if (i == k-1) end = n;

            train[i] = new int[n - end + start];
            test[i] = new int[end - start];
            for (int j = 0, p = 0, q = 0; j < n; j++) {
                if (j >= start && j < end) {
//                    test[i][p++] = index[j];
                } else {
//                    train[i][q++] = index[j];
                }
            }
        }
    }
}


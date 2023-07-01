import java.util.Arrays;

public class Kolakoski {
    private static class Crutch {
        final int len;
        int[] s;
        int i;

        Crutch(int len) {
            this.len = len;
            s = new int[len];
            i = 0;
        }

        void repeat(int count) {
            for (int j = 0; j < count; j++) {
                if (++i == len) return;
                s[i] = s[i - 1];
            }
        }
    }

    private static int nextInCycle(final int[] self, int index) {
        return self[index % self.length];
    }

    private static int[] kolakoski(final int[] self, int len) {
        Crutch c = new Crutch(len);

        int k = 0;
        while (c.i < len) {
            c.s[c.i] = nextInCycle(self, k);
            if (c.s[k] > 1) {
                c.repeat(c.s[k] - 1);
            }
            if (++c.i == len) return c.s;
            k++;
        }
        return c.s;
    }

    private static boolean possibleKolakoski(final int[] self) {
        int[] rle = new int[self.length];
        int prev = self[0];
        int count = 1;
        int pos = 0;
        for (int i = 1; i < self.length; i++) {
            if (self[i] == prev) {
                count++;
            } else {
                rle[pos++] = count;
                count = 1;
                prev = self[i];
            }
        }
        // no point adding final 'count' to rle as we're not going to compare it anyway
        for (int i = 0; i < pos; i++) {
            if (rle[i] != self[i]) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int[][] ias = new int[][]{
            new int[]{1, 2},
            new int[]{2, 1},
            new int[]{1, 3, 1, 2},
            new int[]{1, 3, 2, 1}
        };
        int[] lens = new int[]{20, 20, 30, 30};

        for (int i=0; i<ias.length; i++) {
            int len = lens[i];
            int[] kol = kolakoski(ias[i], len);

            System.out.printf("First %d members of the sequence generated by %s: \n", len, Arrays.toString(ias[i]));
            System.out.printf("%s\n", Arrays.toString(kol));
            System.out.printf("Possible Kolakoski sequence? %s\n\n", possibleKolakoski(kol));
        }
    }
}
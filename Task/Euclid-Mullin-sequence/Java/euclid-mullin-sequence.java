import java.math.BigInteger;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public final class EuclidMullinSequence {

	public static void main(String[] aArgs) {
		primes = listPrimesUpTo(1_000_000);
		
		System.out.println("The first 27 terms of the Euclid-Mullin sequence:");
		System.out.print(2 + "  ");
		for ( int i = 1; i < 27; i++ ) {
			System.out.print(
                String.format("%s%s", nextEuclidMullin(), ( i == 14 || i == 27 ) ? "\n" : "  "));
		}
	}
	
	private static BigInteger nextEuclidMullin() {
		BigInteger smallestPrime = smallestPrimeFactor(product.add(BigInteger.ONE));
		product = product.multiply(smallestPrime);
		
		return smallestPrime;
	}
	
	private static BigInteger smallestPrimeFactor(BigInteger aNumber) {
		if ( aNumber.isProbablePrime(CERTAINTY_LEVEL) ) {
			return aNumber;
		}
		
		for ( BigInteger prime : primes ) {
			if ( aNumber.mod(prime).signum() == 0 ) {
				return prime;
			}
 		}
		
		BigInteger factor = pollardsRho(aNumber);
		return smallestPrimeFactor(factor);
	}
	
	private static BigInteger pollardsRho(BigInteger aN) {
		if ( aN.equals(BigInteger.ONE) ) {
			return BigInteger.ONE;
		}
		
		if ( aN.mod(BigInteger.TWO).signum() == 0 ) {
			return BigInteger.TWO;
		}
		
		final BigInteger core  = new BigInteger(aN.bitLength(), random);
		BigInteger x  = new BigInteger(aN.bitLength(), random);
		BigInteger xx = x;
		BigInteger divisor = null;		
		
		do {
			x = x.multiply(x).mod(aN).add(core).mod(aN);
			xx = xx.multiply(xx).mod(aN).add(core).mod(aN);
			xx = xx.multiply(xx).mod(aN).add(core).mod(aN);
			divisor = x.subtract(xx).gcd(aN);
		} while ( divisor.equals(BigInteger.ONE) );
		
		return divisor;
	}	
	
	private static List<BigInteger> listPrimesUpTo(int aLimit) {
		BitSet sieve = new BitSet(aLimit + 1);
		sieve.set(2, aLimit + 1);
		
		for ( int i = 2; i * i <= aLimit; i = sieve.nextSetBit(i + 1) ) {
			for ( int j = i * i; j <= aLimit; j += i ) {
				sieve.clear(j);
			}
		}
		
		List<BigInteger> result = new ArrayList<BigInteger>(sieve.cardinality());
		for ( int i = 2; i >= 0; i = sieve.nextSetBit(i + 1) ) {
			result.add(BigInteger.valueOf(i));
		}
		
		return result;
	}
	
	private static List<BigInteger> primes;
	private static BigInteger product = BigInteger.TWO;
	private static ThreadLocalRandom random = ThreadLocalRandom.current();
	
	private static final int CERTAINTY_LEVEL = 20;

}

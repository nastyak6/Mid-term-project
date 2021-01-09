package sim;

import java.util.ArrayList;
import java.util.SplittableRandom;

public class BarcodeSimulation {
	private static BarcodeSimulation obj;
	private static ArrayList<String> pool;
	
	// SingletonBuilder
	private BarcodeSimulation() {
		pool = new ArrayList<String>();
		pool.add("565656895");
		pool.add("m1114");
		pool.add("895898568");
		pool.add("112233441");
		pool.add("g1141");
		pool.add("m1131");
		pool.add("123456789");
		pool.add("123456123");
	}

	// Singleton, create one instance only
	public static BarcodeSimulation getSim() {
		if (obj == null) {
			if (obj == null) {
				obj = new BarcodeSimulation();// instance will be created at request time
			}
		}
		return obj;
	}
	
	public static String read(int key) {
		switch (key) {
		case 0:
			return "g"+String.valueOf(new SplittableRandom().nextInt(1_000, 5_001));
		case 1:
			return "m"+String.valueOf(new SplittableRandom().nextInt(1_000, 5_001));
		case 2:
			return String.valueOf(new SplittableRandom().nextInt(1_000_000, 3_999_000));
		case 3:
			return nextIn();
		default:
			return null;
		}
	}
	
	private static String nextIn() {
		if (pool.isEmpty())
			return read(0);
		String ret = pool.get(0);
		pool.remove(ret);
		return ret;
	}
}
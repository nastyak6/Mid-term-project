package dataLayer;

public class Park {

	private String name;
	private int maximumCapacityInPark = 0;
	private int currentAmount = 0;
	private int maxAmountOrders = 0;
	private int enteryPrice;
	private int mangerDiscount;

	// ******************************************************
	// needed to be checked that 'maxAmountOrders < maximumCapacityInPark' while
	// editing!!
	// ******************************************************

	public int getEnteryPrice() {
		return enteryPrice;
	}

	public void setEnteryPrice(int enteryPrice) {
		this.enteryPrice = enteryPrice;
	}

	public int getMangerDiscount() {
		return mangerDiscount;
	}

	public void setMangerDiscount(int mangerDiscount) {
		this.mangerDiscount = mangerDiscount;
	}

	public Park(String name, int maxAmountOrders, int maximumCapacityInPark, int currentAmount) {
		this.name = name;
		this.maxAmountOrders = maxAmountOrders;
		this.maximumCapacityInPark = maximumCapacityInPark;
		this.currentAmount = currentAmount;
		if (!check()) {
			System.out.println("Orders capacity is bigger than the Park Capacity!");
		}
	}

	public int getMaxAmountOrders() {
		return maxAmountOrders;
	}

	public void setMaxAmountOrders(int maxAmountOrders) {
		this.maxAmountOrders = maxAmountOrders;
	}

	public int getMaximumCapacityInPark() {
		return maximumCapacityInPark;
	}

	public void setMaximumCapacityInPark(int maximumCapacityInPark) {
		this.maximumCapacityInPark = maximumCapacityInPark;
	}

	public boolean check() {
		if (maxAmountOrders <= maximumCapacityInPark)
			return false;
		return true;
	}

	public Park(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCurrentAmount() {
		return currentAmount;
	}

	public void setCurrentAmount(int currentAmount) {
		this.currentAmount = currentAmount;
	}

}

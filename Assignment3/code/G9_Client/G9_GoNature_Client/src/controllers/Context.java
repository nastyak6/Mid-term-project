package controllers;



public class Context {
	
	private OrderController OrderC;
	private WaitingListController WLC;
	private WaitingListConfirmContoller WLCC;
	
	private final static Context instance = new Context();
	  public static Context getInstance() {
	    return instance;
	  }
	
	  public OrderController getOrderC() {
		return OrderC;
	}
	public void setOrderC(OrderController orderC) {
		OrderC = orderC;
	}
	public WaitingListController getWLC() {
		return WLC;
	}
	public void setWLC(WaitingListController wLC) {
		WLC = wLC;
	}
	public WaitingListConfirmContoller getWLCC() {
		return WLCC;
	}
	public void setWLCC(WaitingListConfirmContoller wLCC) {
		WLCC = wLCC;
	}
	
	
	
	  
}


package server;

import java.util.ArrayList;
import java.util.Arrays;

//import dataLayer.CreditCard;
import ocsf.server.ConnectionToClient;
import orderData.Order;
import orderData.OrderType;
import server.WaitingList;
import userData.Member;

//executed by Nastya
public class NewOrder {

	public static void NewReservation(ArrayList<Object> recived, ConnectionToClient client) {
		WaitingList a = null;
		ArrayList<Object> answer = new ArrayList<Object>();
		answer.add(recived.get(0));
		Order data = (Order) recived.get(1); // credit card object received
		Member memb = MemerCheck(data); // to check the member type by order
		// check if the capacity of orders is full
		if ((!a.checkForAvailableSpots(recived, client))) {
			answer.add(false);
			EchoServer.sendToMyClient(answer, client);
		}

		else {

			// ����� ID �� MEMBERID,
			// �� �� ������. ����� �� ����� ������ �� ���� ���
			// ����� �� ����. �� �� �� �� ��� ��� ���� �� �����

			data = totalPrice(data, memb);// updating the prices in the order

			ArrayList<String> query = new ArrayList<String>();
			query.add("insert"); // command
			query.add("orders"); // table name
			query.add(toStringForReservation(data)); // values in query format

			if (MySQLConnection.insert(query))
				answer.add(true);
			else
				answer.add(false);

			EchoServer.sendToMyClient(answer, client);
		}

	}

	// input: Order with empty totalPrice & price & orderType, a Member
	//
	// output: Order with updated totalPrice and price and orderType
	public static Order totalPrice(Order ord, Member memb) {

		int parkEnteryPrice = CurrentPriceInPark(ord);
		ord.setTotalPrice(parkEnteryPrice * ord.getVisitorsNumber());
		if (memb == null) {// if the order is not 4 a member
			ord.setOrderType(OrderType.REGULAR);
			ord.setPrice(parkEnteryPrice * ord.getVisitorsNumber() * 0.85);
		} else {// if the order is for some members

			switch (memb.getMemberOrderType()) {
			case MEMBER:
				ord.setOrderType(OrderType.MEMBER);
				int familymembers = Integer.parseInt(memb.getAmount());
				int notFamilyMembers = ord.getVisitorsNumber() - familymembers;
				if (notFamilyMembers < 0)
					notFamilyMembers = 0;
				ord.setPrice(familymembers * parkEnteryPrice * 0.85);
				ord.setPrice(ord.getPrice() * 0.75 + notFamilyMembers * parkEnteryPrice * 0.85);
				break;
			case GROUP:
				ord.setOrderType(OrderType.GROUP);
				int groupAmount = Integer.parseInt(memb.getAmount());
				ord.setPrice(groupAmount * parkEnteryPrice * 0.75);
				break;
			default:
				break;
			}
		}
		return ord;
	}

	// check if needed to be sent null or empty in order number
	public static String toStringForReservation(Order data) {
		
		String s=Double. toString(data.getTotalPrice());
		String p=Double. toString(data.getPrice());
		return "'" + "" + "','" 
				+ data.getVisitorsNumber() + "','" 
				+ data.getOrderEmail() + "','" 
				+ data.getOrderPhone()+ "','"
				+ data.getOrderType().toString() + "','" 
				+ s + "','"
				+ p + "','" 
				+ data.getParkName() + "','" 
				+ data.getArrivedTime() + "','" 
				+ data.getMemberId() + "','"
				+ data.getID() + "'";
	}

	// checks if u a member and return the member from DB
	public static Member MemerCheck(Order ord) {
		ArrayList<String> query = new ArrayList<String>();
		query.add("select"); // command
		query.add("member"); // table name
		query.add("*"); // columns to select from
//		if (ord.getMemberId() != null && ord.getID() != null)
//			query.add("WHERE memberNumber='" + ord.getMemberId() + "'" + " OR ID='=" + ord.getID() + "'");
		if (ord.getMemberId() != null)
			query.add("WHERE memberNumber='" + ord.getMemberId() + "'");
		else if (ord.getID() != null)
			query.add("WHERE ID='" + ord.getID() + "'");
		query.add("9"); // how many columns returned

		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query);
		if (queryData.get(0).isEmpty())
			return null;
		else
			return new Member(queryData.get(0));

	}

	// return the current price of entry in the park selected in the order
	public static int CurrentPriceInPark(Order ord) {

		ArrayList<String> query = new ArrayList<String>();
		query.add("select"); // command
		query.add("park"); // table name
		query.add("entryPrice"); // columns to select from
		query.add("WHERE parkName='" + ord.getParkName() + "'"); // condition - non -> all parks names required
		query.add("1"); // how many columns returned

		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query);

		return Integer.parseInt(queryData.get(0).get(0));
	}

	// func that returns all parks names
	public static void ParksNames(ArrayList<Object> recived, ConnectionToClient client) {

		// the returned values stored here
		ArrayList<Object> answer = new ArrayList<Object>();
		// the service name : ParksNames
		answer.add(recived.get(0));
		// cell 0: recivedFromServerParksNames

		ArrayList<String> query = new ArrayList<String>();
		query.add("select"); // command
		query.add("park"); // table name
		query.add("parkName"); // columns to select from
		query.add(""); // condition - non -> all parks names required
		query.add("1"); // how many columns returned

		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query);
		if (queryData.get(0).isEmpty()) {
			// no parks in DB
			answer.add(new ArrayList<String>(Arrays.asList("Failed")));
		} else {
			ArrayList<String> parkNames = new ArrayList<String>();
			for (ArrayList<String> a : queryData)
				for (String b : a)
					parkNames.add(b);
			answer.add(parkNames);
		}
		EchoServer.sendToMyClient(answer, client);

	}

}

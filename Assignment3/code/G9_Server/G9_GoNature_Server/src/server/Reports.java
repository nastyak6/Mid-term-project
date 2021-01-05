package server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import ocsf.server.ConnectionToClient;

/**
 * The Reports program generates Reports
 *
 * @author Anastasia Kokin
 */

public class Reports {

	/**
	 * Overall Visitors Report generated by visitors type. by parks with option for
	 * all parks
	 * 
	 * @param ArrayList of objects contains: [0] -> String "overallVisitorsReport"
	 *                  [1] -> Array list of String contains: [0] -> String parkName
	 *                  [1] -> String startDate in a following date format:
	 *                  (YYYY-MM-DD) [2] -> String endDate in a following date
	 *                  format: (YYYY-MM-DD)
	 * @return Array list that contains: [1-n] -> Array list of string that
	 *         contains: (n depends on number of entries in the DB) [0] ->
	 *         visitorType [1] -> amount of visitors arrived on the specific dates
	 */

	public static void OverallVisitorsReport(ArrayList<Object> recived, ConnectionToClient client) {

		ArrayList<Object> answer = new ArrayList<Object>();
		// the service name : getCancellationReports
		answer.add(recived.get(0));
		ArrayList<String> dataFromClient = (ArrayList<String>) recived.get(1);
		String startDate = dataFromClient.get(1);
		String endDate = dataFromClient.get(2);
		String dateCond = "arrivedTime BETWEEN '" + startDate + "' AND '" + endDate + "'";

		ArrayList<String> query = new ArrayList<String>();
		query.add("select"); // command
		query.add("orders"); // table name
		query.add("orderType, SUM(amountArrived), arrivedTime"); // columns to select from
		query.add("WHERE parkName='" + dataFromClient.get(0) + "' AND " + dateCond
				+ "AND amountArrived >0 GROUP BY DAY(arrivedTime), orderType"); // condition
		query.add("3"); // how many columns returned

		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query);
		if (queryData.isEmpty()) {
			// no orders in these dates
			answer.add(new ArrayList<String>(Arrays.asList("Failed")));
			EchoServer.sendToMyClient(answer, client);
			return;
		} else {
			answer.add(queryData);
			System.out.println(queryData);
			EchoServer.sendToMyClient(answer, client);
		}
	}

	/**
	 * report for When The Park Wasn't Full
	 * 
	 * @param ArrayList of objects contains: [0] -> String "UsageReport" [1] ->
	 *                  Array list of String contains: [0] -> String parkName [1] ->
	 *                  String startDate in a following date format: (YYYY-MM-DD)
	 *                  [2] -> String endDate in a following date format:
	 *                  (YYYY-MM-DD)
	 * @return send to client: Array list that contains: [0-n] -> Array list of
	 *         string that contains: (n depends on number of entries in the DB) [0]
	 *         -> date and time of a capsule that was not full [1] -> Difference
	 *         between max allowed and actual arrived
	 */

	public static void UsageReport(ArrayList<Object> recived, ConnectionToClient client) {
		ArrayList<String> dataFromClient = (ArrayList<String>) recived.get(1);
		ArrayList<Object> answer = new ArrayList<Object>();
		ArrayList<ArrayList<String>> notFullDaysTable = new ArrayList<ArrayList<String>>();
		answer.add(recived.get(0));
		String parkName = dataFromClient.get(0);
		String startDate = dataFromClient.get(1);
		String endDate = dataFromClient.get(2);
		String dateCond = "arrivedTime BETWEEN '" + startDate + "' AND '" + endDate + "'";
		System.out.println("here1");
		ArrayList<String> query = new ArrayList<String>();
		query.add("select"); // select
		query.add("orders"); // tableName
		query.add("arrivedTime,SUM(amountArrived) AS amountArrived"); // columns
		query.add("WHERE parkName='" + parkName + "' AND " + dateCond + " GROUP BY arrivedTime ORDER BY arrivedTime"); // condition
		query.add("2"); // replyColNum
		ArrayList<ArrayList<String>> parkSummedCapacityByCapsule = MySQLConnection.select(query);
		System.out.println(parkSummedCapacityByCapsule);
		System.out.println("here2");
		query.clear();
		query.add("select"); // select
		query.add("park"); // tableName
		query.add("maxVisitorAmount"); // columns
		query.add("WHERE parkName= '" + parkName + "'"); // condition
		query.add("1"); // replyColNum

		ArrayList<ArrayList<String>> maxCapacityForPark = MySQLConnection.select(query);
		System.out.println("here3");
		System.out.println(maxCapacityForPark);
		int maxCapacity = Integer.parseInt(maxCapacityForPark.get(0).get(0));
		for (ArrayList<String> row : parkSummedCapacityByCapsule) {
			double capacityInCapsule = Double.parseDouble(row.get(1));
			if (capacityInCapsule < maxCapacity) {
				ArrayList<String> notFullDaysRow = new ArrayList<String>();
				notFullDaysRow.add(row.get(0));
				System.out.println("maxCapacity=" + maxCapacity);
				System.out.println("capacityInCapsule=" + capacityInCapsule);
				String dif = "" + (maxCapacity - capacityInCapsule);
				System.out.println("dif=" + dif);
				notFullDaysRow.add(dif);
				System.out.println(notFullDaysRow);
				notFullDaysTable.add(notFullDaysRow);
			}
		}

		System.out.println("here4");
		System.out.println(notFullDaysTable);
		answer.add(notFullDaysTable);
		try {
			client.sendToClient(answer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * calculate the percentage of people that were in the park for some amount of
	 * time (0-1, 1-2, 2-3, 3-4), generated by visitors type
	 * 
	 * @param ArrayList<Object> cell[0] name cell[1] from date cell[2] to date
	 *                          cell[3] orderType
	 * @return ArrayList<Object> cell[0] name cell[1] 0-1 percentage of visitors
	 *         cell[2] 1-2 percentage of visitors cell[3] 2-3 percentage of visitors
	 *         cell [4] 3-4 percentage of visitors
	 */
	public static void VisitsReport(ArrayList<Object> recived, ConnectionToClient client) {
		ArrayList<Object> answer = new ArrayList<Object>();
		answer.add(recived.get(0));
		ArrayList<String> dataFromClient = (ArrayList<String>) recived.get(1);
		String startDate = (String) dataFromClient.get(0);
		String endDate = (String) dataFromClient.get(1);
		String ot = (String) dataFromClient.get(2);
		String dateCond = "timeEnter BETWEEN '" + startDate + "' AND '" + endDate + "'";
		double[] temp = new double[4];
		int amountArrivedOverall = 0;
		ArrayList<String> query1 = new ArrayList<String>();
		query1.add("select"); // command
		query1.add("enteryandexit"); // table name
		query1.add("SUM(amountArrived)"); // columns to present
		query1.add("WHERE orderType='" + ot.toString() + "' AND " + dateCond + " "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) < '01:00:00' "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) > '00:00:00'"); // condition
		query1.add("1"); // how many columns returned

		ArrayList<ArrayList<String>> queryData1 = MySQLConnection.select(query1);
		if (queryData1.get(0) == null) {
			System.out.println("check");
			EchoServer.sendToMyClient(answer, client);
			return;
		}
		if (!(queryData1.get(0).get(0) == null)) {
			System.out.println("1:" + queryData1);
			temp[0] = Double.parseDouble(queryData1.get(0).get(0));
			amountArrivedOverall += temp[0];
		} else
			temp[0] = 0;

		ArrayList<String> query2 = new ArrayList<String>();
		query2.add("select"); // command
		query2.add("enteryandexit"); // table name
		query2.add("SUM(amountArrived)"); // columns to present
		query2.add("WHERE orderType='" + ot.toString() + "' AND " + dateCond + " "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) < '02:01:00' "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) > '01:00:00'"); // condition
		query2.add("1"); // how many columns returned
		ArrayList<ArrayList<String>> queryData2 = MySQLConnection.select(query2);
		if (!(queryData2.get(0).get(0) == null)) {
			System.out.println("2:" + queryData2);
			temp[1] = Double.parseDouble(queryData2.get(0).get(0));
			amountArrivedOverall += temp[1];
		} else
			temp[1] = 0;

		ArrayList<String> query3 = new ArrayList<String>();
		query3.add("select"); // command
		query3.add("enteryandexit"); // table name
		query3.add("SUM(amountArrived)"); // columns to present
		query3.add("WHERE orderType='" + ot.toString() + "' AND " + dateCond + " "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) < '03:01:00' "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) > '02:00:00'"); // condition
		query3.add("1"); // how many columns returned
		ArrayList<ArrayList<String>> queryData3 = MySQLConnection.select(query3);
		if (!(queryData3.get(0).get(0) == null)) {
			System.out.println("3:" + queryData3);
			temp[2] = Double.parseDouble(queryData3.get(0).get(0));
			amountArrivedOverall += temp[2];
		} else
			temp[2] = 0;

		ArrayList<String> query4 = new ArrayList<String>();
		query4.add("select"); // command
		query4.add("enteryandexit"); // table name
		query4.add("SUM(amountArrived)"); // columns to present
		query4.add("WHERE orderType='" + ot.toString() + "' AND " + dateCond + " "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) < '04:01:00' "
				+ " AND SUBTIME(TIME(timeExit), TIME(timeEnter)) > '03:00:00'"); // condition
		query4.add("1"); // how many columns returned
		ArrayList<ArrayList<String>> queryData4 = MySQLConnection.select(query4);
		if (!(queryData4.get(0).get(0) == null)) {
			System.out.println("4:" + queryData4);
			temp[3] = Double.parseDouble(queryData4.get(0).get(0));
			amountArrivedOverall += temp[3];
		} else
			temp[3] = 0;

		if (amountArrivedOverall != 0) {
			for (int i = 0; i < temp.length; i++) {
				System.out.println("arr [" + i + "]=" + ((temp[i] / amountArrivedOverall) * 100));
				answer.add((temp[i] / amountArrivedOverall) * 100);

			}
		} else
			answer.add("empty");
		EchoServer.sendToMyClient(answer, client);
	}

	/**
	 * Cancellation and visits lost Report
	 * 
	 * @param ArrayList<Object>: cell[0] name, cell[1] start date, cell[2] end date
	 *                           ,ConnectionToClient
	 * @return ArrayList<Object>: cell[0] func_name cell[1] ArrayList<String> of
	 *         rows in query
	 */

	public static void CancellationReport(ArrayList<Object> recived, ConnectionToClient client) {
		ArrayList<Object> answer = new ArrayList<Object>();
		// the service name : getCancellationReports
		answer.add(recived.get(0));

		ArrayList<String> dataFromClient = (ArrayList<String>) recived.get(1);
		String startDate = dataFromClient.get(0);
		String endDate = dataFromClient.get(1);
		String dateCond = "arrivedTime BETWEEN '" + startDate + "' AND '" + endDate + "'";
		ArrayList<String> query1 = new ArrayList<String>();
		query1.add("complexSelect"); // command
		query1.add(
				"(SELECT parkName, arrivedTime, visitorsNumber - amountArrived AS visitorsNumber FROM g9_gonature.orders WHERE "
						+ dateCond
						+ " AND visitorsNumber - amountArrived > 0 UNION ALL SELECT parkName, arrivedTime, visitorsNumber FROM g9_gonature.canceledorders WHERE "
						+ dateCond + " ORDER BY arrivedTime) t1 "); // table name
		query1.add("parkName, arrivedTime, SUM(visitorsNumber)"); // columns to present
		query1.add("GROUP BY Day(arrivedTime), parkname"); // condition
		query1.add("3"); // how many columns returned
		System.out.println(query1.toString());
		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query1);

		answer.add(queryData);
		System.out.println(queryData);// **

		EchoServer.sendToMyClient(answer, client);
	}

	/**
	 * sums the incomes on specific range of dates
	 * 
	 * @param ArrayList<Object>: cell[0] name, cell[1] ArrayList<String>
	 *  										cell[0] start date,
	 *  										cell[1] end date,
	 *  										cell[2] park name
	 *  						ConnectionToClient
	 * @returnArrayList<Object>: cell[0] func_name, cell[1] ArrayList<String>
	 *                           cell[0] Date and time cell[1] amount of money
	 *                           earned
	 */

	//select arrivedTime, SUM(afterDiscountPrice) AS price  from g9_gonature.orders where parkName='disney' and (arrivedTime BETWEEN '2021-01-01' and '2021-02-02' ) GROUP BY day(arrivedTime) order by day(arrivedTime);
	
	public static void incomesReport(ArrayList<Object> recived, ConnectionToClient client) {
		ArrayList<Object> answer = new ArrayList<Object>();
		answer.add(recived.get(0));
		String parkName = (String)((ArrayList<String>)recived.get(1)).get(2);
		ArrayList<String> dataFromClient = (ArrayList<String>) recived.get(1);
		String startDate = dataFromClient.get(0);
		String endDate = dataFromClient.get(1);
		String dateCond = "arrivedTime BETWEEN '" + startDate + "' AND '" + endDate + "'";

		ArrayList<String> query = new ArrayList<String>();
		query.add("select");
		query.add("orders");
		query.add("arrivedTime, SUM(afterDiscountPrice) AS price");
		query.add("WHERE parkName='"+ parkName +"' AND (arrivedTime BETWEEN '" + startDate + "' AND '" + endDate + "') GROUP BY day(arrivedTime) order by day(arrivedTime)");
//		query.add("WHERE " + dateCond + "AND parkName='" + dataFromClient.get(2)
//				+ "' AND amountArrived > 0 GROUP BY arrivedTime ORDER BY arrivedTime");
		query.add("2");
		ArrayList<ArrayList<String>> queryData = MySQLConnection.select(query);
		answer.add(queryData.get(0));
		System.out.println("revenues on these dates are : " + queryData);
		EchoServer.sendToMyClient(answer, client);
	}

}

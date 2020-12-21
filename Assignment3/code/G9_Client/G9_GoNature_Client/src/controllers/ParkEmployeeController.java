package controllers;

import java.io.IOException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXRadioButton;
import com.jfoenix.controls.JFXTextField;

import client.ClientUI;
import dataLayer.Park;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import orderData.Order;

public class ParkEmployeeController implements Initializable {
	@FXML
	private Label lblFirstNameTitle;
	@FXML
	private Button btnLogout;
	@FXML
	private Button btnDashboard;
	@FXML
	private Button btnSettings;

	@FXML
	private Label lblTitle;
	@FXML
	private Label lblCurrentVisitors;

	@FXML
	private Pane pnSettings;
	@FXML
	private Pane pnDashboard;

	@FXML
	private Label lblOrderNumber;
	@FXML
	private Label lblParkName;
	@FXML
	private Label lblDate;
	@FXML
	private Label lblTime;
	@FXML
	private Label lblVisitorsNumber;
	@FXML
	private Label lblEmail;

	@FXML
	private Label lblVisitorsAmount;
	@FXML
	private Label lblPrice;
	@FXML
	private Label lblDiscount;
	@FXML
	private Label lblPayment;
	@FXML
	private Label lblTotalPrice;

	@FXML
	private Button btnBarcodeScan;

	@FXML
	private JFXTextField txtOrderNumber;
	@FXML
	private JFXTextField txtVisitorsAmount;
	@FXML
	private Button btnShowDetails;

	@FXML
	private Button btnRandomVisitor;
	@FXML
	private Label lblDateTitle;
	@FXML
	private Label lblRandomDate;
	@FXML
	private Label lblTimeTitle;
	@FXML
	private Label lblRandomTime;
	@FXML
	private JFXTextField txtRandomVisitorsAmount;

	@FXML
	private JFXRadioButton radEnter;
	@FXML
	private JFXRadioButton radExit;
	@FXML
	private ToggleGroup radGroupStatus;
	@FXML
	private Button btnApprove;

	// check if we already was is the DB
	private AlertController alert = new AlertController();
	private boolean informationExists = false;
	private String radVisitorStatusText;
	private static String firstName;
	private static String parkName;
	private static Order orderDetails;
	private static Park parkDetails;
	private static String error = "";
	// private Map<String, Integer> orderDocumentation = new HashMap<String,
	// Integer>();

	@FXML
	void logout(ActionEvent event) throws IOException {
		Stage stage = (Stage) btnLogout.getScene().getWindow();
		Parent root = FXMLLoader.load(getClass().getResource("/gui/Login.fxml"));
		stage.setScene(new Scene(root));
	}

	// input: Id / memberId
	// output: order details
	@FXML
	void barcodeScan(ActionEvent event) {
		informationExists = true;
		// get order number from the server
		// call showDetails() function to set up all the order details

		int id = getOrderNumberFromBarcodeByID();
		int memberId = getOrderNumberFromBarcodeByMemberId();
		System.out.println("MemberId: " + memberId);

		sendToServer("ordersByIdOrMemberId", new ArrayList<String>(Arrays.asList(String.valueOf(memberId))));

		if (getError().equals("No such order")) {
			alert.failedAlert("Failed", "No such order.");
			clearAllFields();
			return;
		}

		txtOrderNumber.setText(String.valueOf(orderDetails.getOrderNumber()));
		txtVisitorsAmount.setText(String.valueOf(getVisitorsEnteredFromBarcode()));

		showDetails(event);
	}

	private int getOrderNumberFromBarcodeByID() {
		return 123456;
	}

	private int getOrderNumberFromBarcodeByMemberId() {
		// Random rand = new Random();
		// generate random integers in range 0 to 3
		// return rand.nextInt(4);
		return 2;
	}

	private int getVisitorsEnteredFromBarcode() {
		return 2;
	}

	// input: order number
	// output: order details
	@FXML
	void showDetails(ActionEvent event) {
		radExit.setDisable(false);
		setRandomModeOff();

		if (txtOrderNumber.getText().isEmpty() || txtVisitorsAmount.getText().isEmpty()) {
			alert.failedAlert("Failed", "All fields required.");
			return;
		}

		// will not enter if already has information from the barcodeScan
		if (!informationExists) {
			sendToServer("ordersByOrderNumber", new ArrayList<String>(Arrays.asList(txtOrderNumber.getText())));

			if (error.equals("No such order")) {
				alert.failedAlert("Failed", "No such order.");
				clearAllFields();
				return;
			}
		}

		if (!(String.valueOf(orderDetails.getOrderNumber()).equals(txtOrderNumber.getText()))) {
			alert.failedAlert("Failed", "No such order.");
			clearAllFields();
			return;
		}

		//TODO /****** calculate discount ******/
		// float price = Float.parseFloat(orderDetails.get(5));
		// float discount = Float.parseFloat(orderDetails.get(6));

		// lblTotalPrice.setText(String.valueOf(totalPrice) + "₪");

		printOrderDetails();

		informationExists = false;
		btnApprove.setDisable(false);
	}

	// enter random mode
	// input: random button has been pressed
	// output: screen changes
	@FXML
	void randomVisitor(ActionEvent event) {
		btnRandomVisitor.setVisible(false);
		lblDateTitle.setVisible(true);
		lblRandomDate.setVisible(true);
		lblTimeTitle.setVisible(true);
		lblRandomTime.setVisible(true);
		txtRandomVisitorsAmount.setVisible(true);
		radExit.setDisable(true);
	}
	
	public void setRandomModeOff() {
		btnRandomVisitor.setVisible(true);
		lblDateTitle.setVisible(false);
		lblRandomDate.setVisible(false);
		lblTimeTitle.setVisible(false);
		lblRandomTime.setVisible(false);
		txtRandomVisitorsAmount.setVisible(false);
	}

	// input: none
	// output: number of visitor/s that enter / leave the park
	@FXML
	void approve(ActionEvent event) {
	
		sendToServer("getParkDetails", new ArrayList<String>(Arrays.asList(getParkName())));

		lblCurrentVisitors.setText("[" + getParkName() + "]:  " 
									+ String.valueOf(parkDetails.getCurrentAmount()) + "/" 
									+ parkDetails.getMaximumCapacityInPark());
		// checking for places in the park
		if (checkFreePlacesInThePark()) {
			// random mode
			if (!btnRandomVisitor.isVisible()) {
				if (txtRandomVisitorsAmount.getText().isEmpty()) {
					alert.failedAlert("Failed", "You must enter visitor/s amount.");
					return;
				} else {
					execRandomVisitor(Integer.parseInt(txtRandomVisitorsAmount.getText()));
				}
			// barcode / regular entry
			} else {				
				// if the order is for another park
				if (!orderDetails.getParkName().equals(getParkName())) {
					alert.failedAlert("Failed", "The order is for the park " + orderDetails.getParkName() + ".");
					clearAllFields();
					return;
				}
				
				// check date and time
				if (checkDate() && checkTime()) {
					/*** Enter ***/
					// doesn't exists in the list -> entering the park
					if (radVisitorStatusText.equals("Enter")) {
						execEnter();
						
					/*** Exit ***/
					} else {
						// update park current visitors
						execExit();
					}
				}
			}
		} else {
			alert.failedAlert("Failed", "We're sorry, the park is full.\nPlease try again later.");
		}
		informationExists = false;
		clearAllFields();

		btnApprove.setDisable(false);
	}
	
	// enter control to the park
	// input: none
	// output: updating the current visitors in the park 
	public void execEnter() {
		int tooManyVisitors = 0;
		
		// check if the amount of "visitorsEntered" greater than the invitation.
		if (Integer.parseInt(txtVisitorsAmount.getText()) > 
	    	Integer.parseInt(lblVisitorsNumber.getText())) {
				tooManyVisitors = Integer.parseInt(txtVisitorsAmount.getText()) -
						Integer.parseInt(lblVisitorsNumber.getText());
			// alert to ensure that the employee didn't get typing wrong
			alert.ensureAlert("Ensure", "Are you sure you want to approve?");
			if (alert.getAction().get() == ButtonType.OK) {
				if (checkFreePlacesInTheGateway()) {
					// ArrayList<String> data
					// 		  cell 0: orderNumber
					//        cell 1: new arrived amount (updated one)
					ArrayList<String> data = new ArrayList<String>();
					data.add(String.valueOf(orderDetails.getOrderNumber()));
					data.add(lblVisitorsNumber.getText());
					sendToServer("updateAmountArrived", data);
					
					// check if the update failed and showing alert
					if (getError().equals("false")) {
						alert.failedAlert("Failed", "Sorry, we couldn't do the update.");
					}
					
					// TODO discount
					
					// make an automatic purchase for the additional visitors
					execRandomVisitor(tooManyVisitors);
					
				} else {
					alert.failedAlert("Failed", "We're sorry, the park doesn't have enough places.");
				}
			}
		// amount of visitors is less than or equal to what is on the order
		} else {
			if (checkFreePlacesInTheGateway()) {
				// ArrayList<String> data
				// 		  cell 0: orderNumber
				//        cell 1: new arrived amount (updated one)
				ArrayList<String> data = new ArrayList<String>();
				data.add(String.valueOf(orderDetails.getOrderNumber()));
				data.add(txtVisitorsAmount.getText());
				sendToServer("updateAmountArrived", data);
				
				// check if the update failed and showing alert
				if (getError().equals("false")) {
					alert.failedAlert("Failed", "Sorry, we couldn't do the update.");
				}
				
				alert.successAlert("Success", txtVisitorsAmount.getText() + " visitor/s entered.");
			} 
		}
	}
	
	// exit control from the park
	// input: none
	// output: updating the current visitors in the park 
	public void execExit() {
		int updateCurrentVisitors = 0;
		// update current visitors
		alert.successAlert("Success", txtVisitorsAmount.getText() + " visitor/s leaved.");
		updateCurrentVisitors = parkDetails.getCurrentAmount() - Integer.parseInt(txtRandomVisitorsAmount.getText());
		lblCurrentVisitors.setText(String.valueOf(updateCurrentVisitors) + "/" + parkDetails.getMaximumCapacityInPark());
	
		// ArrayList<String> data, sending to the server to update the current visitors amount
		// input: cell 0: parkName
		//        cell 1: new current visitors (updated one)
		// output: message with the result of the update: true if success
		//                                                false, otherwise
		ArrayList<String> data = new ArrayList<String>();
		data.add(getParkName());
		data.add(String.valueOf(updateCurrentVisitors));
		sendToServer("updateCurrentVisitors", data);
		
		// check if the update failed and showing alert
		if (getError().equals("false")) {
			alert.failedAlert("Failed", "Sorry, we couldn't do the update.");
		}
	}

	// checking the entrance and exit of the random visitor
	// ArrayList<String> data, sending to the server to update the current visitors amount
	// input: cell 0: parkName
	//        cell 1: new current visitors (updated one)
	// output: updating the current visitors in the park 
	public void execRandomVisitor(int visitorsAmount) {
		int maxVisitors = parkDetails.getMaximumCapacityInPark();
		int currentVisitors = parkDetails.getCurrentAmount();
		int updateCurrentVisitors = 0;
		int freePlace = maxVisitors - currentVisitors;

		// check if the amount of "visitorsEntered" greater than the invitation.
		if (Integer.parseInt(txtRandomVisitorsAmount.getText()) > freePlace) {
			alert.failedAlert("Failed", "The amount of visitors doesn't match the invitation.");
		} else {
			// update current visitors
			alert.successAlert("Success", String.valueOf(visitorsAmount) + " visitor/s entered.");
			updateCurrentVisitors = visitorsAmount + currentVisitors;
			lblCurrentVisitors.setText("[" + getParkName() + "]:  " 
					+ String.valueOf(updateCurrentVisitors) + "/" 
					+ parkDetails.getMaximumCapacityInPark());
		}

		ArrayList<String> data = new ArrayList<String>();
		data.add(getParkName());
		data.add(String.valueOf(updateCurrentVisitors));
		sendToServer("updateCurrentVisitors", data);
		
		// check if the update failed and showing alert
		if (getError().equals("false")) {
			alert.failedAlert("Failed", "Sorry, we couldn't do the update.");
		}
	}

	// prints order data
	// input: order
	// output: prints the order data 
	public void printOrderDetails() {
		// 2021-01-01 08:00:00
		String DateAndTime = orderDetails.getArrivedTime();
		String[] splitDateAndTime = DateAndTime.split(" ");
		// 2021-01-01
		String date = splitDateAndTime[0];

		// changing the date format from "yyyy-MM-dd" to "dd-MM-yyyy"
		// iFormatter -> input format
		DateFormat iFormatter = new SimpleDateFormat("yyyy-MM-dd");
		// oFormatter -> output format
		DateFormat oFormatter = new SimpleDateFormat("dd-MM-yyyy");
		try {
			String strDateTime = oFormatter.format(iFormatter.parse(date));

			// 08:00:00 -> 08:00
			String time = (String) splitDateAndTime[1].subSequence(0, 5);

			lblOrderNumber.setText(String.valueOf(orderDetails.getOrderNumber()));
			lblParkName.setText(orderDetails.getParkName());
			lblDate.setText(strDateTime);
			lblTime.setText(time);
			lblVisitorsNumber.setText(String.valueOf(orderDetails.getVisitorsNumber()));
			lblEmail.setText(orderDetails.getOrderEmail());

			lblVisitorsAmount.setText(txtVisitorsAmount.getText());
			lblPrice.setText(orderDetails.getPrice() + "₪");

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	// check for valid date in the order
	// input: [0] 'today's date' 
	//        [1] order date
	// output: return true if that's today's date
	//         otherwise false
	public boolean checkDate() {
		LocalDateTime arrivelDate = LocalDateTime.now();
		// "dd-MM-yyyy"
		String currentDate = arrivelDate.getDayOfMonth() + "-" + arrivelDate.getMonthValue() + "-"
				+ arrivelDate.getYear();
		String orderDate = lblDate.getText();

		if (currentDate.equals(orderDate)) {
			return true;
		}

		alert.failedAlert("Failed", "Invalid date.");
		return false;
	}

	// check for correct visit time in the order
	// input: [0] 'the time now' 
	//        [1] order time range
	// output: return true if the visitor arrived at the right hours
	//         otherwise false
	public boolean checkTime() {
		LocalDateTime arrivelTime = LocalDateTime.now();
		// currentHour = hh
		int currentHour = arrivelTime.getHour();
		// startTime = hh:mm
		String startTime = lblTime.getText();
		String[] splitStartTime = startTime.split(":");
		// stringArrivelHour = hh
		String stringArrivelHour = splitStartTime[0];
		int arrivelHour = Integer.parseInt(stringArrivelHour);

		// currentHour = 08:00 | 12:00
		// arrivelHour = 08:00 - 12:00 | 12:00 - 16:00
		if ((currentHour >= arrivelHour && currentHour < 12) || (currentHour >= arrivelHour && currentHour < 23)) {
			return true;
		}

		alert.failedAlert("Failed", "Invalid time.");
		return false;
	}
	
	// checking to see if there are any available places in the park 
	// for the amount of people who want to enter right now
	// input: amount of visitors
	// output: if there are available places return true
	//         otherwise false
	public boolean checkFreePlacesInTheGateway() {
		int visitorsNumber = 0;
		
		// random mode
		if (!btnRandomVisitor.isVisible()) {
			visitorsNumber = parkDetails.getCurrentAmount() + 
					Integer.parseInt(txtRandomVisitorsAmount.getText());
			if (visitorsNumber <= parkDetails.getMaximumCapacityInPark()) {
				return true;
			}
		// barcode / regular
		} else {
			visitorsNumber = parkDetails.getCurrentAmount() + 
					Integer.parseInt(txtVisitorsAmount.getText());
			if (visitorsNumber <= parkDetails.getMaximumCapacityInPark()) {
				return true;
			}
		}
		
		return false;
	}

	// checking the park for available places
	// input: none
	// output: if there are available places return true
	//		   otherwise false
	public boolean checkFreePlacesInThePark() {
		if (parkDetails.getCurrentAmount() < parkDetails.getMaximumCapacityInPark()) {
			return true;
		}
		return false;
	}

	// String type, the case we dealing with
	// ArrayList<String> dbColumns, sending to the server to get data
	// input: cells, depending on the case
	// output: none
	public void sendToServer(String type, ArrayList<String> dbColumns) {
		// Query
		ArrayList<Object> msg = new ArrayList<Object>();
		
		msg.add(type);
		// Data fields
		msg.add(dbColumns);
		
		// set up all the order details and the payment method
		ClientUI.sentToChatClient(msg);
	}

	public static String getFirstName() {
		return firstName;
	}

	public static void setFirstName(String firstName) {
		ParkEmployeeController.firstName = firstName;
	}

	public static String getError() {
		return error;
	}

	public static void setError(String error) {
		ParkEmployeeController.error = error;
	}

	public static Order getOrderDetails() {
		return orderDetails;
	}

	public static String getParkName() {
		return parkName;
	}

	public static void setParkName(String parkName) {
		ParkEmployeeController.parkName = parkName;
	}
	
	// getting information from the server
	// input: if the order number exists in the system: 
	// 		  		1. ArrayList<String> order with all the order data
	//        otherwise 2. string of "No such order"
	// output: for case 1. we create new order with all the received details
	//         for case 2. we set the error message
	public static void receivedFromServerOrderDetails(ArrayList<String> order) {
		if (order.get(0).equals("No such order")) {
			setError("No such order");
		} else {
			ParkEmployeeController.orderDetails = new Order(order);
		}
	}

	// getting information from the server
	// input: ArrayList<String> park with all the park data
	// output: new park
	public static void receivedFromServerParkDetails(ArrayList<String> park) {
		ParkEmployeeController.parkDetails = new Park(park);
	}
	
	// getting information from the server
	// input: boolean status
	// output: set error message with the following return
	public static void receivedFromServerCurrentVisitorsUpdateStatus(boolean status) {
		if (status) {
			setError("true");
		} else {
			setError("false");
		}
	}
	
	// getting information from the server
	// input: boolean status
	// output: set error message with the following return
	public static void receivedFromServerAmountArrivedStatus(boolean status) {
		if (status) {
			setError("true");
		} else {
			setError("false");
		}
	}

	// clear the screen fields
	// input: none
	// output: none
	public void clearAllFields() {
		txtOrderNumber.clear();
		lblOrderNumber.setText("");
		txtVisitorsAmount.clear();
		lblVisitorsAmount.setText("");
		lblParkName.setText("");
		lblDate.setText("");
		lblTime.setText("");
		lblVisitorsNumber.setText("");
		lblEmail.setText("");
		lblPrice.setText("");
		lblDiscount.setText("");
		lblPayment.setText("");
		lblTotalPrice.setText("");
		txtRandomVisitorsAmount.setText("");
		lblDateTitle.setVisible(false);
		lblRandomDate.setVisible(false);
		lblTimeTitle.setVisible(false);
		lblRandomTime.setVisible(false);
		txtRandomVisitorsAmount.setVisible(false);
		btnApprove.setDisable(false);
		btnRandomVisitor.setVisible(true);
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnApprove.setDisable(true);
		radEnter.setSelected(true);
		lblDateTitle.setVisible(false);
		lblRandomDate.setVisible(false);
		lblTimeTitle.setVisible(false);
		lblRandomTime.setVisible(false);
		txtRandomVisitorsAmount.setVisible(false);
		radVisitorStatusText = "Enter";
		
		//setParkName(LoginController.getParkName());
		setParkName("jurasic");

		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm");
		LocalDateTime arrivelTime = LocalDateTime.now();
		lblRandomTime.setText(arrivelTime.format(time));

		LocalDateTime arrivelDate = LocalDateTime.now();
		lblRandomDate.setText(arrivelDate.getDayOfMonth() 
				+ "-" + arrivelDate.getMonthValue() 
				+ "-" + arrivelDate.getYear());

		// force the field to be numeric only
		txtOrderNumber.textProperty().addListener((obs, oldValue, newValue) -> {

			// \\d -> only digits
			// * -> escaped special characters
			if (!newValue.matches("\\d")) {
				// ^\\d -> everything that not a digit
				txtOrderNumber.setText(newValue.replaceAll("[^\\d]", ""));
			}
		});

		// force the field to be numeric only
		txtVisitorsAmount.textProperty().addListener((obs, oldValue, newValue) -> {
			lblVisitorsAmount.setText(newValue);
			// \\d -> only digits
			// * -> escaped special characters
			if (!newValue.matches("\\d")) {
				// ^\\d -> everything that not a digit
				txtVisitorsAmount.setText(newValue.replaceAll("[^\\d]", ""));
				lblVisitorsAmount.setText(newValue.replaceAll("[^\\d]", ""));
			}
		});

		// force the field to be numeric only
		txtRandomVisitorsAmount.textProperty().addListener((obs, oldValue, newValue) -> {
			btnApprove.setDisable(false);
			lblVisitorsAmount.setText(newValue);
			// \\d -> only digits
			// * -> escaped special characters
			if (!newValue.matches("\\d")) {
				// ^\\d -> everything that not a digit
				txtRandomVisitorsAmount.setText(newValue.replaceAll("[^\\d]", ""));
				lblVisitorsAmount.setText(newValue.replaceAll("[^\\d]", ""));
			}
		});

		// listen to changes in selected toggle
		radGroupStatus.selectedToggleProperty().addListener((observable, oldToggle, newToggle) -> {
			if (newToggle == radEnter) {
				radVisitorStatusText = ((RadioButton) radGroupStatus.getSelectedToggle()).getText();
			} else if (newToggle == radExit) {
				radVisitorStatusText = ((RadioButton) radGroupStatus.getSelectedToggle()).getText();
			}
		});
	}
}

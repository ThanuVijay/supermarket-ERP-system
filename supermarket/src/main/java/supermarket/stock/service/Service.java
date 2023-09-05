package supermarket.stock.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;
import supermarket.util.DbUtil;
import supermarket.stock.model.*;

public class Service {
   
	private static final String NEW_STOCK = "INSERT INTO stocks(productName,productID,quantity) VALUES(?,?,?) ON DUPLICATE KEY UPDATE quantity = ? + quantity";
	private static final String STOCK_BALANCE_BY_CATEGORY = "SELECT products.category,SUM(stocks.quantity) AS quantity FROM products,stocks WHERE products.productID = stocks.productID GROUP BY products.category";
	private static final String GET_STOCK = "SELECT * FROM stocks";
	private static final String SEARCH_STOCK = "SELECT * FROM stocks WHERE productName = ?";
	private static final String DELETE_STOCK = "DELETE FROM stocks WHERE productID = ?";
	private static final String STOCK_BALANCE = "SELECT productName,quantity FROM stocks";
	
	public static void insertStock(String productName,int productID,int quantity) {
		Connection connection  = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(NEW_STOCK);
			preparedStatement.setString(1, productName);
			preparedStatement.setInt(2, productID);
			preparedStatement.setInt(3, quantity);
			preparedStatement.setInt(4, quantity);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static JSONObject stockChart() {
		Connection connection = DbUtil.getConnection();
		JSONObject json = new JSONObject();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(STOCK_BALANCE_BY_CATEGORY);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				String category = rs.getString("category");
				int quantity = rs.getInt("quantity");
				try {
					json.put(category, quantity);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	public static JSONObject stockBalanceChart() {
		Connection connection = DbUtil.getConnection();
		JSONObject json = new JSONObject();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(STOCK_BALANCE);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				String name = rs.getString("productName");
				int quantity = rs.getInt("quantity");
				try {
					json.put(name, quantity);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	public static ArrayList<Stock> getStock(){
		Connection connection = DbUtil.getConnection();
		ArrayList<Stock> stocks = new ArrayList<Stock>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(GET_STOCK);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Stock stock = new Stock();
				int productID = rs.getInt("productID");
				int quantity = rs.getInt("quantity");
				String name = rs.getString("productName");
				stock.setProductID(productID);
				stock.setProductName(name);
				stock.setQuantity(quantity);
				stocks.add(stock);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stocks;
	}
	public static ArrayList<Stock> searchStock(String productName){
		Connection connection = DbUtil.getConnection();
		ArrayList<Stock> stocks = new ArrayList<Stock>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STOCK);
			preparedStatement.setString(1, productName);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Stock stock = new Stock();
				int productID = rs.getInt("productID");
				int quantity = rs.getInt("quantity");
				String name = rs.getString("productName");
				stock.setProductID(productID);
				stock.setProductName(name);
				stock.setQuantity(quantity);
				stocks.add(stock);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stocks;
	}
	public static void deleteStock(int productID) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STOCK);
			preparedStatement.setInt(1, productID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

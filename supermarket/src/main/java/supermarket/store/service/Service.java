package supermarket.store.service;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import supermarket.store.model.Expense;
import supermarket.util.DbUtil;

public class Service {
	
	private static final String SELECT_EXPENSES = "SELECT * FROM store";
	private static final String SELECT_EXPENSE_BY_RECIPENT_NAME = "SELECT * FROM store WHERE recipentName = ?";
	private static final String UPDATE_EXPENSE = "UPDATE store SET amount = ? WHERE expenseID = ?";
	private static final String NEW_EXPENSE = "INSERT INTO store(amount,recipentName,paymentFor,payment_date) VALUES(?,?,?,?)";
	private static final String DELETE_EXPENSE = "DELETE FROM store WHERE expenseID = ?";
	
	public static ArrayList<Expense> getExpenses() {
		Connection connection = DbUtil.getConnection();
		ArrayList<Expense> expenses = new ArrayList<Expense>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSES);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Expense expense = new Expense();
				int expenseID = rs.getInt("expenseID");
				java.sql.Date date = rs.getDate("payment_date");
				String name = rs.getString("recipentName");
				BigDecimal paid = rs.getBigDecimal("amount");
				String paymentFor = rs.getNString("paymentFor");
				expense.setAmount(paid);
				expense.setDate(date);
				expense.setExpenseID(expenseID);
				expense.setRecipentName(name);
				expense.setPaymentFor(paymentFor);
				expenses.add(expense);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}

	public static ArrayList<Expense> getPaymentByRecipentName(String nme) {
		Connection connection = DbUtil.getConnection();
		ArrayList<Expense> expenses = new ArrayList<Expense>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSE_BY_RECIPENT_NAME);
			preparedStatement.setString(1, nme);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Expense expense = new Expense();
				int expenseID = rs.getInt("expenseID");
				java.sql.Date date = rs.getDate("payment_date");
				String name = rs.getString("recipentName");
				BigDecimal paid = rs.getBigDecimal("amount");
				String paymentFor = rs.getNString("paymentFor");
				expense.setAmount(paid);
				expense.setDate(date);
				expense.setExpenseID(expenseID);
				expense.setRecipentName(name);
				expense.setPaymentFor(paymentFor);
				expenses.add(expense);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return expenses;
	}

	public static void updateExpense(int expenseID,BigDecimal amount) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EXPENSE);
			preparedStatement.setBigDecimal(1, amount);
			preparedStatement.setInt(2, expenseID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void newExpense(BigDecimal amount,String name,String paymentFor) {
		Connection connection = DbUtil.getConnection();
		java.sql.Date sqlDate = new java.sql.Date(System.currentTimeMillis());
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(NEW_EXPENSE);
			preparedStatement.setBigDecimal(1, amount);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, paymentFor);
			preparedStatement.setDate(4, sqlDate);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void deleteExpense(int expenseID) {
		Connection connection = DbUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EXPENSE);
			preparedStatement.setInt(1, expenseID);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

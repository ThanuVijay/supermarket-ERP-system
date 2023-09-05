package supermarket.store.model;

import java.math.BigDecimal;

public class Expense {
	
	private int expenseID;
	private BigDecimal amount;
	private String recipentName;
	private String paymentFor;
	private java.sql.Date date;
	public int getExpenseID() {
		return expenseID;
	}
	public void setExpenseID(int expenseID) {
		this.expenseID = expenseID;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getRecipentName() {
		return recipentName;
	}
	public void setRecipentName(String recipentName) {
		this.recipentName = recipentName;
	}
	public String getPaymentFor() {
		return paymentFor;
	}
	public void setPaymentFor(String paymentFor) {
		this.paymentFor = paymentFor;
	}
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}

}

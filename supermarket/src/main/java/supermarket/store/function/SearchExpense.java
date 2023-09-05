package supermarket.store.function;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supermarket.store.model.Expense;
import supermarket.store.service.Service;

/**
 * Servlet implementation class SearchExpense
 */
@WebServlet("/SearchExpense")
public class SearchExpense extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchExpense() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		ArrayList<Expense> searchResult = Service.getPaymentByRecipentName(search);
		request.setAttribute("searchExpense", searchResult);
		RequestDispatcher rd = request.getRequestDispatcher("store.jsp");
		rd.forward(request, response);
	}

}

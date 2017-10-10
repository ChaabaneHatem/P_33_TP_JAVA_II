package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionIngredient;
import action.ActionProduit;

/**
 * Servlet implementation class RetierDonnees
 */
@WebServlet("/retierDonnees")
public class RetierDonnees extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RetierDonnees() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("retirerIngredient") != null) {

			if (request.getParameter("idIngredient") != null) {
				int idIngredient = Integer.parseInt(request.getParameter("idIngredient"));
				ActionIngredient.DeleteIngredient(idIngredient);
				ActionProduit.afficherAllIngredient(request);
				request.getRequestDispatcher("WEB-INF/gestionIngredient.jsp").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

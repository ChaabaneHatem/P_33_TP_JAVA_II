package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.ManagerPanier;

/**
 * Servlet implementation class ActionPanier
 */
@WebServlet("/actionPanier")
public class ActionPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActionPanier() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afficherPanier") != null) {
			ManagerPanier.getAllProduitPanier(request);
			request.getRequestDispatcher("WEB-INF/panier.jsp").forward(request, response);

		} else {

			response.sendRedirect("afficherProduit");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idPorduit = 0;
		int qtyProduit = 0;

		if (request.getParameter("add_item") != null) {
			if (request.getParameter("idProduit") != null) {
				idPorduit = Integer.parseInt(request.getParameter("idProduit"));
			}
			if (request.getParameter("qtyProduit") != null) {
				qtyProduit = Integer.parseInt(request.getParameter("qtyProduit"));
			}
			ManagerPanier.addToPanier(request, idPorduit, qtyProduit);
			ManagerPanier.afficherPanierConsole(request);
			System.out.println("" + ManagerPanier.getNbArticle(request));
			doGet(request, response);
		}

		else if (request.getParameter("add_one") != null) {
			if (request.getParameter("idProduit") != null) {
				int idProduit = Integer.parseInt(request.getParameter("idProduit"));
				ManagerPanier.addToPanier(request, idProduit, 1);
			}
			response.sendRedirect("actionPanier?afficherPanier=true");
		}

		else if (request.getParameter("delete_one") != null) {
			if (request.getParameter("idProduit") != null) {
				int idProduit = Integer.parseInt(request.getParameter("idProduit"));
				ManagerPanier.removeFromPanier(request, idProduit, 1);
			}
			response.sendRedirect("actionPanier?afficherPanier=true");
		}

		else if (request.getParameter("delete_item") != null) {
			if (request.getParameter("idProduit") != null) {
				int idProduit = Integer.parseInt(request.getParameter("idProduit"));
				ManagerPanier.removeFromPanier(request, idProduit, 0);
			}
			response.sendRedirect("actionPanier?afficherPanier=true");
		}

	}

}

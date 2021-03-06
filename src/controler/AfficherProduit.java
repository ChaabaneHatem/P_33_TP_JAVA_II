package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionProduit;

/**
 * Servlet implementation class AfficherProduit
 */
@WebServlet("/afficherProduit")
public class AfficherProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AfficherProduit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("idProduit") == null) {
			ActionProduit.afficherAllProduit(request);
			request.getRequestDispatcher("produit.jsp").forward(request, response);
		} else {
			int idProduit = Integer.parseInt(request.getParameter("idProduit"));

			ActionProduit.afficherbyProduitID(request, idProduit);
			request.getRequestDispatcher("descriptionProduit.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomCategorie = null;
		int idCategorie = 0;
		if (request.getParameter("categorie") != null) {
			nomCategorie = request.getParameter("categorie");
			switch (nomCategorie) {
			case "Pain":
					idCategorie = 1;
				break;
			case "Viennoiserie":
				idCategorie = 2;
				break;
			case "Patisserie":
				idCategorie = 3;
				break;
			}
			ActionProduit.afficherProduitByCategorie(request, idCategorie);
			request.getRequestDispatcher("produit.jsp").forward(request, response);
		}
		
		if(request.getParameter("allProduit") != null) {
			ActionProduit.afficherAllProduit(request);
			request.getRequestDispatcher("produit.jsp").forward(request, response);
		}

	}

}

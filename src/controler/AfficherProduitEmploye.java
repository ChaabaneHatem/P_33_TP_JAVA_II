package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionProduit;

/**
 * Servlet implementation class AfficherProduitEmploye
 */
@WebServlet("/afficherProduitEmploye")
public class AfficherProduitEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherProduitEmploye() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("idProduit") == null) {
			ActionProduit.afficherAllProduit(request);
			request.getRequestDispatcher("produitEmploye.jsp").forward(request, response);
		} else {
			int idProduit = Integer.parseInt(request.getParameter("idProduit"));

			ActionProduit.afficherbyProduitID(request, idProduit);
			request.getRequestDispatcher("descriptionProduit.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionProduit;

/**
 * Servlet implementation class GestionProduit
 */
@WebServlet("/gestionProduit")
public class GestionProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("IDProduitModifie") == null) {
			ActionProduit.afficherAllProduit(request);
		} else {
			int idProduit = Integer.parseInt(request.getParameter("IDProduitModifie"));
			ActionProduit.afficherbyProduitID(request, idProduit);
			ActionProduit.afficherAllCategorie(request);
			ActionProduit.afficherAllIngredient(request);
		}
		request.getRequestDispatcher("WEB-INF/gestionProduit.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	
	
	}

}

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
 * Servlet implementation class AjoutNouveauDonnees
 */
@WebServlet("/ajoutNouveauDonnees")
public class AjoutNouveauDonnees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutNouveauDonnees() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionProduit.afficherAllCategorie(request);
		ActionProduit.afficherAllRecette(request);
		ActionProduit.afficherAllIngredient(request);
		request.getRequestDispatcher("WEB-INF/ajoutDonnees.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("annulerAjoutIngredient") != null) {
			ActionProduit.afficherAllIngredient(request);
			request.getRequestDispatcher("WEB-INF/gestionIngredient.jsp").forward(request, response);
		} else if(request.getParameter("AjouterCeIngredient") !=null) {
			String nomIngredient = request.getParameter("nomIngredient");
			ActionIngredient.AddIngredient(nomIngredient);
			ActionProduit.afficherAllIngredient(request);
			request.getRequestDispatcher("WEB-INF/gestionIngredient.jsp").forward(request, response);
		}
	
	
	
	}

}

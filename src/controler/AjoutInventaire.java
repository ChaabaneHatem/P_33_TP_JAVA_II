package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionVente;
import enitities.Vente;

/**
 * Servlet implementation class AjoutInventaire
 */
@WebServlet(name = "ajoutInventaire", urlPatterns = { "/ajoutInventaire" })
public class AjoutInventaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutInventaire() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vente venteProd = new Vente();
		venteProd.setId(Integer.parseInt(request.getParameter("id")));		
		venteProd.setQuantiteTotal(Integer.parseInt(request.getParameter("quantiteTotal")));		
		venteProd.setQuantiteRestante(Integer.parseInt(request.getParameter("QuantiteRestante")));		
		//venteProd.setDate("date");
		venteProd.setScience("periode");
		ActionVente.inventaireVente(request, venteProd);	

	}

}

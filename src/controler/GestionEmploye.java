package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionEmploye;

/**
 * Servlet implementation class GestionEmploye
 */
@WebServlet("/gestionEmploye")
public class GestionEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionEmploye() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("idEmployeAModifier") == null) {
			ActionEmploye.afficherAllEmploye(request);
		} else {
			int idEmploye = Integer.parseInt(request.getParameter("idEmployeAModifier"));
			ActionEmploye.afficherAllFonctionEmploye(request);
			ActionEmploye.afficherEmployeById(request, idEmploye);
			
		}
		request.getRequestDispatcher("WEB-INF/gestionEmploye.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

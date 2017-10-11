package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionEmploye;
import action.ActionUser;

@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Inscription() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("idEmployeAModifier") != null) {
			int idEmploye = Integer.parseInt(request.getParameter("idEmployeAModifier"));
			ActionEmploye.afficherEmployeById(request, idEmploye);
		}
		
		ActionEmploye.afficherAllFonctionEmploye(request);
		
		request.getRequestDispatcher("inscriptionEmploye.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("validerInscription") != null) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String phone = request.getParameter("phone");
			String adresse = request.getParameter("adresse");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			int idCategorie = Integer.parseInt(request.getParameter("idCategorie"));

			ActionUser.AddAUser(nom, prenom, phone, adresse, username, password, email, idCategorie);
			response.sendRedirect("index.jsp");
		}
	}

}

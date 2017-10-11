package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enitities.Employe;
import manager.ManagerSession;
import utils.Autentification;

/**
 * Servlet implementation class RedirectionDesPages
 */
@WebServlet("/redirectionDesPages")
public class RedirectionDesPages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RedirectionDesPages() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Employe employeConnecte = (Employe) ManagerSession.get(request, "user");

		if (request.getParameter("deconnexion") != null) {
			ManagerSession.deleteKey(request, "user");
			response.sendRedirect("index.jsp");
		} else if (employeConnecte != null) {
			if (employeConnecte.getFonction().getType().equals("Admin")) {
				request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("username") != null && request.getParameter("password") != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Employe employeConnecte = Autentification.AuthentifiactionUser(username, password);
			ManagerSession.add(request, "user", employeConnecte);

			if (employeConnecte.getFonction().getType().equals("Admin")) {
				request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
			}
		}

	}

}

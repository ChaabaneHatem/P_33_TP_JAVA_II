package manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ManagerSession {

	public static void add(HttpServletRequest request, String key, Object valeur) {

		HttpSession s = request.getSession(false);
		if (s != null) {
			s.setAttribute(key, valeur);
		}
	}

	public static Object get(HttpServletRequest request, String key) {
		Object retour = null;
		HttpSession s = request.getSession(false);

		if (s != null) {
			retour = s.getAttribute(key);
		}
		return retour;
	}

	public static void deleteKey(HttpServletRequest request, String key) {

		HttpSession s = request.getSession(false);

		if (s != null) {
			s.removeAttribute(key);
		}

	}
}

package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import enitities.Login;
import services.ConnectionBDD;

public class ManagerLogin {
	private static String queryProduitGetAll = "SELECT * FROM mamie_clafoutie.`table employe` where username=? and password=?;";
	
	public static ArrayList<Login> getAllLogin() {
		ArrayList<Login> retour = null;
		
		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryProduitGetAll);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				retour = new ArrayList<>();

				while (result.next()) {
					Login l = new Login();
					l.setUsername(result.getString("username"));
					l.setPassword(result.getString("nom"));
					retour.add(l);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

//		ConnexionBDD.close();
		
		return retour;
	}

}

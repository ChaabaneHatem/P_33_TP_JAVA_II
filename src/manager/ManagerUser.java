package manager;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import services.ConnectionBDD;

public class ManagerUser {

	private static String queryAddUser = "INSERT INTO `table employe` VALUES (id_emp,?,?,?,?,?,?,?,?,false);";

	public static boolean AddUser(String nom, String prenom, String phone, String adresse, String username,
			String password, String email,int idCategorie) {
		int nbLigne = 0;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryAddUser);
			pstatment.setString(1, nom);
			pstatment.setString(2, prenom);
			pstatment.setString(3, phone);
			pstatment.setString(4, adresse);
			pstatment.setString(6, username);
			pstatment.setString(7, password);
			pstatment.setString(8, email);
			pstatment.setInt(5, idCategorie);
			
			nbLigne = pstatment.executeUpdate();

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return nbLigne > 0;
	}
}

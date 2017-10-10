package manager;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import services.ConnectionBDD;

public class ManagerIngredient {

	
	private static String queryAddIngredient = "INSERT INTO `table ingredient` VALUES (id_ingredient,?)";

	private static String queryDeleteIngredient = "Delete from `table ingredient` where id_ingredient = ?";

	public static boolean AddIngredient(String nomIngredient) {
		int nbLigne = 0;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryAddIngredient);
			pstatment.setString(1, nomIngredient);

			nbLigne = pstatment.executeUpdate();

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


		return nbLigne > 0;
	}
	
	public static boolean DeleteIngredient(int idIngredient) {
		int nbLigne = 0;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryDeleteIngredient);
			pstatment.setInt(1, idIngredient);

			nbLigne = pstatment.executeUpdate();

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


		return nbLigne > 0;
	}
	
	
	
}
